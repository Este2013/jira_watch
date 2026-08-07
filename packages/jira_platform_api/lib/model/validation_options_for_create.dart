//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ValidationOptionsForCreate {
  /// Returns a new [ValidationOptionsForCreate] instance.
  ValidationOptionsForCreate({
    this.levels = const [],
  });

  List<ValidationOptionsForCreateLevelsEnum> levels;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ValidationOptionsForCreate &&
    _deepEquality.equals(other.levels, levels);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (levels.hashCode);

  @override
  String toString() => 'ValidationOptionsForCreate[levels=$levels]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'levels'] = this.levels;
    return json;
  }

  /// Returns a new [ValidationOptionsForCreate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ValidationOptionsForCreate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ValidationOptionsForCreate(
        levels: ValidationOptionsForCreateLevelsEnum.listFromJson(json[r'levels']),
      );
    }
    return null;
  }

  static List<ValidationOptionsForCreate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ValidationOptionsForCreate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ValidationOptionsForCreate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ValidationOptionsForCreate> mapFromJson(dynamic json) {
    final map = <String, ValidationOptionsForCreate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ValidationOptionsForCreate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ValidationOptionsForCreate-objects as value to a dart map
  static Map<String, List<ValidationOptionsForCreate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ValidationOptionsForCreate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ValidationOptionsForCreate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum ValidationOptionsForCreateLevelsEnum {
  WARNING._(r'WARNING'),
  ERROR._(r'ERROR'),
  ;

  /// Instantiate a new enum with the provided value.
  const ValidationOptionsForCreateLevelsEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ValidationOptionsForCreateLevelsEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ValidationOptionsForCreateLevelsEnum? fromJson(dynamic value) => ValidationOptionsForCreateLevelsEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ValidationOptionsForCreateLevelsEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ValidationOptionsForCreateLevelsEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ValidationOptionsForCreateLevelsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ValidationOptionsForCreateLevelsEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ValidationOptionsForCreateLevelsEnum] to String,
/// and [decode] dynamic data back to [ValidationOptionsForCreateLevelsEnum].
class ValidationOptionsForCreateLevelsEnumTypeTransformer {
  factory ValidationOptionsForCreateLevelsEnumTypeTransformer() => _instance ??= const ValidationOptionsForCreateLevelsEnumTypeTransformer._();

  const ValidationOptionsForCreateLevelsEnumTypeTransformer._();

  String encode(ValidationOptionsForCreateLevelsEnum data) => data._value;

  /// Returns the instance of [ValidationOptionsForCreateLevelsEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ValidationOptionsForCreateLevelsEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ValidationOptionsForCreateLevelsEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'WARNING': return ValidationOptionsForCreateLevelsEnum.WARNING;
        case r'ERROR': return ValidationOptionsForCreateLevelsEnum.ERROR;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ValidationOptionsForCreateLevelsEnumTypeTransformer? _instance;
}


