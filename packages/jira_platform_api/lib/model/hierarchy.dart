//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Hierarchy {
  /// Returns a new [Hierarchy] instance.
  Hierarchy({
    this.baseLevelId,
    this.levels = const [],
  });

  /// The ID of the base level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? baseLevelId;

  /// Details about the hierarchy level.
  List<SimplifiedHierarchyLevel> levels;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Hierarchy &&
    other.baseLevelId == baseLevelId &&
    _deepEquality.equals(other.levels, levels);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (baseLevelId == null ? 0 : baseLevelId!.hashCode) +
    (levels.hashCode);

  @override
  String toString() => 'Hierarchy[baseLevelId=$baseLevelId, levels=$levels]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.baseLevelId != null) {
      json[r'baseLevelId'] = this.baseLevelId;
    } else {
      json[r'baseLevelId'] = null;
    }
      json[r'levels'] = this.levels;
    return json;
  }

  /// Returns a new [Hierarchy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Hierarchy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Hierarchy(
        baseLevelId: mapValueOfType<int>(json, r'baseLevelId'),
        levels: SimplifiedHierarchyLevel.listFromJson(json[r'levels']),
      );
    }
    return null;
  }

  static List<Hierarchy> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Hierarchy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Hierarchy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Hierarchy> mapFromJson(dynamic json) {
    final map = <String, Hierarchy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Hierarchy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Hierarchy-objects as value to a dart map
  static Map<String, List<Hierarchy>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Hierarchy>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Hierarchy.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

