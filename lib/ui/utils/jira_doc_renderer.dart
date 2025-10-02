import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/home/overview_widgets/avatar.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:url_launcher/url_launcher.dart';

/// A lightweight renderer for Atlassian Document Format (Jira doc) JSON.
///
/// Supported nodes (initial set):
/// - document root { version, type, content }
/// - paragraph
/// - text (with marks: bold, italic, underline, strike, code, link)
/// - bulletList
/// - listItem (including nested lists)
/// - mediaSingle -> media (file/external) via [mediaBuilder]
///
/// Extension points:
/// - Provide a [mediaBuilder] to render images/attachments given the media attrs
///   (e.g., map Jira file id -> a NetworkImage or a custom widget).
/// - Provide [linkHandler] to intercept link taps.
/// - Provide [textStyle] and [codeStyle] to align with app theming.
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
  });

  /// Parsed ADF JSON map (root document object).
  final Map<String, dynamic> adf;

  /// Builds a widget for a `media` node using its attrs.
  ///
  /// attrs example (file):
  /// {"type":"file","id":"<uuid>","alt":"image.png","width":532,"height":477}
  final Widget Function(BuildContext context, Map<String, dynamic> attrs)? mediaBuilder;

  /// Called when a link is tapped. If null, uses default launcher (if available)
  /// otherwise does nothing.
  final void Function(String url)? linkHandler;

  final TextStyle? textStyle;
  final TextStyle? codeStyle;

  final double paragraphSpacing;
  final double listIndent;
  final double bulletGap;

  @override
  Widget build(BuildContext context) {
    final rootContent = _asList(adf['content']);
    final children = <Widget>[];

    for (final node in rootContent) {
      final w = _buildNode(context, node, 0);
      if (w != null) children.add(w);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _withParagraphSpacing(children, paragraphSpacing),
    );
  }

  List<Widget> _withParagraphSpacing(List<Widget> children, double spacing) {
    final spaced = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      spaced.add(children[i]);
      if (i != children.length - 1) spaced.add(SizedBox(height: spacing));
    }
    return spaced;
  }

  Widget? _buildNode(BuildContext context, Map<String, dynamic>? node, int indentLevel) {
    if (node == null) return null;
    final type = node['type'] as String?;
    switch (type) {
      case 'paragraph':
        return _buildParagraph(context, node);
      case 'text':
        // `text` nodes are handled inside paragraph RichText. If we get here
        // directly (edge cases), just render a Text.
        return Text(_textOf(node), style: _defaultTextStyle(context));
      case 'mention':
        return _buildMention(context, node);
      case 'bulletList':
        return _buildBulletList(context, node, indentLevel);
      case 'listItem':
        return _buildListItem(context, node, indentLevel);
      case 'mediaSingle':
        return _buildMediaSingle(context, node, indentLevel);
      case 'media':
        return _buildMedia(context, node);
      case 'inlineCard':
        return _buildInlineCard(context, node);
      default:
        // Unknown node: render its children (best-effort) to avoid data loss.
        final children = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();
        if (children.isEmpty) return const SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
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

  String _textOf(Map<String, dynamic> node) => (node['text'] ?? '') as String;

  Widget _buildParagraph(BuildContext context, Map<String, dynamic> node) {
    final spans = _buildInlineSpans(context, _asList(node['content']));
    if (spans.isEmpty) {
      return const SizedBox(height: 0); // empty paragraph -> minimal gap
    }
    return RichText(
      text: TextSpan(style: _defaultTextStyle(context), children: spans),
      textAlign: TextAlign.start,
    );
  }

  List<InlineSpan> _buildInlineSpans(BuildContext context, List<Map<String, dynamic>> content) {
    final spans = <InlineSpan>[];
    for (final node in content) {
      if (node['type'] == 'text') {
        final text = _textOf(node);
        final marks = _asList(node['marks']);
        TextStyle style = _defaultTextStyle(context);
        GestureRecognizer? recognizer;

        for (final mark in marks) {
          switch (mark['type']) {
            case 'strong':
              style = style.merge(const TextStyle(fontWeight: FontWeight.w600));
              break;
            case 'em':
              style = style.merge(const TextStyle(fontStyle: FontStyle.italic));
              break;
            case 'underline':
              style = style.merge(const TextStyle(decoration: TextDecoration.underline));
              break;
            case 'strike':
              style = style.merge(const TextStyle(decoration: TextDecoration.lineThrough));
              break;
            case 'code':
              style = _defaultCodeStyle(context).merge(
                TextStyle(
                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                  letterSpacing: 0.25,
                ),
              );
              break;
            case 'link':
              final href = (mark['attrs']?['href'] ?? '') as String;
              style = style.merge(
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
                };
              break;
          }
        }

        spans.add(TextSpan(text: text, style: style, recognizer: recognizer));
      } else if (node['type'] == 'hardBreak') {
        spans.add(const TextSpan(text: '\n'));
      } else if (node['type'] == 'emoji') {
        // Basic emoji support: render as text using shortName or text attr.
        final emojiText = (node['attrs']?['text'] ?? node['attrs']?['shortName'] ?? '') as String;
        spans.add(TextSpan(text: emojiText, style: _defaultTextStyle(context)));
      } else {
        var nodeRender = _buildNode(context, node, 0);
        if (nodeRender != null) {
          spans.add(WidgetSpan(child: nodeRender, alignment: PlaceholderAlignment.middle));
        }
      }
    }
    return spans;
  }

  // Widget _buildEmoji(BuildContext context, Map<String, dynamic> node){
  // TODO find how to get this working
  // }

  Widget _buildBulletList(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final items = _asList(node['content']).map((c) => _buildNode(context, c, indentLevel)).whereType<Widget>().toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
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
        const Text('•'),
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

  Widget _buildMediaSingle(BuildContext context, Map<String, dynamic> node, int indentLevel) {
    final attrs = (node['attrs'] ?? const <String, dynamic>{}) as Map<String, dynamic>;
    final layout = (attrs['layout'] ?? 'center') as String; // 'align-start' | 'align-end' | 'center'
    final width = (attrs['width'] is num) ? (attrs['width'] as num).toDouble() : null;

    final mediaNode = _asList(node['content']).firstWhere(
      (e) => e['type'] == 'media',
      orElse: () => const <String, dynamic>{},
    );

    final media = _buildMedia(context, Map<String, dynamic>.from(mediaNode));

    Alignment alignment = Alignment.centerLeft;
    if (layout == 'align-end') alignment = Alignment.centerRight;
    if (layout == 'center') alignment = Alignment.center;

    final child = ConstrainedBox(
      constraints: BoxConstraints(
        // If explicit pixel width is provided, honor it up to screen size.
        maxWidth: width ?? double.infinity,
      ),
      child: media,
    );

    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(left: indentLevel * listIndent),
        child: child,
      ),
    );
  }

  Widget _buildMedia(BuildContext context, Map<String, dynamic> node) {
    final attrs = (node['attrs'] ?? const <String, dynamic>{}) as Map<String, dynamic>;
    if (mediaBuilder != null) {
      return mediaBuilder!(context, attrs);
    }

    // Fallback generic box if no mediaBuilder provided
    final alt = (attrs['alt'] ?? 'media').toString();
    final w = (attrs['width'] is num) ? (attrs['width'] as num).toDouble() : 240.0;
    final h = (attrs['height'] is num) ? (attrs['height'] as num).toDouble() : 160.0;

    return Container(
      width: w,
      height: h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Text(alt, style: _defaultTextStyle(context)),
    );
  }

  static List<Map<String, dynamic>> _asList(dynamic v) {
    if (v is List) {
      return v.whereType<Map<String, dynamic>>().toList();
    }
    return const [];
  }

  Widget? _buildMention(BuildContext context, Map<String, dynamic> node) {
    var t = Theme.of(context).colorScheme;
    String userIdMentionned = node['attrs']['id'];
    var isMe = APIModel().myself().then(
      (value) => jsonDecode(value.body)['accountId'] == userIdMentionned,
    );

    return FutureBuilder(
      future: isMe,
      builder: (context, asyncSnapshot) {
        bool isMentionOfMe = asyncSnapshot.hasData && asyncSnapshot.data!;
        return Chip(
          backgroundColor: isMentionOfMe ? t.primary : null,

          label: Text(node['attrs']['text'], style: isMentionOfMe ? TextStyle(color: t.onPrimary) : null),
        );
      },
    );
  }

  Widget? _buildInlineCard(BuildContext context, Map<String, dynamic> node) {
    var url = node['attrs']['url'];
    if (url == null) return null;

    if ((url as String).startsWith('https://${SettingsModel().domainController.text}.atlassian.net/browse')) {
      // Jira ticket card
      var issueKey = url.replaceAll('https://${SettingsModel().domainController.text}.atlassian.net/browse/', '');
      var response = APIModel().getIssue(issueKey);

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
              var issue = IssueData(jsonDecode(asyncSnapshot.data?.body ?? ''), lastCacheUpdate: DateTime.now());
              return ActionChip(
                label: Wrap(
                  spacing: 8,
                  children: [
                    Text('$issueKey: ${issue.fields?['summary']}'),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: t.surfaceContainerHigh,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(issue.statusCategory?['name']),
                    ),
                  ],
                ),
                avatar: JiraAvatar(url: issue.fields?['issuetype']['iconUrl']),

                onPressed: () => launchUrl(Uri.parse(url)),
              );
            }
            return Tooltip(
              message: 'Jira servers said nope while looking up $url as a Jira inlineCard:\n\nResponse status: ${asyncSnapshot.data?.statusCode}\n${asyncSnapshot.data?.reasonPhrase}',
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
          return ActionChip(
            label: Text('Fetching $issueKey...'),
            onPressed: () => launchUrl(Uri.parse(url)),
          );
        },
      );
    }

    return Chip(
      label: Text(node['attrs']['url']),
    );
  }

  Future startUrl(String url) {
    // TODO make this open an issue view in a dialog
    return launchUrl(Uri.parse(url));
  }
}

/// ---- Example usage -------------------------------------------------------
///
/// AdfRenderer(
///   adf: adfJsonMap,
///   mediaBuilder: (context, attrs) {
///     // Example mapping Jira media to an image (replace with your logic).
///     final type = attrs['type'];
///     if (type == 'external') {
///       final url = attrs['url'] as String?;
///       if (url != null) {
///         return Image.network(url, fit: BoxFit.contain);
///       }
///     }
///     if (type == 'file') {
///       final id = attrs['id'] as String?; // Jira file id
///       // TODO: turn [id] into a URL via your backend/proxy/Auth.
///       // return Image.network(fileUrlFor(id));
///       return AspectRatio(
///         aspectRatio: (attrs['width'] is num && attrs['height'] is num)
///             ? (attrs['width'] as num).toDouble() / (attrs['height'] as num).toDouble()
///             : 4 / 3,
///         child: Container(
///           alignment: Alignment.center,
///           decoration: BoxDecoration(
///             borderRadius: BorderRadius.circular(8),
///             color: Theme.of(context).colorScheme.surfaceVariant,
///           ),
///           child: Text('Media file: ${attrs['alt'] ?? id ?? 'unknown'}'),
///         ),
///       );
///     }
///     return const SizedBox.shrink();
///   },
///   linkHandler: (url) {
///     // Handle link taps (e.g., with url_launcher)
///     // launchUrlString(url);
///   },
/// )
/// -------------------------------------------------------------------------
