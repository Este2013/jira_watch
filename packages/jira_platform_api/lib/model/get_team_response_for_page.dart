//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetTeamResponseForPage {
  /// Returns a new [GetTeamResponseForPage] instance.
  GetTeamResponseForPage({
    required this.id,
    this.name,
    required this.type,
  });

  /// The team ID.
  String id;

  /// The team name. This is returned if the type is \"PlanOnly\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The team type. This is \"PlanOnly\" or \"Atlassian\".
  GetTeamResponseForPageTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetTeamResponseForPage &&
    other.id == id &&
    other.name == name &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'GetTeamResponseForPage[id=$id, name=$name, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [GetTeamResponseForPage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetTeamResponseForPage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "GetTeamResponseForPage[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "GetTeamResponseForPage[id]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "GetTeamResponseForPage[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "GetTeamResponseForPage[type]" has a null value in JSON.');
        return true;
      }());

      return GetTeamResponseForPage(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name'),
        type: GetTeamResponseForPageTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<GetTeamResponseForPage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetTeamResponseForPage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetTeamResponseForPage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetTeamResponseForPage> mapFromJson(dynamic json) {
    final map = <String, GetTeamResponseForPage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetTeamResponseForPage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetTeamResponseForPage-objects as value to a dart map
  static Map<String, List<GetTeamResponseForPage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetTeamResponseForPage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetTeamResponseForPage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'type',
  };
}

/// The team type. This is \"PlanOnly\" or \"Atlassian\".
enum GetTeamResponseForPageTypeEnum {
  planOnly._(r'PlanOnly'),
  atlassian._(r'Atlassian'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetTeamResponseForPageTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetTeamResponseForPageTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetTeamResponseForPageTypeEnum? fromJson(dynamic value) => GetTeamResponseForPageTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetTeamResponseForPageTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetTeamResponseForPageTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetTeamResponseForPageTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetTeamResponseForPageTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetTeamResponseForPageTypeEnum] to String,
/// and [decode] dynamic data back to [GetTeamResponseForPageTypeEnum].
class GetTeamResponseForPageTypeEnumTypeTransformer {
  factory GetTeamResponseForPageTypeEnumTypeTransformer() => _instance ??= const GetTeamResponseForPageTypeEnumTypeTransformer._();

  const GetTeamResponseForPageTypeEnumTypeTransformer._();

  String encode(GetTeamResponseForPageTypeEnum data) => data._value;

  /// Returns the instance of [GetTeamResponseForPageTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetTeamResponseForPageTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetTeamResponseForPageTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PlanOnly': return GetTeamResponseForPageTypeEnum.planOnly;
        case r'Atlassian': return GetTeamResponseForPageTypeEnum.atlassian;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetTeamResponseForPageTypeEnumTypeTransformer? _instance;
}


