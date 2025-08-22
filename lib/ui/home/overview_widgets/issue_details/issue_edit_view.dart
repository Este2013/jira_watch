import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../../models/api_model.dart';

/// Widget to view and edit the fields of a given issue.
class IssueEditFieldsWidget extends StatefulWidget {
  final IssueData issueData;
  final void Function(IssueData updatedIssue)? onSave;
  final VoidCallback? onCancel;

  const IssueEditFieldsWidget({
    Key? key,
    required this.issueData,
    this.onSave,
    this.onCancel,
  }) : super(key: key);

  @override
  State<IssueEditFieldsWidget> createState() => _IssueEditFieldsWidgetState();
}

class _IssueEditFieldsWidgetState extends State<IssueEditFieldsWidget> {
  late TextEditingController _summaryController;
  late String _status;
  late String _priority;
  late Map _description;

  @override
  void initState() {
    super.initState();

    final data = widget.issueData.data;
    _summaryController = TextEditingController(text: data['fields']['summary'] ?? '');
    _description = data['fields']['description'] ?? {};
    _status = data['fields']['status']['name'] ?? 'unknown';
    _priority = data['fields']['priority']['name'] ?? 'Medium';
  }

  @override
  void dispose() {
    _summaryController.dispose();
    super.dispose();
  }

  // void _handleSave() {
  //   final updatedData = Map<String, dynamic>.from(widget.issueData.data);
  //   updatedData['summary'] = _summaryController.text;
  //   updatedData['description'] = _descriptionController.text;
  //   updatedData['status'] = _status;
  //   updatedData['priority'] = _priority;
  //   final updatedIssue = IssueData(updatedData, lastCacheUpdate: DateTime.now());
  //   if (widget.onSave != null) {
  //     widget.onSave!(updatedIssue);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edit Issue', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            TextField(
              controller: _summaryController,
              decoration: const InputDecoration(labelText: 'Summary'),
            ),
            const SizedBox(height: 12),
            JiraDescriptionEditor(
              initialAdf: _description as Map<String, dynamic>,
              onChanged: (newAdf) {},
              readOnly: true,
              showJsonDebug: true,
            ),
            // TextField(
            //   controller: _descriptionController,
            //   decoration: const InputDecoration(labelText: 'Description'),
            //   maxLines: 3,
            // ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _status,
              decoration: const InputDecoration(labelText: 'Status'),
              items: {'Open', 'In Progress', 'Closed', _status}.toList().map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _status = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _priority,
              decoration: const InputDecoration(labelText: 'Priority'),
              items: {'Low', 'Medium', 'High', _priority}.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _priority = val);
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                ElevatedButton(
                  onPressed: null, //_handleSave,
                  child: const Text('Save'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: widget.onCancel,
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// JiraDescriptionEditor
/// ----------------------
/// A single-file Flutter widget that can READ and EDIT Jira Cloud issue
/// descriptions stored in Atlassian Document Format (ADF) JSON.
///
/// ✅ What it supports (subset of ADF):
/// - paragraphs
/// - headings (levels 1–3)
/// - bullet/ordered lists
/// - hardBreak (newlines)
/// - text marks: bold, italic, code, underline, link
///
/// 🧩 How it works:
/// - Converts incoming ADF → lightweight Markdown for editing
/// - Lets users edit Markdown in a TextField with a small toolbar
/// - Converts Markdown → ADF for saving via onChanged callback
/// - Live preview renders ADF as Flutter widgets
///
/// ⚠️ Notes:
/// - This is a pragmatic, dependency-free subset. It won’t handle every
///   advanced ADF node/mark (tables, panels, mentions, emojis, etc.).
/// - You can extend the converters as needed.
///
/// Example usage:
///
/// JiraDescriptionEditor(
///   initialAdf: yourAdfMap,
///   onChanged: (newAdf) {
///     // send to Jira API
///   },
/// )
class JiraDescriptionEditor extends StatefulWidget {
  const JiraDescriptionEditor({
    super.key,
    required this.initialAdf,
    required this.onChanged,
    this.readOnly = false,
    this.showJsonDebug = false,
  });

  final Map<String, dynamic> initialAdf;
  final void Function(Map<String, dynamic> newAdf) onChanged;
  final bool readOnly;
  final bool showJsonDebug;

  @override
  State<JiraDescriptionEditor> createState() => _JiraDescriptionEditorState();
}

class _JiraDescriptionEditorState extends State<JiraDescriptionEditor> {
  late TextEditingController _markdownCtrl; // will be MarkdownStylingController to live-style as-you-type
  late Map<String, dynamic> _currentAdf;
  bool _showPreview = true;

  @override
  void initState() {
    super.initState();
    _currentAdf = Map<String, dynamic>.from(widget.initialAdf);
    _markdownCtrl = MarkdownStylingController(text: _adfToMarkdown(_currentAdf));
  }

  @override
  void dispose() {
    _markdownCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth > 720;
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Header(
                  onTogglePreview: () => setState(() => _showPreview = !_showPreview),
                  showPreview: _showPreview,
                  readOnly: widget.readOnly,
                  onSave: widget.readOnly
                      ? null
                      : () {
                          final adf = _markdownToAdf(_markdownCtrl.text);
                          setState(() => _currentAdf = adf);
                          widget.onChanged(adf);
                        },
                ),
                const SizedBox(height: 12),
                if (!widget.readOnly) _Toolbar(controller: _markdownCtrl),
                const SizedBox(height: 12),
                if (wide)
                  Row(
                    children: [
                      Expanded(
                        child: _Editor(controller: _markdownCtrl, readOnly: widget.readOnly),
                      ),
                      const VerticalDivider(width: 24),
                      if (_showPreview) Expanded(child: _AdfPreview(adf: _markdownToAdf(_markdownCtrl.text))),
                    ],
                  )
                else
                  Column(
                    children: [
                      _Editor(controller: _markdownCtrl, readOnly: widget.readOnly),
                      if (_showPreview) ...[
                        const Divider(height: 24),
                        _AdfPreview(adf: _markdownToAdf(_markdownCtrl.text)),
                      ],
                    ],
                  ),
                if (widget.showJsonDebug) ...[
                  const SizedBox(height: 12),
                  _JsonDebug(adf: _currentAdf),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.onTogglePreview,
    required this.showPreview,
    required this.readOnly,
    this.onSave,
  });

  final VoidCallback onTogglePreview;
  final bool showPreview;
  final bool readOnly;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.description_outlined),
        const SizedBox(width: 8),
        const Text('Jira Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const Spacer(),
        if (!readOnly)
          FilledButton.tonal(
            onPressed: onSave,
            child: const Text('Save'),
          ),
        const SizedBox(width: 8),
        TextButton.icon(
          onPressed: onTogglePreview,
          icon: Icon(showPreview ? Icons.visibility_off : Icons.visibility),
          label: Text(showPreview ? 'Hide preview' : 'Show preview'),
        ),
      ],
    );
  }
}

class _Toolbar extends StatelessWidget {
  const _Toolbar({required this.controller});
  final TextEditingController controller;

  void _wrapSelection(String left, String right) {
    final sel = controller.selection;
    final text = controller.text;
    final start = sel.start >= 0 ? sel.start : 0;
    final end = sel.end >= 0 ? sel.end : 0;
    final selected = start == end ? '' : text.substring(start, end);
    final newText = text.replaceRange(start, end, '$left$selected$right');
    controller.value = controller.value.copyWith(
      text: newText,
      selection: TextSelection(baseOffset: start + left.length, extentOffset: start + left.length + selected.length),
    );
  }

  void _insertLinePrefix(String prefix) {
    final sel = controller.selection;
    final text = controller.text;
    final lines = text.split('\n');
    int charCount = 0;
    for (int i = 0; i < lines.length; i++) {
      final lineStart = charCount;
      final lineEnd = charCount + lines[i].length;
      final intersects = sel.start <= lineEnd && sel.end >= lineStart;
      if (intersects) {
        lines[i] = lines[i].isEmpty ? prefix : '$prefix ${lines[i]}'.replaceAll(RegExp('^$prefix\\s+'), '$prefix ');
      }
      charCount += lines[i].length + 1; // +\n
    }
    final updated = lines.join('\n');
    controller.value = controller.value.copyWith(
      text: updated,
      selection: TextSelection.collapsed(offset: sel.end + prefix.length + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dense = Theme.of(context).visualDensity;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _TBtn(icon: Icons.format_bold, tooltip: 'Bold (**text**)', onTap: () => _wrapSelection('**', '**')),
        _TBtn(icon: Icons.format_italic, tooltip: 'Italic (*text*)', onTap: () => _wrapSelection('*', '*')),
        _TBtn(icon: Icons.code, tooltip: 'Inline code (`code`)', onTap: () => _wrapSelection('`', '`')),
        _TBtn(icon: Icons.format_underlined, tooltip: 'Underline (__text__)', onTap: () => _wrapSelection('__', '__')),
        _TBtn(icon: Icons.link, tooltip: 'Link ([text](url))', onTap: () => _wrapSelection('[', '](https://)')),
        const SizedBox(width: 12),
        _TBtn(icon: Icons.h_mobiledata_outlined, tooltip: 'Heading 1', onTap: () => _insertLinePrefix('#')),
        _TBtn(icon: Icons.h_plus_mobiledata, tooltip: 'Heading 2', onTap: () => _insertLinePrefix('##')),
        _TBtn(icon: Icons.hdr_strong, tooltip: 'Heading 3', onTap: () => _insertLinePrefix('###')),
        const SizedBox(width: 12),
        _TBtn(icon: Icons.format_list_bulleted, tooltip: 'Bullet list', onTap: () => _insertLinePrefix('-')),
        _TBtn(icon: Icons.format_list_numbered, tooltip: 'Numbered list', onTap: () => _insertLinePrefix('1.')),
      ],
    );
  }
}

class _TBtn extends StatelessWidget {
  const _TBtn({required this.icon, required this.tooltip, required this.onTap});
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Ink(
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: Theme.of(context).colorScheme.surfaceVariant,
        ),
        child: IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: onTap,
          icon: Icon(icon),
        ),
      ),
    );
  }
}

class _Editor extends StatelessWidget {
  const _Editor({required this.controller, required this.readOnly});
  final TextEditingController controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: null,
      maxLines: null,
      readOnly: readOnly,
      style: const TextStyle(height: 1.35),
      decoration: InputDecoration(
        hintText:
            'Write description in lightweight Markdown...'
            'Now with live styling: **bold**, *italic*, __underline__, `code`, lists, links.',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

/// Live-styling controller that renders Markdown marks directly inside the editor
class MarkdownStylingController extends TextEditingController {
  MarkdownStylingController({super.text});

  static final _link = RegExp(r"\[([^\]]+)\]\(([^\)]+)\)");
  static final _code = RegExp(r"`([^`]+)`");
  static final _bold = RegExp(r"\*\*([^*]+)\*\*");
  static final _underline = RegExp(r"__([^_]+)__");
  // NOTE: italic must be last to avoid eating bold markers
  static final _italic = RegExp(r"(?<!\*)\*([^*]+)\*(?!\*)");

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, bool? withComposing}) {
    final base = style ?? const TextStyle();
    final spans = <InlineSpan>[];
    final raw = text;

    int i = 0;
    while (i < raw.length) {
      final next = _nextMatch(raw, i);
      if (next == null) {
        spans.add(TextSpan(text: raw.substring(i), style: base));
        break;
      }
      if (next.start > i) {
        spans.add(TextSpan(text: raw.substring(i, next.start), style: base));
      }
      final token = raw.substring(next.start, next.end);
      if (next.pattern == _link) {
        final m = _link.firstMatch(token)!;
        final label = m.group(1)!;
        spans.add(
          TextSpan(
            text: label,
            style: base.merge(const TextStyle(decoration: TextDecoration.underline)),
          ),
        );
      } else if (next.pattern == _code) {
        final m = _code.firstMatch(token)!;
        spans.add(
          TextSpan(
            text: m.group(1)!,
            style: base.merge(const TextStyle(fontFamily: 'monospace', backgroundColor: Color(0xFFE0E0E0))),
          ),
        );
      } else if (next.pattern == _bold) {
        final m = _bold.firstMatch(token)!;
        spans.add(
          TextSpan(
            text: m.group(1)!,
            style: base.merge(const TextStyle(fontWeight: FontWeight.w700)),
          ),
        );
      } else if (next.pattern == _underline) {
        final m = _underline.firstMatch(token)!;
        spans.add(
          TextSpan(
            text: m.group(1)!,
            style: base.merge(const TextStyle(decoration: TextDecoration.underline)),
          ),
        );
      } else if (next.pattern == _italic) {
        final m = _italic.firstMatch(token)!;
        spans.add(
          TextSpan(
            text: m.group(1)!,
            style: base.merge(const TextStyle(fontStyle: FontStyle.italic)),
          ),
        );
      }
      i = next.end;
    }

    return TextSpan(style: base, children: spans);
  }

  _Match? _nextMatch(String s, int from) {
    final candidates = <_Match?>[
      _first(_link, s, from),
      _first(_code, s, from),
      _first(_bold, s, from),
      _first(_underline, s, from),
      _first(_italic, s, from),
    ]..removeWhere((e) => e == null);
    if (candidates.isEmpty) return null;
    candidates.sort((a, b) => a!.start.compareTo(b!.start));
    return candidates.first;
  }

  _Match? _first(RegExp re, String s, int from) {
    final m = re.matchAsPrefix(s.substring(from));
    if (m == null) {
      final f = re.firstMatch(s.substring(from));
      if (f == null) return null;
      return _Match(from + f.start, from + f.end, re);
    }
    return _Match(from + m.start, from + m.end, re);
  }
}

class _Match {
  final int start;
  final int end;
  final RegExp pattern;
  _Match(this.start, this.end, this.pattern);
}

class _AdfPreview extends StatelessWidget {
  const _AdfPreview({required this.adf});
  final Map<String, dynamic> adf;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: _AdfRenderer(adf: adf),
      ),
    );
  }
}

class _JsonDebug extends StatelessWidget {
  const _JsonDebug({required this.adf});
  final Map<String, dynamic> adf;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: const Text('ADF JSON (debug)'),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SelectableText(const JsonEncoder.withIndent('  ').convert(adf)),
        ),
      ],
    );
  }
}

/// ======================
/// ADF → WIDGET RENDERER
/// ======================
class _AdfRenderer extends StatelessWidget {
  const _AdfRenderer({required this.adf});
  final Map<String, dynamic> adf;

  @override
  Widget build(BuildContext context) {
    if (adf['type'] != 'doc') {
      return const Text('Invalid ADF: missing root doc');
    }
    final content = (adf['content'] as List?) ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final node in content) _renderNode(context, node as Map<String, dynamic>),
      ],
    );
  }

  Widget _renderNode(BuildContext context, Map<String, dynamic> node) {
    switch (node['type']) {
      case 'paragraph':
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _InlineText(node),
        );
      case 'heading':
        final level = (node['attrs']?['level'] ?? 1).clamp(1, 6);
        final sizes = {1: 24.0, 2: 20.0, 3: 18.0, 4: 16.0, 5: 14.0, 6: 13.0};
        final weight = level <= 3 ? FontWeight.w700 : FontWeight.w600;
        return Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          child: DefaultTextStyle(
            style: TextStyle(fontSize: sizes[level]!, fontWeight: weight),
            child: _InlineText(node),
          ),
        );
      case 'bulletList':
        return _ListRenderer(node: node, ordered: false);
      case 'orderedList':
        return _ListRenderer(node: node, ordered: true);
      default:
        return const SizedBox.shrink();
    }
  }
}

class _InlineText extends StatelessWidget {
  const _InlineText(this.node);
  final Map<String, dynamic> node;

  @override
  Widget build(BuildContext context) {
    final children = <InlineSpan>[];
    final content = (node['content'] as List?) ?? [];
    for (final n in content) {
      final m = (n as Map<String, dynamic>);
      if (m['type'] == 'text') {
        final text = (m['text'] as String?) ?? '';
        TextStyle style = const TextStyle(height: 1.35);
        final marks = (m['marks'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        for (final mark in marks) {
          switch (mark['type']) {
            case 'strong':
              style = style.merge(const TextStyle(fontWeight: FontWeight.w700));
              break;
            case 'em':
              style = style.merge(const TextStyle(fontStyle: FontStyle.italic));
              break;
            case 'underline':
              style = style.merge(const TextStyle(decoration: TextDecoration.underline));
              break;
            case 'code':
              style = style.merge(
                TextStyle(
                  fontFamily: 'monospace',
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.6),
                ),
              );
              break;
            case 'link':
              style = style.merge(const TextStyle(decoration: TextDecoration.underline));
              break;
          }
        }
        children.add(TextSpan(text: text, style: style));
      } else if (m['type'] == 'hardBreak') {
        children.add(const TextSpan(text: '\n'));
      }
    }
    return RichText(
      text: TextSpan(style: DefaultTextStyle.of(context).style, children: children),
    );
  }
}

class _ListRenderer extends StatelessWidget {
  const _ListRenderer({required this.node, required this.ordered});
  final Map<String, dynamic> node;
  final bool ordered;

  @override
  Widget build(BuildContext context) {
    final items = (node['content'] as List?) ?? [];
    int index = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 28,
                child: Text(ordered ? '${index++}.' : '•', textAlign: TextAlign.right),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final c in ((item as Map<String, dynamic>)['content'] as List? ?? []))
                      _AdfRenderer(
                        adf: {
                          'type': 'doc',
                          'content': [c],
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}

/// ==================
/// ADF ↔ Markdown I/O
/// ==================

String _adfToMarkdown(Map<String, dynamic> adf) {
  if (adf['type'] != 'doc') return '';
  final buf = StringBuffer();
  for (final node in (adf['content'] as List? ?? [])) {
    final n = node as Map<String, dynamic>;
    switch (n['type']) {
      case 'heading':
        final level = (n['attrs']?['level'] ?? 1).clamp(1, 6);
        buf.writeln('#' * level + ' ' + _inlineToMd(n));
        buf.writeln();
        break;
      case 'paragraph':
        final t = _inlineToMd(n);
        if (t.trim().isNotEmpty) buf.writeln(t);
        buf.writeln();
        break;
      case 'bulletList':
        for (final item in (n['content'] as List? ?? [])) {
          final ic = (item as Map<String, dynamic>)['content'] as List? ?? [];
          for (final p in ic) {
            buf.writeln('- ' + _inlineToMd(p as Map<String, dynamic>));
          }
        }
        buf.writeln();
        break;
      case 'orderedList':
        int i = 1;
        for (final item in (n['content'] as List? ?? [])) {
          final ic = (item as Map<String, dynamic>)['content'] as List? ?? [];
          for (final p in ic) {
            buf.writeln('${i++}. ' + _inlineToMd(p as Map<String, dynamic>));
          }
        }
        buf.writeln();
        break;
    }
  }
  return buf.toString().trimRight();
}

String _inlineToMd(Map<String, dynamic> node) {
  final sb = StringBuffer();
  for (final c in (node['content'] as List? ?? [])) {
    final m = c as Map<String, dynamic>;
    if (m['type'] == 'text') {
      String t = m['text'] ?? '';
      final marks = (m['marks'] as List? ?? []).cast<Map<String, dynamic>>();
      bool isBold = marks.any((mk) => mk['type'] == 'strong');
      bool isItalic = marks.any((mk) => mk['type'] == 'em');
      bool isUnderline = marks.any((mk) => mk['type'] == 'underline');
      bool isCode = marks.any((mk) => mk['type'] == 'code');
      final link = marks.firstWhere(
        (mk) => mk['type'] == 'link',
        orElse: () => {},
      );
      if (isCode) t = '`$t`';
      if (isBold) t = '**$t**';
      if (isItalic) t = '*$t*';
      if (isUnderline) t = '__${t}__';
      if (link.isNotEmpty) {
        final href = link['attrs']?['href'] ?? '';
        t = '[$t]($href)';
      }
      sb.write(t);
    } else if (m['type'] == 'hardBreak') {
      sb.write('  \n');
    }
  }
  return sb.toString();
}

Map<String, dynamic> _markdownToAdf(String md) {
  final lines = md.replaceAll('\r\n', '\n').split('\n');
  final content = <Map<String, dynamic>>[];

  bool inOl = false;
  bool inUl = false;
  List<Map<String, dynamic>>? listItems;
  bool flushList() {
    if (listItems == null || listItems!.isEmpty) return false;
    content.add({
      'type': inOl ? 'orderedList' : 'bulletList',
      'content': listItems,
    });
    listItems = null;
    inOl = inUl = false;
    return true;
  }

  Map<String, dynamic> paragraphFromMd(String text) => {
    'type': 'paragraph',
    'content': _mdInlineToAdf(text),
  };

  for (final raw in lines) {
    final line = raw.trimRight();
    if (line.isEmpty) {
      flushList();
      continue;
    }
    final h = RegExp(r'^(#{1,6})\\s+(.*)\$');
    final ul = RegExp(r'^([-*+])\\s+(.*)\$');
    final ol = RegExp(r'^(\\d+)\\.\\s+(.*)\$');

    if (h.hasMatch(line)) {
      flushList();
      final m = h.firstMatch(line)!;
      content.add({
        'type': 'heading',
        'attrs': {'level': m.group(1)!.length},
        'content': _mdInlineToAdf(m.group(2)!),
      });
      continue;
    }

    if (ul.hasMatch(line)) {
      final m = ul.firstMatch(line)!;
      if (!inUl) {
        flushList();
        inUl = true;
        listItems = [];
      }
      listItems!.add({
        'type': 'listItem',
        'content': [paragraphFromMd(m.group(2)!)],
      });
      continue;
    }

    if (ol.hasMatch(line)) {
      final m = ol.firstMatch(line)!;
      if (!inOl) {
        flushList();
        inOl = true;
        listItems = [];
      }
      listItems!.add({
        'type': 'listItem',
        'content': [paragraphFromMd(m.group(2)!)],
      });
      continue;
    }

    // plain paragraph
    flushList();
    content.add(paragraphFromMd(line));
  }
  flushList();

  return {
    'version': 1,
    'type': 'doc',
    'content': content,
  };
}

List<Map<String, dynamic>> _mdInlineToAdf(String text) {
  // Minimal inline Markdown parser for **bold**, *italic*, __underline__, `code`, [text](url)
  // Also supports hard line breaks: two spaces before \n
  final nodes = <Map<String, dynamic>>[];
  // Handle hard breaks encoded as two spaces + \n (already line-by-line here, so we add only text)

  // Link
  final linkRe = RegExp(r'\[([^\]]+)\]\(([^)]+)\)');
  text = text.replaceAllMapped(linkRe, (m) {
    nodes.add({
      'type': 'text',
      'text': m.group(1)!,
      'marks': [
        {
          'type': 'link',
          'attrs': {'href': m.group(2)},
        },
      ],
    });
    return '\u0000'; // placeholder
  });

  // Code
  final codeRe = RegExp(r'`([^`]+)`');
  text = text.replaceAllMapped(codeRe, (m) {
    nodes.add({
      'type': 'text',
      'text': m.group(1)!,
      'marks': [
        {'type': 'code'},
      ],
    });
    return '\u0000';
  });

  // Bold
  final boldRe = RegExp(r'\\*\\*([^*]+)\\*\\*');
  text = text.replaceAllMapped(boldRe, (m) {
    nodes.add({
      'type': 'text',
      'text': m.group(1)!,
      'marks': [
        {'type': 'strong'},
      ],
    });
    return '\u0000';
  });

  // Italic
  final italicRe = RegExp(r'(?<!\\*)\\*([^*]+)\\*(?!\\*)');
  text = text.replaceAllMapped(italicRe, (m) {
    nodes.add({
      'type': 'text',
      'text': m.group(1)!,
      'marks': [
        {'type': 'em'},
      ],
    });
    return '\u0000';
  });

  // Underline
  final underlineRe = RegExp(r'__([^_]+)__');
  text = text.replaceAllMapped(underlineRe, (m) {
    nodes.add({
      'type': 'text',
      'text': m.group(1)!,
      'marks': [
        {'type': 'underline'},
      ],
    });
    return '\u0000';
  });

  // Remaining text split by placeholders
  for (final chunk in text.split('\u0000')) {
    if (chunk.isEmpty) continue;
    nodes.add({'type': 'text', 'text': chunk});
  }

  return nodes;
}
