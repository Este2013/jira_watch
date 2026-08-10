import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/models/confluence_tabs_model.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_adf.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_article_view.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_images.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_page_tree.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_tab_strip.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// Waits for the saved tabs before building anything, so the strip does not
/// flash empty on the way in.
class ConfluencePagePreLoadView extends StatelessWidget {
  const ConfluencePagePreLoadView({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder<bool>(
    future: DataModel().confluenceTabs.isReady,
    builder: (context, snapshot) => snapshot.data == true ? const ConfluenceWorkspaceView() : const Center(child: CircularProgressIndicator()),
  );
}

/// The Confluence page: the tab strip plus the active space.
class ConfluenceWorkspaceView extends StatelessWidget {
  const ConfluenceWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = DataModel().confluenceTabs;

    return AnimatedBuilder(
      animation: Listenable.merge([model.tabs, model.activeTabId]),
      builder: (context, _) => CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.keyT, control: true): () => showConfluenceSpacePicker(context),
          const SingleActivator(LogicalKeyboardKey.keyF, control: true): () => showConfluenceSearch(context),
        },
        child: Focus(
          child: model.tabs.isEmpty
              ? const _NoTabsView()
              : Column(
                  children: [
                    const ConfluenceTabStrip(),
                    const Divider(height: 1),
                    Expanded(
                      // Keyed per tab so each keeps its own tree state, scroll
                      // position and open article while it is open.
                      child: IndexedStack(
                        index: model.activeIndex,
                        children: [
                          for (final tab in model.tabs.list) ConfluenceSpaceView(tab: tab, key: ValueKey(tab.tabId)),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _NoTabsView extends StatelessWidget {
  const _NoTabsView();

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        const Text('📚', style: TextStyle(fontSize: 72)),
        Text('No space is open.', style: Theme.of(context).textTheme.titleMedium),
        Text(
          'Open a space to browse its articles, or search across all of them.',
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            FilledButton.icon(
              icon: const Icon(Symbols.add),
              label: const Text('Open a space'),
              onPressed: () => showConfluenceSpacePicker(context),
            ),
            OutlinedButton.icon(
              icon: const Icon(Symbols.search),
              label: const Text('Search'),
              onPressed: () => showConfluenceSearch(context),
            ),
          ],
        ),
      ],
    ),
  );
}

/// One space: its page tree beside the open article.
class ConfluenceSpaceView extends StatefulWidget {
  const ConfluenceSpaceView({super.key, required this.tab});

  final ConfluenceSpaceTab tab;

  @override
  State<ConfluenceSpaceView> createState() => _ConfluenceSpaceViewState();
}

class _ConfluenceSpaceViewState extends State<ConfluenceSpaceView> {
  ConfluenceTabsModel get _model => DataModel().confluenceTabs;

  /// The divider position, as a fraction of the width. Not persisted — it is
  /// cheap to set again and a per-tab saved width would fight the window size.
  double _treeFraction = 0.28;

  /// Bumped to rebuild the tree and the article from scratch. Keying on it is
  /// simpler than threading a reload method into each, and it also drops any
  /// state they were holding — an open version history, a filter — which is
  /// what someone pressing refresh is asking for.
  int _reloadToken = 0;

  @override
  void initState() {
    super.initState();
    _describeSpace();
  }

  /// A tab opened from a search result carries a page but often no space name
  /// or icon, and a tab restored from an older file has no icon either. One
  /// lookup fills both in, and it is skipped when there is nothing to learn.
  Future<void> _describeSpace() async {
    if (widget.tab.spaceId.isEmpty) return;
    if (widget.tab.iconPath != null && widget.tab.spaceName.isNotEmpty && widget.tab.spaceKey.isNotEmpty) return;

    final space = await ConfluenceApi().space(widget.tab.spaceId);
    if (!mounted || space == null) return;
    setState(() => _model.describeSpace(widget.tab, name: space.name, key: space.key, iconPath: space.icon?.path));
  }

  void _open(String pageId, {String? title}) => setState(() => _model.setPage(widget.tab, pageId, title: title));

  void _goBack() => setState(() => _model.goBack(widget.tab));
  void _goForward() => setState(() => _model.goForward(widget.tab));

  void _refreshTab() => setState(() => _reloadToken++);

  /// A link inside an article. Ctrl opens a new tab, Alt a preview dialog, and
  /// a plain click replaces the article in this tab.
  void _openLink(String pageId, ConfluenceOpenMode mode) {
    switch (mode) {
      case ConfluenceOpenMode.here:
        _open(pageId);
      case ConfluenceOpenMode.newTab:
        // The linked page may well live in another space; the tab carries this
        // one's identity until the article loads and can say otherwise.
        _model.openSpace(
          ConfluenceSpaceTab(
            tabId: ConfluenceSpaceTab.newTabId(),
            spaceId: widget.tab.spaceId,
            spaceKey: widget.tab.spaceKey,
            spaceName: widget.tab.spaceName,
            pageId: pageId,
          ),
        );
      case ConfluenceOpenMode.dialog:
        showConfluenceArticleDialog(context, pageId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final spaceUrl = ConfluenceApi().webUrl('/spaces/${widget.tab.spaceKey}');

    return LayoutBuilder(
      builder: (context, constraints) {
        final treeWidth = (constraints.maxWidth * _treeFraction).clamp(200.0, 420.0);

        return Row(
          children: [
            SizedBox(
              width: treeWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                    child: Column(
                      children: [
                        // Centred, because the space is the heading of this
                        // pane rather than one control among several.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            ConfluenceSpaceIcon(path: widget.tab.iconPath, size: 20, fallbackLabel: widget.tab.spaceName),
                            Flexible(
                              child: Text(
                                widget.tab.spaceName,
                                style: Theme.of(context).textTheme.titleSmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  tooltip: 'Back',
                                  icon: const Icon(Symbols.arrow_back),
                                  visualDensity: VisualDensity.compact,
                                  onPressed: widget.tab.canGoBack ? _goBack : null,
                                ),
                                IconButton(
                                  tooltip: 'Forward',
                                  icon: const Icon(Symbols.arrow_forward),
                                  visualDensity: VisualDensity.compact,
                                  onPressed: widget.tab.canGoForward ? _goForward : null,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  tooltip: 'Reload this tab',
                                  icon: const Icon(Symbols.refresh),
                                  visualDensity: VisualDensity.compact,
                                  onPressed: _refreshTab,
                                ),
                                if (spaceUrl != null)
                                  IconButton(
                                    tooltip: 'Create a page on the website',
                                    icon: const Icon(Symbols.add_circle),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () => launchUrl(Uri.parse('$spaceUrl/pages/createpage.action')),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ConfluencePageTree(
                      key: ValueKey('tree|${widget.tab.tabId}|$_reloadToken'),
                      tab: widget.tab,
                      onOpen: (node) => _open(node.id, title: node.title),
                    ),
                  ),
                ],
              ),
            ),
            _DragDivider(
              onDrag: (delta) => setState(() {
                _treeFraction = ((treeWidth + delta) / constraints.maxWidth).clamp(0.15, 0.5);
              }),
            ),
            Expanded(
              child: widget.tab.pageId == null
                  ? Center(
                      child: Text('Pick an article from the tree.', style: TextStyle(color: Theme.of(context).hintColor)),
                    )
                  : ConfluenceArticleView(
                      // Keyed so switching articles rebuilds the state rather
                      // than showing the previous page's history panel.
                      key: ValueKey('${widget.tab.pageId}|$_reloadToken'),
                      pageId: widget.tab.pageId!,
                      onOpenLink: _openLink,
                      // The tab labels itself with the article, which is only
                      // known once the page is in — a page reached by a link or
                      // by going back was never named in the tree.
                      onTitleResolved: (title) => setState(() => _model.describePage(widget.tab, title)),
                    ),
            ),
          ],
        );
      },
    );
  }
}

class _DragDivider extends StatelessWidget {
  const _DragDivider({required this.onDrag});

  final void Function(double delta) onDrag;

  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.resizeLeftRight,
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragUpdate: (details) => onDrag(details.delta.dx),
      child: const SizedBox(width: 8, child: VerticalDivider(width: 8)),
    ),
  );
}

/// The alt-click preview: an article on its own, with no space around it.
Future<void> showConfluenceArticleDialog(BuildContext context, String pageId) => showDialog(
  context: context,
  builder: (context) => Dialog(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900, maxHeight: 720),
      child: Column(
        children: [
          Expanded(
            child: ConfluenceArticleView(
              pageId: pageId,
              compact: true,
              // A link inside a preview opens another preview rather than
              // reaching back into a tab the reader cannot see behind it.
              onOpenLink: (id, _) => showConfluenceArticleDialog(context, id),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
            ),
          ),
        ],
      ),
    ),
  ),
);
