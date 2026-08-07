import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A space's icon, falling back to its initials.
///
/// Most spaces have no icon at all — Confluence only stores one if somebody
/// uploaded it — so the fallback is the common case rather than the error case,
/// and it uses initials for the same reason a GitLab project tab does: two
/// spaces are easier to tell apart by their letters than by the same book
/// glyph twice.
class ConfluenceSpaceIcon extends StatelessWidget {
  const ConfluenceSpaceIcon({super.key, required this.path, this.size = 20, this.fallbackLabel});

  final String? path;
  final double size;
  final String? fallbackLabel;

  String? get _initials {
    final label = fallbackLabel?.trim();
    if (label == null || label.isEmpty) return null;
    final words = label.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    return (words.length == 1 ? words.first.substring(0, 1) : words.take(2).map((w) => w.substring(0, 1)).join()).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final url = ConfluenceApi().absoluteUrl(path);
    final scheme = Theme.of(context).colorScheme;

    if (url == null) {
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      // Sized from outside because JiraImage takes a width but no height, and
      // an icon that is square everywhere else should stay square here.
      //
      // Goes through JiraImage for its authenticated cache: a space icon sits
      // behind the same login as everything else, so an unauthenticated fetch
      // gets a login page rather than a picture.
      child: SizedBox(
        width: size,
        height: size,
        child: JiraImage(url: url, width: size, boxFit: BoxFit.cover),
      ),
    );
  }
}
