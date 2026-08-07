//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetAtlassianTeamResponse {
  /// Returns a new [GetAtlassianTeamResponse] instance.
  GetAtlassianTeamResponse({
    this.capacity,
    required this.id,
    this.issueSourceId,
    required this.planningStyle,
    this.sprintLength,
  });

  /// The capacity for the Atlassian team.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? capacity;

  /// The Atlassian team ID.
  String id;

  /// The ID of the issue source for the Atlassian team.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueSourceId;

  /// The planning style for the Atlassian team. This is \"Scrum\" or \"Kanban\".
  GetAtlassianTeamResponsePlanningStyleEnum planningStyle;

  /// The sprint length for the Atlassian team.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? sprintLength;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetAtlassianTeamResponse &&
    other.capacity == capacity &&
    other.id == id &&
    other.issueSourceId == issueSourceId &&
    other.planningStyle == planningStyle &&
    other.sprintLength == sprintLength;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (capacity == null ? 0 : capacity!.hashCode) +
    (id.hashCode) +
    (issueSourceId == null ? 0 : issueSourceId!.hashCode) +
    (planningStyle.hashCode) +
    (sprintLength == null ? 0 : sprintLength!.hashCode);

  @override
  String toString() => 'GetAtlassianTeamResponse[capacity=$capacity, id=$id, issueSourceId=$issueSourceId, planningStyle=$planningStyle, sprintLength=$sprintLength]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.capacity != null) {
      json[r'capacity'] = this.capacity;
    } else {
      json[r'capacity'] = null;
    }
      json[r'id'] = this.id;
    if (this.issueSourceId != null) {
      json[r'issueSourceId'] = this.issueSourceId;
    } else {
      json[r'issueSourceId'] = null;
    }
      json[r'planningStyle'] = this.planningStyle;
    if (this.sprintLength != null) {
      json[r'sprintLength'] = this.sprintLength;
    } else {
      json[r'sprintLength'] = null;
    }
    return json;
  }

  /// Returns a new [GetAtlassianTeamResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetAtlassianTeamResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "GetAtlassianTeamResponse[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "GetAtlassianTeamResponse[id]" has a null value in JSON.');
        assert(json.containsKey(r'planningStyle'), 'Required key "GetAtlassianTeamResponse[planningStyle]" is missing from JSON.');
        assert(json[r'planningStyle'] != null, 'Required key "GetAtlassianTeamResponse[planningStyle]" has a null value in JSON.');
        return true;
      }());

      return GetAtlassianTeamResponse(
        capacity: mapValueOfType<double>(json, r'capacity'),
        id: mapValueOfType<String>(json, r'id')!,
        issueSourceId: mapValueOfType<int>(json, r'issueSourceId'),
        planningStyle: GetAtlassianTeamResponsePlanningStyleEnum.fromJson(json[r'planningStyle'])!,
        sprintLength: mapValueOfType<int>(json, r'sprintLength'),
      );
    }
    return null;
  }

  static List<GetAtlassianTeamResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetAtlassianTeamResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetAtlassianTeamResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetAtlassianTeamResponse> mapFromJson(dynamic json) {
    final map = <String, GetAtlassianTeamResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetAtlassianTeamResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetAtlassianTeamResponse-objects as value to a dart map
  static Map<String, List<GetAtlassianTeamResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetAtlassianTeamResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetAtlassianTeamResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'planningStyle',
  };
}

/// The planning style for the Atlassian team. This is \"Scrum\" or \"Kanban\".
enum GetAtlassianTeamResponsePlanningStyleEnum {
  scrum._(r'Scrum'),
  kanban._(r'Kanban'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetAtlassianTeamResponsePlanningStyleEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetAtlassianTeamResponsePlanningStyleEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetAtlassianTeamResponsePlanningStyleEnum? fromJson(dynamic value) => GetAtlassianTeamResponsePlanningStyleEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetAtlassianTeamResponsePlanningStyleEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetAtlassianTeamResponsePlanningStyleEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetAtlassianTeamResponsePlanningStyleEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetAtlassianTeamResponsePlanningStyleEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetAtlassianTeamResponsePlanningStyleEnum] to String,
/// and [decode] dynamic data back to [GetAtlassianTeamResponsePlanningStyleEnum].
class GetAtlassianTeamResponsePlanningStyleEnumTypeTransformer {
  factory GetAtlassianTeamResponsePlanningStyleEnumTypeTransformer() => _instance ??= const GetAtlassianTeamResponsePlanningStyleEnumTypeTransformer._();

  const GetAtlassianTeamResponsePlanningStyleEnumTypeTransformer._();

  String encode(GetAtlassianTeamResponsePlanningStyleEnum data) => data._value;

  /// Returns the instance of [GetAtlassianTeamResponsePlanningStyleEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetAtlassianTeamResponsePlanningStyleEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetAtlassianTeamResponsePlanningStyleEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Scrum': return GetAtlassianTeamResponsePlanningStyleEnum.scrum;
        case r'Kanban': return GetAtlassianTeamResponsePlanningStyleEnum.kanban;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetAtlassianTeamResponsePlanningStyleEnumTypeTransformer? _instance;
}


