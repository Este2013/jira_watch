//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatePlanRequest {
  /// Returns a new [CreatePlanRequest] instance.
  CreatePlanRequest({
    this.crossProjectReleases = const [],
    this.customFields = const [],
    this.exclusionRules,
    this.issueSources = const [],
    this.leadAccountId,
    required this.name,
    this.permissions = const [],
    required this.scheduling,
  });

  /// The cross-project releases to include in the plan.
  List<CreateCrossProjectReleaseRequest> crossProjectReleases;

  /// The custom fields for the plan.
  List<CreateCustomFieldRequest> customFields;

  /// The exclusion rules for the plan.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateExclusionRulesRequest? exclusionRules;

  /// The issue sources to include in the plan.
  List<CreateIssueSourceRequest> issueSources;

  /// The account ID of the plan lead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? leadAccountId;

  /// The plan name.
  String name;

  /// The permissions for the plan.
  List<CreatePermissionRequest> permissions;

  /// The scheduling settings for the plan.
  CreateSchedulingRequest scheduling;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreatePlanRequest &&
    _deepEquality.equals(other.crossProjectReleases, crossProjectReleases) &&
    _deepEquality.equals(other.customFields, customFields) &&
    other.exclusionRules == exclusionRules &&
    _deepEquality.equals(other.issueSources, issueSources) &&
    other.leadAccountId == leadAccountId &&
    other.name == name &&
    _deepEquality.equals(other.permissions, permissions) &&
    other.scheduling == scheduling;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (crossProjectReleases.hashCode) +
    (customFields.hashCode) +
    (exclusionRules == null ? 0 : exclusionRules!.hashCode) +
    (issueSources.hashCode) +
    (leadAccountId == null ? 0 : leadAccountId!.hashCode) +
    (name.hashCode) +
    (permissions.hashCode) +
    (scheduling.hashCode);

  @override
  String toString() => 'CreatePlanRequest[crossProjectReleases=$crossProjectReleases, customFields=$customFields, exclusionRules=$exclusionRules, issueSources=$issueSources, leadAccountId=$leadAccountId, name=$name, permissions=$permissions, scheduling=$scheduling]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'crossProjectReleases'] = this.crossProjectReleases;
      json[r'customFields'] = this.customFields;
    if (this.exclusionRules != null) {
      json[r'exclusionRules'] = this.exclusionRules;
    } else {
      json[r'exclusionRules'] = null;
    }
      json[r'issueSources'] = this.issueSources;
    if (this.leadAccountId != null) {
      json[r'leadAccountId'] = this.leadAccountId;
    } else {
      json[r'leadAccountId'] = null;
    }
      json[r'name'] = this.name;
      json[r'permissions'] = this.permissions;
      json[r'scheduling'] = this.scheduling;
    return json;
  }

  /// Returns a new [CreatePlanRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatePlanRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueSources'), 'Required key "CreatePlanRequest[issueSources]" is missing from JSON.');
        assert(json[r'issueSources'] != null, 'Required key "CreatePlanRequest[issueSources]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "CreatePlanRequest[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreatePlanRequest[name]" has a null value in JSON.');
        assert(json.containsKey(r'scheduling'), 'Required key "CreatePlanRequest[scheduling]" is missing from JSON.');
        assert(json[r'scheduling'] != null, 'Required key "CreatePlanRequest[scheduling]" has a null value in JSON.');
        return true;
      }());

      return CreatePlanRequest(
        crossProjectReleases: CreateCrossProjectReleaseRequest.listFromJson(json[r'crossProjectReleases']),
        customFields: CreateCustomFieldRequest.listFromJson(json[r'customFields']),
        exclusionRules: CreateExclusionRulesRequest.fromJson(json[r'exclusionRules']),
        issueSources: CreateIssueSourceRequest.listFromJson(json[r'issueSources']),
        leadAccountId: mapValueOfType<String>(json, r'leadAccountId'),
        name: mapValueOfType<String>(json, r'name')!,
        permissions: CreatePermissionRequest.listFromJson(json[r'permissions']),
        scheduling: CreateSchedulingRequest.fromJson(json[r'scheduling'])!,
      );
    }
    return null;
  }

  static List<CreatePlanRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePlanRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePlanRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatePlanRequest> mapFromJson(dynamic json) {
    final map = <String, CreatePlanRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatePlanRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatePlanRequest-objects as value to a dart map
  static Map<String, List<CreatePlanRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreatePlanRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatePlanRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueSources',
    'name',
    'scheduling',
  };
}

