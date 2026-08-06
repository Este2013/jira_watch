//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeDetails {
  /// Returns a new [IssueTypeDetails] instance.
  IssueTypeDetails({
    this.avatarId,
    this.description,
    this.entityId,
    this.hierarchyLevel,
    this.iconUrl,
    this.id,
    this.name,
    this.scope,
    this.self,
    this.subtask,
  });

  /// The ID of the issue type's avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? avatarId;

  /// The description of the issue type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Unique ID for next-gen projects.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? entityId;

  /// Hierarchy level of the issue type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? hierarchyLevel;

  /// The URL of the issue type's avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? iconUrl;

  /// The ID of the issue type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The name of the issue type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Details of the next-gen projects the issue type is available in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Scope? scope;

  /// The URL of these issue type details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// Whether this issue type is used to create subtasks.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? subtask;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeDetails &&
    other.avatarId == avatarId &&
    other.description == description &&
    other.entityId == entityId &&
    other.hierarchyLevel == hierarchyLevel &&
    other.iconUrl == iconUrl &&
    other.id == id &&
    other.name == name &&
    other.scope == scope &&
    other.self == self &&
    other.subtask == subtask;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (avatarId == null ? 0 : avatarId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (entityId == null ? 0 : entityId!.hashCode) +
    (hierarchyLevel == null ? 0 : hierarchyLevel!.hashCode) +
    (iconUrl == null ? 0 : iconUrl!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (subtask == null ? 0 : subtask!.hashCode);

  @override
  String toString() => 'IssueTypeDetails[avatarId=$avatarId, description=$description, entityId=$entityId, hierarchyLevel=$hierarchyLevel, iconUrl=$iconUrl, id=$id, name=$name, scope=$scope, self=$self, subtask=$subtask]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.avatarId != null) {
      json[r'avatarId'] = this.avatarId;
    } else {
      json[r'avatarId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.entityId != null) {
      json[r'entityId'] = this.entityId;
    } else {
      json[r'entityId'] = null;
    }
    if (this.hierarchyLevel != null) {
      json[r'hierarchyLevel'] = this.hierarchyLevel;
    } else {
      json[r'hierarchyLevel'] = null;
    }
    if (this.iconUrl != null) {
      json[r'iconUrl'] = this.iconUrl;
    } else {
      json[r'iconUrl'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.subtask != null) {
      json[r'subtask'] = this.subtask;
    } else {
      json[r'subtask'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTypeDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypeDetails(
        avatarId: mapValueOfType<int>(json, r'avatarId'),
        description: mapValueOfType<String>(json, r'description'),
        entityId: mapValueOfType<String>(json, r'entityId'),
        hierarchyLevel: mapValueOfType<int>(json, r'hierarchyLevel'),
        iconUrl: mapValueOfType<String>(json, r'iconUrl'),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        scope: Scope.fromJson(json[r'scope']),
        self: mapValueOfType<String>(json, r'self'),
        subtask: mapValueOfType<bool>(json, r'subtask'),
      );
    }
    return null;
  }

  static List<IssueTypeDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeDetails> mapFromJson(dynamic json) {
    final map = <String, IssueTypeDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeDetails-objects as value to a dart map
  static Map<String, List<IssueTypeDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

