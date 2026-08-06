//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateCustomFieldContext {
  /// Returns a new [CreateCustomFieldContext] instance.
  CreateCustomFieldContext({
    this.description,
    this.id,
    this.issueTypeIds = const [],
    required this.name,
    this.projectIds = const [],
  });

  /// The description of the context.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the context.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The list of issue types IDs for the context. If the list is empty, the context refers to all issue types.
  List<String> issueTypeIds;

  /// The name of the context.
  String name;

  /// The list of project IDs associated with the context. If the list is empty, the context is global.
  List<String> projectIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateCustomFieldContext &&
    other.description == description &&
    other.id == id &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds) &&
    other.name == name &&
    _deepEquality.equals(other.projectIds, projectIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (issueTypeIds.hashCode) +
    (name.hashCode) +
    (projectIds.hashCode);

  @override
  String toString() => 'CreateCustomFieldContext[description=$description, id=$id, issueTypeIds=$issueTypeIds, name=$name, projectIds=$projectIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'issueTypeIds'] = this.issueTypeIds;
      json[r'name'] = this.name;
      json[r'projectIds'] = this.projectIds;
    return json;
  }

  /// Returns a new [CreateCustomFieldContext] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateCustomFieldContext? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "CreateCustomFieldContext[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreateCustomFieldContext[name]" has a null value in JSON.');
        return true;
      }());

      return CreateCustomFieldContext(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        issueTypeIds: json[r'issueTypeIds'] is Iterable
            ? (json[r'issueTypeIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        name: mapValueOfType<String>(json, r'name')!,
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<CreateCustomFieldContext> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateCustomFieldContext>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateCustomFieldContext.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateCustomFieldContext> mapFromJson(dynamic json) {
    final map = <String, CreateCustomFieldContext>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateCustomFieldContext.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateCustomFieldContext-objects as value to a dart map
  static Map<String, List<CreateCustomFieldContext>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateCustomFieldContext>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateCustomFieldContext.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

