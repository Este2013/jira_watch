/// Parses a Jira "Development" custom field's raw value into structured
/// summary data — connected repos, branches, commits, pull requests, and
/// builds, with per-source-app counts.
///
/// The raw value is *not* JSON. It's a Java/Groovy map's own `toString()`,
/// e.g. `{repository={count=6, dataType=repository}, build={...}}` — except
/// for one entry, confusingly named `json`, whose value genuinely is
/// embedded JSON (carrying the same counts as the outer pseudo-map, plus
/// more: a per-source breakdown, freshness). That's the one entry worth
/// reading; the rest of the outer map is a flattened duplicate of it.
library;

import 'dart:convert';

/// The parsed `cachedValue.summary` from a Development field's embedded
/// `json` entry — one [DevelopmentFieldCategory] per data type Jira has
/// linked to this issue (`repository`, `branch`, `commit`, `pullrequest`,
/// `build`; only the ones actually present are included).
class DevelopmentFieldSummary {
  const DevelopmentFieldSummary({required this.isStale, required this.categories});

  final bool isStale;
  final Map<String, DevelopmentFieldCategory> categories;

  bool get isEmpty => categories.isEmpty;

  /// Returns null if [raw] doesn't contain a recognizable embedded `json`
  /// summary — a field with nothing linked at all renders as `{}`, with no
  /// `json` entry, which is a valid "nothing to show" result rather than a
  /// parse failure.
  static DevelopmentFieldSummary? parse(String raw) {
    final decoded = _extractEmbeddedJson(raw);
    if (decoded == null) return null;
    final cachedValue = decoded['cachedValue'];
    if (cachedValue is! Map) return null;
    final summary = cachedValue['summary'];
    if (summary is! Map) return null;

    final categories = <String, DevelopmentFieldCategory>{};
    for (final entry in summary.entries) {
      final category = DevelopmentFieldCategory._fromJson(entry.value);
      if (category != null) categories[entry.key as String] = category;
    }
    return DevelopmentFieldSummary(isStale: decoded['isStale'] == true, categories: categories);
  }

  /// Scans for a `json=` entry in the outer pseudo-map and pulls out a
  /// brace-balanced substring starting at the `{` right after it — the
  /// value isn't quoted, so it can't just be sliced off with a regex, and a
  /// plain "drop the last character" trim would break the moment a nested
  /// value itself contains `}` (inside a string, say).
  static Map<String, dynamic>? _extractEmbeddedJson(String raw) {
    const marker = 'json=';
    final markerStart = raw.indexOf(marker);
    if (markerStart == -1) return null;
    final jsonStart = markerStart + marker.length;
    if (jsonStart >= raw.length || raw[jsonStart] != '{') return null;

    var depth = 0;
    var inString = false;
    var escaped = false;
    for (var i = jsonStart; i < raw.length; i++) {
      final char = raw[i];
      if (inString) {
        if (escaped) {
          escaped = false;
        } else if (char == '\\') {
          escaped = true;
        } else if (char == '"') {
          inString = false;
        }
        continue;
      }
      if (char == '"') {
        inString = true;
      } else if (char == '{') {
        depth++;
      } else if (char == '}') {
        depth--;
        if (depth == 0) {
          try {
            final decoded = jsonDecode(raw.substring(jsonStart, i + 1));
            return decoded is Map<String, dynamic> ? decoded : null;
          } on FormatException {
            return null;
          }
        }
      }
    }
    return null;
  }
}

/// One category's totals (e.g. every branch across every connected source),
/// broken down by which integration reported them.
class DevelopmentFieldCategory {
  const DevelopmentFieldCategory({required this.dataType, required this.count, required this.lastUpdated, required this.bySource, required this.extra});

  final String dataType;
  final int count;
  final DateTime? lastUpdated;

  /// One entry per source app (e.g. a GitLab connection), keyed by Jira's
  /// own internal instance id for it — opaque, but stable enough to use as
  /// a map key and, later, to try matching against a connected GitLab repo.
  final List<DevelopmentFieldSource> bySource;

  /// Whatever this category's `overall` object had beyond `count`,
  /// `lastUpdated` and `dataType` — e.g. a build's own
  /// `failedBuildCount`/`successfulBuildCount`/`unknownBuildCount`. Kept as
  /// a raw map rather than named fields per category, since only `build`
  /// has any today and a future Jira release could add more without this
  /// needing to change.
  final Map<String, dynamic> extra;

  static DevelopmentFieldCategory? _fromJson(dynamic json) {
    if (json is! Map) return null;
    final overall = json['overall'];
    if (overall is! Map) return null;
    final dataType = overall['dataType'];
    if (dataType is! String) return null;

    final byInstanceType = json['byInstanceType'];
    final sources = <DevelopmentFieldSource>[];
    if (byInstanceType is Map) {
      for (final entry in byInstanceType.entries) {
        final source = DevelopmentFieldSource._fromJson(entry.key as String, entry.value);
        if (source != null) sources.add(source);
      }
    }

    return DevelopmentFieldCategory(
      dataType: dataType,
      count: (overall['count'] as num?)?.toInt() ?? 0,
      lastUpdated: _tryParseDate(overall['lastUpdated']),
      bySource: sources,
      extra: {
        for (final e in overall.entries)
          if (!{'count', 'lastUpdated', 'dataType'}.contains(e.key)) e.key as String: e.value,
      },
    );
  }

  static DateTime? _tryParseDate(dynamic value) {
    if (value is! String) return null;
    try {
      return DateTime.parse(value);
    } on FormatException {
      return null;
    }
  }
}

/// One integration's contribution to a [DevelopmentFieldCategory]'s total —
/// e.g. "6 repositories, via GitLab".
class DevelopmentFieldSource {
  const DevelopmentFieldSource({required this.instanceKey, required this.name, required this.count});

  /// Jira's own internal id for this connection, e.g.
  /// `oAuth-gitlab-jira-connect-gitlab.com`. Opaque — not a project id or
  /// URL — but stable, and the only handle available for guessing which
  /// data-source app to ask for this category's actual items.
  final String instanceKey;
  final String name;
  final int count;

  static DevelopmentFieldSource? _fromJson(String instanceKey, dynamic json) {
    if (json is! Map) return null;
    final name = json['name'];
    if (name is! String) return null;
    return DevelopmentFieldSource(instanceKey: instanceKey, name: name, count: (json['count'] as num?)?.toInt() ?? 0);
  }
}
