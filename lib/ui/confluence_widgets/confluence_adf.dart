import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:material_symbols_icons/symbols.dart';

/// How a link the reader clicked should be opened.
enum ConfluenceOpenMode {
  /// Replace the article in the tab that was clicked in.
  here,

  /// A new space tab, on Ctrl-click.
  newTab,

  /// A dialog showing only the article, on Alt-click.
  dialog,
}

/// Reads the modifiers held at the moment of a click.
///
/// Taken from the keyboard rather than passed down from a gesture: ADF links are
/// spans inside a paragraph, handled by a `TapGestureRecognizer`, which reports
/// no modifier state — and threading one through every builder to reach a span
/// would touch the whole renderer.
ConfluenceOpenMode currentOpenMode() {
  final pressed = HardwareKeyboard.instance.logicalKeysPressed;
  bool held(LogicalKeyboardKey left, LogicalKeyboardKey right) => pressed.contains(left) || pressed.contains(right);

  if (held(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.altRight)) return ConfluenceOpenMode.dialog;
  if (held(LogicalKeyboardKey.controlLeft, LogicalKeyboardKey.controlRight)) return ConfluenceOpenMode.newTab;
  return ConfluenceOpenMode.here;
}

/// The page id inside a Confluence URL, or null if it is not one this app can
/// open itself.
///
/// Two shapes carry an id outright:
///
///   /wiki/spaces/KEY/pages/123456/Some+Title
///   /wiki/pages/viewpage.action?pageId=123456
///
/// A third, `/wiki/x/AbCdEf`, is a tiny link whose id is only resolvable by
/// asking Confluence, so it is left to the browser rather than guessed at.
String? confluencePageIdIn(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null) return null;

  final fromQuery = uri.queryParameters['pageId'];
  if (fromQuery != null && int.tryParse(fromQuery) != null) return fromQuery;

  final segments = uri.pathSegments;
  final pagesAt = segments.indexOf('pages');
  if (pagesAt >= 0 && pagesAt + 1 < segments.length && int.tryParse(segments[pagesAt + 1]) != null) {
    return segments[pagesAt + 1];
  }
  return null;
}

/// Renders a page's images.
///
/// Confluence media comes in two forms and only one of them resembles Jira's.
/// An `external` node carries a URL outright. A `file` node carries only a
/// `fileId`, which has to be matched against the page's attachments — so this
/// needs the page it belongs to, which is why it is built per page rather than
/// being a single shared function.
Widget Function(BuildContext, Map<String, dynamic>, num) confluenceMediaBuilder(String pageId) {
  return (context, node, size) {
    final width = size.toDouble();

    if (node['type'] == 'external') {
      final url = node['url'] as String?;
      if (url == null) return const SizedBox.shrink();
      return _ZoomableImage(url: url, width: width, label: node['alt'] as String?);
    }

    final fileId = node['id'] as String?;
    if (fileId == null) return const SizedBox.shrink();

    return FutureBuilder<Map<String, String>>(
      future: ConfluenceApi().mediaUrls(pageId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2));
        final url = snapshot.data![fileId];
        if (url == null) {
          // An attachment can be on a different page than the one embedding it,
          // which this lookup does not follow. Saying so beats an empty gap.
          return Tooltip(
            message: 'This image is attached to another page, so it cannot be shown here.',
            child: Icon(Icons.image_not_supported_outlined, size: 20, color: Theme.of(context).hintColor),
          );
        }
        return _ZoomableImage(url: url, width: width, label: node['alt'] as String?);
      },
    );
  };
}

class _ZoomableImage extends StatelessWidget {
  const _ZoomableImage({required this.url, required this.width, this.label});

  final String url;
  final double width;
  final String? label;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        constraints: const BoxConstraints.expand(),
        title: Text(label ?? 'Image'),
        content: InteractiveViewer(
          child: Center(child: JiraImage(url: url, boxFit: BoxFit.contain, width: width)),
        ),
        actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
      ),
    ),
    child: JiraImage(url: url, boxFit: BoxFit.fitWidth, width: width),
  );
}

/// Labels a wiki link with the page's actual title.
///
/// A Confluence URL ends in a page id as often as a title slug, so a link chip
/// would otherwise read "2857762846" where the website reads "CHKB0 -
/// Dictionnary". Returns null for anything that is not a page this app can
/// identify, which leaves the chip on its fallback.
Future<String?> resolveConfluenceLinkTitle(String url) async {
  final pageId = confluencePageIdIn(url);
  return pageId == null ? null : ConfluenceApi().pageTitle(pageId);
}

/// Renders the macros that need Confluence itself, rather than only the
/// document — currently the child-pages listing.
///
/// The table of contents is not here: everything it needs is in the document,
/// so the renderer builds it without help.
Widget? Function(BuildContext, String, Map<String, dynamic>) confluenceMacroBuilder(
  ConfluencePage page, {
  required void Function(String pageId, ConfluenceOpenMode mode) onOpen,
}) {
  return (context, macroKey, node) {
    final parameters = node['attrs']?['parameters']?['macroParams'] as Map<String, dynamic>?;
    String param(String name) => '${parameters?[name]?['value'] ?? ''}'.trim();

    switch (macroKey) {
      // Confluence has shipped the child-pages macro under both names.
      case 'children':
      case 'child-pages':
        final root = param('page');
        return _ChildPagesMacro(pageId: page.id, rootTitle: root.isEmpty ? null : root, onOpen: onOpen);

      case 'pagetree':
        final root = param('root');
        return _PageTreeMacro(
          page: page,
          // `@home`, `@self`, `@parent`, or a page named by title. `@home` is
          // both the macro's default and what it carries in practice.
          root: root.isEmpty ? '@home' : root,
          spaceKey: param('spaces'),
          onOpen: onOpen,
        );
    }
    return null;
  };
}

class _ChildPagesMacro extends StatefulWidget {
  const _ChildPagesMacro({required this.pageId, required this.rootTitle, required this.onOpen});

  final String pageId;

  /// The macro's `page` parameter, when it points somewhere other than the page
  /// it sits on. Only a title, which is not something this can resolve without
  /// a search — so it is shown as a note rather than followed.
  final String? rootTitle;

  final void Function(String pageId, ConfluenceOpenMode mode) onOpen;

  @override
  State<_ChildPagesMacro> createState() => _ChildPagesMacroState();
}

class _ChildPagesMacroState extends State<_ChildPagesMacro> {
  late final Future<List<ConfluencePageNode>> _children;

  @override
  void initState() {
    super.initState();
    _children = ConfluenceApi().childPages(widget.pageId);
  }

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return FutureBuilder<List<ConfluencePageNode>>(
      future: _children,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('The child pages could not be listed.', style: TextStyle(color: colours.error));
        }
        if (!snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }

        final children = snapshot.data!;
        if (children.isEmpty) {
          return Text('This page has no child pages.', style: TextStyle(color: Theme.of(context).hintColor));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.rootTitle != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'Showing this page\'s children; the macro points at "${widget.rootTitle}".',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
                ),
              ),
            for (final child in children)
              InkWell(
                onTap: () => widget.onOpen(child.id, currentOpenMode()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    spacing: 6,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Symbols.description, size: 15, color: colours.primary),
                      Flexible(
                        child: Text(
                          child.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: colours.primary, decoration: TextDecoration.underline, decorationColor: colours.primary.withAlpha(90)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// The page-tree macro: a whole subtree, one level at a time.
///
/// Unlike the child-pages macro this can be rooted anywhere — `@home` (the
/// default), `@self`, `@parent`, or a page named by title — and in a different
/// space than the one being read, which the `spaces` parameter gives by key.
///
/// Everything starts collapsed and each level is fetched the first time it is
/// opened, because loading the whole subtree up front would be one request per
/// node on a tree nobody may expand.
class _PageTreeMacro extends StatefulWidget {
  const _PageTreeMacro({required this.page, required this.root, required this.spaceKey, required this.onOpen});

  final ConfluencePage page;
  final String root;
  final String spaceKey;
  final void Function(String pageId, ConfluenceOpenMode mode) onOpen;

  @override
  State<_PageTreeMacro> createState() => _PageTreeMacroState();
}

class _PageTreeMacroState extends State<_PageTreeMacro> {
  late final Future<({String? rootId, String? note})> _root;

  @override
  void initState() {
    super.initState();
    _root = _resolveRoot();
  }

  Future<({String? rootId, String? note})> _resolveRoot() async {
    final api = ConfluenceApi();

    switch (widget.root) {
      case '@self':
        return (rootId: widget.page.id, note: null);

      case '@parent':
        // A page at the top of its space has no parent, so its own subtree is
        // the nearest useful thing to show.
        return (rootId: widget.page.parentId ?? widget.page.id, note: null);

      case '@home':
        var spaceId = widget.page.spaceId;
        if (widget.spaceKey.isNotEmpty) {
          final space = await api.spaceByKey(widget.spaceKey);
          spaceId = space?.id ?? spaceId;
        }
        if (spaceId == null) return (rootId: null, note: 'This tree names a space that could not be found.');

        final home = await api.spaceHomepageId(spaceId);
        return home == null
            ? (rootId: null, note: 'That space has no home page for the tree to start from.')
            : (rootId: home, note: null);

      default:
        // A page title, which cannot be turned into an id without a search.
        // This page's own subtree beats showing nothing, as long as it says so.
        return (
          rootId: widget.page.id,
          note: 'This tree is rooted at "${widget.root}"; showing the current page instead.',
        );
    }
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<({String? rootId, String? note})>(
    future: _root,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)),
        );
      }

      final (rootId: rootId, note: note) = snapshot.data!;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (note != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                note,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
              ),
            ),
          if (rootId != null) _LazyTreeLevel(parentId: rootId, depth: 0, onOpen: widget.onOpen),
        ],
      );
    },
  );
}

/// One level of a lazily-expanded tree.
class _LazyTreeLevel extends StatefulWidget {
  const _LazyTreeLevel({required this.parentId, required this.depth, required this.onOpen});

  final String parentId;
  final int depth;
  final void Function(String pageId, ConfluenceOpenMode mode) onOpen;

  @override
  State<_LazyTreeLevel> createState() => _LazyTreeLevelState();
}

class _LazyTreeLevelState extends State<_LazyTreeLevel> {
  late final Future<List<ConfluencePageNode>> _children;

  @override
  void initState() {
    super.initState();
    _children = ConfluenceApi().childPages(widget.parentId);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<List<ConfluencePageNode>>(
    future: _children,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('This part of the tree could not be listed.', style: TextStyle(color: Theme.of(context).colorScheme.error));
      }
      if (!snapshot.hasData) {
        return Padding(
          padding: EdgeInsets.only(left: widget.depth * 16, top: 4, bottom: 4),
          child: const SizedBox(height: 14, width: 14, child: CircularProgressIndicator(strokeWidth: 2)),
        );
      }

      final children = snapshot.data!;
      if (children.isEmpty) {
        return Padding(
          padding: EdgeInsets.only(left: widget.depth * 16 + 24),
          child: Text(
            widget.depth == 0 ? 'Nothing under this page yet.' : 'Nothing here.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final child in children) _LazyTreeNode(node: child, depth: widget.depth, onOpen: widget.onOpen),
        ],
      );
    },
  );
}

class _LazyTreeNode extends StatefulWidget {
  const _LazyTreeNode({required this.node, required this.depth, required this.onOpen});

  final ConfluencePageNode node;
  final int depth;
  final void Function(String pageId, ConfluenceOpenMode mode) onOpen;

  @override
  State<_LazyTreeNode> createState() => _LazyTreeNodeState();
}

class _LazyTreeNodeState extends State<_LazyTreeNode> {
  /// Closed to begin with, and its children are not fetched until it is opened.
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: widget.depth * 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Every node gets a chevron. v2 reports no child count, so whether
              // anything sits under a page is only knowable by asking — and an
              // empty one says so rather than opening onto a blank.
              IconButton(
                tooltip: _expanded ? 'Collapse' : 'Expand',
                icon: AnimatedRotation(
                  turns: _expanded ? 0 : -0.25,
                  duration: Durations.short3,
                  child: const Icon(Symbols.expand_more),
                ),
                iconSize: 16,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => setState(() => _expanded = !_expanded),
              ),
              const SizedBox(width: 4),
              Icon(Symbols.article, size: 15, color: colours.primary),
              const SizedBox(width: 4),
              Flexible(
                child: InkWell(
                  onTap: () => widget.onOpen(widget.node.id, currentOpenMode()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(
                      widget.node.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: colours.primary, decoration: TextDecoration.underline, decorationColor: colours.primary.withAlpha(90)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_expanded) _LazyTreeLevel(parentId: widget.node.id, depth: widget.depth + 1, onOpen: widget.onOpen),
      ],
    );
  }
}

/// Flattens an ADF document to plain text, for comparing two revisions.
///
/// `DiffReviewer` diffs two strings, so a structural diff of the document tree
/// is out of reach; this is deliberately a reading of the prose. Block nodes are
/// separated by newlines so a paragraph moved or removed shows up as a change on
/// its own line rather than smearing across the whole document.
String adfToPlainText(Map<String, dynamic>? adf) {
  if (adf == null) return '';
  final buffer = StringBuffer();

  void walk(Object? node) {
    if (node is List) {
      for (final child in node) {
        walk(child);
      }
      return;
    }
    if (node is! Map) return;

    switch (node['type']) {
      case 'text':
        buffer.write(node['text'] ?? '');
      case 'hardBreak':
        buffer.write('\n');
      case 'emoji':
        buffer.write(node['attrs']?['text'] ?? node['attrs']?['shortName'] ?? '');
      case 'mention':
        buffer.write(node['attrs']?['text'] ?? '');
      case 'date':
        buffer.write(node['attrs']?['timestamp'] ?? '');
      case 'status':
        buffer.write(node['attrs']?['text'] ?? '');
      case 'inlineCard':
      case 'blockCard':
        buffer.write(node['attrs']?['url'] ?? '');
      default:
        walk(node['content']);
        if (_isBlock(node['type'])) buffer.write('\n');
    }
  }

  walk(adf['content']);
  // Collapses the runs of blank lines that nesting produces, which would
  // otherwise show up as changes when a section is merely re-nested.
  return buffer.toString().replaceAll(RegExp(r'\n{3,}'), '\n\n').trim();
}

/// Nodes that end a line.
///
/// Deliberately excludes the containers whose own children already end one —
/// `listItem`, `taskItem` and `tableRow` all wrap paragraphs — since counting
/// both would put a blank line between every bullet and read as a change in the
/// diff whenever a list was touched.
bool _isBlock(Object? type) => const {
  'blockquote',
  'bulletList',
  'codeBlock',
  'expand',
  'heading',
  'layoutSection',
  'mediaSingle',
  'nestedExpand',
  'orderedList',
  'panel',
  'paragraph',
  'rule',
  'table',
  'taskList',
}.contains(type);
