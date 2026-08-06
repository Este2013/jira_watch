//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RedactionPosition {
  /// Returns a new [RedactionPosition] instance.
  RedactionPosition({
    this.adfPointer,
    required this.expectedText,
    required this.from,
    required this.to,
  });

  /// The ADF pointer indicating the position of the text to be redacted. This is only required when redacting from rich text(ADF) fields. For plain text fields, this field can be omitted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? adfPointer;

  /// The text which will be redacted, encoded using SHA256 hash and Base64 digest
  String expectedText;

  /// The start index(inclusive) for the redaction in specified content
  int from;

  /// The ending index(exclusive) for the redaction in specified content
  int to;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RedactionPosition &&
    other.adfPointer == adfPointer &&
    other.expectedText == expectedText &&
    other.from == from &&
    other.to == to;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (adfPointer == null ? 0 : adfPointer!.hashCode) +
    (expectedText.hashCode) +
    (from.hashCode) +
    (to.hashCode);

  @override
  String toString() => 'RedactionPosition[adfPointer=$adfPointer, expectedText=$expectedText, from=$from, to=$to]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.adfPointer != null) {
      json[r'adfPointer'] = this.adfPointer;
    } else {
      json[r'adfPointer'] = null;
    }
      json[r'expectedText'] = this.expectedText;
      json[r'from'] = this.from;
      json[r'to'] = this.to;
    return json;
  }

  /// Returns a new [RedactionPosition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RedactionPosition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'expectedText'), 'Required key "RedactionPosition[expectedText]" is missing from JSON.');
        assert(json[r'expectedText'] != null, 'Required key "RedactionPosition[expectedText]" has a null value in JSON.');
        assert(json.containsKey(r'from'), 'Required key "RedactionPosition[from]" is missing from JSON.');
        assert(json[r'from'] != null, 'Required key "RedactionPosition[from]" has a null value in JSON.');
        assert(json.containsKey(r'to'), 'Required key "RedactionPosition[to]" is missing from JSON.');
        assert(json[r'to'] != null, 'Required key "RedactionPosition[to]" has a null value in JSON.');
        return true;
      }());

      return RedactionPosition(
        adfPointer: mapValueOfType<String>(json, r'adfPointer'),
        expectedText: mapValueOfType<String>(json, r'expectedText')!,
        from: mapValueOfType<int>(json, r'from')!,
        to: mapValueOfType<int>(json, r'to')!,
      );
    }
    return null;
  }

  static List<RedactionPosition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RedactionPosition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RedactionPosition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RedactionPosition> mapFromJson(dynamic json) {
    final map = <String, RedactionPosition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RedactionPosition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RedactionPosition-objects as value to a dart map
  static Map<String, List<RedactionPosition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RedactionPosition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RedactionPosition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'expectedText',
    'from',
    'to',
  };
}

