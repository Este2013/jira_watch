import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_snackbar.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_status.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// How the branch list is ordered within each section.
enum BranchSort {
  recent('Last updated', Symbols.history),
  oldest('Oldest updated', Symbols.hourglass_bottom),
  name('Name', Symbols.sort_by_alpha);

  const BranchSort(this.label, this.icon);
  final String label;
  final IconData icon;
}

/// A branch counts as stale once nothing has landed on it for this long.
///
/// Three months matches what GitLab's own branches page calls stale, so the two do
/// not disagree about the same repository.
const branchStaleAfter = Duration(days: 90);

/// When a branch was last committed to, or null when the API gave no usable date.
DateTime? branchLastCommit(Map<String, dynamic> branch) {
  final commit = branch['commit'] as Map?;
  final raw = (commit?['committed_date'] ?? commit?['created_at']) as String?;
  return raw == null ? null : DateTime.tryParse(raw);
}

/// Splits branches into the two sections, by last commit date.
({List<Map<String, dynamic>> active, List<Map<String, dynamic>> stale}) splitBranches(
  List<Map<String, dynamic>> branches, {
  DateTime? now,
}) {
  final cutoff = (now ?? DateTime.now()).subtract(branchStaleAfter);
  final active = <Map<String, dynamic>>[];
  final stale = <Map<String, dynamic>>[];
  for (final branch in branches) {
    final date = branchLastCommit(branch);
    // An unknown date counts as stale rather than active, so it does not clutter
    // the section you actually work from.
    (date != null && date.isAfter(cutoff) ? active : stale).add(branch);
  }
  return (active: active, stale: stale);
}

/// Sorts in place, keeping the default branch at the top of whichever section it
/// falls into — it is the one branch you are always looking for.
void sortBranches(List<Map<String, dynamic>> branches, BranchSort sort) {
  branches.sort((a, b) {
    if (a['default'] == true) return -1;
    if (b['default'] == true) return 1;

    switch (sort) {
      case BranchSort.name:
        return (a['name'] as String? ?? '').toLowerCase().compareTo((b['name'] as String? ?? '').toLowerCase());
      case BranchSort.recent:
      case BranchSort.oldest:
        final dateA = branchLastCommit(a);
        final dateB = branchLastCommit(b);
        // Dateless branches sink to the bottom in both directions, rather than
        // jumping to the top when sorting oldest-first.
        if (dateA == null || dateB == null) return dateA == null ? (dateB == null ? 0 : 1) : -1;
        return sort == BranchSort.recent ? dateB.compareTo(dateA) : dateA.compareTo(dateB);
    }
  });
}

class GitLabBranchesView extends StatefulWidget {
  const GitLabBranchesView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabBranchesView> createState() => _GitLabBranchesViewState();
}

class _GitLabBranchesViewState extends State<GitLabBranchesView> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  String _search = '';

  Future<({List<Map<String, dynamic>> branches, bool truncated})>? _load;

  BranchSort get _sort => BranchSort.values.firstWhere(
    (s) => s.name == widget.tab.viewState['branchSort'],
    orElse: () => BranchSort.recent,
  );
  set _sort(BranchSort value) {
    widget.tab.viewState['branchSort'] = value.name;
    DataModel().gitlabTabs.requestSave();
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _refresh() => setState(() {
    _load = DataModel().gitlab.branchesAll(
      widget.tab.projectId,
      search: _search.isEmpty ? null : _search,
    );
  });

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      _search = value.trim();
      _refresh();
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          spacing: 8,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(Symbols.search, size: 18),
                  labelText: 'Search branches',
                ),
              ),
            ),
            DropdownMenu<BranchSort>(
              initialSelection: _sort,
              enableSearch: false,
              requestFocusOnTap: false,
              label: const Text('Sort'),
              dropdownMenuEntries: [
                for (final sort in BranchSort.values)
                  DropdownMenuEntry(value: sort, label: sort.label, leadingIcon: Icon(sort.icon, size: 18)),
              ],
              onSelected: (value) {
                if (value == null) return;
                setState(() => _sort = value);
              },
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Refresh',
              icon: const Icon(Symbols.refresh),
              onPressed: _refresh,
            ),
          ],
        ),
      ),
      const Divider(height: 1),
      Expanded(child: _list()),
    ],
  );

  Widget _list() => FutureBuilder<({List<Map<String, dynamic>> branches, bool truncated})>(
    future: _load,
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      }
      if (snapshot.hasError) {
        return Center(
          child: Card(
            child: ListTile(
              leading: Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.error),
              title: const Text('Could not load branches'),
              subtitle: Text('${snapshot.error}'),
              trailing: TextButton(onPressed: _refresh, child: const Text('Retry')),
            ),
          ),
        );
      }

      final result = snapshot.data!;
      if (result.branches.isEmpty) {
        return Center(child: Text(_search.isEmpty ? 'This project has no branches.' : 'No branches match that search.'));
      }

      final (active: active, stale: stale) = splitBranches(result.branches);
      sortBranches(active, _sort);
      sortBranches(stale, _sort);

      // Slivers rather than a flat list, so each section header can pin itself to
      // the top while its own branches scroll under it. With both pinned, the
      // stale header takes over from the active one as it reaches the top.
      return CustomScrollView(
        slivers: [
          if (result.truncated)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      spacing: 8,
                      children: [
                        const Icon(Symbols.info, size: 18),
                        Expanded(
                          child: Text(
                            'This project has more branches than can be sorted at once. '
                            'Showing the first ${result.branches.length} — search to narrow them down.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          // Both headers always render, so the split is visible even when one side
          // is empty — an empty "Stale branches" is itself worth knowing.
          _section(
            label: 'Active branches',
            icon: Symbols.check_circle,
            branches: active,
            emptyMessage: 'Nothing committed in the last 3 months.',
          ),
          _section(
            label: 'Stale branches',
            icon: Symbols.history_toggle_off,
            branches: stale,
            emptyMessage: 'Every branch has recent activity.',
          ),
        ],
      );
    },
  );

  /// One section: a header that sticks only while its own rows are in view.
  ///
  /// Grouped rather than listed flat because a bare pinned header pins for the
  /// rest of the scroll, so two of them would stack at the top — leaving both
  /// labels on screen and the wrong one claiming the rows below it. Inside a
  /// [SliverMainAxisGroup] the header is pinned within the group only, so the next
  /// section's header pushes it out as it arrives.
  Widget _section({
    required String label,
    required IconData icon,
    required List<Map<String, dynamic>> branches,
    required String emptyMessage,
  }) => SliverMainAxisGroup(
    slivers: [
      SliverPersistentHeader(
        pinned: true,
        delegate: BranchSectionHeaderDelegate(label: label, count: branches.length, icon: icon),
      ),
      if (branches.isEmpty)
        SliverToBoxAdapter(child: _EmptySection(emptyMessage))
      else
        // SliverList has no separated constructor, so the divider between rows —
        // which the previous paginated list provided — is built in.
        SliverList.builder(
          itemCount: branches.length,
          itemBuilder: (context, index) => Column(
            children: [
              _BranchRow(branch: branches[index]),
              if (index < branches.length - 1) const Divider(height: 1),
            ],
          ),
        ),
    ],
  );
}

/// Sizes and pins a [BranchSectionHeader].
@visibleForTesting
class BranchSectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  const BranchSectionHeaderDelegate({required this.label, required this.count, required this.icon});

  final String label;
  final int count;
  final IconData icon;

  /// Equal min and max, so the header neither grows nor collapses as it pins.
  @override
  double get minExtent => BranchSectionHeader.height;

  @override
  double get maxExtent => BranchSectionHeader.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) =>
      BranchSectionHeader(label: label, count: count, icon: icon);

  @override
  bool shouldRebuild(BranchSectionHeaderDelegate oldDelegate) => oldDelegate.label != label || oldDelegate.count != count || oldDelegate.icon != icon;
}

@visibleForTesting
class BranchSectionHeader extends StatelessWidget {
  const BranchSectionHeader({super.key, required this.label, required this.count, required this.icon});

  final String label;
  final int count;
  final IconData icon;

  /// Kept here rather than on the delegate so the two cannot disagree.
  ///
  /// A pinned sliver reports the child's *measured* height as its paintExtent
  /// while claiming the full extent as its layoutExtent, and asserts if the
  /// former is smaller — so the child has to be exactly this tall, not merely
  /// allowed to be.
  static const double height = 40;

  @override
  Widget build(BuildContext context) => Container(
    height: height,
    // Fully opaque, with an edge: while pinned, rows scroll underneath, and
    // without both they would read as attached to the header.
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      spacing: 8,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).hintColor),
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        Text('$count', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor)),
      ],
    ),
  );
}

class _EmptySection extends StatelessWidget {
  const _EmptySection(this.message);

  final String message;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Text(
      message,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).disabledColor),
    ),
  );
}

class _BranchRow extends StatelessWidget {
  const _BranchRow({required this.branch});

  final Map<String, dynamic> branch;

  @override
  Widget build(BuildContext context) {
    final commit = branch['commit'] as Map?;
    final isDefault = branch['default'] == true;
    final isProtected = branch['protected'] == true;
    final isMerged = branch['merged'] == true;
    final webUrl = branch['web_url'] as String?;
    final name = branch['name'] as String? ?? '';

    return InkWell(
      onTap: webUrl == null ? null : () => launchUrl(Uri.parse(webUrl)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          spacing: 12,
          children: [
            const Icon(Symbols.fork_right, size: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'RobotoMono'),
                        ),
                      ),
                      if (isDefault) _badge(context, 'default', Theme.of(context).colorScheme.primary),
                      if (isProtected) _badge(context, 'protected', Theme.of(context).hintColor),
                      if (isMerged) _badge(context, 'merged', const Color(0xFF6E49CB)),
                    ],
                  ),
                  if (commit != null)
                    Text(
                      '${shortSha(commit['short_id'] as String? ?? commit['id'] as String?)} · ${commit['title']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            if (commit != null)
              SizedBox(
                width: 110,
                child: Text(
                  timeAgo(timeStr: (commit['committed_date'] ?? commit['created_at']) as String?),
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.end,
                ),
              ),
            IconButton(
              tooltip: 'Copy branch name',
              visualDensity: VisualDensity.compact,
              icon: const Icon(Symbols.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: name));
                showGitLabSnackBar(context, SnackBar(content: Text('Copied $name')));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(BuildContext context, String text, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    decoration: BoxDecoration(
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(text, style: TextStyle(fontSize: 10, color: color)),
  );
}
