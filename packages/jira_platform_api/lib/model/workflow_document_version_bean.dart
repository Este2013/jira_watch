//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowDocumentVersionBean {
  /// Returns a new [WorkflowDocumentVersionBean] instance.
  WorkflowDocumentVersionBean({
    this.id,
    this.versionNumber,
  });

  /// The version UUID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The version number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? versionNumber;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowDocumentVersionBean &&
    other.id == id &&
    other.versionNumber == versionNumber;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (versionNumber == null ? 0 : versionNumber!.hashCode);

  @override
  String toString() => 'WorkflowDocumentVersionBean[id=$id, versionNumber=$versionNumber]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.versionNumber != null) {
      json[r'versionNumber'] = this.versionNumber;
    } else {
      json[r'versionNumber'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowDocumentVersionBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowDocumentVersionBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowDocumentVersionBean(
        id: mapValueOfType<String>(json, r'id'),
        versionNumber: mapValueOfType<int>(json, r'versionNumber'),
      );
    }
    return null;
  }

  static List<WorkflowDocumentVersionBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowDocumentVersionBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowDocumentVersionBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowDocumentVersionBean> mapFromJson(dynamic json) {
    final map = <String, WorkflowDocumentVersionBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowDocumentVersionBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowDocumentVersionBean-objects as value to a dart map
  static Map<String, List<WorkflowDocumentVersionBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowDocumentVersionBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowDocumentVersionBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

