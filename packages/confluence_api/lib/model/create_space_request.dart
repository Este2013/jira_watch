//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSpaceRequest {
  /// Returns a new [CreateSpaceRequest] instance.
  CreateSpaceRequest({
    required this.name,
    this.key,
    this.alias,
    this.description,
    this.roleAssignments = const [],
    this.copySpaceAccessConfiguration,
    this.createPrivateSpace,
    this.templateKey,
  });

  /// The name of the space to be created.
  String name;

  /// The key for the new space. See [Space Keys](https://support.atlassian.com/confluence-cloud/docs/create-a-space/). If the key property is not provided, the alias property is required to be used instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// This field will be used as the new identifier for the space in confluence page URLs. If the alias property is not provided, the key property is required to be used instead. Maximum 255 alphanumeric characters in length.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? alias;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateSpaceRequestDescription? description;

  List<CreateSpaceRequestRoleAssignmentsInner> roleAssignments;

  /// The id of the space to copy the space access configuration from.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? copySpaceAccessConfiguration;

  /// Whether to create the space as private.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? createPrivateSpace;

  /// The key of the template to use.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? templateKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateSpaceRequest &&
    other.name == name &&
    other.key == key &&
    other.alias == alias &&
    other.description == description &&
    _deepEquality.equals(other.roleAssignments, roleAssignments) &&
    other.copySpaceAccessConfiguration == copySpaceAccessConfiguration &&
    other.createPrivateSpace == createPrivateSpace &&
    other.templateKey == templateKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (alias == null ? 0 : alias!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (roleAssignments.hashCode) +
    (copySpaceAccessConfiguration == null ? 0 : copySpaceAccessConfiguration!.hashCode) +
    (createPrivateSpace == null ? 0 : createPrivateSpace!.hashCode) +
    (templateKey == null ? 0 : templateKey!.hashCode);

  @override
  String toString() => 'CreateSpaceRequest[name=$name, key=$key, alias=$alias, description=$description, roleAssignments=$roleAssignments, copySpaceAccessConfiguration=$copySpaceAccessConfiguration, createPrivateSpace=$createPrivateSpace, templateKey=$templateKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.alias != null) {
      json[r'alias'] = this.alias;
    } else {
      json[r'alias'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'roleAssignments'] = this.roleAssignments;
    if (this.copySpaceAccessConfiguration != null) {
      json[r'copySpaceAccessConfiguration'] = this.copySpaceAccessConfiguration;
    } else {
      json[r'copySpaceAccessConfiguration'] = null;
    }
    if (this.createPrivateSpace != null) {
      json[r'createPrivateSpace'] = this.createPrivateSpace;
    } else {
      json[r'createPrivateSpace'] = null;
    }
    if (this.templateKey != null) {
      json[r'templateKey'] = this.templateKey;
    } else {
      json[r'templateKey'] = null;
    }
    return json;
  }

  /// Returns a new [CreateSpaceRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSpaceRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "CreateSpaceRequest[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreateSpaceRequest[name]" has a null value in JSON.');
        return true;
      }());

      return CreateSpaceRequest(
        name: mapValueOfType<String>(json, r'name')!,
        key: mapValueOfType<String>(json, r'key'),
        alias: mapValueOfType<String>(json, r'alias'),
        description: CreateSpaceRequestDescription.fromJson(json[r'description']),
        roleAssignments: CreateSpaceRequestRoleAssignmentsInner.listFromJson(json[r'roleAssignments']),
        copySpaceAccessConfiguration: mapValueOfType<int>(json, r'copySpaceAccessConfiguration'),
        createPrivateSpace: mapValueOfType<bool>(json, r'createPrivateSpace'),
        templateKey: mapValueOfType<String>(json, r'templateKey'),
      );
    }
    return null;
  }

  static List<CreateSpaceRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateSpaceRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSpaceRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSpaceRequest> mapFromJson(dynamic json) {
    final map = <String, CreateSpaceRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateSpaceRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSpaceRequest-objects as value to a dart map
  static Map<String, List<CreateSpaceRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateSpaceRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateSpaceRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

