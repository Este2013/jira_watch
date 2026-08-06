//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RichText {
  /// Returns a new [RichText] instance.
  RichText({
    this.empty,
    this.emptyAdf,
    this.finalised,
    this.valueSet,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? empty;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? emptyAdf;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? finalised;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? valueSet;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RichText &&
    other.empty == empty &&
    other.emptyAdf == emptyAdf &&
    other.finalised == finalised &&
    other.valueSet == valueSet;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (empty == null ? 0 : empty!.hashCode) +
    (emptyAdf == null ? 0 : emptyAdf!.hashCode) +
    (finalised == null ? 0 : finalised!.hashCode) +
    (valueSet == null ? 0 : valueSet!.hashCode);

  @override
  String toString() => 'RichText[empty=$empty, emptyAdf=$emptyAdf, finalised=$finalised, valueSet=$valueSet]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.empty != null) {
      json[r'empty'] = this.empty;
    } else {
      json[r'empty'] = null;
    }
    if (this.emptyAdf != null) {
      json[r'emptyAdf'] = this.emptyAdf;
    } else {
      json[r'emptyAdf'] = null;
    }
    if (this.finalised != null) {
      json[r'finalised'] = this.finalised;
    } else {
      json[r'finalised'] = null;
    }
    if (this.valueSet != null) {
      json[r'valueSet'] = this.valueSet;
    } else {
      json[r'valueSet'] = null;
    }
    return json;
  }

  /// Returns a new [RichText] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RichText? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RichText(
        empty: mapValueOfType<bool>(json, r'empty'),
        emptyAdf: mapValueOfType<bool>(json, r'emptyAdf'),
        finalised: mapValueOfType<bool>(json, r'finalised'),
        valueSet: mapValueOfType<bool>(json, r'valueSet'),
      );
    }
    return null;
  }

  static List<RichText> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RichText>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RichText.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RichText> mapFromJson(dynamic json) {
    final map = <String, RichText>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RichText.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RichText-objects as value to a dart map
  static Map<String, List<RichText>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RichText>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RichText.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

