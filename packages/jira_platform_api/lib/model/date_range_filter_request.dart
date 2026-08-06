//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DateRangeFilterRequest {
  /// Returns a new [DateRangeFilterRequest] instance.
  DateRangeFilterRequest({
    required this.dateAfter,
    required this.dateBefore,
  });

  /// List issues archived after a specified date, passed in the YYYY-MM-DD format.
  String dateAfter;

  /// List issues archived before a specified date provided in the YYYY-MM-DD format.
  String dateBefore;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DateRangeFilterRequest &&
    other.dateAfter == dateAfter &&
    other.dateBefore == dateBefore;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dateAfter.hashCode) +
    (dateBefore.hashCode);

  @override
  String toString() => 'DateRangeFilterRequest[dateAfter=$dateAfter, dateBefore=$dateBefore]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'dateAfter'] = this.dateAfter;
      json[r'dateBefore'] = this.dateBefore;
    return json;
  }

  /// Returns a new [DateRangeFilterRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DateRangeFilterRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'dateAfter'), 'Required key "DateRangeFilterRequest[dateAfter]" is missing from JSON.');
        assert(json[r'dateAfter'] != null, 'Required key "DateRangeFilterRequest[dateAfter]" has a null value in JSON.');
        assert(json.containsKey(r'dateBefore'), 'Required key "DateRangeFilterRequest[dateBefore]" is missing from JSON.');
        assert(json[r'dateBefore'] != null, 'Required key "DateRangeFilterRequest[dateBefore]" has a null value in JSON.');
        return true;
      }());

      return DateRangeFilterRequest(
        dateAfter: mapValueOfType<String>(json, r'dateAfter')!,
        dateBefore: mapValueOfType<String>(json, r'dateBefore')!,
      );
    }
    return null;
  }

  static List<DateRangeFilterRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DateRangeFilterRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DateRangeFilterRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DateRangeFilterRequest> mapFromJson(dynamic json) {
    final map = <String, DateRangeFilterRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DateRangeFilterRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DateRangeFilterRequest-objects as value to a dart map
  static Map<String, List<DateRangeFilterRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DateRangeFilterRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DateRangeFilterRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'dateAfter',
    'dateBefore',
  };
}

