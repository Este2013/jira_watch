//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PageOfWorklogs {
  /// Returns a new [PageOfWorklogs] instance.
  PageOfWorklogs({
    this.maxResults,
    this.startAt,
    this.total,
    this.worklogs = const [],
  });

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

  /// List of worklogs.
  List<Worklog> worklogs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PageOfWorklogs &&
    other.maxResults == maxResults &&
    other.startAt == startAt &&
    other.total == total &&
    _deepEquality.equals(other.worklogs, worklogs);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (startAt == null ? 0 : startAt!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (worklogs.hashCode);

  @override
  String toString() => 'PageOfWorklogs[maxResults=$maxResults, startAt=$startAt, total=$total, worklogs=$worklogs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
      json[r'worklogs'] = this.worklogs;
    return json;
  }

  /// Returns a new [PageOfWorklogs] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PageOfWorklogs? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PageOfWorklogs(
        maxResults: mapValueOfType<int>(json, r'maxResults'),
        startAt: mapValueOfType<int>(json, r'startAt'),
        total: mapValueOfType<int>(json, r'total'),
        worklogs: Worklog.listFromJson(json[r'worklogs']),
      );
    }
    return null;
  }

  static List<PageOfWorklogs> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PageOfWorklogs>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PageOfWorklogs.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PageOfWorklogs> mapFromJson(dynamic json) {
    final map = <String, PageOfWorklogs>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PageOfWorklogs.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PageOfWorklogs-objects as value to a dart map
  static Map<String, List<PageOfWorklogs>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PageOfWorklogs>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PageOfWorklogs.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

