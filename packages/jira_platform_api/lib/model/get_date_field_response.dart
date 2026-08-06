//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetDateFieldResponse {
  /// Returns a new [GetDateFieldResponse] instance.
  GetDateFieldResponse({
    this.dateCustomFieldId,
    required this.type,
  });

  /// A date custom field ID. This is returned if the type is \"DateCustomField\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? dateCustomFieldId;

  /// The date field type. This is \"DueDate\", \"TargetStartDate\", \"TargetEndDate\" or \"DateCustomField\".
  GetDateFieldResponseTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetDateFieldResponse &&
    other.dateCustomFieldId == dateCustomFieldId &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dateCustomFieldId == null ? 0 : dateCustomFieldId!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'GetDateFieldResponse[dateCustomFieldId=$dateCustomFieldId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.dateCustomFieldId != null) {
      json[r'dateCustomFieldId'] = this.dateCustomFieldId;
    } else {
      json[r'dateCustomFieldId'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [GetDateFieldResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetDateFieldResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "GetDateFieldResponse[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "GetDateFieldResponse[type]" has a null value in JSON.');
        return true;
      }());

      return GetDateFieldResponse(
        dateCustomFieldId: mapValueOfType<int>(json, r'dateCustomFieldId'),
        type: GetDateFieldResponseTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<GetDateFieldResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetDateFieldResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetDateFieldResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetDateFieldResponse> mapFromJson(dynamic json) {
    final map = <String, GetDateFieldResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetDateFieldResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetDateFieldResponse-objects as value to a dart map
  static Map<String, List<GetDateFieldResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetDateFieldResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetDateFieldResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

/// The date field type. This is \"DueDate\", \"TargetStartDate\", \"TargetEndDate\" or \"DateCustomField\".
enum GetDateFieldResponseTypeEnum {
  dueDate._(r'DueDate'),
  targetStartDate._(r'TargetStartDate'),
  targetEndDate._(r'TargetEndDate'),
  dateCustomField._(r'DateCustomField'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetDateFieldResponseTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetDateFieldResponseTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetDateFieldResponseTypeEnum? fromJson(dynamic value) => GetDateFieldResponseTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetDateFieldResponseTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetDateFieldResponseTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetDateFieldResponseTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetDateFieldResponseTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetDateFieldResponseTypeEnum] to String,
/// and [decode] dynamic data back to [GetDateFieldResponseTypeEnum].
class GetDateFieldResponseTypeEnumTypeTransformer {
  factory GetDateFieldResponseTypeEnumTypeTransformer() => _instance ??= const GetDateFieldResponseTypeEnumTypeTransformer._();

  const GetDateFieldResponseTypeEnumTypeTransformer._();

  String encode(GetDateFieldResponseTypeEnum data) => data._value;

  /// Returns the instance of [GetDateFieldResponseTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetDateFieldResponseTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetDateFieldResponseTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'DueDate': return GetDateFieldResponseTypeEnum.dueDate;
        case r'TargetStartDate': return GetDateFieldResponseTypeEnum.targetStartDate;
        case r'TargetEndDate': return GetDateFieldResponseTypeEnum.targetEndDate;
        case r'DateCustomField': return GetDateFieldResponseTypeEnum.dateCustomField;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetDateFieldResponseTypeEnumTypeTransformer? _instance;
}


