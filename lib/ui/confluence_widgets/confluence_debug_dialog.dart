import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Inspects what an article actually is, for the debug build only.
///
/// The two questions worth asking when a page renders wrongly are what
/// Confluence sent and what reached `AdfRenderer` — so this shows the page's
/// fields, the raw ADF handed to the renderer, and a tally of the node types in
/// it, which is usually what identifies an unsupported one.
///
/// [page] may be null and [error] non-null: this opens on a page that failed to
/// load too, since that is when knowing why matters most.
class ConfluenceDebugDialog extends StatelessWidget {
  const ConfluenceDebugDialog({super.key, required this.pageId, required this.page, this.error});

  final String pageId;
  final ConfluencePage? page;
  final Object? error;

  static const _encoder = JsonEncoder.withIndent('  ');

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Row(
      children: [
        const Icon(Symbols.bug_report),
        const SizedBox(width: 8),
        Expanded(child: Text('Article debugger — ${page?.title ?? pageId}')),
      ],
    ),
    // No minWidth: the tabs hold scrolling views, which cannot report an
    // intrinsic width. See confluence_dialog_layout_test.dart.
    constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 800),
    content: SizedBox(
      width: 940,
      height: 620,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Page'),
                Tab(text: 'ADF'),
                Tab(text: 'Node types'),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TabBarView(
                  children: [
                    _pageTab(context),
                    _JsonPane(label: 'ADF handed to AdfRenderer', json: page?.adf, empty: 'This page carries no ADF body.'),
                    _nodeTypesTab(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
  );

  Widget _pageTab(BuildContext context) {
    final fields = <String, Object?>{
      'id': page?.id ?? pageId,
      'title': page?.title,
      'spaceId': page?.spaceId,
      'status': page?.status,
      'authorId': page?.authorId,
      'versionNumber': page?.versionNumber,
      'versionCreatedAt': page?.versionCreatedAt?.toIso8601String(),
      'webPath': page?.webPath,
      'hasAdf': page?.adf != null,
      if (error != null) 'error': '$error',
    };

    return _JsonPane(label: 'Page as the app models it', json: fields, empty: 'Nothing loaded.');
  }

  Widget _nodeTypesTab(BuildContext context) {
    final adf = page?.adf;
    if (adf == null) {
      return Center(child: Text('This page carries no ADF body.', style: TextStyle(color: Theme.of(context).hintColor)));
    }

    final counts = <String, int>{};
    void walk(Object? node) {
      if (node is List) {
        for (final child in node) {
          walk(child);
        }
        return;
      }
      if (node is! Map) return;
      final type = node['type'];
      if (type is String) counts[type] = (counts[type] ?? 0) + 1;
      walk(node['content']);
    }

    walk(adf['content']);
    final sorted = counts.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Every node type in this document, most frequent first. A type the renderer does not handle falls through to its default, which renders the children and nothing else.',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView(
            children: [
              for (final entry in sorted)
                ListTile(
                  dense: true,
                  leading: Text('${entry.value}', style: const TextStyle(fontFamily: 'RobotoMono')),
                  title: Text(entry.key),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _JsonPane extends StatelessWidget {
  const _JsonPane({required this.label, required this.json, required this.empty});

  final String label;
  final Object? json;
  final String empty;

  @override
  Widget build(BuildContext context) {
    if (json == null) {
      return Center(child: Text(empty, style: TextStyle(color: Theme.of(context).hintColor)));
    }
    final text = ConfluenceDebugDialog._encoder.convert(json);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(label, style: Theme.of(context).textTheme.labelLarge)),
            IconButton(
              tooltip: 'Copy',
              icon: const Icon(Symbols.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: text));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied.'), duration: Duration(seconds: 2)),
                );
              },
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SelectableText(text, style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 12)),
          ),
        ),
      ],
    );
  }
}
