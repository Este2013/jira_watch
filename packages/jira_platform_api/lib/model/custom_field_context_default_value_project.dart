//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueProject {
  /// Returns a new [CustomFieldContextDefaultValueProject] instance.
  CustomFieldContextDefaultValueProject({
    required this.contextId,
    required this.projectId,
    required this.type,
  });

  /// The ID of the context.
  String contextId;

  /// The ID of the default project.
  String projectId;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueProject &&
    other.contextId == contextId &&
    other.projectId == projectId &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (projectId.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueProject[contextId=$contextId, projectId=$projectId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'projectId'] = this.projectId;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueProject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueProject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueProject[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueProject[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'projectId'), 'Required key "CustomFieldContextDefaultValueProject[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "CustomFieldContextDefaultValueProject[projectId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueProject[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueProject[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueProject(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueProject> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueProject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueProject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueProject> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueProject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueProject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueProject-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueProject>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueProject>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueProject.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'projectId',
    'type',
  };
}

