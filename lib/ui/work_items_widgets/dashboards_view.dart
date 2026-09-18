import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_watcher/models/dashboards_model.dart';
import 'package:jira_watcher/ui/utils/widgets/browser_tab_chip.dart';
import 'package:jira_watcher/ui/work_items_widgets/board_edit_dialog.dart';
import 'package:jira_watcher/ui/work_items_widgets/jql_board_view.dart';
import 'package:material_symbols_icons/symbols.dart';

/// The Dashboards leading view: a strip of saved boards — separate from the
/// work item tabs above it, and never one of them itself — with whichever
/// one is selected shown beneath it.
///
/// Listens to [DashboardsModel] itself (an [AnimatedBuilder] of its own),
/// rather than folding into the work item workspace's, so a board being
/// created, renamed, or switched redraws this without that file needing to
/// know dashboards exist.
class DashboardsView extends StatelessWidget {
  const DashboardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = DashboardsModel();
    return AnimatedBuilder(
      animation: Listenable.merge([model.boards, model.selectedBoardId]),
      builder: (context, _) => _build(context, model),
    );
  }

  Widget _build(BuildContext context, DashboardsModel model) {
    final boards = model.boards.list;
    if (boards.isEmpty) return _NoBoardsYet(onCreate: () => _createBoard(context));

    final board = model.selectedBoard ?? boards.first;
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 4),
                  children: [
                    for (final b in boards)
                      BrowserTabChip(
                        key: ValueKey(b.id),
                        tooltip: b.name,
                        label: b.name,
                        leading: Icon(_iconFor(b.config), size: 16),
                        isActive: b.id == board.id,
                        onTap: () => model.selectBoard(b.id),
                        onSecondaryTapDown: (details) => _showContextMenu(context, details, b),
                      ),
                  ],
                ),
              ),
              IconButton(tooltip: 'New board', icon: const Icon(Symbols.add), onPressed: () => _createBoard(context)),
              const SizedBox(width: 8),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(child: _content(board)),
      ],
    );
  }

  /// A board's leading icon is fixed by its type, the same way each of the
  /// strip's own leading views has a fixed icon — a board's type dictates
  /// what it does and shows, not something a person picks separately from it.
  IconData _iconFor(BoardConfig config) => switch (config) {
    JqlBoardConfig() => Symbols.data_object,
  };

  /// The board's own content — a compiler-enforced checklist, along with
  /// [BoardConfig.fromJson]: a new [BoardConfig] subclass fails this switch
  /// until a case renders it.
  Widget _content(Board board) => switch (board.config) {
    JqlBoardConfig config => JqlBoardView(key: ValueKey(board.id), board: board, config: config),
  };

  void _createBoard(BuildContext context) => showDialog(context: context, builder: (_) => const BoardEditDialog());

  void _showContextMenu(BuildContext context, TapDownDetails details, Board board) {
    showContextMenu(
      context,
      contextMenu: ContextMenu(
        position: details.globalPosition,
        entries: <ContextMenuEntry>[
          MenuItem(label: Center(child: Text(board.name)), enabled: false),
          const MenuDivider(),
          MenuItem(
            label: const Text('Rename...'),
            icon: const Icon(Symbols.edit),
            onSelected: (_) => showDialog(context: context, builder: (_) => BoardEditDialog(board: board)),
          ),
          MenuItem(
            label: const Text('Delete'),
            icon: const Icon(Symbols.delete),
            onSelected: (_) => DashboardsModel().deleteBoard(board),
          ),
        ],
      ),
    );
  }
}

class _NoBoardsYet extends StatelessWidget {
  const _NoBoardsYet({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        const Text('📊', style: TextStyle(fontSize: 72)),
        const Text('No dashboards yet', style: TextStyle(fontSize: 24)),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Text(
            'Save a filtered view of your work items to come back to — the same chips and JQL as everywhere else in the app.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
          ),
        ),
        FilledButton.icon(onPressed: onCreate, icon: const Icon(Symbols.add), label: const Text('New board')),
      ],
    ),
  );
}
