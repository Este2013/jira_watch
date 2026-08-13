import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';
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
        length: 4,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Page'),
                Tab(text: 'ADF'),
                Tab(text: 'Node types'),
                Tab(text: 'Space'),
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
                    _SpacePane(spaceId: page?.spaceId),
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

/// What the space queries return, and what the app made of them.
///
/// Both halves are here because a space icon needs both: the space itself
/// carries an image, and an emoji icon lives in the properties, which the spec
/// does not describe at all. Seeing the raw properties is the only way to know
/// what key a site actually uses for one.
class _SpacePane extends StatefulWidget {
  const _SpacePane({required this.spaceId});

  final String? spaceId;

  @override
  State<_SpacePane> createState() => _SpacePaneState();
}

class _SpacePaneState extends State<_SpacePane> {
  Future<Map<String, Object?>>? _query;

  @override
  void initState() {
    super.initState();
    final spaceId = widget.spaceId;
    if (spaceId != null && spaceId.isNotEmpty) _query = _load(spaceId);
  }

  Future<Map<String, Object?>> _load(String spaceId) async {
    final api = ConfluenceApi();
    // Requested together rather than in sequence: the dialog is opened to look
    // at both, and neither depends on the other.
    final (space, properties) = await (api.space(spaceId), api.spaceProperties(spaceId)).wait;

    final iconPath = ConfluenceApi.iconPathOf(space?.icon);
    final emojiProperty = properties.where((p) => (p.key ?? '').toLowerCase().contains('emoji')).firstOrNull;

    return {
      // The app's reading first: this is what the tab and sidebar draw from,
      // and where a mismatch with the raw data below shows up.
      'resolved': {
        'iconPath': iconPath,
        'iconUrl': api.absoluteUrl(iconPath),
        'iconPathIsUnauthenticatable': iconPath != null && ConfluenceApi.isUnauthenticatableIconPath(iconPath),
        'emojiPropertyKey': emojiProperty?.key,
        'emojiRawValue': emojiProperty?.value,
        'emojiDecoded': decodeConfluenceEmoji(emojiProperty?.value),
        'drawnAs': iconPath != null
            ? 'image'
            : decodeConfluenceEmoji(emojiProperty?.value) != null
            ? 'emoji'
            : 'initials',
      },
      'GET /spaces/{id}?include-icon=true': space?.toJson(),
      'GET /spaces/{id}/properties': [for (final property in properties) property.toJson()],
    };
  }

  @override
  Widget build(BuildContext context) {
    final query = _query;
    if (query == null) {
      return Center(
        child: Text('This page reports no space to query.', style: TextStyle(color: Theme.of(context).hintColor)),
      );
    }

    return FutureBuilder<Map<String, Object?>>(
      future: query,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('The space could not be queried.\n${snapshot.error}', textAlign: TextAlign.center));
        }
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

        return _JsonPane(label: 'Space ${widget.spaceId}', json: snapshot.data, empty: 'Nothing returned.');
      },
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

    // Anything not JSON-encodable — a value a generated toJson passed straight
    // through — would otherwise take the dialog down. Falling back to toString
    // still shows what is there, and a debugger that dies on odd data is no use
    // precisely when the data is odd.
    String text;
    try {
      text = ConfluenceDebugDialog._encoder.convert(json);
    } on Object catch (e) {
      text = '// could not be encoded as JSON ($e)\n$json';
    }

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
                showAppSnackBar(context, const SnackBar(content: Text('Copied.')), duration: const Duration(seconds: 2));
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
