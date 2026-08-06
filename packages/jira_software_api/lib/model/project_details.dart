//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectDetails {
  /// Returns a new [ProjectDetails] instance.
  ProjectDetails({
    this.avatarUrls,
    this.id,
    this.key,
    this.name,
    this.projectCategory,
    this.projectTypeKey,
    this.self,
    this.simplified,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueBeanTransitionsInnerToAllOfScopeAllOfProjectAllOfAvatarUrls? avatarUrls;

  /// The ID of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The key of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The name of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueBeanTransitionsInnerToAllOfScopeAllOfProjectAllOfProjectCategory? projectCategory;

  /// The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes) of the project.
  ProjectDetailsProjectTypeKeyEnum? projectTypeKey;

  /// The URL of the project details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// Whether or not the project is simplified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? simplified;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectDetails &&
    other.avatarUrls == avatarUrls &&
    other.id == id &&
    other.key == key &&
    other.name == name &&
    other.projectCategory == projectCategory &&
    other.projectTypeKey == projectTypeKey &&
    other.self == self &&
    other.simplified == simplified;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (avatarUrls == null ? 0 : avatarUrls!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (projectCategory == null ? 0 : projectCategory!.hashCode) +
    (projectTypeKey == null ? 0 : projectTypeKey!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (simplified == null ? 0 : simplified!.hashCode);

  @override
  String toString() => 'ProjectDetails[avatarUrls=$avatarUrls, id=$id, key=$key, name=$name, projectCategory=$projectCategory, projectTypeKey=$projectTypeKey, self=$self, simplified=$simplified]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.avatarUrls != null) {
      json[r'avatarUrls'] = this.avatarUrls;
    } else {
      json[r'avatarUrls'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.projectCategory != null) {
      json[r'projectCategory'] = this.projectCategory;
    } else {
      json[r'projectCategory'] = null;
    }
    if (this.projectTypeKey != null) {
      json[r'projectTypeKey'] = this.projectTypeKey;
    } else {
      json[r'projectTypeKey'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.simplified != null) {
      json[r'simplified'] = this.simplified;
    } else {
      json[r'simplified'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectDetails(
        avatarUrls: IssueBeanTransitionsInnerToAllOfScopeAllOfProjectAllOfAvatarUrls.fromJson(json[r'avatarUrls']),
        id: mapValueOfType<String>(json, r'id'),
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
        projectCategory: IssueBeanTransitionsInnerToAllOfScopeAllOfProjectAllOfProjectCategory.fromJson(json[r'projectCategory']),
        projectTypeKey: ProjectDetailsProjectTypeKeyEnum.fromJson(json[r'projectTypeKey']),
        self: mapValueOfType<String>(json, r'self'),
        simplified: mapValueOfType<bool>(json, r'simplified'),
      );
    }
    return null;
  }

  static List<ProjectDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectDetails> mapFromJson(dynamic json) {
    final map = <String, ProjectDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectDetails-objects as value to a dart map
  static Map<String, List<ProjectDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes) of the project.
enum ProjectDetailsProjectTypeKeyEnum {
  software._(r'software'),
  serviceDesk._(r'service_desk'),
  business._(r'business'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectDetailsProjectTypeKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectDetailsProjectTypeKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectDetailsProjectTypeKeyEnum? fromJson(dynamic value) => ProjectDetailsProjectTypeKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectDetailsProjectTypeKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectDetailsProjectTypeKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectDetailsProjectTypeKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectDetailsProjectTypeKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectDetailsProjectTypeKeyEnum] to String,
/// and [decode] dynamic data back to [ProjectDetailsProjectTypeKeyEnum].
class ProjectDetailsProjectTypeKeyEnumTypeTransformer {
  factory ProjectDetailsProjectTypeKeyEnumTypeTransformer() => _instance ??= const ProjectDetailsProjectTypeKeyEnumTypeTransformer._();

  const ProjectDetailsProjectTypeKeyEnumTypeTransformer._();

  String encode(ProjectDetailsProjectTypeKeyEnum data) => data._value;

  /// Returns the instance of [ProjectDetailsProjectTypeKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectDetailsProjectTypeKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectDetailsProjectTypeKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'software': return ProjectDetailsProjectTypeKeyEnum.software;
        case r'service_desk': return ProjectDetailsProjectTypeKeyEnum.serviceDesk;
        case r'business': return ProjectDetailsProjectTypeKeyEnum.business;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectDetailsProjectTypeKeyEnumTypeTransformer? _instance;
}


