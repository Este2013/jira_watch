import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/models/confluence_tabs_model.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_images.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_search_dialog.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_space_picker.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens the space picker and adds whatever the user chose.
Future<void> showConfluenceSpacePicker(BuildContext context) async {
  final picked = await showDialog<ConfluenceSpaceTab>(
    context: context,
    builder: (context) => const ConfluenceSpacePickerDialog(),
  );
  if (picked != null) DataModel().confluenceTabs.openSpace(picked);
}

/// Opens the search dialog; a chosen result becomes a new tab on its space,
/// already showing the page that was found.
Future<void> showConfluenceSearch(BuildContext context) async {
  final hit = await showDialog<ConfluenceSearchHit>(
    context: context,
    builder: (context) => const ConfluenceSearchDialog(),
  );
  if (hit == null) return;

  final model = DataModel().confluenceTabs;
  model.openSpace(
    ConfluenceSpaceTab(
      tabId: ConfluenceSpaceTab.newTabId(),
      spaceId: hit.spaceId ?? '',
      spaceKey: hit.spaceKey ?? '',
      // Search does not always report a space name; the key reads better than
      // an empty tab, and the space view corrects it once the page loads.
      spaceName: hit.spaceName ?? hit.spaceKey ?? 'Search result',
      pageId: hit.pageId,
      pageTitle: hit.title,
    ),
  );
}

class ConfluenceTabStrip extends StatefulWidget {
  const ConfluenceTabStrip({super.key});

  @override
  State<ConfluenceTabStrip> createState() => _ConfluenceTabStripState();
}

class _ConfluenceTabStripState extends State<ConfluenceTabStrip> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = DataModel().confluenceTabs;
    // Subscribed here rather than relying on the parent to rebuild us: this
    // widget is instantiated as `const`, and Flutter skips rebuilding a subtree
    // whose widget instance is identical, so a parent rebuild alone would never
    // re-run this build method.
    return AnimatedBuilder(
      animation: Listenable.merge([model.tabs, model.activeTabId, model.revision]),
      builder: (context, _) => SizedBox(
        height: 40,
        child: Row(
          children: [
            IconButton(
              tooltip: 'Search Confluence (Ctrl F)',
              icon: const Icon(Symbols.search),
              onPressed: () => showConfluenceSearch(context),
            ),
            Expanded(
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  for (final tab in model.tabs.list)
                    _SpaceTabChip(
                      key: ValueKey(tab.tabId),
                      tab: tab,
                      isActive: tab.tabId == model.activeTabId.value,
                    ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Open a space (Ctrl T)',
              icon: const Icon(Symbols.add),
              onPressed: () => showConfluenceSpacePicker(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpaceTabChip extends StatefulWidget {
  const _SpaceTabChip({super.key, required this.tab, required this.isActive});

  final ConfluenceSpaceTab tab;
  final bool isActive;

  @override
  State<_SpaceTabChip> createState() => _SpaceTabChipState();
}

class _SpaceTabChipState extends State<_SpaceTabChip> {
  bool _hovered = false;

  ConfluenceTabsModel get _model => DataModel().confluenceTabs;

  void _close() => _model.close(widget.tab);

  /// The article if one is open, the space otherwise — the same thing a browser
  /// tab shows, and what tells two tabs on one space apart.
  String get _label => widget.tab.pageTitle?.trim().isNotEmpty == true ? widget.tab.pageTitle! : widget.tab.spaceName;

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
                message: '${widget.tab.spaceName}${widget.tab.pageTitle == null ? '' : '\n${widget.tab.pageTitle}'}',
                waitDuration: const Duration(milliseconds: 600),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 120, maxWidth: 220),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    child: Row(
                      children: [
                        ConfluenceSpaceIcon(path: widget.tab.iconPath, size: 16, fallbackLabel: widget.tab.spaceName),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: widget.isActive ? FontWeight.w600 : null),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                          child: showClose
                              ? IconButton(
                                  icon: const Icon(Symbols.close),
                                  iconSize: 14,
                                  visualDensity: VisualDensity.compact,
                                  padding: EdgeInsets.zero,
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

  void _showContextMenu(TapDownDetails details) {
    final pageUrl = ConfluenceApi().webUrl(
      widget.tab.pageId == null ? '/spaces/${widget.tab.spaceKey}' : '/pages/viewpage.action?pageId=${widget.tab.pageId}',
    );

    showContextMenu(
      context,
      contextMenu: ContextMenu(
        position: details.globalPosition,
        entries: <ContextMenuEntry>[
          MenuItem(label: Center(child: Text(widget.tab.spaceName)), enabled: false),
          const MenuDivider(),
          MenuItem(
            label: const Text('Duplicate'),
            icon: const Icon(Symbols.content_copy),
            onSelected: (_) => _model.duplicate(widget.tab),
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
          if (pageUrl != null)
            MenuItem(
              label: const Text('Open in browser'),
              icon: const Icon(Symbols.open_in_browser, fill: 1),
              onSelected: (_) => launchUrl(Uri.parse(pageUrl)),
            ),
          MenuItem(
            label: const Text('Copy link'),
            icon: const Icon(Symbols.link),
            onSelected: (_) => Clipboard.setData(ClipboardData(text: pageUrl ?? widget.tab.spaceKey)),
          ),
        ],
      ),
    );
  }
}
