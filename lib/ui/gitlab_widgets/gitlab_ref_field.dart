import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A ref (branch or tag) suggestion.
class GitLabRef {
  const GitLabRef(this.name, {required this.isTag});
  final String name;
  final bool isTag;
}

/// A text field that autocompletes a project's branches and tags.
class GitLabRefField extends StatefulWidget {
  const GitLabRefField({
    super.key,
    required this.projectId,
    required this.controller,
    required this.onSubmitted,
    this.label = 'Filter by branch or tag',
    this.width = 280,
  });

  final int projectId;
  final TextEditingController controller;

  /// Called when a suggestion is picked, or after the user stops typing.
  final ValueChanged<String> onSubmitted;
  final String label;
  final double width;

  @override
  State<GitLabRefField> createState() => _GitLabRefFieldState();
}

class _GitLabRefFieldState extends State<GitLabRefField> with UiLoggy {
  final _focusNode = FocusNode();

  /// Results per search term, so backspacing does not refetch.
  final Map<String, List<GitLabRef>> _cache = {};

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  Future<List<GitLabRef>> _search(String query) async {
    final key = query.trim();
    final cached = _cache[key];
    if (cached != null) return cached;

    try {
      // Branches and tags are separate endpoints, so both are queried and merged.
      final results = await Future.wait([
        DataModel().gitlab.branches(widget.projectId, search: key.isEmpty ? null : key, perPage: 15),
        DataModel().gitlab.tags(widget.projectId, search: key.isEmpty ? null : key, perPage: 15),
      ]);

      final refs = <GitLabRef>[
        for (final item in results[0].items) GitLabRef((item as Map)['name'] as String, isTag: false),
        for (final item in results[1].items) GitLabRef((item as Map)['name'] as String, isTag: true),
      ];

      // Prefix matches first — searching "rel" should surface "release/…" above
      // "hotfix-related".
      refs.sort((a, b) {
        final aStarts = a.name.toLowerCase().startsWith(key.toLowerCase());
        final bStarts = b.name.toLowerCase().startsWith(key.toLowerCase());
        if (aStarts != bStarts) return aStarts ? -1 : 1;
        return a.name.length.compareTo(b.name.length);
      });

      _cache[key] = refs;
      return refs;
    } on Object catch (e) {
      loggy.warning('Could not load refs for project ${widget.projectId}: $e');
      return const [];
    }
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () => widget.onSubmitted(value.trim()));
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    width: widget.width,
    child: RawAutocomplete<GitLabRef>(
      textEditingController: widget.controller,
      focusNode: _focusNode,
      displayStringForOption: (ref) => ref.name,
      optionsBuilder: (value) => _search(value.text),
      onSelected: (ref) {
        widget.controller.text = ref.name;
        _debounce?.cancel();
        widget.onSubmitted(ref.name);
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) => TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: _onChanged,
        onSubmitted: (value) {
          _debounce?.cancel();
          widget.onSubmitted(value.trim());
        },
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Icon(Symbols.fork_right, size: 18),
          labelText: widget.label,
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Symbols.close, size: 16),
                  tooltip: 'Clear',
                  onPressed: () {
                    controller.clear();
                    _debounce?.cancel();
                    widget.onSubmitted('');
                  },
                ),
        ),
      ),
      optionsViewBuilder: (context, onSelected, options) => Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 280, maxWidth: widget.width),
            child: options.isEmpty
                ? const Padding(padding: EdgeInsets.all(12), child: Text('No matching branch or tag'))
                : ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final ref = options.elementAt(index);
                      return ListTile(
                        dense: true,
                        leading: Icon(ref.isTag ? Symbols.label : Symbols.fork_right, size: 16),
                        title: Text(ref.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                        trailing: ref.isTag ? Text('tag', style: Theme.of(context).textTheme.bodySmall) : null,
                        onTap: () => onSelected(ref),
                      );
                    },
                  ),
          ),
        ),
      ),
    ),
  );
}
