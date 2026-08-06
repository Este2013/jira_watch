//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkingDaysConfig {
  /// Returns a new [WorkingDaysConfig] instance.
  WorkingDaysConfig({
    this.friday,
    this.id,
    this.monday,
    this.nonWorkingDays = const [],
    this.saturday,
    this.sunday,
    this.thursday,
    this.timezoneId,
    this.tuesday,
    this.wednesday,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? friday;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? monday;

  List<NonWorkingDay> nonWorkingDays;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? saturday;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? sunday;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? thursday;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timezoneId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? tuesday;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? wednesday;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkingDaysConfig &&
    other.friday == friday &&
    other.id == id &&
    other.monday == monday &&
    _deepEquality.equals(other.nonWorkingDays, nonWorkingDays) &&
    other.saturday == saturday &&
    other.sunday == sunday &&
    other.thursday == thursday &&
    other.timezoneId == timezoneId &&
    other.tuesday == tuesday &&
    other.wednesday == wednesday;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (friday == null ? 0 : friday!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (monday == null ? 0 : monday!.hashCode) +
    (nonWorkingDays.hashCode) +
    (saturday == null ? 0 : saturday!.hashCode) +
    (sunday == null ? 0 : sunday!.hashCode) +
    (thursday == null ? 0 : thursday!.hashCode) +
    (timezoneId == null ? 0 : timezoneId!.hashCode) +
    (tuesday == null ? 0 : tuesday!.hashCode) +
    (wednesday == null ? 0 : wednesday!.hashCode);

  @override
  String toString() => 'WorkingDaysConfig[friday=$friday, id=$id, monday=$monday, nonWorkingDays=$nonWorkingDays, saturday=$saturday, sunday=$sunday, thursday=$thursday, timezoneId=$timezoneId, tuesday=$tuesday, wednesday=$wednesday]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.friday != null) {
      json[r'friday'] = this.friday;
    } else {
      json[r'friday'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.monday != null) {
      json[r'monday'] = this.monday;
    } else {
      json[r'monday'] = null;
    }
      json[r'nonWorkingDays'] = this.nonWorkingDays;
    if (this.saturday != null) {
      json[r'saturday'] = this.saturday;
    } else {
      json[r'saturday'] = null;
    }
    if (this.sunday != null) {
      json[r'sunday'] = this.sunday;
    } else {
      json[r'sunday'] = null;
    }
    if (this.thursday != null) {
      json[r'thursday'] = this.thursday;
    } else {
      json[r'thursday'] = null;
    }
    if (this.timezoneId != null) {
      json[r'timezoneId'] = this.timezoneId;
    } else {
      json[r'timezoneId'] = null;
    }
    if (this.tuesday != null) {
      json[r'tuesday'] = this.tuesday;
    } else {
      json[r'tuesday'] = null;
    }
    if (this.wednesday != null) {
      json[r'wednesday'] = this.wednesday;
    } else {
      json[r'wednesday'] = null;
    }
    return json;
  }

  /// Returns a new [WorkingDaysConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkingDaysConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkingDaysConfig(
        friday: mapValueOfType<bool>(json, r'friday'),
        id: mapValueOfType<int>(json, r'id'),
        monday: mapValueOfType<bool>(json, r'monday'),
        nonWorkingDays: NonWorkingDay.listFromJson(json[r'nonWorkingDays']),
        saturday: mapValueOfType<bool>(json, r'saturday'),
        sunday: mapValueOfType<bool>(json, r'sunday'),
        thursday: mapValueOfType<bool>(json, r'thursday'),
        timezoneId: mapValueOfType<String>(json, r'timezoneId'),
        tuesday: mapValueOfType<bool>(json, r'tuesday'),
        wednesday: mapValueOfType<bool>(json, r'wednesday'),
      );
    }
    return null;
  }

  static List<WorkingDaysConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkingDaysConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkingDaysConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkingDaysConfig> mapFromJson(dynamic json) {
    final map = <String, WorkingDaysConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkingDaysConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkingDaysConfig-objects as value to a dart map
  static Map<String, List<WorkingDaysConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkingDaysConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkingDaysConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

