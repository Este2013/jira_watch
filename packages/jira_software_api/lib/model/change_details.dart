//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangeDetails {
  /// Returns a new [ChangeDetails] instance.
  ChangeDetails({
    this.field,
    this.fieldId,
    this.fieldtype,
    this.from,
    this.fromString,
    this.to,
    this.toStringValue,
  });

  /// The name of the field changed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? field;

  /// The ID of the field changed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldId;

  /// The type of the field changed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldtype;

  /// The details of the original value.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? from;

  /// The details of the original value as a string.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fromString;

  /// The details of the new value.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? to;

  /// The details of the new value as a string.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? toStringValue;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangeDetails &&
    other.field == field &&
    other.fieldId == fieldId &&
    other.fieldtype == fieldtype &&
    other.from == from &&
    other.fromString == fromString &&
    other.to == to &&
    other.toStringValue == toStringValue;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (field == null ? 0 : field!.hashCode) +
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (fieldtype == null ? 0 : fieldtype!.hashCode) +
    (from == null ? 0 : from!.hashCode) +
    (fromString == null ? 0 : fromString!.hashCode) +
    (to == null ? 0 : to!.hashCode) +
    (toStringValue == null ? 0 : toStringValue!.hashCode);

  @override
  String toString() => 'ChangeDetails[field=$field, fieldId=$fieldId, fieldtype=$fieldtype, from=$from, fromString=$fromString, to=$to, toStringValue=$toStringValue]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.field != null) {
      json[r'field'] = this.field;
    } else {
      json[r'field'] = null;
    }
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    if (this.fieldtype != null) {
      json[r'fieldtype'] = this.fieldtype;
    } else {
      json[r'fieldtype'] = null;
    }
    if (this.from != null) {
      json[r'from'] = this.from;
    } else {
      json[r'from'] = null;
    }
    if (this.fromString != null) {
      json[r'fromString'] = this.fromString;
    } else {
      json[r'fromString'] = null;
    }
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
    }
    if (this.toStringValue != null) {
      json[r'toString'] = this.toStringValue;
    } else {
      json[r'toString'] = null;
    }
    return json;
  }

  /// Returns a new [ChangeDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangeDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ChangeDetails(
        field: mapValueOfType<String>(json, r'field'),
        fieldId: mapValueOfType<String>(json, r'fieldId'),
        fieldtype: mapValueOfType<String>(json, r'fieldtype'),
        from: mapValueOfType<String>(json, r'from'),
        fromString: mapValueOfType<String>(json, r'fromString'),
        to: mapValueOfType<String>(json, r'to'),
        toStringValue: mapValueOfType<String>(json, r'toString'),
      );
    }
    return null;
  }

  static List<ChangeDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChangeDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangeDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangeDetails> mapFromJson(dynamic json) {
    final map = <String, ChangeDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangeDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangeDetails-objects as value to a dart map
  static Map<String, List<ChangeDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangeDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChangeDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

