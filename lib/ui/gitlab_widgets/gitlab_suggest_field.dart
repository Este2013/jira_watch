import 'package:flutter/material.dart';
import 'package:jira_watcher/utils/string_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A text field that suggests from a known set of values, and — when the field
/// holds a regular expression — filters those suggestions by the pattern itself.
///
/// That doubles as a live preview: typing `MyApp-.*\.exe` shows exactly which
/// entries currently match, and an empty list means the pattern matches nothing.
class GitLabSuggestField extends StatefulWidget {
  const GitLabSuggestField({
    super.key,
    required this.controller,
    required this.label,
    required this.optionsProvider,
    this.helper,
    this.hint,
    this.isRegex = false,
    this.onRegexToggled,
    this.onChanged,
    this.leadingIconFor,
    this.emptyOptionsMessage = 'Nothing to suggest',
    this.monospace = true,
  });

  final TextEditingController controller;
  final String label;

  /// Returns every candidate; filtering against what the user typed is done here.
  final Future<List<String>> Function() optionsProvider;

  final String? helper;
  final String? hint;

  /// When set, a regex toggle is shown and suggestions are filtered by pattern.
  final bool isRegex;
  final ValueChanged<bool>? onRegexToggled;

  final ValueChanged<String>? onChanged;
  final IconData? Function(String option)? leadingIconFor;
  final String emptyOptionsMessage;
  final bool monospace;

  @override
  State<GitLabSuggestField> createState() => _GitLabSuggestFieldState();
}

class _GitLabSuggestFieldState extends State<GitLabSuggestField> {
  final _focusNode = FocusNode();

  List<String>? _options;
  bool _loading = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<List<String>> _load() async {
    if (_options != null) return _options!;
    if (_loading) return const [];
    _loading = true;
    try {
      final options = await widget.optionsProvider();
      _options = options;
      return options;
    } finally {
      _loading = false;
    }
  }

  Future<Iterable<String>> _optionsFor(String query) async {
    final all = await _load();
    if (query.isEmpty) return all.take(200);

    if (widget.isRegex && query.isValidRegex()) {
      final pattern = RegExp(query, caseSensitive: false);
      return all.where(pattern.hasMatch).take(200);
    }
    final lower = query.toLowerCase();
    return all.where((o) => o.toLowerCase().contains(lower)).take(200);
  }

  bool get _regexInvalid => widget.isRegex && widget.controller.text.isNotEmpty && !widget.controller.text.isValidRegex();

  @override
  Widget build(BuildContext context) => RawAutocomplete<String>(
    textEditingController: widget.controller,
    focusNode: _focusNode,
    optionsBuilder: (value) => _optionsFor(value.text),
    onSelected: (option) {
      widget.controller.text = option;
      widget.onChanged?.call(option);
    },
    fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) => TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: widget.onChanged,
      style: widget.monospace ? const TextStyle(fontFamily: 'RobotoMono') : null,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        border: const OutlineInputBorder(),
        helperText: _regexInvalid ? 'That is not a valid regular expression' : widget.helper,
        helperMaxLines: 2,
        helperStyle: _regexInvalid ? TextStyle(color: Theme.of(context).colorScheme.error) : null,
        suffixIcon: widget.onRegexToggled == null
            ? null
            : Tooltip(
                message: widget.isRegex ? 'Matching by regular expression' : 'Matching by plain substring',
                child: IconButton(
                  icon: Icon(
                    Symbols.regular_expression,
                    fill: widget.isRegex ? 1 : 0,
                    color: widget.isRegex ? Theme.of(context).colorScheme.primary : null,
                  ),
                  onPressed: () => widget.onRegexToggled!(!widget.isRegex),
                ),
              ),
      ),
    ),
    optionsViewBuilder: (context, onSelected, options) => Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 260, maxWidth: 520),
          child: options.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.isRegex && widget.controller.text.isNotEmpty ? 'This pattern matches nothing here' : widget.emptyOptionsMessage,
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    final icon = widget.leadingIconFor?.call(option);
                    return ListTile(
                      dense: true,
                      leading: icon == null ? null : Icon(icon, size: 16),
                      title: Text(option, style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                      onTap: () => onSelected(option),
                    );
                  },
                ),
        ),
      ),
    ),
  );
}

/// Turns a concrete path into a version-tolerant regular expression.
///
/// Regex metacharacters are escaped and digit runs become `\d+`, so
/// `Release/MyApp-1.4.2.exe` becomes `Release/MyApp-\d+\.\d+\.\d+\.exe` and keeps
/// matching after the next version bump.
String generalizeNumbersToRegex(String literal) {
  final escaped = RegExp.escape(literal);
  return escaped.replaceAll(RegExp(r'\d+'), r'\d+');
}

/// Whether [literal] contains a digit run worth generalising.
bool hasGeneralizableNumbers(String literal) => RegExp(r'\d').hasMatch(literal);
