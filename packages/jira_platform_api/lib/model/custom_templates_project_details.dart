//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomTemplatesProjectDetails {
  /// Returns a new [CustomTemplatesProjectDetails] instance.
  CustomTemplatesProjectDetails({
    this.accessLevel,
    this.additionalProperties = const {},
    this.assigneeType,
    this.avatarId,
    this.categoryId,
    this.description,
    this.enableComponents = false,
    this.key,
    this.language,
    this.leadAccountId,
    this.name,
    this.url,
  });

  /// The access level of the project. Only used by team-managed project
  CustomTemplatesProjectDetailsAccessLevelEnum? accessLevel;

  /// Additional properties of the project
  Map<String, String> additionalProperties;

  /// The default assignee when creating issues in the project
  CustomTemplatesProjectDetailsAssigneeTypeEnum? assigneeType;

  /// The ID of the project's avatar. Use the \\[Get project avatars\\](\\#api-rest-api-3-project-projectIdOrKey-avatar-get) operation to list the available avatars in a project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? avatarId;

  /// The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-3-projectCategory-get) operation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? categoryId;

  /// Brief description of the project
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Whether components are enabled for the project. Only used by company-managed project
  bool enableComponents;

  /// Project keys must be unique and start with an uppercase letter followed by one or more uppercase alphanumeric characters. The maximum length is 10 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The default language for the project
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? language;

  /// The account ID of the project lead. Either `lead` or `leadAccountId` must be set when creating a project. Cannot be provided with `lead`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? leadAccountId;

  /// Name of the project
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// A link to information about this project, such as project documentation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomTemplatesProjectDetails &&
    other.accessLevel == accessLevel &&
    _deepEquality.equals(other.additionalProperties, additionalProperties) &&
    other.assigneeType == assigneeType &&
    other.avatarId == avatarId &&
    other.categoryId == categoryId &&
    other.description == description &&
    other.enableComponents == enableComponents &&
    other.key == key &&
    other.language == language &&
    other.leadAccountId == leadAccountId &&
    other.name == name &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accessLevel == null ? 0 : accessLevel!.hashCode) +
    (additionalProperties.hashCode) +
    (assigneeType == null ? 0 : assigneeType!.hashCode) +
    (avatarId == null ? 0 : avatarId!.hashCode) +
    (categoryId == null ? 0 : categoryId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (enableComponents.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (language == null ? 0 : language!.hashCode) +
    (leadAccountId == null ? 0 : leadAccountId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (url == null ? 0 : url!.hashCode);

  @override
  String toString() => 'CustomTemplatesProjectDetails[accessLevel=$accessLevel, additionalProperties=$additionalProperties, assigneeType=$assigneeType, avatarId=$avatarId, categoryId=$categoryId, description=$description, enableComponents=$enableComponents, key=$key, language=$language, leadAccountId=$leadAccountId, name=$name, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessLevel != null) {
      json[r'accessLevel'] = this.accessLevel;
    } else {
      json[r'accessLevel'] = null;
    }
      json[r'additionalProperties'] = this.additionalProperties;
    if (this.assigneeType != null) {
      json[r'assigneeType'] = this.assigneeType;
    } else {
      json[r'assigneeType'] = null;
    }
    if (this.avatarId != null) {
      json[r'avatarId'] = this.avatarId;
    } else {
      json[r'avatarId'] = null;
    }
    if (this.categoryId != null) {
      json[r'categoryId'] = this.categoryId;
    } else {
      json[r'categoryId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'enableComponents'] = this.enableComponents;
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.language != null) {
      json[r'language'] = this.language;
    } else {
      json[r'language'] = null;
    }
    if (this.leadAccountId != null) {
      json[r'leadAccountId'] = this.leadAccountId;
    } else {
      json[r'leadAccountId'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [CustomTemplatesProjectDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomTemplatesProjectDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CustomTemplatesProjectDetails(
        accessLevel: CustomTemplatesProjectDetailsAccessLevelEnum.fromJson(json[r'accessLevel']),
        additionalProperties: mapCastOfType<String, String>(json, r'additionalProperties') ?? const {},
        assigneeType: CustomTemplatesProjectDetailsAssigneeTypeEnum.fromJson(json[r'assigneeType']),
        avatarId: mapValueOfType<int>(json, r'avatarId'),
        categoryId: mapValueOfType<int>(json, r'categoryId'),
        description: mapValueOfType<String>(json, r'description'),
        enableComponents: mapValueOfType<bool>(json, r'enableComponents') ?? false,
        key: mapValueOfType<String>(json, r'key'),
        language: mapValueOfType<String>(json, r'language'),
        leadAccountId: mapValueOfType<String>(json, r'leadAccountId'),
        name: mapValueOfType<String>(json, r'name'),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<CustomTemplatesProjectDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomTemplatesProjectDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomTemplatesProjectDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomTemplatesProjectDetails> mapFromJson(dynamic json) {
    final map = <String, CustomTemplatesProjectDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomTemplatesProjectDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomTemplatesProjectDetails-objects as value to a dart map
  static Map<String, List<CustomTemplatesProjectDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomTemplatesProjectDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomTemplatesProjectDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The access level of the project. Only used by team-managed project
enum CustomTemplatesProjectDetailsAccessLevelEnum {
  open._(r'open'),
  limited._(r'limited'),
  private._(r'private'),
  free._(r'free'),
  ;

  /// Instantiate a new enum with the provided value.
  const CustomTemplatesProjectDetailsAccessLevelEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CustomTemplatesProjectDetailsAccessLevelEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CustomTemplatesProjectDetailsAccessLevelEnum? fromJson(dynamic value) => CustomTemplatesProjectDetailsAccessLevelEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CustomTemplatesProjectDetailsAccessLevelEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CustomTemplatesProjectDetailsAccessLevelEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomTemplatesProjectDetailsAccessLevelEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomTemplatesProjectDetailsAccessLevelEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomTemplatesProjectDetailsAccessLevelEnum] to String,
/// and [decode] dynamic data back to [CustomTemplatesProjectDetailsAccessLevelEnum].
class CustomTemplatesProjectDetailsAccessLevelEnumTypeTransformer {
  factory CustomTemplatesProjectDetailsAccessLevelEnumTypeTransformer() => _instance ??= const CustomTemplatesProjectDetailsAccessLevelEnumTypeTransformer._();

  const CustomTemplatesProjectDetailsAccessLevelEnumTypeTransformer._();

  String encode(CustomTemplatesProjectDetailsAccessLevelEnum data) => data._value;

  /// Returns the instance of [CustomTemplatesProjectDetailsAccessLevelEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomTemplatesProjectDetailsAccessLevelEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CustomTemplatesProjectDetailsAccessLevelEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'open': return CustomTemplatesProjectDetailsAccessLevelEnum.open;
        case r'limited': return CustomTemplatesProjectDetailsAccessLevelEnum.limited;
        case r'private': return CustomTemplatesProjectDetailsAccessLevelEnum.private;
        case r'free': return CustomTemplatesProjectDetailsAccessLevelEnum.free;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CustomTemplatesProjectDetailsAccessLevelEnumTypeTransformer? _instance;
}


/// The default assignee when creating issues in the project
enum CustomTemplatesProjectDetailsAssigneeTypeEnum {
  PROJECT_DEFAULT._(r'PROJECT_DEFAULT'),
  COMPONENT_LEAD._(r'COMPONENT_LEAD'),
  PROJECT_LEAD._(r'PROJECT_LEAD'),
  UNASSIGNED._(r'UNASSIGNED'),
  ;

  /// Instantiate a new enum with the provided value.
  const CustomTemplatesProjectDetailsAssigneeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CustomTemplatesProjectDetailsAssigneeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CustomTemplatesProjectDetailsAssigneeTypeEnum? fromJson(dynamic value) => CustomTemplatesProjectDetailsAssigneeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CustomTemplatesProjectDetailsAssigneeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CustomTemplatesProjectDetailsAssigneeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomTemplatesProjectDetailsAssigneeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomTemplatesProjectDetailsAssigneeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomTemplatesProjectDetailsAssigneeTypeEnum] to String,
/// and [decode] dynamic data back to [CustomTemplatesProjectDetailsAssigneeTypeEnum].
class CustomTemplatesProjectDetailsAssigneeTypeEnumTypeTransformer {
  factory CustomTemplatesProjectDetailsAssigneeTypeEnumTypeTransformer() => _instance ??= const CustomTemplatesProjectDetailsAssigneeTypeEnumTypeTransformer._();

  const CustomTemplatesProjectDetailsAssigneeTypeEnumTypeTransformer._();

  String encode(CustomTemplatesProjectDetailsAssigneeTypeEnum data) => data._value;

  /// Returns the instance of [CustomTemplatesProjectDetailsAssigneeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomTemplatesProjectDetailsAssigneeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CustomTemplatesProjectDetailsAssigneeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT_DEFAULT': return CustomTemplatesProjectDetailsAssigneeTypeEnum.PROJECT_DEFAULT;
        case r'COMPONENT_LEAD': return CustomTemplatesProjectDetailsAssigneeTypeEnum.COMPONENT_LEAD;
        case r'PROJECT_LEAD': return CustomTemplatesProjectDetailsAssigneeTypeEnum.PROJECT_LEAD;
        case r'UNASSIGNED': return CustomTemplatesProjectDetailsAssigneeTypeEnum.UNASSIGNED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CustomTemplatesProjectDetailsAssigneeTypeEnumTypeTransformer? _instance;
}


