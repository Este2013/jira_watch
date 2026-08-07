import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:material_symbols_icons/symbols.dart';

/// What the search dialog hands back: enough to open the page in a new tab
/// without another lookup.
typedef ConfluenceSearchHit = ({String pageId, String title, String? spaceId, String? spaceKey, String? spaceName});

/// Searches Confluence and returns the chosen page.
class ConfluenceSearchDialog extends StatefulWidget {
  const ConfluenceSearchDialog({super.key});

  @override
  State<ConfluenceSearchDialog> createState() => _ConfluenceSearchDialogState();
}

class _ConfluenceSearchDialogState extends State<ConfluenceSearchDialog> {
  final _controller = TextEditingController();
  Timer? _debounce;

  List<Map<String, dynamic>>? _results;
  bool _searching = false;
  Object? _error;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  /// Each keystroke would otherwise be a search. Confluence is quick but not
  /// free, and results that arrive out of order look like flicker.
  void _onChanged(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), _search);
  }

  Future<void> _search() async {
    final query = _controller.text.trim();
    if (query.isEmpty) {
      setState(() {
        _results = null;
        _error = null;
      });
      return;
    }

    setState(() {
      _searching = true;
      _error = null;
    });
    try {
      final results = await ConfluenceApi().search(query, limit: 30);
      if (!mounted) return;
      setState(() {
        _results = results;
        _searching = false;
      });
    } on Object catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e;
        _searching = false;
      });
    }
  }

  /// v1 search nests the page under `content` and the space under
  /// `resultGlobalContainer`, whose `displayUrl` is `/spaces/KEY`.
  ConfluenceSearchHit? _hitOf(Map<String, dynamic> result) {
    final content = result['content'] as Map<String, dynamic>?;
    final id = content?['id'] as String?;
    if (id == null) return null;

    final container = result['resultGlobalContainer'] as Map<String, dynamic>?;
    final displayUrl = container?['displayUrl'] as String? ?? '';
    final key = displayUrl.split('/').where((s) => s.isNotEmpty).skip(1).firstOrNull;

    return (
      pageId: id,
      title: (content?['title'] as String?) ?? (result['title'] as String?) ?? '(untitled)',
      spaceId: content?['spaceId'] as String?,
      spaceKey: key,
      spaceName: container?['title'] as String?,
    );
  }

  /// Confluence marks matched terms with `@@@hl@@@ ... @@@endhl@@@` in the
  /// excerpt, which has to come out or it shows up as literal text.
  static String _cleanExcerpt(String? excerpt) =>
      (excerpt ?? '').replaceAll('@@@hl@@@', '').replaceAll('@@@endhl@@@', '').replaceAll('\n', ' ').trim();

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Search Confluence'),
    constraints: const BoxConstraints(maxWidth: 760, minWidth: 520),
    content: SizedBox(
      height: 520,
      child: Column(
        spacing: 12,
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Symbols.search),
              labelText: 'Search all spaces',
              helperText: 'A result opens in a new tab.',
              suffixIcon: _searching
                  ? const Padding(padding: EdgeInsets.all(12), child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)))
                  : null,
            ),
            onChanged: _onChanged,
            onSubmitted: (_) => _search(),
          ),
          Expanded(child: _body(context)),
        ],
      ),
    ),
    actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
  );

  Widget _body(BuildContext context) {
    if (_error != null) {
      return Center(child: Text('The search failed.\n$_error', textAlign: TextAlign.center));
    }
    if (_results == null) {
      return Center(
        child: Text('Type to search.', style: TextStyle(color: Theme.of(context).hintColor)),
      );
    }
    if (_results!.isEmpty) {
      return Center(
        child: Text('Nothing matched.', style: TextStyle(color: Theme.of(context).hintColor)),
      );
    }

    return ListView.builder(
      itemCount: _results!.length,
      itemBuilder: (context, i) {
        final hit = _hitOf(_results![i]);
        if (hit == null) return const SizedBox.shrink();
        final excerpt = _cleanExcerpt(_results![i]['excerpt'] as String?);

        return ListTile(
          leading: const Icon(Symbols.description),
          title: Text(hit.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (hit.spaceName != null) Text(hit.spaceName!, style: Theme.of(context).textTheme.labelSmall),
              if (excerpt.isNotEmpty) Text(excerpt, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
          isThreeLine: excerpt.isNotEmpty && hit.spaceName != null,
          onTap: () => Navigator.of(context).pop(hit),
        );
      },
    );
  }
}
