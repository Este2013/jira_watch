//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PageOfChangelogs {
  /// Returns a new [PageOfChangelogs] instance.
  PageOfChangelogs({
    this.histories = const [],
    this.maxResults,
    this.startAt,
    this.total,
  });

  /// The list of changelogs.
  List<IssueBeanChangelogAllOfHistoriesInner> histories;

  /// The maximum number of results that could be on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  /// The index of the first item returned on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startAt;

  /// The number of results on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PageOfChangelogs &&
    _deepEquality.equals(other.histories, histories) &&
    other.maxResults == maxResults &&
    other.startAt == startAt &&
    other.total == total;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (histories.hashCode) +
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (startAt == null ? 0 : startAt!.hashCode) +
    (total == null ? 0 : total!.hashCode);

  @override
  String toString() => 'PageOfChangelogs[histories=$histories, maxResults=$maxResults, startAt=$startAt, total=$total]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'histories'] = this.histories;
    if (this.maxResults != null) {
      json[r'maxResults'] = this.maxResults;
    } else {
      json[r'maxResults'] = null;
    }
    if (this.startAt != null) {
      json[r'startAt'] = this.startAt;
    } else {
      json[r'startAt'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
    return json;
  }

  /// Returns a new [PageOfChangelogs] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PageOfChangelogs? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PageOfChangelogs(
        histories: IssueBeanChangelogAllOfHistoriesInner.listFromJson(json[r'histories']),
        maxResults: mapValueOfType<int>(json, r'maxResults'),
        startAt: mapValueOfType<int>(json, r'startAt'),
        total: mapValueOfType<int>(json, r'total'),
      );
    }
    return null;
  }

  static List<PageOfChangelogs> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PageOfChangelogs>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PageOfChangelogs.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PageOfChangelogs> mapFromJson(dynamic json) {
    final map = <String, PageOfChangelogs>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PageOfChangelogs.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PageOfChangelogs-objects as value to a dart map
  static Map<String, List<PageOfChangelogs>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PageOfChangelogs>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PageOfChangelogs.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

