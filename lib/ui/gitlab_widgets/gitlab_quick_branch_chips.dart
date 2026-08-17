import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/gitlab_quick_branches_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_branch_icons.dart';
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

  /// The filter's current text, compared against what a rule actually
  /// resolves to — not against its pattern — to decide whether its chip
  /// should show as selected.
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
                  key: ValueKey(rule.id),
                  projectId: tab.projectId,
                  rule: rule,
                  currentValue: currentValue,
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
  const _QuickBranchChip({super.key, required this.projectId, required this.rule, required this.currentValue, required this.onResolved});

  final int projectId;
  final GitLabQuickBranchRule rule;
  final String currentValue;
  final ValueChanged<String> onResolved;

  @override
  State<_QuickBranchChip> createState() => _QuickBranchChipState();
}

class _QuickBranchChipState extends State<_QuickBranchChip> {
  bool _resolving = false;

  /// What this rule actually resolves to right now, kept only to answer "is
  /// this chip selected" — comparing the filter's current text against the
  /// pattern instead would light up a "most recent beta" chip for *any* beta
  /// branch, including ones that stopped being the most recent one long ago.
  String? _target;
  Timer? _selectionDebounce;

  @override
  void initState() {
    super.initState();
    _refreshTarget();
  }

  @override
  void didUpdateWidget(_QuickBranchChip old) {
    super.didUpdateWidget(old);
    if (old.rule.pattern != widget.rule.pattern || old.rule.matchType != widget.rule.matchType) {
      // The rule itself changed — a stale target would otherwise keep a chip
      // selected (or not) for a pattern it no longer represents.
      _target = null;
      _refreshTarget();
    } else if (old.currentValue != widget.currentValue) {
      // Re-checked on every value change rather than kept from the first
      // resolve: the branch a rule points at can move on its own — a newer
      // "beta/1.6" landing makes the chip's target change with nobody having
      // touched the chip at all. Debounced so typing in the filter field does
      // not fire one request per keystroke for every contains/regex rule.
      _selectionDebounce?.cancel();
      _selectionDebounce = Timer(const Duration(milliseconds: 400), _refreshTarget);
    }
  }

  @override
  void dispose() {
    _selectionDebounce?.cancel();
    super.dispose();
  }

  Future<void> _refreshTarget() async {
    if (widget.rule.matchType == GitLabBranchMatchType.exact) {
      // No lookup needed or wanted: the pattern is the answer, so this stays
      // correct even before any branch list has loaded.
      setState(() => _target = widget.rule.pattern);
      return;
    }
    try {
      final branch = await GitLabQuickBranchesModel().resolveBranch(widget.projectId, widget.rule);
      if (!mounted) return;
      setState(() => _target = branch);
    } on Object {
      if (!mounted) return;
      setState(() => _target = null);
    }
  }

  bool get _selected => widget.currentValue.isNotEmpty && _target == widget.currentValue;

  Future<void> _tap() async {
    if (widget.rule.matchType == GitLabBranchMatchType.exact) {
      widget.onResolved(widget.rule.pattern);
      return;
    }

    setState(() => _resolving = true);
    try {
      // Resolved fresh rather than reusing _target: that value can be a few
      // hundred milliseconds stale by design (the debounce above), and a tap
      // is a deliberate action that deserves the current answer, not a cached
      // one from just before it.
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
    final selected = _selected;

    return ActionChip(
      avatar: _resolving
          ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
          : Icon(gitLabBranchIcon(widget.rule.iconName), fill: 1, size: 16, color: selected ? colors.onPrimaryContainer : null),
      label: Text(
        widget.rule.label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: selected ? TextStyle(color: colors.onPrimaryContainer, fontWeight: FontWeight.w600) : null,
      ),
      backgroundColor: selected ? colors.primaryContainer : null,
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
