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
  String pageId, {
  required void Function(String pageId, ConfluenceOpenMode mode) onOpen,
}) {
  return (context, macroKey, node) {
    // Confluence has shipped this macro under both names.
    if (macroKey != 'children' && macroKey != 'child-pages') return null;

    final parameters = node['attrs']?['parameters']?['macroParams'] as Map<String, dynamic>?;
    // The macro can be pointed at another page; with no root it lists the
    // children of the page it sits on.
    final root = '${parameters?['page']?['value'] ?? ''}'.trim();

    return _ChildPagesMacro(
      pageId: pageId,
      rootTitle: root.isEmpty ? null : root,
      onOpen: onOpen,
    );
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
