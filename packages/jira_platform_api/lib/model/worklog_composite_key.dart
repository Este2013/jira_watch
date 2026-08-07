//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorklogCompositeKey {
  /// Returns a new [WorklogCompositeKey] instance.
  WorklogCompositeKey({
    this.issueId,
    this.worklogId,
  });

  /// The issue ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueId;

  /// The worklog ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? worklogId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorklogCompositeKey &&
    other.issueId == issueId &&
    other.worklogId == worklogId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueId == null ? 0 : issueId!.hashCode) +
    (worklogId == null ? 0 : worklogId!.hashCode);

  @override
  String toString() => 'WorklogCompositeKey[issueId=$issueId, worklogId=$worklogId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueId != null) {
      json[r'issueId'] = this.issueId;
    } else {
      json[r'issueId'] = null;
    }
    if (this.worklogId != null) {
      json[r'worklogId'] = this.worklogId;
    } else {
      json[r'worklogId'] = null;
    }
    return json;
  }

  /// Returns a new [WorklogCompositeKey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorklogCompositeKey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorklogCompositeKey(
        issueId: mapValueOfType<int>(json, r'issueId'),
        worklogId: mapValueOfType<int>(json, r'worklogId'),
      );
    }
    return null;
  }

  static List<WorklogCompositeKey> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorklogCompositeKey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorklogCompositeKey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorklogCompositeKey> mapFromJson(dynamic json) {
    final map = <String, WorklogCompositeKey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorklogCompositeKey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorklogCompositeKey-objects as value to a dart map
  static Map<String, List<WorklogCompositeKey>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorklogCompositeKey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorklogCompositeKey.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

