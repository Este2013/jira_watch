import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/single_work_item_view.dart';

/// A list of work items with the one currently picked shown beside it — or in
/// a dialog, when the window is too narrow to hold both.
///
/// Every leading view that is fundamentally "a list of work items to read,
/// one at a time" (Pinned work items, a JQL board) decides this the same way,
/// so the split — and its fiddly narrow-window dance — lives here once
/// instead of being copied per view.
class WorkItemListPreview extends StatefulWidget {
  const WorkItemListPreview({super.key, required this.availableKeys, required this.listBuilder, required this.placeholder});

  /// Every key the list currently offers — used only to drop a selection that
  /// has since disappeared from it (a pin removed, a board's filters no
  /// longer matching it).
  final List<String> availableKeys;

  /// Builds the list itself: given which key is selected right now (if any)
  /// and a callback to select a different one, the caller renders its own
  /// tiles — this widget only decides *where* the selection ends up shown
  /// once picked.
  final Widget Function(String? selectedKey, void Function(String key) onSelect) listBuilder;

  /// Shown on the preview side while nothing is selected — a hint pointing
  /// back at the list.
  final String placeholder;

  @override
  State<WorkItemListPreview> createState() => _WorkItemListPreviewState();
}

class _WorkItemListPreviewState extends State<WorkItemListPreview> {
  /// Matches the updates list's own threshold, so the app switches between
  /// side-by-side and a dialog at one consistent width everywhere.
  static const double _minSizeForSideBySide = 1200;

  String? _selectedKey;
  bool _isDialogShown = false;
  bool _isAllowedToShowDialog = true;

  void _select(String key) => setState(() {
    _selectedKey = key;
    _isAllowedToShowDialog = true;
  });

  @override
  Widget build(BuildContext context) {
    // A selected item can disappear from under the selection — a pin
    // removed, a board's filters narrowed past it.
    final selectedKey = widget.availableKeys.contains(_selectedKey) ? _selectedKey : null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final canSplit = constraints.maxWidth > _minSizeForSideBySide;

        // The same dance the updates list does: too narrow to show both, so
        // the selection goes into a dialog instead — and back out of one the
        // moment there is room again. Visibility.of keeps a resize made while
        // another top-level page is showing from popping a dialog over it.
        if (_isAllowedToShowDialog && !_isDialogShown && selectedKey != null && !canSplit && Visibility.of(context) && (ModalRoute.of(context)?.isCurrent ?? true)) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            showDialog(
              context: context,
              builder: (_) => SingleJiraWorkItemDialog(
                JiraWorkItemData({'key': selectedKey}),
                key: Key(selectedKey),
                initialTab: JiraWorkItemTab.details,
              ),
            ).whenComplete(() {
              if (mounted) setState(() => _isDialogShown = false);
            });
            setState(() {
              _isDialogShown = true;
              _isAllowedToShowDialog = false;
            });
          });
        } else if (_isDialogShown && canSplit) {
          SchedulerBinding.instance.addPostFrameCallback((_) => Navigator.of(context).pop());
        }
        if (canSplit && !_isAllowedToShowDialog) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() => _isAllowedToShowDialog = true);
          });
        }

        return Row(
          children: [
            Expanded(child: widget.listBuilder(selectedKey, _select)),
            if (canSplit) const VerticalDivider(width: 1),
            if (canSplit)
              Expanded(
                child: selectedKey == null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(widget.placeholder, style: TextStyle(color: Theme.of(context).hintColor)),
                        ),
                      )
                    : SingleJiraWorkItemView(JiraWorkItemData({'key': selectedKey}), key: ValueKey(selectedKey)),
              ),
          ],
        );
      },
    );
  }
}
