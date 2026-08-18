import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_project_picker_dialog.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens the project picker and adds whatever the user chose.
Future<void> showGitLabProjectPicker(BuildContext context) async {
  final picked = await showDialog<GitLabProjectTab>(
    context: context,
    builder: (context) => const GitLabProjectPickerDialog(),
  );
  if (picked != null) DataModel().gitlabTabs.openProject(picked);
}

class GitLabTabStrip extends StatefulWidget {
  const GitLabTabStrip({super.key});

  @override
  State<GitLabTabStrip> createState() => _GitLabTabStripState();
}

class _GitLabTabStripState extends State<GitLabTabStrip> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = DataModel().gitlabTabs;
    // Subscribed here rather than relying on the parent to rebuild us: this
    // widget is instantiated as `const`, and Flutter skips rebuilding a subtree
    // whose widget instance is identical, so a parent rebuild alone would never
    // re-run this build method.
    return AnimatedBuilder(
      animation: Listenable.merge([model.tabs, model.activeProjectId]),
      builder: (context, _) => SizedBox(
        height: 40,
        child: Row(
          spacing: 8,
          children: [
            Expanded(
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  for (final tab in model.tabs.list)
                    _ProjectTabChip(
                      key: ValueKey(tab.projectId),
                      tab: tab,
                      isActive: tab.projectId == model.activeProjectId.value,
                    ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Open a project (Ctrl T)',
              icon: Icon(Symbols.add),
              onPressed: () => showGitLabProjectPicker(context),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _ProjectTabChip extends StatefulWidget {
  const _ProjectTabChip({super.key, required this.tab, required this.isActive});

  final GitLabProjectTab tab;
  final bool isActive;

  @override
  State<_ProjectTabChip> createState() => _ProjectTabChipState();
}

class _ProjectTabChipState extends State<_ProjectTabChip> {
  bool _hovered = false;

  GitLabTabsModel get _model => DataModel().gitlabTabs;

  void _close() => _model.close(widget.tab);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final showClose = widget.isActive || _hovered;

    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Listener(
          onPointerDown: (event) {
            if (event.buttons == kMiddleMouseButton) _close();
          },
          child: Material(
            color: widget.isActive ? scheme.surfaceContainerHighest : Colors.transparent,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: InkWell(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              onTap: () => _model.setActive(widget.tab),
              onSecondaryTapDown: _showContextMenu,
              child: Tooltip(
                message: widget.tab.pathWithNamespace,
                waitDuration: const Duration(milliseconds: 600),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 120, maxWidth: 220),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    child: Row(
                      children: [
                        GitLabAvatar(url: widget.tab.avatarUrl, size: 16, fallbackLabel: widget.tab.name),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.tab.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: widget.isActive ? FontWeight.w600 : null),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                          child: showClose
                              ? IconButton(
                                  icon: Icon(Symbols.close),
                                  iconSize: 16,
                                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                  constraints: const BoxConstraints(),
                                  tooltip: 'Close',
                                  onPressed: _close,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showContextMenu(TapDownDetails details) => showContextMenu(
    context,
    contextMenu: ContextMenu(
      position: details.globalPosition,
      entries: <ContextMenuEntry>[
        MenuItem(
          label: Center(child: Text(widget.tab.pathWithNamespace)),
          enabled: false,
        ),
        const MenuDivider(),
        MenuItem(
          label: const Text('Close'),
          icon: const Icon(Symbols.close),
          onSelected: (_) => _close(),
        ),
        MenuItem(
          label: const Text('Close others'),
          icon: const Icon(Symbols.close_fullscreen),
          onSelected: (_) => _model.closeOthers(widget.tab),
        ),
        MenuItem(
          label: const Text('Close all'),
          icon: const Icon(Symbols.clear_all),
          onSelected: (_) => _model.closeAll(),
        ),
        const MenuDivider(),
        if (widget.tab.webUrl != null)
          MenuItem(
            label: const Text('Open in browser'),
            icon: const Icon(Symbols.open_in_browser, fill: 1),
            onSelected: (_) => launchUrl(Uri.parse(widget.tab.webUrl!)),
          ),
        MenuItem(
          label: const Text('Copy path'),
          icon: const Icon(Symbols.content_copy),
          onSelected: (_) => Clipboard.setData(ClipboardData(text: widget.tab.pathWithNamespace)),
        ),
      ],
    ),
  );
}
