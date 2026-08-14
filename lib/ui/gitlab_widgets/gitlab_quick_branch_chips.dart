import 'package:flutter/material.dart';
import 'package:jira_watcher/models/gitlab_quick_branches_model.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A row of favorite-branch chips, for wherever a project's rules are worth
/// showing beside a branch filter.
///
/// Shrinks to nothing when there are no valid rules, so it costs a filter row
/// nothing on a project nobody has set favorites for.
class GitLabQuickBranchChips extends StatelessWidget {
  const GitLabQuickBranchChips({super.key, required this.projectId, required this.onResolved});

  final int projectId;

  /// Called with the branch a tapped chip resolved to.
  final ValueChanged<String> onResolved;

  @override
  Widget build(BuildContext context) {
    final rules = GitLabQuickBranchesModel().forProject(projectId);
    // Subscribed here, not left to the parent: adding or removing a favorite
    // (from the star icon, or the manage dialog) does not otherwise reach a
    // widget that was handed the project id rather than the list itself.
    return AnimatedBuilder(
      animation: rules,
      builder: (context, _) {
        final valid = rules.list.where((r) => r.isValid).toList();
        if (valid.isEmpty) return const SizedBox.shrink();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 6,
            children: [for (final rule in valid) _QuickBranchChip(projectId: projectId, rule: rule, onResolved: onResolved)],
          ),
        );
      },
    );
  }
}

class _QuickBranchChip extends StatefulWidget {
  const _QuickBranchChip({required this.projectId, required this.rule, required this.onResolved});

  final int projectId;
  final GitLabQuickBranchRule rule;
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
  Widget build(BuildContext context) => ActionChip(
    avatar: _resolving
        ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
        : const Icon(Symbols.star, fill: 1, size: 16),
    label: Text(widget.rule.label, maxLines: 1, overflow: TextOverflow.ellipsis),
    tooltip: switch (widget.rule.matchType) {
      GitLabBranchMatchType.exact => widget.rule.pattern,
      GitLabBranchMatchType.contains => 'Most recent branch containing "${widget.rule.pattern}"',
      GitLabBranchMatchType.regex => 'Most recent branch matching /${widget.rule.pattern}/',
    },
    visualDensity: VisualDensity.compact,
    onPressed: _resolving ? null : _tap,
  );
}
