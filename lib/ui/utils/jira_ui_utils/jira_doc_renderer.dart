import 'dart:math';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/single_work_item_view.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:jira_watcher/ui/utils/spanning_table.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../updates_widgets/issue_ui_elements.dart';

Color selectionColor = const Color(0x336694e8);

/// One heading in a document, found before rendering starts.
///
/// Collected up front rather than as headings are built, because a table of
/// contents is normally the first thing on a page — by the time the headings
/// themselves render, the widget that has to list them has already been built.
class AdfHeading {
  AdfHeading({required this.node, required this.text, required this.level}) : key = GlobalKey();

  final Map<String, dynamic> node;
  final String text;
  final int level;

  /// Lets a table of contents scroll to the heading.
  final GlobalKey key;
}

/// Renderer for Atlassian Document Format (Jira doc) JSON.
class AdfRenderer extends StatefulWidget {
  const AdfRenderer({
    super.key,
    required this.adf,
    this.mediaBuilder,
    this.macroBuilder,
    this.linkHandler,
    this.linkTitleResolver,
    this.textStyle,
    this.codeStyle,
    this.textScale = 1.0,
    this.paragraphSpacing = 8.0,
    this.listIndent = 16.0,
    this.bulletGap = 8.0,
    required this.attachments,
  });

  /// Parsed ADF JSON map (root document object).
  final Map<String, dynamic> adf;

  /// Builds a widget for a `media` node using its attrs.
  ///
  /// attrs example (file):
  /// {"type":"file","id":"[uuid]","alt":"image.png","width":532,"height":477}
  final Widget Function(BuildContext context, Map<String, dynamic> attrs, num size)? mediaBuilder;

  /// Builds a widget for a macro this renderer cannot handle itself — anything
  /// needing data from the server it came from, like a list of a page's
  /// children. Returning null falls back to the labelled placeholder.
  ///
  /// Kept as a callback so the renderer stays free of any one product's API.
  final Widget? Function(BuildContext context, String macroKey, Map<String, dynamic> node)? macroBuilder;

  /// Called when a link is tapped. If null, uses default launcher (if available)
  /// otherwise does nothing.
  final void Function(String url)? linkHandler;

  /// Resolves a link to something worth reading.
  ///
  /// A wiki URL often ends in a bare page id, which is what a link chip would
  /// otherwise be labelled with. Null, or a null result, keeps the URL.
  final Future<String?> Function(String url)? linkTitleResolver;

  final TextStyle? textStyle;
  final TextStyle? codeStyle;

  /// Multiplies every text size in the document, for readers who want the
  /// article larger without resizing the rest of the app.
  final double textScale;

  final double paragraphSpacing;
  final double listIndent;
  final double bulletGap;

  // List of attached files for the work item; some rendering blocks like media or mediaInline require access to those, to match ids to the actual file url.
  final List? attachments;

  @override
  State<AdfRenderer> createState() => _AdfRendererState();

  /// Renders a `media` node's attachment, whatever it turns out to be.
  ///
  /// A `media` node only ever carries an id — nothing here says up front
  /// whether it is a picture, a text file, or a zip, so the id has to be
  /// resolved to its full attachment via [mediaIdToAttachment] before anything
  /// can be drawn. Only an `image/*` mimetype gets the picture treatment;
  /// everything else — `text/plain`, `application/json`, video, archives,
  /// whatever a Jira attachment can be — opens [AttachmentsDialog], the same
  /// dialog the Details view's own attachment carousel already renders every
  /// one of those correctly in. That is deliberately not duplicated here.
  static Widget defaultMediaBuilder(Map node, BuildContext context, List attachments, num size) {
    if (node['type'] != 'file') {
      throw Exception('Media node of type: ${node['type']} is not handled');
    }
    final id = node['id'] as String;

    return FutureBuilder(
      future: mediaIdToAttachment(id, attachments),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

        final attachment = snapshot.data as Map?;
        if (attachment == null) {
          // The id could not be matched to any of this document's attachments
          // — most likely one that has since been deleted.
          return Tooltip(
            message: 'This attachment is no longer available.',
            child: Icon(Symbols.broken_image, size: size.toDouble().clamp(24, 48)),
          );
        }

        final mimeType = (attachment['mimeType'] as String?) ?? '';
        final contentUrl = attachment['content'] as String?;
        final filename = attachment['filename'] as String?;

        if (mimeType.startsWith('image/') && contentUrl != null) {
          return InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                constraints: BoxConstraints.expand(),
                title: Row(
                  children: [
                    Text(filename ?? node.toString()),
                    Spacer(),
                  ],
                ),
                content: InteractiveViewer(
                  child: Center(
                    child: JiraImage(
                      url: contentUrl,
                      boxFit: BoxFit.contain,
                      width: size.toDouble(),
                    ),
                  ),
                ),
                actions: [
                  TextButton(onPressed: Navigator.of(context).pop, child: Text('Close')),
                ],
              ),
            ),
            child: JiraImage(
              url: contentUrl,
              boxFit: BoxFit.fitWidth,
              width: size.toDouble(),
            ),
          );
        }

        return InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => showDialog(context: context, builder: (context) => AttachmentsDialog([attachment])),
          child: Container(
            // Sized like the Details view's own attachment carousel tiles
            // rather than left to expand: Container.alignment makes it fill
            // whatever bounded width its parent offers once set, which inside
            // a mediaGroup's Wrap is the whole line — a fixed width the size
            // this node was actually asked for keeps every card the same
            // width whether it sits alone or beside others in a group. Height
            // is left alone: the enclosing SizedBox already fixes that from
            // the node's own width/height attrs, and a value here would just
            // be overridden by it regardless of what it said.
            width: size.toDouble(),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).carouselViewTheme.backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).dividerColor),
              //
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              children: [
                Icon(_iconForAttachment(mimeType, filename), size: 40),
                Text(
                  filename ?? (mimeType.isEmpty ? 'Attachment' : mimeType),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Mirrors the icon choices the Details view's own attachment carousel
  /// makes, so a file looks the same whether it is met inline in a document or
  /// in that carousel.
  static IconData _iconForAttachment(String mimeType, String? filename) {
    if (mimeType == 'text/plain') {
      return (filename?.endsWith('.md') ?? false) ? Symbols.markdown : Symbols.text_fields;
    }
    if (mimeType == 'application/json') return Symbols.file_json;
    if (mimeType.startsWith('video/')) return Symbols.movie;
    if (filename != null && ['.zip', '.7z'].any(filename.endsWith)) return Symbols.folder_zip;
    return Symbols.file_present_rounded;
  }
}

class _AdfRendererState extends State<AdfRenderer> {
  /// Every heading in the document, in order, each with a key of its own.
  late List<AdfHeading> _headings;

  /// The same headings by identity of their node, so a heading being built can
  /// find the key that was minted for it. Identity works because the whole
  /// document is one decoded object graph that outlives every rebuild.
  late Map<Map<String, dynamic>, AdfHeading> _byNode;

  @override
  void initState() {
    super.initState();
    _scanHeadings();
  }

  @override
  void didUpdateWidget(AdfRenderer old) {
    super.didUpdateWidget(old);
    // Only when the document itself changed: rescanning on every rebuild would
    // mint new GlobalKeys and force the whole article to rebuild from scratch.
    if (!identical(old.adf, widget.adf)) setState(_scanHeadings);
  }

  void _scanHeadings() {
    _headings = [];
    _byNode = Map.identity();

    void walk(Object? node) {
      if (node is List) {
        for (final child in node) {
          walk(child);
        }
        return;
      }
      if (node is! Map<String, dynamic>) return;
      if (node['type'] == 'heading') {
        final heading = AdfHeading(
          node: node,
          text: _plainTextOf(node),
          level: (node['attrs']?['level'] as num?)?.toInt() ?? 1,
        );
        _headings.add(heading);
        _byNode[node] = heading;
      }
      walk(node['content']);
    }

    walk(widget.adf['content']);
  }

  static String _plainTextOf(Object? node) {
    if (node is List) return node.map(_plainTextOf).join();
    if (node is! Map) return '';
    if (node['type'] == 'text') return '${node['text'] ?? ''}';
    return _plainTextOf(node['content']);
  }

  @override
  Widget build(BuildContext context) {
    final renderer = _AdfRenderer(
      adf: widget.adf,
      bulletGap: widget.bulletGap,
      codeStyle: widget.codeStyle,
      linkHandler: widget.linkHandler,
      linkTitleResolver: widget.linkTitleResolver,
      listIndent: widget.listIndent,
      macroBuilder: widget.macroBuilder,
      mediaBuilder: widget.mediaBuilder ?? (context, node, size) => AdfRenderer.defaultMediaBuilder(node, context, widget.attachments ?? [], size),
      paragraphSpacing: widget.paragraphSpacing,
      textStyle: widget.textStyle,
      attachments: widget.attachments,
      headings: _headings,
      headingOf: (node) => _byNode[node],
    );

    return SelectionArea(
      // Scaling through MediaQuery rather than by overriding styles: it reaches
      // every piece of text in the subtree, including the ones built by widgets
      // that pick their own style.
      child: widget.textScale == 1.0
          ? renderer
          : MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(MediaQuery.textScalerOf(context).scale(1) * widget.textScale),
              ),
              child: renderer,
            ),
    );
  }
}

class _AdfRenderer extends StatelessWidget with UiLoggy {
  const _AdfRenderer({
    required this.adf,
    this.mediaBuilder,
    this.macroBuilder,
    this.linkHandler,
    this.linkTitleResolver,
    this.textStyle,
    this.codeStyle,
    this.paragraphSpacing = 8.0,
    this.listIndent = 16.0,
    this.bulletGap = 8.0,
    this.attachments,
    this.headings = const [],
    this.headingOf,
  });

  /// Parsed ADF JSON map (root document object).
  final Map<String, dynamic> adf;

  /// Builds a widget for a `media` node using its attrs.
  ///
  /// attrs example (file):
  /// {"type":"file","id":"[uuid]","alt":"image.png","width":532,"height":477}
  final Widget Function(BuildContext context, Map<String, dynamic> attrs, num size)? mediaBuilder;

  final Widget? Function(BuildContext context, String macroKey, Map<String, dynamic> node)? macroBuilder;

  /// Called when a link is tapped. If null, uses default launcher (if available)
  /// otherwise does nothing.
  final void Function(String url)? linkHandler;

  final Future<String?> Function(String url)? linkTitleResolver;

  final TextStyle? textStyle;
  final TextStyle? codeStyle;

  final double paragraphSpacing;
  final double listIndent;
  final double bulletGap;

  final List? attachments;

  /// Every heading in the document, found before rendering — see [AdfHeading].
  final List<AdfHeading> headings;

  /// The heading record minted for a node, if it is one.
  final AdfHeading? Function(Map<String, dynamic> node)? headingOf;

  @override
  Widget build(BuildContext context) {
    final rootContent = _asList(adf['content']);
    final children = <Widget>[];

    for (final node in rootContent) {
      final w = _buildNode(context, node, 0);
      if (w != null) children.add(w);
    }

    return RichText(
      textScaler: MediaQuery.textScalerOf(context),
      selectionRegistrar: SelectionContainer.maybeOf(context),
      selectionColor: selectionColor,
      text: TextSpan(
        children:
            _withParagraphSpacing(children, paragraphSpacing)
                .map((e) => WidgetSpan(child: e))
                .expand(
                  (e) => [e, TextSpan(text: '\n')],
                )
                .toList()
              ..safelyRemoveLast(),
      ),
    );
  }

  /// Scales an icon or avatar to match the text around it.
  ///
  /// An explicit `size:` overrides any ambient IconTheme, so icons in this
  /// document would stay put while the prose grew — which reads as the
  /// magnifier being broken. Everything sized by hand goes through here.
  double _scaled(BuildContext context, double size) => MediaQuery.textScalerOf(context).scale(size);

  List<Widget> _withParagraphSpacing(List<Widget> children, double spacing) {
    final spaced = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      spaced.add(children[i]);
      if (i < children.length - 1) spaced.add(SizedBox(height: spacing));
    }
    return spaced;
  }

  Widget? _buildNode(BuildContext context, Map<String, dynamic>? node, int indentLevel, {TextStyle? transferStyle}) {
    if (node == null) return null;
    final type = node['type'] as String?;
    switch (type) {
      case 'blockCard':
        return _buildBlockCard(context, node);
      case 'blockquote':
        return _buildBlockquote(context, node, indentLevel);
      case 'bulletList':
        return _buildBulletList(context, node, indentLevel);
      case 'codeBlock':
        return _buildCodeBlock(context, node);
      // Confluence-only from here. None of these appear in Jira ADF, so adding
      // them changes nothing for work items — but a wiki page made of macros,
      // layouts and expandable sections is mostly invisible without them.
      case 'date':
        return _buildDate(context, node);
      case 'expand':
      case 'nestedExpand':
        return _buildExpand(context, node, indentLevel);
      case 'extension':
      case 'bodiedExtension':
      case 'inlineExtension':
        return _buildExtension(context, node, indentLevel);
      case 'layoutSection':
        return _buildLayoutSection(context, node, indentLevel);
      case 'layoutColumn':
        return _buildLayoutColumn(context, node, indentLevel);
      case 'orderedList':
        return _buildOrderedList(context, node, indentLevel);
      case 'rule':
        return const Divider(height: 24);
      case 'status':
        return _buildStatus(context, node);
      case 'emoji':
        return _buildEmoji(context, node);
      case 'heading':
        // Keyed so a table of contents can scroll to it. KeyedSubtree rather
        // than a key on the built widget, which _buildHeading does not accept.
        final heading = headingOf?.call(node);
        final built = _buildHeading(context, node);
        return heading == null ? built : KeyedSubtree(key: heading.key, child: built);
      case 'inlineCard':
        return _buildInlineCard(context, node);
      case 'listItem':
        return _buildListItem(context, node, indentLevel);
      case 'media':
        return _buildMedia(context, node, 200);
      case 'mediaSingle':
        return _buildMediaSingle(context, node, indentLevel);
      case 'mediaGroup':
        return _buildMediaGroup(context, node, indentLevel);
      case 'mediaInline':
        return _buildMediaInline(context, node, indentLevel);
      case 'mention':
        return _buildMention(context, node);
      case 'panel':
        return _buildPanel(context, node);
      case 'paragraph':
        return _buildParagraph(context, node);
      case 'table':
        return _buildTable(context, node);
      case 'taskList':
        return _buildTaskList(context, node, indentLevel);
      case 'text':
        return SelectableText(
          _textOf(node),
          style: _defaultCodeStyle(context).merge(transferStyle),
          selectionColor: selectionColor,
        );
      default:
        // Unknown node: render its children (best-effort) to avoid data loss.
        final children = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();
        if (children.isEmpty) return const SizedBox.shrink();
        return RichText(
          textScaler: MediaQuery.textScalerOf(context),
          selectionRegistrar: SelectionContainer.maybeOf(context),
          selectionColor: selectionColor,
          text: TextSpan(
            children:
                children
                    .map((e) => WidgetSpan(child: e))
                    .expand(
                      (e) => [e, TextSpan(text: '\n')],
                    )
                    .toList()
                  ..removeLast(),
          ),
        );
    }
  }

  TextStyle _defaultTextStyle(BuildContext context) {
    return textStyle ?? Theme.of(context).textTheme.bodyMedium!;
  }

  TextStyle _defaultCodeStyle(BuildContext context) {
    final base =
        codeStyle ??
        Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'monospace',
        );
    return base;
  }

  String _textOf(Map<String, dynamic> node) => ((node['text'] ?? '') as String);

  Widget _buildBlockCard(BuildContext context, Map<String, dynamic> node) {
    var targetUrl = node['attrs']['url'] as String?;
    if (targetUrl == null) {
      loggy.error('There is a blockCard node without a provided URL? Dev did not expect that:\n${node.toString()}');
      return ErrorWidget('There is a blockCard node without a provided URL? Dev did not expect that.');
    }
    if (targetUrl.startsWith('https://${JiraAuth().domain}/wiki')) {
      // TODO Confluence link
      return ActionChip(
        avatar: Icon(Symbols.book_2),
        label: Text(targetUrl.split('/').last.split('+').join(' ')),
        tooltip: 'Confluence wiki link\n$targetUrl',
        onPressed: () => launchUrl(Uri.parse(targetUrl)),
      );
    }
    if (targetUrl.startsWith('https://${JiraAuth().domain}')) {
      return Card(
        clipBehavior: .hardEdge,
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: FutureBuilder(
          future: DataModel().jiraApi.workItem(targetUrl.split('/').last),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasError) return ErrorWidget('Error while fetching blockCard with URL: $targetUrl\n${asyncSnapshot.error}');
            if (asyncSnapshot.data == null) {
              return asyncSnapshot.connectionState == ConnectionState.done ? ErrorWidget('Jira would not return the work item for blockCard with URL: $targetUrl') : LinearProgressIndicator();
            }
            var workItem = JiraWorkItemData.fromJson({'data': asyncSnapshot.data!});
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => SingleJiraWorkItemDialog(workItem, initialTab: JiraWorkItemTab.details),
                );
              },
              child: LimitedBox(
                maxWidth: 600,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    spacing: 8,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          if (workItem.fields?['issuetype']['iconUrl'] != null) JiraAvatar(url: workItem.fields!['issuetype']['iconUrl'], size: _scaled(context, 20)) else Icon(Symbols.broken_image),
                          Expanded(
                            child: Text(
                              '${workItem.key}: ${workItem.fields?['summary']}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          JiraWorkItemStatusIndicator(issue: workItem),
                        ],
                      ),
                      DefaultTextStyle(
                        style: TextStyle(color: Theme.of(context).hintColor),
                        child: Row(
                          spacing: 8,
                          children: [
                            if (workItem.fields?['assignee']['avatarUrls'] != null) JiraAvatar(url: workItem.fields!['assignee']?['avatarUrls']?['16x16'], size: _scaled(context, 24)) else Icon(Symbols.broken_image),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Assigned to ${workItem.fields?['assignee']?['displayName'].toString() ?? 'null'}"),
                                    TextSpan(
                                      text: ' ･ ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: "Updated ${timeAgo(timeStr: workItem.fields?['updated'])}"),
                                    TextSpan(
                                      text: ' ･ ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: (workItem.fields?['priority']['iconUrl'] != null) ? JiraAvatar(url: workItem.fields?['priority']?['iconUrl'], size: _scaled(context, 16)) : Icon(Symbols.broken_image),
                                      ),
                                    ),
                                    TextSpan(text: ' ${workItem.fields?['priority']?['name'] ?? ''}'),
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        toPlainText(workItem.fields?['description']),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      GestureRecognizer recognizer;
      recognizer = TapGestureRecognizer()
        ..onTap = () {
          if (targetUrl.isEmpty) return;
          defaultLinkHandler(targetUrl);
        };
      return RichText(
        textScaler: MediaQuery.textScalerOf(context),
        selectionRegistrar: SelectionContainer.maybeOf(context),
        text: TextSpan(
          text: targetUrl,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
          recognizer: recognizer,
        ),
      );
    }
  }

  /// A numbered list.
  ///
  /// Built here rather than left to the default case, which would recurse into
  /// the items and give every one a bullet — turning an ordered list into an
  /// unordered one without any sign that it happened.
  Widget _buildOrderedList(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final start = (node['attrs']?['order'] as num?)?.toInt() ?? 1;
    final items = _asList(node['content']);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++) _buildListItem(context, items[i], indentLevel, marker: '${start + i}.'),
      ],
    );
  }

  Widget _buildBlockquote(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final children = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();
    final colours = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: colours.outlineVariant, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _withParagraphSpacing(children, paragraphSpacing),
      ),
    );
  }

  /// Confluence's collapsible section.
  ///
  /// Starts closed, as it does on the website: an author collapses something
  /// precisely because it is detail most readers can skip.
  Widget _buildExpand(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final children = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();

    return Card(
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        dense: true,
        shape: const Border(),
        title: Text(
          (node['attrs']?['title'] as String?)?.trim().isNotEmpty == true ? node['attrs']['title'] as String : 'Details',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: _withParagraphSpacing(children, paragraphSpacing),
      ),
    );
  }

  /// A Confluence macro.
  ///
  /// Macros run on Confluence's server, so a client cannot execute one. Two
  /// cases are still worth more than nothing:
  ///
  /// - A macro migrated from the legacy editor carries its original body under
  ///   `parameters.nestedContent` as a whole ADF document. That is real content
  ///   and is rendered.
  /// - A bodied macro has children of its own, which are rendered under a label.
  ///
  /// Anything else becomes a labelled chip, so a reader can see that something
  /// is there and open the page on the website. Rendering nothing — which is
  /// what the default case did — loses the content silently.
  Widget _buildExtension(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final attrs = node['attrs'] as Map<String, dynamic>? ?? const {};
    final parameters = attrs['parameters'] as Map<String, dynamic>? ?? const {};
    // Read defensively: this is macro metadata off the wire, and a sibling
    // field in the same object (schemaVersion) is a {value: ...} wrapper rather
    // than a bare string, so a hard cast here is one Atlassian change away from
    // throwing mid-render.
    final metadataTitle = parameters['macroMetadata']?['title'];
    final name = (metadataTitle is String ? metadataTitle : metadataTitle?['value']?.toString()) ?? (attrs['extensionKey'] as String?) ?? 'Macro';

    final macroKey = attrs['extensionKey'] as String?;

    // Built here because everything it needs is in the document already.
    if (macroKey == 'toc') return _buildTableOfContents(context, parameters);

    // Anything else that needs data from the server this document came from.
    final delegated = macroKey == null ? null : macroBuilder?.call(context, macroKey, node);
    if (delegated != null) return delegated;

    final nested = parameters['nestedContent'];
    if (nested is Map<String, dynamic>) {
      final children = _asList(nested['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();
      if (children.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _withParagraphSpacing(children, paragraphSpacing),
        );
      }
    }

    final children = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();
    final label = Tooltip(
      message: 'This is a Confluence macro. It runs on the server, so it cannot be rendered here — open the page on the website to see it.',
      child: Chip(
        avatar: Icon(Symbols.extension, size: _scaled(context, 14)),
        label: Text(name, style: const TextStyle(fontSize: 11)),
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
    );

    if (children.isEmpty) return label;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [label, ..._withParagraphSpacing(children, paragraphSpacing)],
    );
  }

  /// Confluence's table-of-contents macro.
  ///
  /// Built from the headings found before rendering started, so it works even
  /// though it sits above every heading it lists. Confluence's own `minLevel`
  /// and `maxLevel` parameters are honoured; the rest of the macro's options
  /// are styling, which this ignores.
  Widget _buildTableOfContents(BuildContext context, Map<String, dynamic> parameters) {
    int? level(String name) => int.tryParse('${parameters['macroParams']?[name]?['value'] ?? ''}');
    final minLevel = level('minLevel') ?? 1;
    final maxLevel = level('maxLevel') ?? 6;

    final listed = headings.where((h) => h.level >= minLevel && h.level <= maxLevel).toList();
    if (listed.isEmpty) return const SizedBox.shrink();

    // Indented relative to the shallowest heading actually listed, so a page
    // whose headings all start at level 3 is not pushed off to the right.
    final shallowest = listed.map((h) => h.level).reduce((a, b) => a < b ? a : b);
    final colours = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      color: colours.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 6,
              children: [
                Icon(Symbols.toc, size: _scaled(context, 16), color: colours.onSurfaceVariant),
                Text('On this page', style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: 4),
            for (final heading in listed)
              Padding(
                padding: EdgeInsets.only(left: (heading.level - shallowest) * 14.0),
                child: InkWell(
                  // The heading may not be laid out yet — it is below the fold
                  // on a long page — in which case there is nothing to scroll
                  // to and the tap is simply ignored.
                  onTap: () {
                    final target = heading.key.currentContext;
                    if (target != null) Scrollable.ensureVisible(target, duration: Durations.medium2, alignment: 0.1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      heading.text,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: colours.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: colours.primary.withAlpha(90),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Confluence's multi-column page layout.
  ///
  /// Laid out as a row when there is room and stacked when there is not, since
  /// three columns of prose in a narrow pane are unreadable.
  Widget _buildLayoutSection(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final columns = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();
    if (columns.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth < 600
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: _withParagraphSpacing(columns, paragraphSpacing))
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [for (final column in columns) Expanded(child: column)],
            ),
    );
  }

  Widget _buildLayoutColumn(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final children = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _withParagraphSpacing(children, paragraphSpacing),
    );
  }

  /// The coloured lozenge Confluence uses for states like DRAFT or DONE.
  Widget _buildStatus(BuildContext context, Map<String, dynamic> node) {
    final attrs = node['attrs'] as Map<String, dynamic>? ?? const {};
    final colours = Theme.of(context).colorScheme;
    // ADF names a colour rather than giving one, and the palette is fixed.
    final background = switch (attrs['color']) {
      'green' => Colors.green,
      'red' => Colors.red,
      'yellow' => Colors.amber,
      'blue' => Colors.blue,
      'purple' => Colors.purple,
      _ => colours.outline,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: background.withAlpha(60),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: background.withAlpha(120)),
      ),
      child: Text(
        '${attrs['text'] ?? ''}'.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  /// An inline date. ADF carries it as epoch milliseconds in a string.
  Widget _buildDate(BuildContext context, Map<String, dynamic> node) {
    final raw = int.tryParse('${node['attrs']?['timestamp'] ?? ''}');
    if (raw == null) return const SizedBox.shrink();
    final date = DateTime.fromMillisecondsSinceEpoch(raw);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Widget _buildBulletList(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final items = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }

  Widget? _buildCodeBlock(BuildContext context, Map<String, dynamic> node) {
    var t = Theme.of(context).colorScheme;

    return Card(
      color: t.surfaceContainerHighest,
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            for (var c in node['content'] as List) _buildNode(context, c, 0, transferStyle: TextStyle(fontFamily: 'RobotoMono')),
          ].where((element) => element != null).toList().cast(),
        ),
      ),
    );
  }

  /// emoji is an inline node.
  /// There are three kinds of emoji:
  ///  - Standard — Unicode emoji
  ///  - Atlassian — Non-standard emoji introduced by Atlassian
  ///  - Site — Non-standard customer defined emoji
  Widget _buildEmoji(BuildContext context, Map<String, dynamic> node) {
    // TODO emotes are not supported in jira API. feature will not happen for atlassian-custom emotes.
    String id = node['attrs']['id'], text = node['attrs']['text'], shortName = node['attrs']['shortName'];
    Widget? byId = {
      'atlassian-check_mark': Icon(Symbols.check_circle, color: Colors.green),
      'atlassian-cross_mark': Transform.rotate(
        angle: pi / 4,
        child: Icon(Symbols.add_circle, color: Colors.red),
      ),
    }[id];
    if (byId != null) return Tooltip(message: shortName, child: byId);
    Widget? byName = {
      ':windows:': Icon(Symbols.window),
      ':macos:': Icon(Icons.apple),
    }[shortName.toLowerCase()];
    if (byName != null) return Tooltip(message: shortName, child: byName);
    if (id.startsWith('atlassian-')) {
      loggy.warning('Do not know how to render the atlassian emoji: ID: $id, text: $text');
    }
    return Text(text);
  }

  Widget _buildHeading(BuildContext context, Map<String, dynamic> node) {
    final headingLevel = node['attrs']['level'] ?? 1;

    TextStyle style;
    switch (headingLevel) {
      case 6:
      case 5:
      case 4:
        style = Theme.of(context).textTheme.titleSmall!;
        break;
      case 3:
        style = Theme.of(context).textTheme.bodyLarge!;
        break;
      case 2:
        style = Theme.of(context).textTheme.titleMedium!;
        break;
      case 1:
      default:
        style = Theme.of(context).textTheme.titleLarge!;
        break;
    }
    return _buildParagraph(
      context,
      node,
      style: style,
    );
  }

  Widget? _buildInlineCard(BuildContext context, Map<String, dynamic> node) {
    var url = node['attrs']['url'];
    if (url == null) return null;
    if (url.startsWith('https://${JiraAuth().domain}/wiki')) {
      // The last path segment is a page id as often as it is a title slug —
      // a link pasted from the address bar has no slug at all — so the chip
      // showed a bare number where Confluence shows a name. The resolver asks
      // what the page is actually called; the slug remains the fallback.
      final fallback = Uri.decodeComponent(url.split('/').last.split('?').first).split('+').join(' ');
      final looksLikeAnId = int.tryParse(fallback) != null;

      return FutureBuilder<String?>(
        future: linkTitleResolver?.call(url),
        builder: (context, snapshot) => ActionChip(
          avatar: Icon(Symbols.book_2, size: _scaled(context, 18)),
          label: Text(
            snapshot.data ?? (looksLikeAnId ? 'Confluence page' : fallback),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          tooltip: 'Confluence wiki link\n$url',
          onPressed: () {
            if (linkHandler != null) {
              linkHandler!(url);
            } else {
              launchUrl(Uri.parse(url));
            }
          },
        ),
      );
    }
    if ((url as String).startsWith('https://${SettingsModel().domainController.text}.atlassian.net/browse')) {
      // Jira workItem card
      var issueKey = url
          .replaceAll(
            'https://${SettingsModel().domainController.text}.atlassian.net/browse/',
            '',
          )
          .replaceAll(
            RegExp(r'\?.*'),
            '',
          );
      var response = DataModel().jiraApi.workItem(issueKey);

      return FutureBuilder(
        future: response,
        builder: (context, asyncSnapshot) {
          var t = Theme.of(context).colorScheme;
          if (asyncSnapshot.hasError) {
            return ActionChip(
              tooltip: 'Error while looking up $url as a Jira inlineCard:\n\n${asyncSnapshot.error}',
              label: Text(
                'Error',
                style: TextStyle(color: t.onErrorContainer),
              ),
              backgroundColor: t.errorContainer,
              onPressed: () => launchUrl(Uri.parse(url)),
            );
          }
          if (asyncSnapshot.connectionState == ConnectionState.done) {
            if (asyncSnapshot.data != null) {
              var issue = JiraWorkItemData(asyncSnapshot.data!, lastCacheUpdate: DateTime.now());
              return ActionChip(
                visualDensity: .compact,
                labelPadding: .zero,
                // avatarBoxConstraints: .tightFor(width: 16, height: 16),
                padding: .only(right: 4),
                label: Wrap(
                  spacing: 8,
                  children: [
                    Text(
                      '$issueKey: ${issue.fields?['summary']}',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
                    ),
                    JiraWorkItemStatusIndicator(issue: issue),
                  ],
                ),
                avatar: JiraAvatar(url: issue.fields?['issuetype']['iconUrl'], size: _scaled(context, 16)),

                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SingleJiraWorkItemDialog(issue, initialTab: JiraWorkItemTab.details),
                  );
                  // launchUrl(Uri.parse(url));
                },
              );
            }
            return Tooltip(
              message: 'Jira servers said nope while looking up $url as a Jira inlineCard.',
              child: ActionChip(
                label: Text('Error', style: TextStyle(color: t.onErrorContainer)),
                backgroundColor: t.errorContainer,
                onPressed: () => launchUrl(Uri.parse(url)),
              ),
            );
          }
          return ActionChip(
            label: Text('Fetching $issueKey...'),
            onPressed: () => launchUrl(Uri.parse(url)),
          );
        },
      );
    }

    return ActionChip(
      label: Text(node['attrs']['url']),
      onPressed: () => launchUrl(Uri.parse(url)),
    );
  }

  List<InlineSpan> _buildInlineSpans(BuildContext context, List<Map<String, dynamic>> content, {TextStyle? style}) {
    final spans = <InlineSpan>[];
    for (final node in content) {
      if (node['type'] == 'text') {
        final text = _textOf(node);
        final marks = _asList(node['marks']);
        style ??= _defaultTextStyle(context);
        GestureRecognizer? recognizer;

        for (final mark in marks) {
          switch (mark['type']) {
            case 'strong':
              style = style!.merge(const TextStyle(fontWeight: FontWeight.w600));
              break;
            case 'em':
              style = style!.merge(const TextStyle(fontStyle: FontStyle.italic));
              break;
            case 'underline':
              style = style!.merge(const TextStyle(decoration: TextDecoration.underline));
              break;
            case 'strike':
              style = style!.merge(const TextStyle(decoration: TextDecoration.lineThrough));
              break;
            case 'code':
              style = _defaultCodeStyle(context).merge(
                TextStyle(
                  fontFamily: 'RobotoMono',
                  background: Paint()
                    ..color = Theme.of(context).colorScheme.surfaceContainerHighest
                    ..style = PaintingStyle.fill,
                  letterSpacing: 0.25,
                ),
              );
              break;
            case 'link':
              final href = (mark['attrs']?['href'] ?? '') as String;
              style = style!.merge(
                TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              );
              recognizer = TapGestureRecognizer()
                ..onTap = () {
                  if (href.isEmpty) return;
                  // Either the caller's handler or the browser, not both. Both
                  // meant a custom handler could add behaviour but never replace
                  // it, so a reader that opens wiki links in its own tab would
                  // still launch a browser window alongside.
                  if (linkHandler != null) {
                    linkHandler!(href);
                  } else {
                    defaultLinkHandler(href);
                  }
                };
              break;
          }
        }

        spans.add(TextSpan(text: text, style: style, recognizer: recognizer));
      } else if (node['type'] == 'hardBreak') {
        spans.add(const TextSpan(text: '\n'));
      } else if (node['type'] == 'emoji') {
        // Basic emoji support: render as text using shortName or text attr.
        spans.add(WidgetSpan(child: _buildEmoji(context, node)));
      } else {
        var nodeRender = _buildNode(context, node, 0);
        if (nodeRender != null) {
          spans.add(WidgetSpan(child: nodeRender, alignment: PlaceholderAlignment.middle));
        }
      }
    }
    return spans;
  }

  /// [marker] replaces the bullet, for an ordered list's numbering. Null keeps
  /// the bullet, which is what a bulletList and a bare listItem want.
  Widget _buildListItem(BuildContext context, Map<String, dynamic> node, int indentLevel, {String? marker}) {
    // A listItem can contain one or more paragraphs and nested lists.
    final children = _asList(node['content']);

    // First paragraph (if present) becomes the bullet line; remaining nodes render below indented.
    final List<Map<String, dynamic>> paragraphs = [];
    final List<Map<String, dynamic>> nested = [];

    for (final c in children) {
      final type = c['type'];
      if (type == 'paragraph') {
        paragraphs.add(c);
      } else {
        nested.add(c);
      }
    }

    final bulletLine = paragraphs.isNotEmpty ? _buildParagraph(context, paragraphs.first) : const SizedBox.shrink();

    final bulletRow = RichText(
      textScaler: MediaQuery.textScalerOf(context),
      text: TextSpan(
        children: [
          WidgetSpan(child: SizedBox(width: indentLevel * listIndent)),
          if (marker == null) BulletListBulletSpan(indent: 1) else TextSpan(text: marker, style: Theme.of(context).textTheme.bodyMedium),
          WidgetSpan(child: SizedBox(width: bulletGap)),
          WidgetSpan(child: bulletLine),
        ],
      ),
    );

    final below = <Widget>[];

    // Render any additional paragraphs for this list item.
    for (var i = 1; i < paragraphs.length; i++) {
      below.add(
        Padding(
          padding: EdgeInsets.only(left: (indentLevel + 1) * listIndent + bulletGap + 8),
          child: _buildParagraph(context, paragraphs[i]),
        ),
      );
    }

    // Render nested lists under this item.
    for (final n in nested) {
      final w = _buildNode(context, n, indentLevel + 1);
      if (w != null) {
        below.add(
          Padding(
            padding: EdgeInsets.only(left: (indentLevel + 1) * listIndent + bulletGap + 8),
            child: w,
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bulletRow,
        if (below.isNotEmpty) ..._withParagraphSpacing(below, paragraphSpacing / 2),
      ],
    );
  }

  Widget _buildMedia(BuildContext context, Map<String, dynamic> node, num size) {
    final attrs = (node['attrs'] ?? const <String, dynamic>{}) as Map<String, dynamic>;
    final alt = (attrs['alt'] ?? 'media').toString();
    final w = (attrs['width'] is num) ? (attrs['width'] as num).toDouble() : 240.0;
    final h = (attrs['height'] is num) ? (attrs['height'] as num).toDouble() : 160.0;
    if (mediaBuilder != null) {
      return SizedBox(height: h * size / w, child: mediaBuilder!(context, attrs, size));
    }

    // Fallback generic box if no mediaBuilder provided
    return Container(
      constraints: BoxConstraints(maxWidth: w, maxHeight: h),

      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: RichText(
        textScaler: MediaQuery.textScalerOf(context),
        text: TextSpan(text: alt, style: _defaultTextStyle(context)),
        selectionRegistrar: SelectionContainer.maybeOf(context),
        selectionColor: selectionColor,
      ),
    );
  }

  Widget _buildMediaSingle(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final attrs = (node['attrs'] ?? const <String, dynamic>{}) as Map<String, dynamic>;
    // "wrap-left", "center", "wrap-right", "wide", "full-width", "align-start", "align-end"
    final layout = (attrs['layout'] ?? 'center') as String; // 'align-start' | 'align-end' | 'center'
    final width = (attrs['width'] is num) ? (attrs['width'] as num).toDouble() : null;

    // print('w:$width');

    final mediaNode = _asList(node['content']).firstWhere(
      (e) => e['type'] == 'media',
      orElse: () => const <String, dynamic>{},
    );

    final media = SizedBox(width: width ?? 500, child: _buildMedia(context, Map<String, dynamic>.from(mediaNode), width ?? 500));

    Alignment alignment = Alignment.centerLeft;
    if (layout == 'align-end') alignment = Alignment.centerRight;
    if (layout == 'center') alignment = Alignment.center;

    final child = media;

    return Container(
      alignment: alignment,
      padding: EdgeInsets.only(left: indentLevel * listIndent),
      // color: Colors.amber,
      child: child,
    );
  }

  Widget? _buildMediaInline(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final attrs = (node['attrs'] ?? const <String, dynamic>{}) as Map<String, dynamic>;
    if (attrs['type'] == 'file') {
      // match ID with attachment
      String id = attrs['id'];

      return FutureBuilder(
        future: mediaIdToAttachment(id, attachments ?? []),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ActionChip(
                  avatar: Icon(Symbols.attach_file),
                  label: Text((snapshot.data?['filename']).toString()),
                  onPressed: snapshot.hasData ? () => showDialog(context: context, builder: (context) => AttachmentsDialog([snapshot.data!])) : null,
                )
              : CircularProgressIndicator();
        },
      );

      // return JiraAvatar(url: attachment['content']);
    } else {
      throw Exception('Media node of type: ${node['type']} is not handled');
    }
  }

  Widget? _buildMediaGroup(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [for (var subnode in node['content']) _buildNode(context, subnode, indentLevel) ?? SizedBox()],
    );
  }

  Widget? _buildMention(BuildContext context, Map<String, dynamic> node) {
    var t = Theme.of(context).colorScheme;
    String userIdMentionned = node['attrs']['id'];
    Future<bool> isMe = DataModel().jiraApi.myself().then(
      (me) => me != null && me['accountId'] == userIdMentionned,
    );

    return FutureBuilder(
      future: isMe,
      builder: (context, asyncSnapshot) {
        bool isMentionOfMe = asyncSnapshot.hasData && asyncSnapshot.data!;
        return Chip(
          backgroundColor: isMentionOfMe ? t.primary : null,

          label: Text(
            node['attrs']['text'],
            style: isMentionOfMe ? TextStyle(color: t.onPrimary) : null,
          ),
        );
      },
    );
  }

  /// The panel node is a  top-level block node, representing a container that highlights content.
  Widget _buildPanel(BuildContext context, Map<String, dynamic> node) {
    // "info", "note", "warning", "success", "error"
    bool isLightMode = Theme.brightnessOf(context) == Brightness.light;
    String type = node['attrs']?['panelType'] ?? 'info';
    Color back;
    Icon icon;
    switch (type) {
      case 'note':
        back = isLightMode ? Color(0xFFf8eefe) : Color(0xFF35243f);
        icon = Icon(Symbols.note, color: Colors.purpleAccent);
        break;
      case 'warning':
        back = isLightMode ? Color(0xFFfef7c8) : Color(0xFF332e1b);
        icon = Icon(Symbols.warning_rounded, color: Colors.amber);
        break;
      case 'success':
        back = isLightMode ? Color(0xFFdcfff1) : Color(0xFF1c3329);
        icon = Icon(Symbols.check_circle, color: Colors.green);
        break;
      case 'error':
        back = isLightMode ? Color(0xFFffeceb) : Color(0xFF42221f);
        icon = Icon(Symbols.error, color: Colors.red);
        break;
      case 'info':
      default:
        back = isLightMode ? Color(0xFFe9f2fe) : Color(0xFF1c2b42);
        icon = Icon(Symbols.info, color: Colors.lightBlue);
        break;
    }
    return Card(
      color: back,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Flexible(
              child: RichText(
                textScaler: MediaQuery.textScalerOf(context),
                text: TextSpan(
                  children: _buildInlineSpans(context, (node['content'] as List).cast()),
                ),
                selectionRegistrar: SelectionContainer.maybeOf(context),
                selectionColor: selectionColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(BuildContext context, Map<String, dynamic> node, {TextStyle? style}) {
    final spans = _buildInlineSpans(context, _asList(node['content']), style: style);
    if (spans.isEmpty) {
      return const SizedBox(height: 0); // empty paragraph -> minimal gap
    }
    return RichText(
      textScaler: MediaQuery.textScalerOf(context),
      text: TextSpan(
        style: style ?? _defaultTextStyle(context),
        children: spans,
      ),
      selectionRegistrar: SelectionContainer.maybeOf(context),
      selectionColor: selectionColor,
      textAlign: TextAlign.start,
    );
  }

  /// Top-level block node, providing a container for the nodes that define a table.
  Widget _buildTable(BuildContext context, Map<String, dynamic> node) {
    var table = SpanTable.fromJiraNode(
      node,
      context: context,
      cellContentBuilder: (cell) => _buildNode(context, cell.cast(), 0),
    );

    if (kDebugMode) {
      return Column(
        children: [
          FilledButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SpanTableTestPage(
                  providedJiraTableNode: node,
                  providedJiraCellContentBuilder: (cell) => _buildNode(context, cell.cast(), 0),
                ),
              ),
            ),
            style: FilledButton.styleFrom(backgroundColor: Colors.amber.shade900),
            child: Text('DEBUG TABLES'),
          ),
          table,
        ],
      );
    }
    return table;
  }

  Widget _buildTaskList(BuildContext context, Map<String, dynamic> node, int indent) {
    List content = node['content'];
    List<InlineSpan> spans = [];
    for (var e in content) {
      if (e['type'] == 'taskItem') {
        spans.add(
          WidgetSpan(
            alignment: .top,
            child: Padding(
              padding: EdgeInsets.only(left: indent * 24.0),
              child: SizedBox.square(
                // to remove checkbox padding
                dimension: 24,
                child: Checkbox(
                  value: e['attrs']['state'] != 'TODO',
                  onChanged: null,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
          ),
        );
        spans.add(
          WidgetSpan(
            alignment: .top,
            child: _buildParagraph(context, e),
          ),
        );
      } else if (e['type'] == 'taskList') {
        spans.add(WidgetSpan(child: _buildTaskList(context, e, indent + 1)));
      }
      spans.add(TextSpan(text: '\n'));
    }
    spans.removeLast();
    return RichText(
      textScaler: MediaQuery.textScalerOf(context),
      text: TextSpan(children: spans),
      selectionRegistrar: SelectionContainer.maybeOf(context),
      selectionColor: selectionColor,
    );
  }

  static List<Map<String, dynamic>> _asList(dynamic v) {
    if (v is List) {
      return v.whereType<Map<String, dynamic>>().toList();
    }
    return const [];
  }

  void defaultLinkHandler(String url) => launchUrl(Uri.parse(url));

  List<String> _buildPlainTextInlineSpans(List<Map<String, dynamic>> content, {TextStyle? style}) {
    final spans = <String>[];
    for (final node in content) {
      if (node['type'] == 'text') {
        spans.add(_textOf(node).trim());
      } else if (node['type'] == 'hardBreak') {
        spans.add('\n');
      } else {
        var nodeRender = _buildPlainTextNode(node, 0);
        if (nodeRender != null) {
          spans.add(nodeRender);
        }
      }
    }
    return spans;
  }

  String? _buildPlainTextNode(Map<String, dynamic>? node, int indentLevel, {TextStyle? transferStyle}) {
    if (node == null) return null;
    final type = node['type'] as String?;
    switch (type) {
      case 'blockCard':
        return node['attrs']['url'];
      case 'bulletList':
        final items = _asList(node['content']).map((c) => _buildPlainTextNode(c, indentLevel)).whereType<Widget>().toList();
        return ' • ${items.join('\n • ')}';
      // case 'codeBlock':
      //   return _buildCodeBlock(context, node);
      // case 'emoji':
      //   return _buildEmoji(context, node);
      // case 'heading':
      //   return _buildHeading(context, node);
      // case 'inlineCard':
      //   return _buildInlineCard(context, node);
      // case 'listItem':
      //   return _buildListItem(context, node, indentLevel);
      // case 'media':
      //   return _buildMedia(context, node, 200);
      // case 'mediaSingle':
      //   return _buildMediaSingle(context, node, indentLevel);
      // case 'mention':
      //   return _buildMention(context, node);
      // case 'panel':
      //   return _buildPanel(context, node);
      case 'paragraph':
        final spans = _buildPlainTextInlineSpans(_asList(node['content']));
        if (spans.isEmpty) {
          return "";
        }
        return spans.join(' ');
      // case 'table':
      //   return ;
      case 'text':
        return _textOf(node);
      default:
        // Unknown node: render its children (best-effort) to avoid data loss.
        final children = _asList(node['content']).map((c) => _buildPlainTextNode(c, indentLevel)).toList();
        if (children.isEmpty) return "";
        return children.join('\n');
    }
  }

  /// Takes in an ADF document's root node, and mashes all its nodes within to text as possible, with no formatting.
  String toPlainText(Map? document) {
    if (document == null) return 'null';
    return (document['content'] as List).map((c) => _buildPlainTextNode(c, 0)).join('\n');
  }
}

class BulletListBulletSpan extends WidgetSpan {
  BulletListBulletSpan({this.indent = 1}) : super(child: SelectableText('•'), alignment: .middle);

  final int indent;

  @override
  void computeToPlainText(
    StringBuffer buffer, {
    bool includeSemanticsLabels = true,
    bool includePlaceholders = true,
  }) {
    buffer.write('\n${"\t" * indent} ');
  }
}

Future<dynamic> mediaIdToAttachment(
  String mediaId,
  List<dynamic> attachments,
) async {
  final client = HttpClient()..autoUncompress = false;

  try {
    for (final a in attachments) {
      final contentUrl = (a['content'] as String?)?.trim();
      if (contentUrl == null || contentUrl.isEmpty) continue;

      final uri = Uri.parse(contentUrl);
      final req = await client.getUrl(uri);

      // Auth + do NOT follow the redirect
      req.followRedirects = false;
      req.headers.set(HttpHeaders.authorizationHeader, JiraAuth().authHeader);
      // (optional) be explicit about what we want
      req.headers.set(HttpHeaders.acceptHeader, '*/*');

      final res = await req.close();

      // We expect 303 with a Location header to api.media.atlassian.com
      final loc = res.headers.value(HttpHeaders.locationHeader);

      if (loc == null || loc.isEmpty) {
        // Some proxies/CDNs may reply 302/307/308 as well; still check location.
        // If missing, skip gracefully.
        await res.drain();
        continue;
      }

      // Extract UUID from .../file/<uuid>/binary
      final match = RegExp(
        r'[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}',
      ).firstMatch(loc);

      if (match != null) {
        final attachmentMediaId = match.group(0)!;
        if (attachmentMediaId == mediaId) {
          await res.drain();
          return a;
        }
      }

      await res.drain();
    }
  } finally {
    client.close(force: true);
  }

  return null;
}

extension on List {
  void safelyRemoveLast() {
    if (isEmpty) return;
    removeLast();
  }
}
