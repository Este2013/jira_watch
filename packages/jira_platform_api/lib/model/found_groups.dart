//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FoundGroups {
  /// Returns a new [FoundGroups] instance.
  FoundGroups({
    this.groups = const [],
    this.header,
    this.total,
  });

  List<FoundGroup> groups;

  /// Header text indicating the number of groups in the response and the total number of groups found in the search.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? header;

  /// The total number of groups found in the search.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FoundGroups &&
    _deepEquality.equals(other.groups, groups) &&
    other.header == header &&
    other.total == total;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (groups.hashCode) +
    (header == null ? 0 : header!.hashCode) +
    (total == null ? 0 : total!.hashCode);

  @override
  String toString() => 'FoundGroups[groups=$groups, header=$header, total=$total]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'groups'] = this.groups;
    if (this.header != null) {
      json[r'header'] = this.header;
    } else {
      json[r'header'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
    return json;
  }

  /// Returns a new [FoundGroups] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FoundGroups? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FoundGroups(
        groups: FoundGroup.listFromJson(json[r'groups']),
        header: mapValueOfType<String>(json, r'header'),
        total: mapValueOfType<int>(json, r'total'),
      );
    }
    return null;
  }

  static List<FoundGroups> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FoundGroups>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FoundGroups.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FoundGroups> mapFromJson(dynamic json) {
    final map = <String, FoundGroups>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FoundGroups.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FoundGroups-objects as value to a dart map
  static Map<String, List<FoundGroups>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FoundGroups>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FoundGroups.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

