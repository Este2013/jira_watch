//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowAssociationStatusMapping {
  /// Returns a new [WorkflowAssociationStatusMapping] instance.
  WorkflowAssociationStatusMapping({
    this.newStatusId,
    this.oldStatusId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newStatusId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? oldStatusId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowAssociationStatusMapping &&
    other.newStatusId == newStatusId &&
    other.oldStatusId == oldStatusId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (newStatusId == null ? 0 : newStatusId!.hashCode) +
    (oldStatusId == null ? 0 : oldStatusId!.hashCode);

  @override
  String toString() => 'WorkflowAssociationStatusMapping[newStatusId=$newStatusId, oldStatusId=$oldStatusId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.newStatusId != null) {
      json[r'newStatusId'] = this.newStatusId;
    } else {
      json[r'newStatusId'] = null;
    }
    if (this.oldStatusId != null) {
      json[r'oldStatusId'] = this.oldStatusId;
    } else {
      json[r'oldStatusId'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowAssociationStatusMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowAssociationStatusMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowAssociationStatusMapping(
        newStatusId: mapValueOfType<String>(json, r'newStatusId'),
        oldStatusId: mapValueOfType<String>(json, r'oldStatusId'),
      );
    }
    return null;
  }

  static List<WorkflowAssociationStatusMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowAssociationStatusMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowAssociationStatusMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowAssociationStatusMapping> mapFromJson(dynamic json) {
    final map = <String, WorkflowAssociationStatusMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowAssociationStatusMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowAssociationStatusMapping-objects as value to a dart map
  static Map<String, List<WorkflowAssociationStatusMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowAssociationStatusMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowAssociationStatusMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

