//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetPlanResponseForPage {
  /// Returns a new [GetPlanResponseForPage] instance.
  GetPlanResponseForPage({
    required this.id,
    this.issueSources = const [],
    required this.name,
    required this.scenarioId,
    required this.status,
  });

  /// The plan ID.
  String id;

  /// The issue sources included in the plan.
  List<GetIssueSourceResponse> issueSources;

  /// The plan name.
  String name;

  /// Default scenario ID.
  String scenarioId;

  /// The plan status. This is \"Active\", \"Trashed\" or \"Archived\".
  GetPlanResponseForPageStatusEnum status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetPlanResponseForPage &&
    other.id == id &&
    _deepEquality.equals(other.issueSources, issueSources) &&
    other.name == name &&
    other.scenarioId == scenarioId &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (issueSources.hashCode) +
    (name.hashCode) +
    (scenarioId.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'GetPlanResponseForPage[id=$id, issueSources=$issueSources, name=$name, scenarioId=$scenarioId, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'issueSources'] = this.issueSources;
      json[r'name'] = this.name;
      json[r'scenarioId'] = this.scenarioId;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [GetPlanResponseForPage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetPlanResponseForPage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "GetPlanResponseForPage[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "GetPlanResponseForPage[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "GetPlanResponseForPage[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "GetPlanResponseForPage[name]" has a null value in JSON.');
        assert(json.containsKey(r'scenarioId'), 'Required key "GetPlanResponseForPage[scenarioId]" is missing from JSON.');
        assert(json[r'scenarioId'] != null, 'Required key "GetPlanResponseForPage[scenarioId]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "GetPlanResponseForPage[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "GetPlanResponseForPage[status]" has a null value in JSON.');
        return true;
      }());

      return GetPlanResponseForPage(
        id: mapValueOfType<String>(json, r'id')!,
        issueSources: GetIssueSourceResponse.listFromJson(json[r'issueSources']),
        name: mapValueOfType<String>(json, r'name')!,
        scenarioId: mapValueOfType<String>(json, r'scenarioId')!,
        status: GetPlanResponseForPageStatusEnum.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<GetPlanResponseForPage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetPlanResponseForPage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetPlanResponseForPage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetPlanResponseForPage> mapFromJson(dynamic json) {
    final map = <String, GetPlanResponseForPage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetPlanResponseForPage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetPlanResponseForPage-objects as value to a dart map
  static Map<String, List<GetPlanResponseForPage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetPlanResponseForPage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetPlanResponseForPage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'scenarioId',
    'status',
  };
}

/// The plan status. This is \"Active\", \"Trashed\" or \"Archived\".
enum GetPlanResponseForPageStatusEnum {
  active._(r'Active'),
  trashed._(r'Trashed'),
  archived._(r'Archived'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetPlanResponseForPageStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetPlanResponseForPageStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetPlanResponseForPageStatusEnum? fromJson(dynamic value) => GetPlanResponseForPageStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetPlanResponseForPageStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetPlanResponseForPageStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetPlanResponseForPageStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetPlanResponseForPageStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetPlanResponseForPageStatusEnum] to String,
/// and [decode] dynamic data back to [GetPlanResponseForPageStatusEnum].
class GetPlanResponseForPageStatusEnumTypeTransformer {
  factory GetPlanResponseForPageStatusEnumTypeTransformer() => _instance ??= const GetPlanResponseForPageStatusEnumTypeTransformer._();

  const GetPlanResponseForPageStatusEnumTypeTransformer._();

  String encode(GetPlanResponseForPageStatusEnum data) => data._value;

  /// Returns the instance of [GetPlanResponseForPageStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetPlanResponseForPageStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetPlanResponseForPageStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Active': return GetPlanResponseForPageStatusEnum.active;
        case r'Trashed': return GetPlanResponseForPageStatusEnum.trashed;
        case r'Archived': return GetPlanResponseForPageStatusEnum.archived;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetPlanResponseForPageStatusEnumTypeTransformer? _instance;
}


