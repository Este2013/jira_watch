import 'package:flutter/material.dart';
import 'package:jira_watcher/models/gitlab_quick_branches_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_quick_branches_dialog.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A row of favorite-branch chips, for wherever a project's rules are worth
/// showing beside a branch filter, plus a trailing icon-only chip that opens
/// the dialog to manage them.
///
/// Never empty — even with no favorites yet, the trailing chip is still the
/// discoverable way to add one — so this always costs a filter row its width,
/// unlike a widget that could shrink to nothing.
class GitLabQuickBranchChips extends StatelessWidget {
  const GitLabQuickBranchChips({super.key, required this.tab, required this.currentValue, required this.onResolved});

  final GitLabProjectTab tab;

  /// The filter's current text, so a favorite that would produce this exact
  /// value can show itself as already selected.
  final String currentValue;

  /// Called with the branch a tapped chip resolved to.
  final ValueChanged<String> onResolved;

  @override
  Widget build(BuildContext context) {
    final rules = GitLabQuickBranchesModel().forProject(tab.projectId);
    // Subscribed here, not left to the parent: adding or removing a favorite
    // (from the star icon, or the manage dialog) does not otherwise reach a
    // widget that was handed the project id rather than the list itself.
    return AnimatedBuilder(
      animation: rules,
      builder: (context, _) {
        final valid = rules.list.where((r) => r.isValid).toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 6,
            children: [
              for (final rule in valid)
                _QuickBranchChip(
                  projectId: tab.projectId,
                  rule: rule,
                  // A rule "corresponds to" the current filter when it would
                  // itself produce that value — synchronous on purpose, so
                  // typing does not trigger a resolve per keystroke. For
                  // contains/regex this checks the pattern against the typed
                  // text directly rather than what the rule last resolved to,
                  // which is the same test tapping the chip would apply.
                  selected: currentValue.isNotEmpty && rule.matches(currentValue),
                  onResolved: onResolved,
                ),
              ActionChip(
                avatar: const Icon(Symbols.add, size: 16),
                label: const SizedBox.shrink(),
                labelPadding: EdgeInsets.zero,
                tooltip: 'Manage favorite branches',
                visualDensity: VisualDensity.compact,
                onPressed: () => showDialog(context: context, builder: (context) => GitLabQuickBranchesDialog(tab: tab)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuickBranchChip extends StatefulWidget {
  const _QuickBranchChip({required this.projectId, required this.rule, required this.selected, required this.onResolved});

  final int projectId;
  final GitLabQuickBranchRule rule;
  final bool selected;
  final ValueChanged<String> onResolved;

  @override
  State<_QuickBranchChip> createState() => _QuickBranchChipState();
}

class _QuickBranchChipState extends State<_QuickBranchChip> {
  bool _resolving = false;

  Future<void> _tap() async {
    // An exact rule resolves synchronously, so there is nothing to show a
    // spinner for — only contains/regex touch the network.
    if (widget.rule.matchType == GitLabBranchMatchType.exact) {
      widget.onResolved(widget.rule.pattern);
      return;
    }

    setState(() => _resolving = true);
    try {
      final branch = await GitLabQuickBranchesModel().resolveBranch(widget.projectId, widget.rule);
      if (!mounted) return;
      widget.onResolved(branch);
    } on QuickBranchNoMatch {
      if (!mounted) return;
      showAppSnackBar(context, SnackBar(content: Text('No branch matches "${widget.rule.label}"')));
    } on Object {
      if (!mounted) return;
      showAppSnackBar(context, SnackBar(content: Text('Could not resolve "${widget.rule.label}"')));
    } finally {
      if (mounted) setState(() => _resolving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ActionChip(
      avatar: _resolving
          ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
          : Icon(Symbols.star, fill: 1, size: 16, color: widget.selected ? colors.onPrimaryContainer : null),
      label: Text(
        widget.rule.label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: widget.selected ? TextStyle(color: colors.onPrimaryContainer, fontWeight: FontWeight.w600) : null,
      ),
      backgroundColor: widget.selected ? colors.primaryContainer : null,
      tooltip: switch (widget.rule.matchType) {
        GitLabBranchMatchType.exact => widget.rule.pattern,
        GitLabBranchMatchType.contains => 'Most recent branch containing "${widget.rule.pattern}"',
        GitLabBranchMatchType.regex => 'Most recent branch matching /${widget.rule.pattern}/',
      },
      visualDensity: VisualDensity.compact,
      onPressed: _resolving ? null : _tap,
    );
  }
}
