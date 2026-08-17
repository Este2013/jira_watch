import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/gitlab_quick_branches_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/utils/string_utils.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_branch_icons.dart';
import 'package:jira_watcher/ui/utils/widgets/dialog_widgets.dart/action_buttons.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Manage a project's favorite-branch rules.
class GitLabQuickBranchesDialog extends StatefulWidget {
  const GitLabQuickBranchesDialog({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabQuickBranchesDialog> createState() => _GitLabQuickBranchesDialogState();
}

class _GitLabQuickBranchesDialogState extends State<GitLabQuickBranchesDialog> {
  GitLabQuickBranchesModel get _model => GitLabQuickBranchesModel();

  Future<void> _add() async {
    final rule = _model.createRule(widget.tab.projectId);
    await _edit(rule);
  }

  Future<void> _edit(GitLabQuickBranchRule rule) async {
    final edited = await showDialog<GitLabQuickBranchRule>(
      context: context,
      builder: (context) => _RuleEditorDialog(tab: widget.tab, rule: rule.copy()),
    );
    if (edited != null) _model.replaceRule(widget.tab.projectId, edited);
  }

  @override
  Widget build(BuildContext context) {
    final rules = _model.forProject(widget.tab.projectId);

    return AlertDialog(
      title: const Text('Favorite branches'),
      constraints: const BoxConstraints(maxWidth: 640, maxHeight: 640),
      actions: [
        Row(
          children: [
            TextButton.icon(
              icon: const Icon(Symbols.add),
              label: const Text('Add a favorite'),
              onPressed: _add,
            ),
            const Spacer(),
            TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close')),
          ],
        ),
      ],
      content: SizedBox(
        width: 580,
        child: AnimatedBuilder(
          animation: rules,
          builder: (context, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'These appear as chips beside the branch filter, and the order here is the '
                'order they show up in. Drag the handle to rearrange them.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
              ),
              const Divider(),
              Expanded(
                child: rules.isEmpty
                    ? const Center(child: Text('No favorites yet.'))
                    : ReorderableListView.builder(
                        // A tile already supplies its own drag handle below;
                        // leaving this true adds a second, automatic one on
                        // desktop that overlaps it.
                        buildDefaultDragHandles: false,
                        itemCount: rules.length,
                        itemBuilder: (context, index) {
                          final rule = rules[index];
                          return _RuleTile(
                            key: ValueKey(rule.id),
                            index: index,
                            rule: rule,
                            onEdit: () => _edit(rule),
                            onDelete: () async {
                              final confirmed = await requestConfirmation(context, 'Remove the favorite "${rule.label}"?');
                              if (confirmed ?? false) _model.deleteRule(widget.tab.projectId, rule);
                            },
                          );
                        },
                        // Not onReorder: it reports newIndex from before the
                        // dragged item was removed, which is one too high
                        // whenever the move is forward — onReorderItem already
                        // adjusts for that.
                        onReorderItem: (oldIndex, newIndex) => _model.reorder(widget.tab.projectId, oldIndex, newIndex),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RuleTile extends StatelessWidget {
  const _RuleTile({super.key, required this.index, required this.rule, required this.onEdit, required this.onDelete});

  /// This item's position in the ReorderableListView, which the drag handle
  /// needs to tell the list what is being dragged.
  final int index;
  final GitLabQuickBranchRule rule;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  String get _subtitle => switch (rule.matchType) {
    GitLabBranchMatchType.exact => rule.pattern,
    GitLabBranchMatchType.contains => 'most recent containing "${rule.pattern}"',
    GitLabBranchMatchType.regex => 'most recent matching /${rule.pattern}/',
  };

  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(
      rule.isValid ? gitLabBranchIcon(rule.iconName) : Symbols.error,
      fill: 1,
      color: rule.isValid ? null : Theme.of(context).colorScheme.error,
    ),
    title: Text(rule.label),
    subtitle: Text(_subtitle, style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 11)),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(tooltip: 'Edit', icon: const Icon(Symbols.edit), onPressed: onEdit),
        IconButton(tooltip: 'Remove', icon: Icon(Symbols.delete, fill: 1, color: Theme.of(context).colorScheme.error), onPressed: onDelete),
        // A dedicated drag handle rather than the whole tile: the tile already
        // has two buttons and a tap target of its own (edit), so dragging from
        // anywhere would fight them.
        ReorderableDragStartListener(
          index: index,
          child: const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Icon(Symbols.drag_handle),
          ),
        ),
      ],
    ),
  );
}

class _RuleEditorDialog extends StatefulWidget {
  const _RuleEditorDialog({required this.tab, required this.rule});

  final GitLabProjectTab tab;
  final GitLabQuickBranchRule rule;

  @override
  State<_RuleEditorDialog> createState() => _RuleEditorDialogState();
}

class _RuleEditorDialogState extends State<_RuleEditorDialog> {
  late final TextEditingController _label;
  late final TextEditingController _pattern;
  late GitLabBranchMatchType _matchType;
  late String _iconName;

  Timer? _debounce;
  bool _resolving = false;
  String? _resolved;
  Object? _resolveError;

  GitLabQuickBranchRule get _current => GitLabQuickBranchRule(
    id: widget.rule.id,
    label: _label.text,
    pattern: _pattern.text,
    matchType: _matchType,
    iconName: _iconName,
  );

  @override
  void initState() {
    super.initState();
    _label = TextEditingController(text: widget.rule.label);
    _pattern = TextEditingController(text: widget.rule.pattern);
    _matchType = widget.rule.matchType;
    _iconName = widget.rule.iconName;
    _schedulePreview();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _label.dispose();
    _pattern.dispose();
    super.dispose();
  }

  void _schedulePreview() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), _preview);
  }

  Future<void> _preview() async {
    final rule = _current;
    if (!rule.isValid) {
      setState(() {
        _resolving = false;
        _resolved = null;
        _resolveError = null;
      });
      return;
    }

    setState(() {
      _resolving = true;
      _resolveError = null;
    });
    try {
      final branch = await GitLabQuickBranchesModel().resolveBranch(widget.tab.projectId, rule);
      if (!mounted) return;
      setState(() {
        _resolved = branch;
        _resolving = false;
      });
    } on Object catch (e) {
      if (!mounted) return;
      setState(() {
        _resolved = null;
        _resolveError = e;
        _resolving = false;
      });
    }
  }

  Future<void> _pickFromFullList() async {
    final picked = await showDialog<String>(
      context: context,
      builder: (context) => GitLabBranchIconPickerDialog(selected: _iconName),
    );
    if (picked != null) setState(() => _iconName = picked);
  }

  Widget _iconPicker(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // The current icon is always offered even when it is not one of the
    // quick-select defaults — picked via the full list, it should still show
    // as selected here rather than looking like nothing was chosen.
    final quickNames = gitLabBranchQuickIconNames.contains(_iconName)
        ? gitLabBranchQuickIconNames
        : [...gitLabBranchQuickIconNames, _iconName];

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final name in quickNames)
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => setState(() => _iconName = name),
            child: Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: name == _iconName ? colors.primaryContainer : null,
                border: name == _iconName ? Border.all(color: colors.primary) : null,
              ),
              child: Icon(gitLabBranchIcon(name), fill: name == _iconName ? 1 : 0),
            ),
          ),
        IconButton(
          tooltip: 'More icons…',
          icon: const Icon(Symbols.more_horiz),
          onPressed: _pickFromFullList,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.rule.label.isEmpty ? 'New favorite branch' : 'Edit favorite branch'),
    constraints: const BoxConstraints(maxWidth: 480),
    content: SizedBox(
      width: 420,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          TextField(
            controller: _label,
            decoration: const InputDecoration(labelText: 'Label', helperText: 'Shown on the chip'),
            onChanged: (_) => setState(() {}),
          ),
          _iconPicker(context),
          SegmentedButton<GitLabBranchMatchType>(
            segments: [
              for (final type in GitLabBranchMatchType.values) ButtonSegment(value: type, label: Text(type.label)),
            ],
            selected: {_matchType},
            onSelectionChanged: (selection) {
              setState(() => _matchType = selection.first);
              _schedulePreview();
            },
          ),
          TextField(
            controller: _pattern,
            decoration: InputDecoration(
              labelText: switch (_matchType) {
                GitLabBranchMatchType.exact => 'Branch name',
                GitLabBranchMatchType.contains => 'Text the branch name contains',
                GitLabBranchMatchType.regex => 'Regular expression',
              },
              errorText: _matchType == GitLabBranchMatchType.regex && _pattern.text.isNotEmpty && !_pattern.text.isValidRegex()
                  ? 'Not a valid regex'
                  : null,
            ),
            style: const TextStyle(fontFamily: 'RobotoMono'),
            onChanged: (_) {
              setState(() {});
              _schedulePreview();
            },
          ),
          _previewSection(context),
        ],
      ),
    ),
    actions: [
      TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
      FilledButton(
        onPressed: _current.isValid ? () => Navigator.of(context).pop(_current) : null,
        child: const Text('Save'),
      ),
    ],
  );

  Widget _previewSection(BuildContext context) {
    if (!_current.isValid) return const SizedBox.shrink();

    final content = _resolving
        ? const Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2)),
              Text('Resolving…'),
            ],
          )
        : _resolveError is QuickBranchNoMatch
        ? Text('No branch matches this rule.', style: TextStyle(color: Theme.of(context).colorScheme.error))
        : _resolveError != null
        ? Text('Could not check this rule: $_resolveError', style: TextStyle(color: Theme.of(context).colorScheme.error))
        : _resolved == null
        ? const Text('—')
        : Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              const Icon(Symbols.fork_right, size: 16),
              Flexible(child: Text(_resolved!, style: const TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.w600))),
            ],
          );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(8),
      ),
      child: content,
    );
  }
}
