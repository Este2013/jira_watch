//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FunctionReferenceData {
  /// Returns a new [FunctionReferenceData] instance.
  FunctionReferenceData({
    this.displayName,
    this.isList,
    this.supportsListAndSingleValueOperators,
    this.types = const [],
    this.value,
  });

  /// The display name of the function.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// Whether the function can take a list of arguments.
  FunctionReferenceDataIsListEnum? isList;

  /// Whether the function supports both single and list value operators.
  FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum? supportsListAndSingleValueOperators;

  /// The data types returned by the function.
  List<String> types;

  /// The function identifier.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FunctionReferenceData &&
    other.displayName == displayName &&
    other.isList == isList &&
    other.supportsListAndSingleValueOperators == supportsListAndSingleValueOperators &&
    _deepEquality.equals(other.types, types) &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (displayName == null ? 0 : displayName!.hashCode) +
    (isList == null ? 0 : isList!.hashCode) +
    (supportsListAndSingleValueOperators == null ? 0 : supportsListAndSingleValueOperators!.hashCode) +
    (types.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'FunctionReferenceData[displayName=$displayName, isList=$isList, supportsListAndSingleValueOperators=$supportsListAndSingleValueOperators, types=$types, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
    }
    if (this.isList != null) {
      json[r'isList'] = this.isList;
    } else {
      json[r'isList'] = null;
    }
    if (this.supportsListAndSingleValueOperators != null) {
      json[r'supportsListAndSingleValueOperators'] = this.supportsListAndSingleValueOperators;
    } else {
      json[r'supportsListAndSingleValueOperators'] = null;
    }
      json[r'types'] = this.types;
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [FunctionReferenceData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FunctionReferenceData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FunctionReferenceData(
        displayName: mapValueOfType<String>(json, r'displayName'),
        isList: FunctionReferenceDataIsListEnum.fromJson(json[r'isList']),
        supportsListAndSingleValueOperators: FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum.fromJson(json[r'supportsListAndSingleValueOperators']),
        types: json[r'types'] is Iterable
            ? (json[r'types'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<FunctionReferenceData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FunctionReferenceData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FunctionReferenceData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FunctionReferenceData> mapFromJson(dynamic json) {
    final map = <String, FunctionReferenceData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FunctionReferenceData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FunctionReferenceData-objects as value to a dart map
  static Map<String, List<FunctionReferenceData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FunctionReferenceData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FunctionReferenceData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Whether the function can take a list of arguments.
enum FunctionReferenceDataIsListEnum {
  true_._(r'true'),
  false_._(r'false'),
  ;

  /// Instantiate a new enum with the provided value.
  const FunctionReferenceDataIsListEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FunctionReferenceDataIsListEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FunctionReferenceDataIsListEnum? fromJson(dynamic value) => FunctionReferenceDataIsListEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FunctionReferenceDataIsListEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FunctionReferenceDataIsListEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FunctionReferenceDataIsListEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FunctionReferenceDataIsListEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FunctionReferenceDataIsListEnum] to String,
/// and [decode] dynamic data back to [FunctionReferenceDataIsListEnum].
class FunctionReferenceDataIsListEnumTypeTransformer {
  factory FunctionReferenceDataIsListEnumTypeTransformer() => _instance ??= const FunctionReferenceDataIsListEnumTypeTransformer._();

  const FunctionReferenceDataIsListEnumTypeTransformer._();

  String encode(FunctionReferenceDataIsListEnum data) => data._value;

  /// Returns the instance of [FunctionReferenceDataIsListEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FunctionReferenceDataIsListEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FunctionReferenceDataIsListEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'true': return FunctionReferenceDataIsListEnum.true_;
        case r'false': return FunctionReferenceDataIsListEnum.false_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FunctionReferenceDataIsListEnumTypeTransformer? _instance;
}


/// Whether the function supports both single and list value operators.
enum FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum {
  true_._(r'true'),
  false_._(r'false'),
  ;

  /// Instantiate a new enum with the provided value.
  const FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum? fromJson(dynamic value) => FunctionReferenceDataSupportsListAndSingleValueOperatorsEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum] to String,
/// and [decode] dynamic data back to [FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum].
class FunctionReferenceDataSupportsListAndSingleValueOperatorsEnumTypeTransformer {
  factory FunctionReferenceDataSupportsListAndSingleValueOperatorsEnumTypeTransformer() => _instance ??= const FunctionReferenceDataSupportsListAndSingleValueOperatorsEnumTypeTransformer._();

  const FunctionReferenceDataSupportsListAndSingleValueOperatorsEnumTypeTransformer._();

  String encode(FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum data) => data._value;

  /// Returns the instance of [FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'true': return FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum.true_;
        case r'false': return FunctionReferenceDataSupportsListAndSingleValueOperatorsEnum.false_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FunctionReferenceDataSupportsListAndSingleValueOperatorsEnumTypeTransformer? _instance;
}


