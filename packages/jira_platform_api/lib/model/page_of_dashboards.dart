//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PageOfDashboards {
  /// Returns a new [PageOfDashboards] instance.
  PageOfDashboards({
    this.dashboards = const [],
    this.maxResults,
    this.next,
    this.prev,
    this.startAt,
    this.total,
  });

  /// List of dashboards.
  List<Dashboard> dashboards;

  /// The maximum number of results that could be on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  /// The URL of the next page of results, if any.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? next;

  /// The URL of the previous page of results, if any.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? prev;

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
  bool operator ==(Object other) => identical(this, other) || other is PageOfDashboards &&
    _deepEquality.equals(other.dashboards, dashboards) &&
    other.maxResults == maxResults &&
    other.next == next &&
    other.prev == prev &&
    other.startAt == startAt &&
    other.total == total;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dashboards.hashCode) +
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (next == null ? 0 : next!.hashCode) +
    (prev == null ? 0 : prev!.hashCode) +
    (startAt == null ? 0 : startAt!.hashCode) +
    (total == null ? 0 : total!.hashCode);

  @override
  String toString() => 'PageOfDashboards[dashboards=$dashboards, maxResults=$maxResults, next=$next, prev=$prev, startAt=$startAt, total=$total]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'dashboards'] = this.dashboards;
    if (this.maxResults != null) {
      json[r'maxResults'] = this.maxResults;
    } else {
      json[r'maxResults'] = null;
    }
    if (this.next != null) {
      json[r'next'] = this.next;
    } else {
      json[r'next'] = null;
    }
    if (this.prev != null) {
      json[r'prev'] = this.prev;
    } else {
      json[r'prev'] = null;
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

  /// Returns a new [PageOfDashboards] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PageOfDashboards? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PageOfDashboards(
        dashboards: Dashboard.listFromJson(json[r'dashboards']),
        maxResults: mapValueOfType<int>(json, r'maxResults'),
        next: mapValueOfType<String>(json, r'next'),
        prev: mapValueOfType<String>(json, r'prev'),
        startAt: mapValueOfType<int>(json, r'startAt'),
        total: mapValueOfType<int>(json, r'total'),
      );
    }
    return null;
  }

  static List<PageOfDashboards> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PageOfDashboards>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PageOfDashboards.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PageOfDashboards> mapFromJson(dynamic json) {
    final map = <String, PageOfDashboards>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PageOfDashboards.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PageOfDashboards-objects as value to a dart map
  static Map<String, List<PageOfDashboards>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PageOfDashboards>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PageOfDashboards.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

