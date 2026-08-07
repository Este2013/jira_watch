//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Environment {
  /// Returns a new [Environment] instance.
  Environment({
    required this.id,
    required this.displayName,
    required this.type,
  });

  /// The identifier of this environment, must be unique for the provider so that it can be shared across pipelines. 
  String id;

  /// The name of the environment to present to the user. 
  String displayName;

  /// The type of the environment. 
  EnvironmentTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Environment &&
    other.id == id &&
    other.displayName == displayName &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (displayName.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'Environment[id=$id, displayName=$displayName, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'displayName'] = this.displayName;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [Environment] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Environment? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "Environment[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Environment[id]" has a null value in JSON.');
        assert(json.containsKey(r'displayName'), 'Required key "Environment[displayName]" is missing from JSON.');
        assert(json[r'displayName'] != null, 'Required key "Environment[displayName]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "Environment[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "Environment[type]" has a null value in JSON.');
        return true;
      }());

      return Environment(
        id: mapValueOfType<String>(json, r'id')!,
        displayName: mapValueOfType<String>(json, r'displayName')!,
        type: EnvironmentTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<Environment> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Environment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Environment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Environment> mapFromJson(dynamic json) {
    final map = <String, Environment>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Environment.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Environment-objects as value to a dart map
  static Map<String, List<Environment>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Environment>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Environment.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'displayName',
    'type',
  };
}

/// The type of the environment. 
enum EnvironmentTypeEnum {
  unmapped._(r'unmapped'),
  development._(r'development'),
  testing._(r'testing'),
  staging._(r'staging'),
  production._(r'production'),
  ;

  /// Instantiate a new enum with the provided value.
  const EnvironmentTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [EnvironmentTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static EnvironmentTypeEnum? fromJson(dynamic value) => EnvironmentTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [EnvironmentTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<EnvironmentTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EnvironmentTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnvironmentTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EnvironmentTypeEnum] to String,
/// and [decode] dynamic data back to [EnvironmentTypeEnum].
class EnvironmentTypeEnumTypeTransformer {
  factory EnvironmentTypeEnumTypeTransformer() => _instance ??= const EnvironmentTypeEnumTypeTransformer._();

  const EnvironmentTypeEnumTypeTransformer._();

  String encode(EnvironmentTypeEnum data) => data._value;

  /// Returns the instance of [EnvironmentTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EnvironmentTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is EnvironmentTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'unmapped': return EnvironmentTypeEnum.unmapped;
        case r'development': return EnvironmentTypeEnum.development;
        case r'testing': return EnvironmentTypeEnum.testing;
        case r'staging': return EnvironmentTypeEnum.staging;
        case r'production': return EnvironmentTypeEnum.production;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static EnvironmentTypeEnumTypeTransformer? _instance;
}


