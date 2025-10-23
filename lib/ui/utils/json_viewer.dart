import 'dart:math';

import 'package:flutter/material.dart';

/// A lightweight, dependency-free JSON viewer with:
/// - Collapsible objects/arrays (showing child counts)
/// - Empty objects/arrays are not expandable
/// - Type-aware styling for keys/values
/// - Optional TextEditingController that prunes the tree to only
///   show branches containing the search text in any key or value
class JsonViewer extends StatefulWidget {
  /// Any JSON-like structure (Map / List / primitive).
  final dynamic data;

  /// Optional: a controller whose text filters the tree.
  /// All branches that do not contain the search term in any key or value
  /// are removed. Case-insensitive contains().
  final TextEditingController? searchController;

  /// Optionally start with all nodes expanded.
  final int initialExpandDepth;
  final bool filterNullValues;

  /// Optional styling knobs.
  final JsonViewerStyle? style;

  const JsonViewer({
    super.key,
    required this.data,
    this.searchController,
    this.initialExpandDepth = -1,
    this.filterNullValues = false,
    this.style,
  });

  @override
  State<JsonViewer> createState() => _JsonViewerState();
}

class _JsonViewerState extends State<JsonViewer> {
  late dynamic _filteredData;

  @override
  void initState() {
    super.initState();
    _filteredData = widget.data;
    widget.searchController?.addListener(_onSearchChanged);

    _applyFilter();
  }

  @override
  void didUpdateWidget(covariant JsonViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchController != widget.searchController) {
      oldWidget.searchController?.removeListener(_onSearchChanged);
      widget.searchController?.addListener(_onSearchChanged);
    }
    // Re-filter when data or controller changes.
    _applyFilter();
  }

  @override
  void dispose() {
    widget.searchController?.removeListener(_onSearchChanged);
    super.dispose();
  }

  void _onSearchChanged() {
    _applyFilter();
  }

  void _applyFilter() {
    final q = widget.searchController?.text ?? '';
    if (q.trim().isEmpty) {
      setState(() => _filteredData = widget.data);
      return;
    }
    final filtered = _filterJson(widget.data, q.trim().toLowerCase());
    setState(() => _filteredData = filtered);
  }

  /// Returns a pruned copy of `node` that only includes branches where
  /// either a key or value contains `query` (case-insensitive).
  /// If nothing matches, returns null (caller should hide that node).
  dynamic _filterJson(dynamic node, String query) {
    bool valueMatches(dynamic v) {
      if (v == null) return 'null'.contains(query);
      if (v is bool) return (v ? 'true' : 'false').contains(query);
      return v.toString().toLowerCase().contains(query);
    }

    if (node is Map) {
      final Map<String, dynamic> out = {};
      bool anyMatchHere = false;

      node.forEach((k, v) {
        final keyMatches = k.toLowerCase().contains(query);
        final childFiltered = _filterJson(v, query);
        final valueDirectMatch = valueMatches(v);

        if (keyMatches || valueDirectMatch || childFiltered != null) {
          out[k] = childFiltered ?? v; // keep original when direct match
          anyMatchHere = true;
        }
      });

      if (anyMatchHere) return out;
      return null;
    } else if (node is List) {
      final List<dynamic> out = [];
      for (final item in node) {
        final childFiltered = _filterJson(item, query);
        if (childFiltered != null || valueMatches(item)) {
          out.add(childFiltered ?? item);
        }
      }
      if (out.isNotEmpty) return out;
      return null;
    } else {
      // Primitive
      return valueMatches(node) ? node : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? const JsonViewerStyle();
    return _filteredData == null
        ? _EmptyFilteredNotice(style: style)
        : _JsonNode(
            keyLabel: null,
            value: _filteredData,
            initialExpandDepth: widget.initialExpandDepth,
            filterNullValues: widget.filterNullValues,
            style: style,
            isRoot: true,
          );
  }
}

/// Type-aware text styles for keys and values.
class JsonViewerStyle {
  final TextStyle keyStyle;
  final TextStyle stringStyle;
  final TextStyle numberStyle;
  final TextStyle boolStyle;
  final TextStyle nullStyle;
  final TextStyle punctuationStyle;
  final TextStyle countBadgeStyle;
  final Color countBadgeBg;
  final EdgeInsetsGeometry nodePadding;
  final double indent;

  const JsonViewerStyle({
    TextStyle? keyStyle,
    TextStyle? stringStyle,
    TextStyle? numberStyle,
    TextStyle? boolStyle,
    TextStyle? nullStyle,
    TextStyle? punctuationStyle,
    TextStyle? countBadgeStyle,
    Color? countBadgeBg,
    this.nodePadding = const EdgeInsets.symmetric(vertical: 2.5),
    this.indent = 8.0,
  }) : keyStyle = keyStyle ?? const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1565C0)),
       stringStyle = stringStyle ?? const TextStyle(color: Color(0xFF2E7D32)), // green-ish
       numberStyle = numberStyle ?? const TextStyle(color: Color(0xFF6A1B9A)), // purple-ish
       boolStyle = boolStyle ?? const TextStyle(color: Color(0xFF00838F), fontStyle: FontStyle.italic),
       nullStyle = nullStyle ?? const TextStyle(color: Color(0xFF757575), fontStyle: FontStyle.italic),
       punctuationStyle = punctuationStyle ?? const TextStyle(color: Color(0xFF9E9E9E)),
       countBadgeStyle =
           countBadgeStyle ??
           const TextStyle(
             fontSize: 11,
             fontWeight: FontWeight.w600,
             color: Colors.white,
           ),
       countBadgeBg = countBadgeBg ?? const Color(0xFFB0BEC5);
}

class _EmptyFilteredNotice extends StatelessWidget {
  final JsonViewerStyle style;
  const _EmptyFilteredNotice({required this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        'No results',
        style: style.nullStyle,
      ),
    );
  }
}

class _JsonNode extends StatefulWidget {
  final String? keyLabel; // null for root
  final dynamic value;
  final int initialExpandDepth;
  final bool filterNullValues;
  final JsonViewerStyle style;
  final bool isRoot;

  const _JsonNode({
    required this.keyLabel,
    required this.value,
    required this.initialExpandDepth,
    required this.filterNullValues,
    required this.style,
    required this.isRoot,
  });

  @override
  State<_JsonNode> createState() => _JsonNodeState();
}

class _JsonNodeState extends State<_JsonNode> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initialExpandDepth == -1 || widget.initialExpandDepth > 0;
  }

  @override
  Widget build(BuildContext context) {
    final v = widget.value;

    if (v is Map) {
      v.removeWhere((key, value) => widget.filterNullValues && value == null);
      if (v is Map<String, dynamic>) {
        return _buildObject(v);
      }
      // Cast non-typed map safely
      final casted = v.map<String, dynamic>((k, val) => MapEntry(k.toString(), val));
      return _buildObject(casted);
    } else if (v is List) {
      return _buildArray(v);
    } else {
      return _buildPrimitive(widget.keyLabel, v);
    }
  }

  Widget _buildKeyLeading(String? keyLabel) {
    if (keyLabel == null) return const SizedBox.shrink();
    return SelectableText(
      keyLabel,
      style: widget.style.keyStyle,
    );
  }

  Widget _buildCountBadge(int count) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    margin: const EdgeInsets.symmetric(horizontal: 6),
    decoration: BoxDecoration(
      color: widget.style.countBadgeBg,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      '$count',
      style: widget.style.countBadgeStyle,
      textAlign: TextAlign.center,
    ),
  );

  Widget _buildObject(Map<String, dynamic> map) {
    final isEmpty = map.isEmpty;
    final header = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.keyLabel != null) _buildKeyLeading(widget.keyLabel!) else const SizedBox.shrink(),
        if (widget.keyLabel != null) const SizedBox(width: 6),
        Text('{', style: widget.style.punctuationStyle),
        if (!isEmpty) _buildCountBadge(map.length),
        Text('}', style: widget.style.punctuationStyle),
      ],
    );

    if (isEmpty) {
      // Not expandable
      return Padding(
        padding: widget.style.nodePadding,
        child: header,
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      padding: widget.style.nodePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ExpandableHeader(
            expanded: _expanded,
            onToggle: () => setState(() => _expanded = !_expanded),
            child: header,
          ),
          if (_expanded)
            Padding(
              padding: EdgeInsets.only(left: widget.style.indent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: map.entries.map((e) {
                  return _JsonNode(
                    keyLabel: e.key,
                    value: e.value,
                    initialExpandDepth: downStreamExpansionLevel(),
                    filterNullValues: widget.filterNullValues,
                    style: widget.style,
                    isRoot: false,
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }

  int downStreamExpansionLevel() => widget.initialExpandDepth == -1 ? -1 : max(0, widget.initialExpandDepth - 1);

  Widget _buildArray(List list) {
    final isEmpty = list.isEmpty;
    final header = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.keyLabel != null) _buildKeyLeading(widget.keyLabel!) else const SizedBox.shrink(),
        if (widget.keyLabel != null) const SizedBox(width: 6),
        Text('[', style: widget.style.punctuationStyle),
        if (!isEmpty) _buildCountBadge(list.length),
        Text(']', style: widget.style.punctuationStyle),
      ],
    );

    if (isEmpty) {
      // Not expandable
      return Padding(
        padding: widget.style.nodePadding,
        child: header,
      );
    }

    return Padding(
      padding: widget.style.nodePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ExpandableHeader(
            expanded: _expanded,
            onToggle: () => setState(() => _expanded = !_expanded),
            child: header,
          ),
          if (_expanded)
            Padding(
              padding: EdgeInsets.only(left: widget.style.indent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(list.length, (i) {
                  return _JsonNode(
                    keyLabel: '#$i',
                    value: list[i],
                    initialExpandDepth: downStreamExpansionLevel(),
                    filterNullValues: widget.filterNullValues,
                    style: widget.style,
                    isRoot: false,
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPrimitive(String? keyLabel, dynamic value) {
    final children = <InlineSpan>[];
    if (keyLabel != null) {
      children.add(TextSpan(text: keyLabel, style: widget.style.keyStyle));
      children.add(const TextSpan(text: ': '));
    }
    children.add(_spanForValue(value, widget.style));

    return Padding(
      padding: widget.style.nodePadding,
      child: SelectableText.rich(
        TextSpan(style: DefaultTextStyle.of(context).style, children: children),
      ),
    );
  }

  TextSpan _spanForValue(dynamic value, JsonViewerStyle style) {
    if (value == null) return TextSpan(text: 'null', style: style.nullStyle);
    if (value is String) return TextSpan(text: '"$value"', style: style.stringStyle);
    if (value is num) return TextSpan(text: value.toString(), style: style.numberStyle);
    if (value is bool) return TextSpan(text: value ? 'true' : 'false', style: style.boolStyle);
    // Fallback (e.g., DateTime, custom)
    return TextSpan(text: value.toString(), style: style.stringStyle);
  }
}

class _ExpandableHeader extends StatelessWidget {
  final bool expanded;
  final VoidCallback onToggle;
  final Widget child;

  const _ExpandableHeader({
    required this.expanded,
    required this.onToggle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedRotation(
            duration: const Duration(milliseconds: 150),
            turns: expanded ? 0.25 : 0.0,
            child: const Icon(Icons.chevron_right, size: 18),
          ),
          const SizedBox(width: 2),
          Flexible(child: child),
        ],
      ),
    );
  }
}
