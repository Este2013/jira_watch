//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetIssueSourceResponse {
  /// Returns a new [GetIssueSourceResponse] instance.
  GetIssueSourceResponse({
    required this.type,
    required this.value,
  });

  /// The issue source type. This is \"Board\", \"Project\" or \"Filter\".
  GetIssueSourceResponseTypeEnum type;

  /// The issue source value. This is a board ID if the type is \"Board\", a project ID if the type is \"Project\" or a filter ID if the type is \"Filter\".
  int value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetIssueSourceResponse &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'GetIssueSourceResponse[type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'type'] = this.type;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [GetIssueSourceResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetIssueSourceResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "GetIssueSourceResponse[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "GetIssueSourceResponse[type]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "GetIssueSourceResponse[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "GetIssueSourceResponse[value]" has a null value in JSON.');
        return true;
      }());

      return GetIssueSourceResponse(
        type: GetIssueSourceResponseTypeEnum.fromJson(json[r'type'])!,
        value: mapValueOfType<int>(json, r'value')!,
      );
    }
    return null;
  }

  static List<GetIssueSourceResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetIssueSourceResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetIssueSourceResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetIssueSourceResponse> mapFromJson(dynamic json) {
    final map = <String, GetIssueSourceResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetIssueSourceResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetIssueSourceResponse-objects as value to a dart map
  static Map<String, List<GetIssueSourceResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetIssueSourceResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetIssueSourceResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'value',
  };
}

/// The issue source type. This is \"Board\", \"Project\" or \"Filter\".
enum GetIssueSourceResponseTypeEnum {
  board._(r'Board'),
  project._(r'Project'),
  filter._(r'Filter'),
  custom._(r'Custom'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetIssueSourceResponseTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetIssueSourceResponseTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetIssueSourceResponseTypeEnum? fromJson(dynamic value) => GetIssueSourceResponseTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetIssueSourceResponseTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetIssueSourceResponseTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetIssueSourceResponseTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetIssueSourceResponseTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetIssueSourceResponseTypeEnum] to String,
/// and [decode] dynamic data back to [GetIssueSourceResponseTypeEnum].
class GetIssueSourceResponseTypeEnumTypeTransformer {
  factory GetIssueSourceResponseTypeEnumTypeTransformer() => _instance ??= const GetIssueSourceResponseTypeEnumTypeTransformer._();

  const GetIssueSourceResponseTypeEnumTypeTransformer._();

  String encode(GetIssueSourceResponseTypeEnum data) => data._value;

  /// Returns the instance of [GetIssueSourceResponseTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetIssueSourceResponseTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetIssueSourceResponseTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Board': return GetIssueSourceResponseTypeEnum.board;
        case r'Project': return GetIssueSourceResponseTypeEnum.project;
        case r'Filter': return GetIssueSourceResponseTypeEnum.filter;
        case r'Custom': return GetIssueSourceResponseTypeEnum.custom;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetIssueSourceResponseTypeEnumTypeTransformer? _instance;
}


