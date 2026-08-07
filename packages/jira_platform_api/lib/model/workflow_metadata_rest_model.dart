//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowMetadataRestModel {
  /// Returns a new [WorkflowMetadataRestModel] instance.
  WorkflowMetadataRestModel({
    required this.description,
    required this.id,
    required this.name,
    required this.version,
  });

  /// The description of the workflow.
  String description;

  /// The ID of the workflow.
  String id;

  /// The name of the workflow.
  String name;

  DocumentVersion version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowMetadataRestModel &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.version == version;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (version.hashCode);

  @override
  String toString() => 'WorkflowMetadataRestModel[description=$description, id=$id, name=$name, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'description'] = this.description;
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'version'] = this.version;
    return json;
  }

  /// Returns a new [WorkflowMetadataRestModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowMetadataRestModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'description'), 'Required key "WorkflowMetadataRestModel[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "WorkflowMetadataRestModel[description]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "WorkflowMetadataRestModel[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "WorkflowMetadataRestModel[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "WorkflowMetadataRestModel[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "WorkflowMetadataRestModel[name]" has a null value in JSON.');
        assert(json.containsKey(r'version'), 'Required key "WorkflowMetadataRestModel[version]" is missing from JSON.');
        assert(json[r'version'] != null, 'Required key "WorkflowMetadataRestModel[version]" has a null value in JSON.');
        return true;
      }());

      return WorkflowMetadataRestModel(
        description: mapValueOfType<String>(json, r'description')!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        version: DocumentVersion.fromJson(json[r'version'])!,
      );
    }
    return null;
  }

  static List<WorkflowMetadataRestModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowMetadataRestModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowMetadataRestModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowMetadataRestModel> mapFromJson(dynamic json) {
    final map = <String, WorkflowMetadataRestModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowMetadataRestModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowMetadataRestModel-objects as value to a dart map
  static Map<String, List<WorkflowMetadataRestModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowMetadataRestModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowMetadataRestModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'id',
    'name',
    'version',
  };
}

