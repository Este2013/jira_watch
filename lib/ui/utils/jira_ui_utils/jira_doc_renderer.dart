import 'dart:convert';
import 'dart:math';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/single_work_item_view.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:jira_watcher/ui/utils/spanning_table.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/material_symbols_metadata.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../updates_widgets/issue_ui_elements.dart';

Color selectionColor = const Color(0x336694e8);

/// Renderer for Atlassian Document Format (Jira doc) JSON.
class AdfRenderer extends StatelessWidget {
  const AdfRenderer({
    super.key,
    required this.adf,
    this.mediaBuilder,
    this.linkHandler,
    this.textStyle,
    this.codeStyle,
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

  /// Called when a link is tapped. If null, uses default launcher (if available)
  /// otherwise does nothing.
  final void Function(String url)? linkHandler;

  final TextStyle? textStyle;
  final TextStyle? codeStyle;

  final double paragraphSpacing;
  final double listIndent;
  final double bulletGap;

  // List of attached files for the work item; some rendering blocks like media or mediaInline require access to those, to match ids to the actual file url.
  final List? attachments;

  @override
  Widget build(BuildContext context) => SelectionArea(
    child: _AdfRenderer(
      adf: adf,
      bulletGap: bulletGap,
      codeStyle: codeStyle,
      linkHandler: linkHandler,
      listIndent: listIndent,
      mediaBuilder: mediaBuilder,
      paragraphSpacing: paragraphSpacing,
      textStyle: textStyle,
      attachments: attachments,
    ),
  );

  static Widget defaultMediaBuilder(Map node, BuildContext context, List attachments, num size) {
    if (node['type'] == 'file') {
      // match ID with attachment
      String id = node['id'];

      return FutureBuilder(
        future: Future.microtask(
          () async {
            var map = await mediaIdToContentUrl(attachments);
            return map[id];
          },
        ),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      constraints: BoxConstraints.expand(),
                      title: Row(
                        children: [
                          Text(node.toString()),
                          Spacer(),
                          // IconButton(onPressed: () => launchUrl(Uri.parse(contentURL)), icon: Icon(Icons.download)),
                        ],
                      ),
                      content: InteractiveViewer(
                        child: Center(
                          child: JiraImage(
                            url: snapshot.data!,
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
                    url: snapshot.data!,
                    boxFit: BoxFit.fitWidth,
                    width: size.toDouble(),
                  ),
                )
              : CircularProgressIndicator();
        },
      );

      // return JiraAvatar(url: attachment['content']);
    } else {
      throw Exception('Media node of type: ${node['type']} is not handled');
    }
  }
}

class _AdfRenderer extends StatelessWidget with UiLoggy {
  const _AdfRenderer({
    required this.adf,
    this.mediaBuilder,
    this.linkHandler,
    this.textStyle,
    this.codeStyle,
    this.paragraphSpacing = 8.0,
    this.listIndent = 16.0,
    this.bulletGap = 8.0,
    this.attachments,
  });

  /// Parsed ADF JSON map (root document object).
  final Map<String, dynamic> adf;

  /// Builds a widget for a `media` node using its attrs.
  ///
  /// attrs example (file):
  /// {"type":"file","id":"[uuid]","alt":"image.png","width":532,"height":477}
  final Widget Function(BuildContext context, Map<String, dynamic> attrs, num size)? mediaBuilder;

  /// Called when a link is tapped. If null, uses default launcher (if available)
  /// otherwise does nothing.
  final void Function(String url)? linkHandler;

  final TextStyle? textStyle;
  final TextStyle? codeStyle;

  final double paragraphSpacing;
  final double listIndent;
  final double bulletGap;

  final List? attachments;

  @override
  Widget build(BuildContext context) {
    final rootContent = _asList(adf['content']);
    final children = <Widget>[];

    for (final node in rootContent) {
      final w = _buildNode(context, node, 0);
      if (w != null) children.add(w);
    }

    return RichText(
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
      case 'bulletList':
        return _buildBulletList(context, node, indentLevel);
      case 'codeBlock':
        return _buildCodeBlock(context, node);
      case 'emoji':
        return _buildEmoji(context, node);
      case 'heading':
        return _buildHeading(context, node);
      case 'inlineCard':
        return _buildInlineCard(context, node);
      case 'listItem':
        return _buildListItem(context, node, indentLevel);
      case 'media':
        return _buildMedia(context, node, 200);
      case 'mediaSingle':
        return _buildMediaSingle(context, node, indentLevel);

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
        return Text(
          _textOf(node).trim(),
          style: _defaultCodeStyle(context).merge(transferStyle),
          selectionColor: selectionColor,
        );
      default:
        // Unknown node: render its children (best-effort) to avoid data loss.
        final children = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();
        if (children.isEmpty) return const SizedBox.shrink();
        return RichText(
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

  String _textOf(Map<String, dynamic> node) => ((node['text'] ?? '') as String).trim();

  Widget _buildBlockCard(BuildContext context, Map<String, dynamic> node) {
    var targetUrl = node['attrs']['url'] as String?;
    if (targetUrl == null) {
      loggy.error('There is a blockCard node without a provided URL? Dev did not expect that:\n${node.toString()}');
      return ErrorWidget('There is a blockCard node without a provided URL? Dev did not expect that.');
    }
    if (targetUrl.startsWith('https://${APIDao().domain}')) {
      return Card(
        clipBehavior: .hardEdge,
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: FutureBuilder(
          future: DataModel().jiraApi.getWorkItem(targetUrl.split('/').last),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasError) return ErrorWidget('Error while fetching blockCard with URL: $targetUrl\n${asyncSnapshot.error}');
            if (!asyncSnapshot.hasData) {
              return LinearProgressIndicator();
            }
            var workItem = JiraWorkItemData.fromJson({'data': jsonDecode(asyncSnapshot.data!.body)});
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
                          if (workItem.fields?['issuetype']['iconUrl'] != null) JiraAvatar(url: workItem.fields!['issuetype']['iconUrl'], size: 20) else Icon(Symbols.broken_image),
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
                            if (workItem.fields?['assignee']['avatarUrls'] != null) JiraAvatar(url: workItem.fields!['assignee']?['avatarUrls']?['16x16'], size: 24) else Icon(Symbols.broken_image),
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
                                        child: (workItem.fields?['priority']['iconUrl'] != null) ? JiraAvatar(url: workItem.fields?['priority']?['iconUrl'], size: 16) : Icon(Symbols.broken_image),
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
      'atlassian-check_mark': Icon(Icons.check_circle, color: Colors.green),
      'atlassian-cross_mark': Transform.rotate(
        angle: pi / 4,
        child: Icon(Icons.add_circle, color: Colors.red),
      ),
    }[id];
    if (byId != null) return Tooltip(message: shortName, child: byId);
    Widget? byName = {
      ':windows:': Icon(Icons.window),
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
      var response = DataModel().jiraApi.getWorkItem(issueKey);

      return FutureBuilder(
        future: response,
        builder: (context, asyncSnapshot) {
          var t = Theme.of(context).colorScheme;
          if (asyncSnapshot.hasError) {
            return Tooltip(
              message: 'Error while looking up $url as a Jira inlineCard:\n\n${asyncSnapshot.error}',
              child: ActionChip(
                label: Text(
                  'Error',
                  style: TextStyle(color: t.onErrorContainer),
                ),
                backgroundColor: t.errorContainer,
                onPressed: () => launchUrl(Uri.parse(url)),
              ),
            );
          }
          if (asyncSnapshot.hasData) {
            if (asyncSnapshot.data?.statusCode == 200) {
              var issue = JiraWorkItemData(jsonDecode(asyncSnapshot.data?.body ?? ''), lastCacheUpdate: DateTime.now());
              return ActionChip(
                label: Wrap(
                  spacing: 8,
                  children: [
                    Text(
                      '$issueKey: ${issue.fields?['summary']}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    JiraWorkItemStatusIndicator(issue: issue),
                  ],
                ),
                avatar: JiraAvatar(url: issue.fields?['issuetype']['iconUrl']),

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
              message: 'Jira servers said nope while looking up $url as a Jira inlineCard:\n\nResponse status: ${asyncSnapshot.data?.statusCode}\n${asyncSnapshot.data?.reasonPhrase}',
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
                  if (linkHandler != null) {
                    linkHandler!(href);
                  }
                  defaultLinkHandler(href);
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

  Widget _buildListItem(BuildContext context, Map<String, dynamic> node, int indentLevel) {
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

    final bulletRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: indentLevel * listIndent),
        RichText(text: BulletListBulletSpan(indent: 1)),
        SizedBox(width: bulletGap),
        Expanded(child: bulletLine),
      ],
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

  Widget? _buildMention(BuildContext context, Map<String, dynamic> node) {
    var t = Theme.of(context).colorScheme;
    String userIdMentionned = node['attrs']['id'];
    Future<bool> isMe = DataModel().jiraApi.myself().then(
      (value) => jsonDecode(value.body)['accountId'] == userIdMentionned,
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
        icon = Icon(Icons.note, color: Colors.purpleAccent);
        break;
      case 'warning':
        back = isLightMode ? Color(0xFFfef7c8) : Color(0xFF332e1b);
        icon = Icon(Icons.warning_rounded, color: Colors.amber);
        break;
      case 'success':
        back = isLightMode ? Color(0xFFdcfff1) : Color(0xFF1c3329);
        icon = Icon(Icons.check_circle, color: Colors.green);
        break;
      case 'error':
        back = isLightMode ? Color(0xFFffeceb) : Color(0xFF42221f);
        icon = Icon(Icons.error, color: Colors.red);
        break;
      case 'info':
      default:
        back = isLightMode ? Color(0xFFe9f2fe) : Color(0xFF1c2b42);
        icon = Icon(Icons.info, color: Colors.lightBlue);
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
    return RichText(text: TextSpan(children: spans));
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
        return ' ･ ' + items.join('\n ･ ');
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
  BulletListBulletSpan({this.indent = 1}) : super(child: Text('•'));

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

/// Given a list of Jira attachment objects (from the REST API),
/// resolves their Media Service IDs by following the redirect
/// from the attachment.content URL.
///
/// Returns a map of `mediaId` → `contentUrl`.
///
/// Requires:
/// - [attachments] : List of attachment JSON objects
/// - [jiraToken]   : Jira Cloud API OAuth or PAT token
///
/// Example:
/// final mapping = await mapMediaIdsToAttachments(attachments, jiraToken);
/// print(mapping); // { "43b3bd1f-0d90-4798-8bff-bf84ba84ca00": "https://elgato.atlassian.net/rest/api/3/attachment/content/70981" }
/// Returns a map of mediaId (UUID) -> attachment content URL.
/// [attachments] is the list from Jira's REST API under "fields.attachments".
/// [jiraToken] is your OAuth2/PAT bearer token.
/// Works on Dart VM / Flutter mobile/desktop. Not suitable for Flutter Web.
Future<Map<String, String>> mediaIdToContentUrl(
  List<dynamic> attachments,
) async {
  final result = <String, String>{};
  final client = HttpClient()..autoUncompress = false;

  try {
    for (final a in attachments) {
      final contentUrl = (a['content'] as String?)?.trim();
      if (contentUrl == null || contentUrl.isEmpty) continue;

      final uri = Uri.parse(contentUrl);
      final req = await client.getUrl(uri);

      // Auth + do NOT follow the redirect
      req.followRedirects = false;
      req.headers.set(HttpHeaders.authorizationHeader, APIDao().authHeader);
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
        final mediaId = match.group(0)!;
        result[mediaId] = contentUrl;
      }

      await res.drain();
    }
  } finally {
    client.close(force: true);
  }

  return result;
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
      req.headers.set(HttpHeaders.authorizationHeader, APIDao().authHeader);
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
