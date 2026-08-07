//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PageWithCursorGetPlanResponseForPage {
  /// Returns a new [PageWithCursorGetPlanResponseForPage] instance.
  PageWithCursorGetPlanResponseForPage({
    this.cursor,
    this.last,
    this.nextPageCursor,
    this.size,
    this.total,
    this.values = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? cursor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? last;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageCursor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  List<GetPlanResponseForPage> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PageWithCursorGetPlanResponseForPage &&
    other.cursor == cursor &&
    other.last == last &&
    other.nextPageCursor == nextPageCursor &&
    other.size == size &&
    other.total == total &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cursor == null ? 0 : cursor!.hashCode) +
    (last == null ? 0 : last!.hashCode) +
    (nextPageCursor == null ? 0 : nextPageCursor!.hashCode) +
    (size == null ? 0 : size!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'PageWithCursorGetPlanResponseForPage[cursor=$cursor, last=$last, nextPageCursor=$nextPageCursor, size=$size, total=$total, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cursor != null) {
      json[r'cursor'] = this.cursor;
    } else {
      json[r'cursor'] = null;
    }
    if (this.last != null) {
      json[r'last'] = this.last;
    } else {
      json[r'last'] = null;
    }
    if (this.nextPageCursor != null) {
      json[r'nextPageCursor'] = this.nextPageCursor;
    } else {
      json[r'nextPageCursor'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [PageWithCursorGetPlanResponseForPage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PageWithCursorGetPlanResponseForPage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PageWithCursorGetPlanResponseForPage(
        cursor: mapValueOfType<String>(json, r'cursor'),
        last: mapValueOfType<bool>(json, r'last'),
        nextPageCursor: mapValueOfType<String>(json, r'nextPageCursor'),
        size: mapValueOfType<int>(json, r'size'),
        total: mapValueOfType<int>(json, r'total'),
        values: GetPlanResponseForPage.listFromJson(json[r'values']),
      );
    }
    return null;
  }

  static List<PageWithCursorGetPlanResponseForPage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PageWithCursorGetPlanResponseForPage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PageWithCursorGetPlanResponseForPage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PageWithCursorGetPlanResponseForPage> mapFromJson(dynamic json) {
    final map = <String, PageWithCursorGetPlanResponseForPage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PageWithCursorGetPlanResponseForPage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PageWithCursorGetPlanResponseForPage-objects as value to a dart map
  static Map<String, List<PageWithCursorGetPlanResponseForPage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PageWithCursorGetPlanResponseForPage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PageWithCursorGetPlanResponseForPage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

