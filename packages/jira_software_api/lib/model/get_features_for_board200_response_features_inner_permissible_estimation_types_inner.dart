//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner {
  /// Returns a new [GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner] instance.
  GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner({
    this.localisedDescription,
    this.localisedName,
    this.value,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localisedDescription;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localisedName;

  GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner &&
    other.localisedDescription == localisedDescription &&
    other.localisedName == localisedName &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (localisedDescription == null ? 0 : localisedDescription!.hashCode) +
    (localisedName == null ? 0 : localisedName!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner[localisedDescription=$localisedDescription, localisedName=$localisedName, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.localisedDescription != null) {
      json[r'localisedDescription'] = this.localisedDescription;
    } else {
      json[r'localisedDescription'] = null;
    }
    if (this.localisedName != null) {
      json[r'localisedName'] = this.localisedName;
    } else {
      json[r'localisedName'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner(
        localisedDescription: mapValueOfType<String>(json, r'localisedDescription'),
        localisedName: mapValueOfType<String>(json, r'localisedName'),
        value: GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum.fromJson(json[r'value']),
      );
    }
    return null;
  }

  static List<GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner> mapFromJson(dynamic json) {
    final map = <String, GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner-objects as value to a dart map
  static Map<String, List<GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum {
  STORY_POINTS._(r'STORY_POINTS'),
  ORIGINAL_ESTIMATE._(r'ORIGINAL_ESTIMATE'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum? fromJson(dynamic value) => GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum] to String,
/// and [decode] dynamic data back to [GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum].
class GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnumTypeTransformer {
  factory GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnumTypeTransformer() => _instance ??= const GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnumTypeTransformer._();

  const GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnumTypeTransformer._();

  String encode(GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum data) => data._value;

  /// Returns the instance of [GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'STORY_POINTS': return GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum.STORY_POINTS;
        case r'ORIGINAL_ESTIMATE': return GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnum.ORIGINAL_ESTIMATE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInnerValueEnumTypeTransformer? _instance;
}


