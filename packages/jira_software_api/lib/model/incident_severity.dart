//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IncidentSeverity {
  /// Returns a new [IncidentSeverity] instance.
  IncidentSeverity({
    required this.level,
  });

  /// The severity level of the Incident with P1 being the highest and P5 being the lowest
  IncidentSeverityLevelEnum level;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IncidentSeverity &&
    other.level == level;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (level.hashCode);

  @override
  String toString() => 'IncidentSeverity[level=$level]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'level'] = this.level;
    return json;
  }

  /// Returns a new [IncidentSeverity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IncidentSeverity? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'level'), 'Required key "IncidentSeverity[level]" is missing from JSON.');
        assert(json[r'level'] != null, 'Required key "IncidentSeverity[level]" has a null value in JSON.');
        return true;
      }());

      return IncidentSeverity(
        level: IncidentSeverityLevelEnum.fromJson(json[r'level'])!,
      );
    }
    return null;
  }

  static List<IncidentSeverity> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncidentSeverity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncidentSeverity.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IncidentSeverity> mapFromJson(dynamic json) {
    final map = <String, IncidentSeverity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IncidentSeverity.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IncidentSeverity-objects as value to a dart map
  static Map<String, List<IncidentSeverity>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IncidentSeverity>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IncidentSeverity.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'level',
  };
}

/// The severity level of the Incident with P1 being the highest and P5 being the lowest
enum IncidentSeverityLevelEnum {
  P1._(r'P1'),
  P2._(r'P2'),
  P3._(r'P3'),
  P4._(r'P4'),
  P5._(r'P5'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const IncidentSeverityLevelEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IncidentSeverityLevelEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IncidentSeverityLevelEnum? fromJson(dynamic value) => IncidentSeverityLevelEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IncidentSeverityLevelEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IncidentSeverityLevelEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncidentSeverityLevelEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncidentSeverityLevelEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IncidentSeverityLevelEnum] to String,
/// and [decode] dynamic data back to [IncidentSeverityLevelEnum].
class IncidentSeverityLevelEnumTypeTransformer {
  factory IncidentSeverityLevelEnumTypeTransformer() => _instance ??= const IncidentSeverityLevelEnumTypeTransformer._();

  const IncidentSeverityLevelEnumTypeTransformer._();

  String encode(IncidentSeverityLevelEnum data) => data._value;

  /// Returns the instance of [IncidentSeverityLevelEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IncidentSeverityLevelEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IncidentSeverityLevelEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'P1': return IncidentSeverityLevelEnum.P1;
        case r'P2': return IncidentSeverityLevelEnum.P2;
        case r'P3': return IncidentSeverityLevelEnum.P3;
        case r'P4': return IncidentSeverityLevelEnum.P4;
        case r'P5': return IncidentSeverityLevelEnum.P5;
        case r'unknown': return IncidentSeverityLevelEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IncidentSeverityLevelEnumTypeTransformer? _instance;
}


