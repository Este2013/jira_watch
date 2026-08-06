//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetPlanResponse {
  /// Returns a new [GetPlanResponse] instance.
  GetPlanResponse({
    this.crossProjectReleases = const [],
    this.customFields = const [],
    this.exclusionRules,
    required this.id,
    this.issueSources = const [],
    this.lastSaved,
    this.leadAccountId,
    this.name,
    this.permissions = const [],
    required this.scheduling,
    required this.status,
  });

  /// The cross-project releases included in the plan.
  List<GetCrossProjectReleaseResponse> crossProjectReleases;

  /// The custom fields for the plan.
  List<GetCustomFieldResponse> customFields;

  /// The exclusion rules for the plan.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetExclusionRulesResponse? exclusionRules;

  /// The plan ID.
  int id;

  /// The issue sources included in the plan.
  List<GetIssueSourceResponse> issueSources;

  /// The date when the plan was last saved in UTC.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastSaved;

  /// The account ID of the plan lead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? leadAccountId;

  /// The plan name.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The permissions for the plan.
  List<GetPermissionResponse> permissions;

  /// The scheduling settings for the plan.
  GetSchedulingResponse scheduling;

  /// The plan status. This is \"Active\", \"Trashed\" or \"Archived\".
  GetPlanResponseStatusEnum status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetPlanResponse &&
    _deepEquality.equals(other.crossProjectReleases, crossProjectReleases) &&
    _deepEquality.equals(other.customFields, customFields) &&
    other.exclusionRules == exclusionRules &&
    other.id == id &&
    _deepEquality.equals(other.issueSources, issueSources) &&
    other.lastSaved == lastSaved &&
    other.leadAccountId == leadAccountId &&
    other.name == name &&
    _deepEquality.equals(other.permissions, permissions) &&
    other.scheduling == scheduling &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (crossProjectReleases.hashCode) +
    (customFields.hashCode) +
    (exclusionRules == null ? 0 : exclusionRules!.hashCode) +
    (id.hashCode) +
    (issueSources.hashCode) +
    (lastSaved == null ? 0 : lastSaved!.hashCode) +
    (leadAccountId == null ? 0 : leadAccountId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (permissions.hashCode) +
    (scheduling.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'GetPlanResponse[crossProjectReleases=$crossProjectReleases, customFields=$customFields, exclusionRules=$exclusionRules, id=$id, issueSources=$issueSources, lastSaved=$lastSaved, leadAccountId=$leadAccountId, name=$name, permissions=$permissions, scheduling=$scheduling, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'crossProjectReleases'] = this.crossProjectReleases;
      json[r'customFields'] = this.customFields;
    if (this.exclusionRules != null) {
      json[r'exclusionRules'] = this.exclusionRules;
    } else {
      json[r'exclusionRules'] = null;
    }
      json[r'id'] = this.id;
      json[r'issueSources'] = this.issueSources;
    if (this.lastSaved != null) {
      json[r'lastSaved'] = this.lastSaved;
    } else {
      json[r'lastSaved'] = null;
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
      json[r'permissions'] = this.permissions;
      json[r'scheduling'] = this.scheduling;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [GetPlanResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetPlanResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "GetPlanResponse[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "GetPlanResponse[id]" has a null value in JSON.');
        assert(json.containsKey(r'scheduling'), 'Required key "GetPlanResponse[scheduling]" is missing from JSON.');
        assert(json[r'scheduling'] != null, 'Required key "GetPlanResponse[scheduling]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "GetPlanResponse[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "GetPlanResponse[status]" has a null value in JSON.');
        return true;
      }());

      return GetPlanResponse(
        crossProjectReleases: GetCrossProjectReleaseResponse.listFromJson(json[r'crossProjectReleases']),
        customFields: GetCustomFieldResponse.listFromJson(json[r'customFields']),
        exclusionRules: GetExclusionRulesResponse.fromJson(json[r'exclusionRules']),
        id: mapValueOfType<int>(json, r'id')!,
        issueSources: GetIssueSourceResponse.listFromJson(json[r'issueSources']),
        lastSaved: mapValueOfType<String>(json, r'lastSaved'),
        leadAccountId: mapValueOfType<String>(json, r'leadAccountId'),
        name: mapValueOfType<String>(json, r'name'),
        permissions: GetPermissionResponse.listFromJson(json[r'permissions']),
        scheduling: GetSchedulingResponse.fromJson(json[r'scheduling'])!,
        status: GetPlanResponseStatusEnum.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<GetPlanResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetPlanResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetPlanResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetPlanResponse> mapFromJson(dynamic json) {
    final map = <String, GetPlanResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetPlanResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetPlanResponse-objects as value to a dart map
  static Map<String, List<GetPlanResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetPlanResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetPlanResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'scheduling',
    'status',
  };
}

/// The plan status. This is \"Active\", \"Trashed\" or \"Archived\".
enum GetPlanResponseStatusEnum {
  active._(r'Active'),
  trashed._(r'Trashed'),
  archived._(r'Archived'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetPlanResponseStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetPlanResponseStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetPlanResponseStatusEnum? fromJson(dynamic value) => GetPlanResponseStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetPlanResponseStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetPlanResponseStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetPlanResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetPlanResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetPlanResponseStatusEnum] to String,
/// and [decode] dynamic data back to [GetPlanResponseStatusEnum].
class GetPlanResponseStatusEnumTypeTransformer {
  factory GetPlanResponseStatusEnumTypeTransformer() => _instance ??= const GetPlanResponseStatusEnumTypeTransformer._();

  const GetPlanResponseStatusEnumTypeTransformer._();

  String encode(GetPlanResponseStatusEnum data) => data._value;

  /// Returns the instance of [GetPlanResponseStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetPlanResponseStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetPlanResponseStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Active': return GetPlanResponseStatusEnum.active;
        case r'Trashed': return GetPlanResponseStatusEnum.trashed;
        case r'Archived': return GetPlanResponseStatusEnum.archived;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetPlanResponseStatusEnumTypeTransformer? _instance;
}


