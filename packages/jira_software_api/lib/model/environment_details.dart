//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EnvironmentDetails {
  /// Returns a new [EnvironmentDetails] instance.
  EnvironmentDetails({
    required this.name,
    this.type,
  });

  /// The name of the environment.
  String name;

  /// The 'type' or 'category' of environment this environment belongs to.
  EnvironmentDetailsTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EnvironmentDetails &&
    other.name == name &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'EnvironmentDetails[name=$name, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [EnvironmentDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EnvironmentDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "EnvironmentDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "EnvironmentDetails[name]" has a null value in JSON.');
        return true;
      }());

      return EnvironmentDetails(
        name: mapValueOfType<String>(json, r'name')!,
        type: EnvironmentDetailsTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<EnvironmentDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EnvironmentDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnvironmentDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EnvironmentDetails> mapFromJson(dynamic json) {
    final map = <String, EnvironmentDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EnvironmentDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EnvironmentDetails-objects as value to a dart map
  static Map<String, List<EnvironmentDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EnvironmentDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EnvironmentDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

/// The 'type' or 'category' of environment this environment belongs to.
enum EnvironmentDetailsTypeEnum {
  development._(r'development'),
  testing._(r'testing'),
  staging._(r'staging'),
  production._(r'production'),
  ;

  /// Instantiate a new enum with the provided value.
  const EnvironmentDetailsTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [EnvironmentDetailsTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static EnvironmentDetailsTypeEnum? fromJson(dynamic value) => EnvironmentDetailsTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [EnvironmentDetailsTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<EnvironmentDetailsTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EnvironmentDetailsTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnvironmentDetailsTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EnvironmentDetailsTypeEnum] to String,
/// and [decode] dynamic data back to [EnvironmentDetailsTypeEnum].
class EnvironmentDetailsTypeEnumTypeTransformer {
  factory EnvironmentDetailsTypeEnumTypeTransformer() => _instance ??= const EnvironmentDetailsTypeEnumTypeTransformer._();

  const EnvironmentDetailsTypeEnumTypeTransformer._();

  String encode(EnvironmentDetailsTypeEnum data) => data._value;

  /// Returns the instance of [EnvironmentDetailsTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EnvironmentDetailsTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is EnvironmentDetailsTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'development': return EnvironmentDetailsTypeEnum.development;
        case r'testing': return EnvironmentDetailsTypeEnum.testing;
        case r'staging': return EnvironmentDetailsTypeEnum.staging;
        case r'production': return EnvironmentDetailsTypeEnum.production;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static EnvironmentDetailsTypeEnumTypeTransformer? _instance;
}


