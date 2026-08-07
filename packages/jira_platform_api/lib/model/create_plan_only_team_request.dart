//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatePlanOnlyTeamRequest {
  /// Returns a new [CreatePlanOnlyTeamRequest] instance.
  CreatePlanOnlyTeamRequest({
    this.capacity,
    this.issueSourceId,
    this.memberAccountIds = const [],
    required this.name,
    required this.planningStyle,
    this.sprintLength,
  });

  /// The capacity for the plan-only team.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? capacity;

  /// The ID of the issue source for the plan-only team.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueSourceId;

  /// The account IDs of the plan-only team members.
  List<String> memberAccountIds;

  /// The plan-only team name.
  String name;

  /// The planning style for the plan-only team. This must be \"Scrum\" or \"Kanban\".
  CreatePlanOnlyTeamRequestPlanningStyleEnum planningStyle;

  /// The sprint length for the plan-only team.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? sprintLength;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreatePlanOnlyTeamRequest &&
    other.capacity == capacity &&
    other.issueSourceId == issueSourceId &&
    _deepEquality.equals(other.memberAccountIds, memberAccountIds) &&
    other.name == name &&
    other.planningStyle == planningStyle &&
    other.sprintLength == sprintLength;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (capacity == null ? 0 : capacity!.hashCode) +
    (issueSourceId == null ? 0 : issueSourceId!.hashCode) +
    (memberAccountIds.hashCode) +
    (name.hashCode) +
    (planningStyle.hashCode) +
    (sprintLength == null ? 0 : sprintLength!.hashCode);

  @override
  String toString() => 'CreatePlanOnlyTeamRequest[capacity=$capacity, issueSourceId=$issueSourceId, memberAccountIds=$memberAccountIds, name=$name, planningStyle=$planningStyle, sprintLength=$sprintLength]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.capacity != null) {
      json[r'capacity'] = this.capacity;
    } else {
      json[r'capacity'] = null;
    }
    if (this.issueSourceId != null) {
      json[r'issueSourceId'] = this.issueSourceId;
    } else {
      json[r'issueSourceId'] = null;
    }
      json[r'memberAccountIds'] = this.memberAccountIds;
      json[r'name'] = this.name;
      json[r'planningStyle'] = this.planningStyle;
    if (this.sprintLength != null) {
      json[r'sprintLength'] = this.sprintLength;
    } else {
      json[r'sprintLength'] = null;
    }
    return json;
  }

  /// Returns a new [CreatePlanOnlyTeamRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatePlanOnlyTeamRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "CreatePlanOnlyTeamRequest[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreatePlanOnlyTeamRequest[name]" has a null value in JSON.');
        assert(json.containsKey(r'planningStyle'), 'Required key "CreatePlanOnlyTeamRequest[planningStyle]" is missing from JSON.');
        assert(json[r'planningStyle'] != null, 'Required key "CreatePlanOnlyTeamRequest[planningStyle]" has a null value in JSON.');
        return true;
      }());

      return CreatePlanOnlyTeamRequest(
        capacity: mapValueOfType<double>(json, r'capacity'),
        issueSourceId: mapValueOfType<int>(json, r'issueSourceId'),
        memberAccountIds: json[r'memberAccountIds'] is Iterable
            ? (json[r'memberAccountIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        name: mapValueOfType<String>(json, r'name')!,
        planningStyle: CreatePlanOnlyTeamRequestPlanningStyleEnum.fromJson(json[r'planningStyle'])!,
        sprintLength: mapValueOfType<int>(json, r'sprintLength'),
      );
    }
    return null;
  }

  static List<CreatePlanOnlyTeamRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePlanOnlyTeamRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePlanOnlyTeamRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatePlanOnlyTeamRequest> mapFromJson(dynamic json) {
    final map = <String, CreatePlanOnlyTeamRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatePlanOnlyTeamRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatePlanOnlyTeamRequest-objects as value to a dart map
  static Map<String, List<CreatePlanOnlyTeamRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreatePlanOnlyTeamRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatePlanOnlyTeamRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'planningStyle',
  };
}

/// The planning style for the plan-only team. This must be \"Scrum\" or \"Kanban\".
enum CreatePlanOnlyTeamRequestPlanningStyleEnum {
  scrum._(r'Scrum'),
  kanban._(r'Kanban'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreatePlanOnlyTeamRequestPlanningStyleEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreatePlanOnlyTeamRequestPlanningStyleEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreatePlanOnlyTeamRequestPlanningStyleEnum? fromJson(dynamic value) => CreatePlanOnlyTeamRequestPlanningStyleEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreatePlanOnlyTeamRequestPlanningStyleEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreatePlanOnlyTeamRequestPlanningStyleEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePlanOnlyTeamRequestPlanningStyleEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePlanOnlyTeamRequestPlanningStyleEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreatePlanOnlyTeamRequestPlanningStyleEnum] to String,
/// and [decode] dynamic data back to [CreatePlanOnlyTeamRequestPlanningStyleEnum].
class CreatePlanOnlyTeamRequestPlanningStyleEnumTypeTransformer {
  factory CreatePlanOnlyTeamRequestPlanningStyleEnumTypeTransformer() => _instance ??= const CreatePlanOnlyTeamRequestPlanningStyleEnumTypeTransformer._();

  const CreatePlanOnlyTeamRequestPlanningStyleEnumTypeTransformer._();

  String encode(CreatePlanOnlyTeamRequestPlanningStyleEnum data) => data._value;

  /// Returns the instance of [CreatePlanOnlyTeamRequestPlanningStyleEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreatePlanOnlyTeamRequestPlanningStyleEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreatePlanOnlyTeamRequestPlanningStyleEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Scrum': return CreatePlanOnlyTeamRequestPlanningStyleEnum.scrum;
        case r'Kanban': return CreatePlanOnlyTeamRequestPlanningStyleEnum.kanban;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreatePlanOnlyTeamRequestPlanningStyleEnumTypeTransformer? _instance;
}


