//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ComponentWithIssueCount {
  /// Returns a new [ComponentWithIssueCount] instance.
  ComponentWithIssueCount({
    this.assignee,
    this.assigneeType,
    this.description,
    this.id,
    this.isAssigneeTypeValid,
    this.issueCount,
    this.lead,
    this.name,
    this.project,
    this.projectId,
    this.realAssignee,
    this.realAssigneeType,
    this.self,
  });

  /// The details of the user associated with `assigneeType`, if any. See `realAssignee` for details of the user assigned to issues created with this component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? assignee;

  /// The nominal user type used to determine the assignee for issues created with this component. See `realAssigneeType` for details on how the type of the user, and hence the user, assigned to issues is determined. Takes the following values:   *  `PROJECT_LEAD` the assignee to any issues created with this component is nominally the lead for the project the component is in.  *  `COMPONENT_LEAD` the assignee to any issues created with this component is nominally the lead for the component.  *  `UNASSIGNED` an assignee is not set for issues created with this component.  *  `PROJECT_DEFAULT` the assignee to any issues created with this component is nominally the default assignee for the project that the component is in.
  ComponentWithIssueCountAssigneeTypeEnum? assigneeType;

  /// The description for the component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The unique identifier for the component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Whether a user is associated with `assigneeType`. For example, if the `assigneeType` is set to `COMPONENT_LEAD` but the component lead is not set, then `false` is returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isAssigneeTypeValid;

  /// Count of issues for the component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueCount;

  /// The user details for the component's lead user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? lead;

  /// The name for the component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The key of the project to which the component is assigned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? project;

  /// Not used.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  /// The user assigned to issues created with this component, when `assigneeType` does not identify a valid assignee.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? realAssignee;

  /// The type of the assignee that is assigned to issues created with this component, when an assignee cannot be set from the `assigneeType`. For example, `assigneeType` is set to `COMPONENT_LEAD` but no component lead is set. This property is set to one of the following values:   *  `PROJECT_LEAD` when `assigneeType` is `PROJECT_LEAD` and the project lead has permission to be assigned issues in the project that the component is in.  *  `COMPONENT_LEAD` when `assignee`Type is `COMPONENT_LEAD` and the component lead has permission to be assigned issues in the project that the component is in.  *  `UNASSIGNED` when `assigneeType` is `UNASSIGNED` and Jira is configured to allow unassigned issues.  *  `PROJECT_DEFAULT` when none of the preceding cases are true.
  ComponentWithIssueCountRealAssigneeTypeEnum? realAssigneeType;

  /// The URL for this count of the issues contained in the component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ComponentWithIssueCount &&
    other.assignee == assignee &&
    other.assigneeType == assigneeType &&
    other.description == description &&
    other.id == id &&
    other.isAssigneeTypeValid == isAssigneeTypeValid &&
    other.issueCount == issueCount &&
    other.lead == lead &&
    other.name == name &&
    other.project == project &&
    other.projectId == projectId &&
    other.realAssignee == realAssignee &&
    other.realAssigneeType == realAssigneeType &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (assignee == null ? 0 : assignee!.hashCode) +
    (assigneeType == null ? 0 : assigneeType!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isAssigneeTypeValid == null ? 0 : isAssigneeTypeValid!.hashCode) +
    (issueCount == null ? 0 : issueCount!.hashCode) +
    (lead == null ? 0 : lead!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (project == null ? 0 : project!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (realAssignee == null ? 0 : realAssignee!.hashCode) +
    (realAssigneeType == null ? 0 : realAssigneeType!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'ComponentWithIssueCount[assignee=$assignee, assigneeType=$assigneeType, description=$description, id=$id, isAssigneeTypeValid=$isAssigneeTypeValid, issueCount=$issueCount, lead=$lead, name=$name, project=$project, projectId=$projectId, realAssignee=$realAssignee, realAssigneeType=$realAssigneeType, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.assignee != null) {
      json[r'assignee'] = this.assignee;
    } else {
      json[r'assignee'] = null;
    }
    if (this.assigneeType != null) {
      json[r'assigneeType'] = this.assigneeType;
    } else {
      json[r'assigneeType'] = null;
    }
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
    if (this.isAssigneeTypeValid != null) {
      json[r'isAssigneeTypeValid'] = this.isAssigneeTypeValid;
    } else {
      json[r'isAssigneeTypeValid'] = null;
    }
    if (this.issueCount != null) {
      json[r'issueCount'] = this.issueCount;
    } else {
      json[r'issueCount'] = null;
    }
    if (this.lead != null) {
      json[r'lead'] = this.lead;
    } else {
      json[r'lead'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.realAssignee != null) {
      json[r'realAssignee'] = this.realAssignee;
    } else {
      json[r'realAssignee'] = null;
    }
    if (this.realAssigneeType != null) {
      json[r'realAssigneeType'] = this.realAssigneeType;
    } else {
      json[r'realAssigneeType'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [ComponentWithIssueCount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ComponentWithIssueCount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ComponentWithIssueCount(
        assignee: User.fromJson(json[r'assignee']),
        assigneeType: ComponentWithIssueCountAssigneeTypeEnum.fromJson(json[r'assigneeType']),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        isAssigneeTypeValid: mapValueOfType<bool>(json, r'isAssigneeTypeValid'),
        issueCount: mapValueOfType<int>(json, r'issueCount'),
        lead: User.fromJson(json[r'lead']),
        name: mapValueOfType<String>(json, r'name'),
        project: mapValueOfType<String>(json, r'project'),
        projectId: mapValueOfType<int>(json, r'projectId'),
        realAssignee: User.fromJson(json[r'realAssignee']),
        realAssigneeType: ComponentWithIssueCountRealAssigneeTypeEnum.fromJson(json[r'realAssigneeType']),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<ComponentWithIssueCount> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ComponentWithIssueCount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ComponentWithIssueCount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ComponentWithIssueCount> mapFromJson(dynamic json) {
    final map = <String, ComponentWithIssueCount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ComponentWithIssueCount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ComponentWithIssueCount-objects as value to a dart map
  static Map<String, List<ComponentWithIssueCount>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ComponentWithIssueCount>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ComponentWithIssueCount.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The nominal user type used to determine the assignee for issues created with this component. See `realAssigneeType` for details on how the type of the user, and hence the user, assigned to issues is determined. Takes the following values:   *  `PROJECT_LEAD` the assignee to any issues created with this component is nominally the lead for the project the component is in.  *  `COMPONENT_LEAD` the assignee to any issues created with this component is nominally the lead for the component.  *  `UNASSIGNED` an assignee is not set for issues created with this component.  *  `PROJECT_DEFAULT` the assignee to any issues created with this component is nominally the default assignee for the project that the component is in.
enum ComponentWithIssueCountAssigneeTypeEnum {
  PROJECT_DEFAULT._(r'PROJECT_DEFAULT'),
  COMPONENT_LEAD._(r'COMPONENT_LEAD'),
  PROJECT_LEAD._(r'PROJECT_LEAD'),
  UNASSIGNED._(r'UNASSIGNED'),
  ;

  /// Instantiate a new enum with the provided value.
  const ComponentWithIssueCountAssigneeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ComponentWithIssueCountAssigneeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ComponentWithIssueCountAssigneeTypeEnum? fromJson(dynamic value) => ComponentWithIssueCountAssigneeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ComponentWithIssueCountAssigneeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ComponentWithIssueCountAssigneeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ComponentWithIssueCountAssigneeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ComponentWithIssueCountAssigneeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ComponentWithIssueCountAssigneeTypeEnum] to String,
/// and [decode] dynamic data back to [ComponentWithIssueCountAssigneeTypeEnum].
class ComponentWithIssueCountAssigneeTypeEnumTypeTransformer {
  factory ComponentWithIssueCountAssigneeTypeEnumTypeTransformer() => _instance ??= const ComponentWithIssueCountAssigneeTypeEnumTypeTransformer._();

  const ComponentWithIssueCountAssigneeTypeEnumTypeTransformer._();

  String encode(ComponentWithIssueCountAssigneeTypeEnum data) => data._value;

  /// Returns the instance of [ComponentWithIssueCountAssigneeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ComponentWithIssueCountAssigneeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ComponentWithIssueCountAssigneeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT_DEFAULT': return ComponentWithIssueCountAssigneeTypeEnum.PROJECT_DEFAULT;
        case r'COMPONENT_LEAD': return ComponentWithIssueCountAssigneeTypeEnum.COMPONENT_LEAD;
        case r'PROJECT_LEAD': return ComponentWithIssueCountAssigneeTypeEnum.PROJECT_LEAD;
        case r'UNASSIGNED': return ComponentWithIssueCountAssigneeTypeEnum.UNASSIGNED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ComponentWithIssueCountAssigneeTypeEnumTypeTransformer? _instance;
}


/// The type of the assignee that is assigned to issues created with this component, when an assignee cannot be set from the `assigneeType`. For example, `assigneeType` is set to `COMPONENT_LEAD` but no component lead is set. This property is set to one of the following values:   *  `PROJECT_LEAD` when `assigneeType` is `PROJECT_LEAD` and the project lead has permission to be assigned issues in the project that the component is in.  *  `COMPONENT_LEAD` when `assignee`Type is `COMPONENT_LEAD` and the component lead has permission to be assigned issues in the project that the component is in.  *  `UNASSIGNED` when `assigneeType` is `UNASSIGNED` and Jira is configured to allow unassigned issues.  *  `PROJECT_DEFAULT` when none of the preceding cases are true.
enum ComponentWithIssueCountRealAssigneeTypeEnum {
  PROJECT_DEFAULT._(r'PROJECT_DEFAULT'),
  COMPONENT_LEAD._(r'COMPONENT_LEAD'),
  PROJECT_LEAD._(r'PROJECT_LEAD'),
  UNASSIGNED._(r'UNASSIGNED'),
  ;

  /// Instantiate a new enum with the provided value.
  const ComponentWithIssueCountRealAssigneeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ComponentWithIssueCountRealAssigneeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ComponentWithIssueCountRealAssigneeTypeEnum? fromJson(dynamic value) => ComponentWithIssueCountRealAssigneeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ComponentWithIssueCountRealAssigneeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ComponentWithIssueCountRealAssigneeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ComponentWithIssueCountRealAssigneeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ComponentWithIssueCountRealAssigneeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ComponentWithIssueCountRealAssigneeTypeEnum] to String,
/// and [decode] dynamic data back to [ComponentWithIssueCountRealAssigneeTypeEnum].
class ComponentWithIssueCountRealAssigneeTypeEnumTypeTransformer {
  factory ComponentWithIssueCountRealAssigneeTypeEnumTypeTransformer() => _instance ??= const ComponentWithIssueCountRealAssigneeTypeEnumTypeTransformer._();

  const ComponentWithIssueCountRealAssigneeTypeEnumTypeTransformer._();

  String encode(ComponentWithIssueCountRealAssigneeTypeEnum data) => data._value;

  /// Returns the instance of [ComponentWithIssueCountRealAssigneeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ComponentWithIssueCountRealAssigneeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ComponentWithIssueCountRealAssigneeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT_DEFAULT': return ComponentWithIssueCountRealAssigneeTypeEnum.PROJECT_DEFAULT;
        case r'COMPONENT_LEAD': return ComponentWithIssueCountRealAssigneeTypeEnum.COMPONENT_LEAD;
        case r'PROJECT_LEAD': return ComponentWithIssueCountRealAssigneeTypeEnum.PROJECT_LEAD;
        case r'UNASSIGNED': return ComponentWithIssueCountRealAssigneeTypeEnum.UNASSIGNED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ComponentWithIssueCountRealAssigneeTypeEnumTypeTransformer? _instance;
}


