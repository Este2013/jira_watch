import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A space's icon, falling back to its initials.
///
/// Most spaces have no icon at all — Confluence only stores one if somebody
/// uploaded it — so the fallback is the common case rather than the error case,
/// and it uses initials for the same reason a GitLab project tab does: two
/// spaces are easier to tell apart by their letters than by the same book
/// glyph twice.
class ConfluenceSpaceIcon extends StatelessWidget {
  const ConfluenceSpaceIcon({super.key, required this.path, this.emoji, this.size = 20, this.fallbackLabel});

  final String? path;

  /// Preferred over [path] when present. A space with an emoji icon reports no
  /// image at all, so the two never compete in practice.
  final String? emoji;

  final double size;
  final String? fallbackLabel;

  String? get _initials {
    final label = fallbackLabel?.trim();
    if (label == null || label.isEmpty) return null;
    final words = label.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    return (words.length == 1 ? words.first.substring(0, 1) : words.take(2).map((w) => w.substring(0, 1)).join()).toUpperCase();
  }

  Widget _fallback(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final initials = _initials;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: scheme.secondaryContainer, borderRadius: BorderRadius.circular(4)),
      child: initials == null
          ? Icon(Symbols.book_2, size: size * 0.7, color: scheme.onSecondaryContainer)
          : Text(
              initials,
              style: TextStyle(fontSize: size * 0.45, fontWeight: FontWeight.w700, color: scheme.onSecondaryContainer),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emoji = this.emoji;
    if (emoji != null && emoji.isNotEmpty) {
      return SizedBox(
        width: size,
        height: size,
        // Sized a little under the box: an emoji glyph fills its line box more
        // than a letter does, and at the full size it clips.
        child: Center(child: Text(emoji, style: TextStyle(fontSize: size * 0.8))),
      );
    }

    final url = ConfluenceApi().absoluteUrl(path);
    if (url == null) return _fallback(context);

    // Fetched here rather than through JiraImage because a space icon that
    // cannot be loaded should quietly become initials. JiraImage throws, which
    // showed as a red error box in the sidebar and on the tab — and an icon is
    // not worth a visible failure.
    return FutureBuilder<Uint8List?>(
      future: ConfluenceApi().iconBytes(url),
      builder: (context, snapshot) {
        final bytes = snapshot.data;
        // While loading, the initials stand in: they are the same size, so
        // nothing shifts when the image arrives.
        if (bytes == null) return _fallback(context);

        return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.memory(
            bytes,
            width: size,
            height: size,
            fit: BoxFit.cover,
            // Bytes that are not a decodable image — an SVG, or an HTML login
            // page served with a 200 — land here.
            errorBuilder: (context, _, _) => _fallback(context),
          ),
        );
      },
    );
  }
}
