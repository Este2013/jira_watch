//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TimeTrackingConfiguration {
  /// Returns a new [TimeTrackingConfiguration] instance.
  TimeTrackingConfiguration({
    required this.defaultUnit,
    required this.timeFormat,
    required this.workingDaysPerWeek,
    required this.workingHoursPerDay,
  });

  /// The default unit of time applied to logged time.
  TimeTrackingConfigurationDefaultUnitEnum defaultUnit;

  /// The format that will appear on an issue's *Time Spent* field.
  TimeTrackingConfigurationTimeFormatEnum timeFormat;

  /// The number of days in a working week.
  double workingDaysPerWeek;

  /// The number of hours in a working day.
  double workingHoursPerDay;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TimeTrackingConfiguration &&
    other.defaultUnit == defaultUnit &&
    other.timeFormat == timeFormat &&
    other.workingDaysPerWeek == workingDaysPerWeek &&
    other.workingHoursPerDay == workingHoursPerDay;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultUnit.hashCode) +
    (timeFormat.hashCode) +
    (workingDaysPerWeek.hashCode) +
    (workingHoursPerDay.hashCode);

  @override
  String toString() => 'TimeTrackingConfiguration[defaultUnit=$defaultUnit, timeFormat=$timeFormat, workingDaysPerWeek=$workingDaysPerWeek, workingHoursPerDay=$workingHoursPerDay]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'defaultUnit'] = this.defaultUnit;
      json[r'timeFormat'] = this.timeFormat;
      json[r'workingDaysPerWeek'] = this.workingDaysPerWeek;
      json[r'workingHoursPerDay'] = this.workingHoursPerDay;
    return json;
  }

  /// Returns a new [TimeTrackingConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TimeTrackingConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'defaultUnit'), 'Required key "TimeTrackingConfiguration[defaultUnit]" is missing from JSON.');
        assert(json[r'defaultUnit'] != null, 'Required key "TimeTrackingConfiguration[defaultUnit]" has a null value in JSON.');
        assert(json.containsKey(r'timeFormat'), 'Required key "TimeTrackingConfiguration[timeFormat]" is missing from JSON.');
        assert(json[r'timeFormat'] != null, 'Required key "TimeTrackingConfiguration[timeFormat]" has a null value in JSON.');
        assert(json.containsKey(r'workingDaysPerWeek'), 'Required key "TimeTrackingConfiguration[workingDaysPerWeek]" is missing from JSON.');
        assert(json[r'workingDaysPerWeek'] != null, 'Required key "TimeTrackingConfiguration[workingDaysPerWeek]" has a null value in JSON.');
        assert(json.containsKey(r'workingHoursPerDay'), 'Required key "TimeTrackingConfiguration[workingHoursPerDay]" is missing from JSON.');
        assert(json[r'workingHoursPerDay'] != null, 'Required key "TimeTrackingConfiguration[workingHoursPerDay]" has a null value in JSON.');
        return true;
      }());

      return TimeTrackingConfiguration(
        defaultUnit: TimeTrackingConfigurationDefaultUnitEnum.fromJson(json[r'defaultUnit'])!,
        timeFormat: TimeTrackingConfigurationTimeFormatEnum.fromJson(json[r'timeFormat'])!,
        workingDaysPerWeek: mapValueOfType<double>(json, r'workingDaysPerWeek')!,
        workingHoursPerDay: mapValueOfType<double>(json, r'workingHoursPerDay')!,
      );
    }
    return null;
  }

  static List<TimeTrackingConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TimeTrackingConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TimeTrackingConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TimeTrackingConfiguration> mapFromJson(dynamic json) {
    final map = <String, TimeTrackingConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TimeTrackingConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TimeTrackingConfiguration-objects as value to a dart map
  static Map<String, List<TimeTrackingConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TimeTrackingConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TimeTrackingConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'defaultUnit',
    'timeFormat',
    'workingDaysPerWeek',
    'workingHoursPerDay',
  };
}

/// The default unit of time applied to logged time.
enum TimeTrackingConfigurationDefaultUnitEnum {
  minute._(r'minute'),
  hour._(r'hour'),
  day._(r'day'),
  week._(r'week'),
  ;

  /// Instantiate a new enum with the provided value.
  const TimeTrackingConfigurationDefaultUnitEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [TimeTrackingConfigurationDefaultUnitEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static TimeTrackingConfigurationDefaultUnitEnum? fromJson(dynamic value) => TimeTrackingConfigurationDefaultUnitEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [TimeTrackingConfigurationDefaultUnitEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<TimeTrackingConfigurationDefaultUnitEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TimeTrackingConfigurationDefaultUnitEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TimeTrackingConfigurationDefaultUnitEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TimeTrackingConfigurationDefaultUnitEnum] to String,
/// and [decode] dynamic data back to [TimeTrackingConfigurationDefaultUnitEnum].
class TimeTrackingConfigurationDefaultUnitEnumTypeTransformer {
  factory TimeTrackingConfigurationDefaultUnitEnumTypeTransformer() => _instance ??= const TimeTrackingConfigurationDefaultUnitEnumTypeTransformer._();

  const TimeTrackingConfigurationDefaultUnitEnumTypeTransformer._();

  String encode(TimeTrackingConfigurationDefaultUnitEnum data) => data._value;

  /// Returns the instance of [TimeTrackingConfigurationDefaultUnitEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TimeTrackingConfigurationDefaultUnitEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is TimeTrackingConfigurationDefaultUnitEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'minute': return TimeTrackingConfigurationDefaultUnitEnum.minute;
        case r'hour': return TimeTrackingConfigurationDefaultUnitEnum.hour;
        case r'day': return TimeTrackingConfigurationDefaultUnitEnum.day;
        case r'week': return TimeTrackingConfigurationDefaultUnitEnum.week;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static TimeTrackingConfigurationDefaultUnitEnumTypeTransformer? _instance;
}


/// The format that will appear on an issue's *Time Spent* field.
enum TimeTrackingConfigurationTimeFormatEnum {
  pretty._(r'pretty'),
  days._(r'days'),
  hours._(r'hours'),
  ;

  /// Instantiate a new enum with the provided value.
  const TimeTrackingConfigurationTimeFormatEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [TimeTrackingConfigurationTimeFormatEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static TimeTrackingConfigurationTimeFormatEnum? fromJson(dynamic value) => TimeTrackingConfigurationTimeFormatEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [TimeTrackingConfigurationTimeFormatEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<TimeTrackingConfigurationTimeFormatEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TimeTrackingConfigurationTimeFormatEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TimeTrackingConfigurationTimeFormatEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TimeTrackingConfigurationTimeFormatEnum] to String,
/// and [decode] dynamic data back to [TimeTrackingConfigurationTimeFormatEnum].
class TimeTrackingConfigurationTimeFormatEnumTypeTransformer {
  factory TimeTrackingConfigurationTimeFormatEnumTypeTransformer() => _instance ??= const TimeTrackingConfigurationTimeFormatEnumTypeTransformer._();

  const TimeTrackingConfigurationTimeFormatEnumTypeTransformer._();

  String encode(TimeTrackingConfigurationTimeFormatEnum data) => data._value;

  /// Returns the instance of [TimeTrackingConfigurationTimeFormatEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TimeTrackingConfigurationTimeFormatEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is TimeTrackingConfigurationTimeFormatEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'pretty': return TimeTrackingConfigurationTimeFormatEnum.pretty;
        case r'days': return TimeTrackingConfigurationTimeFormatEnum.days;
        case r'hours': return TimeTrackingConfigurationTimeFormatEnum.hours;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static TimeTrackingConfigurationTimeFormatEnumTypeTransformer? _instance;
}


