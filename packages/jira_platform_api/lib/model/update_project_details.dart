//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateProjectDetails {
  /// Returns a new [UpdateProjectDetails] instance.
  UpdateProjectDetails({
    this.assigneeType,
    this.avatarId,
    this.categoryId,
    this.description,
    this.issueSecurityScheme,
    this.key,
    this.lead,
    this.leadAccountId,
    this.name,
    this.notificationScheme,
    this.permissionScheme,
    this.releasedProjectKeys = const [],
    this.url,
  });

  /// The default assignee when creating issues for this project.
  UpdateProjectDetailsAssigneeTypeEnum? assigneeType;

  /// An integer value for the project's avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? avatarId;

  /// The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-3-projectCategory-get) operation. To remove the project category from the project, set the value to `-1.`
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? categoryId;

  /// A brief description of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the issue security scheme for the project, which enables you to control who can and cannot view issues. Use the [Get issue security schemes](#api-rest-api-3-issuesecurityschemes-get) resource to get all issue security scheme IDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueSecurityScheme;

  /// Project keys must be unique and start with an uppercase letter followed by one or more uppercase alphanumeric characters. The maximum length is 10 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// This parameter is deprecated because of privacy changes. Use `leadAccountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. The user name of the project lead. Cannot be provided with `leadAccountId`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lead;

  /// The account ID of the project lead. Cannot be provided with `lead`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? leadAccountId;

  /// The name of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The ID of the notification scheme for the project. Use the [Get notification schemes](#api-rest-api-3-notificationscheme-get) resource to get a list of notification scheme IDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? notificationScheme;

  /// The ID of the permission scheme for the project. Use the [Get all permission schemes](#api-rest-api-3-permissionscheme-get) resource to see a list of all permission scheme IDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? permissionScheme;

  /// Previous project keys to be released from the current project. Released keys must belong to the current project and not contain the current project key
  List<String> releasedProjectKeys;

  /// A link to information about this project, such as project documentation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateProjectDetails &&
    other.assigneeType == assigneeType &&
    other.avatarId == avatarId &&
    other.categoryId == categoryId &&
    other.description == description &&
    other.issueSecurityScheme == issueSecurityScheme &&
    other.key == key &&
    other.lead == lead &&
    other.leadAccountId == leadAccountId &&
    other.name == name &&
    other.notificationScheme == notificationScheme &&
    other.permissionScheme == permissionScheme &&
    _deepEquality.equals(other.releasedProjectKeys, releasedProjectKeys) &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (assigneeType == null ? 0 : assigneeType!.hashCode) +
    (avatarId == null ? 0 : avatarId!.hashCode) +
    (categoryId == null ? 0 : categoryId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (issueSecurityScheme == null ? 0 : issueSecurityScheme!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (lead == null ? 0 : lead!.hashCode) +
    (leadAccountId == null ? 0 : leadAccountId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (notificationScheme == null ? 0 : notificationScheme!.hashCode) +
    (permissionScheme == null ? 0 : permissionScheme!.hashCode) +
    (releasedProjectKeys.hashCode) +
    (url == null ? 0 : url!.hashCode);

  @override
  String toString() => 'UpdateProjectDetails[assigneeType=$assigneeType, avatarId=$avatarId, categoryId=$categoryId, description=$description, issueSecurityScheme=$issueSecurityScheme, key=$key, lead=$lead, leadAccountId=$leadAccountId, name=$name, notificationScheme=$notificationScheme, permissionScheme=$permissionScheme, releasedProjectKeys=$releasedProjectKeys, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.issueSecurityScheme != null) {
      json[r'issueSecurityScheme'] = this.issueSecurityScheme;
    } else {
      json[r'issueSecurityScheme'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.lead != null) {
      json[r'lead'] = this.lead;
    } else {
      json[r'lead'] = null;
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
    if (this.notificationScheme != null) {
      json[r'notificationScheme'] = this.notificationScheme;
    } else {
      json[r'notificationScheme'] = null;
    }
    if (this.permissionScheme != null) {
      json[r'permissionScheme'] = this.permissionScheme;
    } else {
      json[r'permissionScheme'] = null;
    }
      json[r'releasedProjectKeys'] = this.releasedProjectKeys;
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateProjectDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateProjectDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdateProjectDetails(
        assigneeType: UpdateProjectDetailsAssigneeTypeEnum.fromJson(json[r'assigneeType']),
        avatarId: mapValueOfType<int>(json, r'avatarId'),
        categoryId: mapValueOfType<int>(json, r'categoryId'),
        description: mapValueOfType<String>(json, r'description'),
        issueSecurityScheme: mapValueOfType<int>(json, r'issueSecurityScheme'),
        key: mapValueOfType<String>(json, r'key'),
        lead: mapValueOfType<String>(json, r'lead'),
        leadAccountId: mapValueOfType<String>(json, r'leadAccountId'),
        name: mapValueOfType<String>(json, r'name'),
        notificationScheme: mapValueOfType<int>(json, r'notificationScheme'),
        permissionScheme: mapValueOfType<int>(json, r'permissionScheme'),
        releasedProjectKeys: json[r'releasedProjectKeys'] is Iterable
            ? (json[r'releasedProjectKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<UpdateProjectDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateProjectDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateProjectDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateProjectDetails> mapFromJson(dynamic json) {
    final map = <String, UpdateProjectDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateProjectDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateProjectDetails-objects as value to a dart map
  static Map<String, List<UpdateProjectDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateProjectDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateProjectDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The default assignee when creating issues for this project.
enum UpdateProjectDetailsAssigneeTypeEnum {
  PROJECT_LEAD._(r'PROJECT_LEAD'),
  UNASSIGNED._(r'UNASSIGNED'),
  ;

  /// Instantiate a new enum with the provided value.
  const UpdateProjectDetailsAssigneeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UpdateProjectDetailsAssigneeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UpdateProjectDetailsAssigneeTypeEnum? fromJson(dynamic value) => UpdateProjectDetailsAssigneeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UpdateProjectDetailsAssigneeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UpdateProjectDetailsAssigneeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateProjectDetailsAssigneeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateProjectDetailsAssigneeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateProjectDetailsAssigneeTypeEnum] to String,
/// and [decode] dynamic data back to [UpdateProjectDetailsAssigneeTypeEnum].
class UpdateProjectDetailsAssigneeTypeEnumTypeTransformer {
  factory UpdateProjectDetailsAssigneeTypeEnumTypeTransformer() => _instance ??= const UpdateProjectDetailsAssigneeTypeEnumTypeTransformer._();

  const UpdateProjectDetailsAssigneeTypeEnumTypeTransformer._();

  String encode(UpdateProjectDetailsAssigneeTypeEnum data) => data._value;

  /// Returns the instance of [UpdateProjectDetailsAssigneeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateProjectDetailsAssigneeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UpdateProjectDetailsAssigneeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT_LEAD': return UpdateProjectDetailsAssigneeTypeEnum.PROJECT_LEAD;
        case r'UNASSIGNED': return UpdateProjectDetailsAssigneeTypeEnum.UNASSIGNED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UpdateProjectDetailsAssigneeTypeEnumTypeTransformer? _instance;
}


