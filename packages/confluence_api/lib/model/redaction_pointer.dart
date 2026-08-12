//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RedactionPointer {
  /// Returns a new [RedactionPointer] instance.
  RedactionPointer({
    required this.pointer,
    this.from,
    this.to,
    this.reason,
  });

  /// JSON pointer indicating the exact location within the content structure  where redaction should be applied. Points to the text node containing the content to redact. 
  String pointer;

  /// Starting character index (zero-based) within the target text where redaction begins. 
  ///
  /// Minimum value: 0
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? from;

  /// Ending character index (zero-based) within the target text where redaction ends (exclusive). Must be greater than or equal to 'from' value. 
  ///
  /// Minimum value: 0
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? to;

  /// Optional human-readable reason for the redaction. Used for audit trails and compliance documentation. 
  String? reason;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RedactionPointer &&
    other.pointer == pointer &&
    other.from == from &&
    other.to == to &&
    other.reason == reason;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (pointer.hashCode) +
    (from == null ? 0 : from!.hashCode) +
    (to == null ? 0 : to!.hashCode) +
    (reason == null ? 0 : reason!.hashCode);

  @override
  String toString() => 'RedactionPointer[pointer=$pointer, from=$from, to=$to, reason=$reason]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'pointer'] = this.pointer;
    if (this.from != null) {
      json[r'from'] = this.from;
    } else {
      json[r'from'] = null;
    }
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
    }
    if (this.reason != null) {
      json[r'reason'] = this.reason;
    } else {
      json[r'reason'] = null;
    }
    return json;
  }

  /// Returns a new [RedactionPointer] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RedactionPointer? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'pointer'), 'Required key "RedactionPointer[pointer]" is missing from JSON.');
        assert(json[r'pointer'] != null, 'Required key "RedactionPointer[pointer]" has a null value in JSON.');
        return true;
      }());

      return RedactionPointer(
        pointer: mapValueOfType<String>(json, r'pointer')!,
        from: mapValueOfType<int>(json, r'from'),
        to: mapValueOfType<int>(json, r'to'),
        reason: mapValueOfType<String>(json, r'reason'),
      );
    }
    return null;
  }

  static List<RedactionPointer> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RedactionPointer>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RedactionPointer.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RedactionPointer> mapFromJson(dynamic json) {
    final map = <String, RedactionPointer>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RedactionPointer.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RedactionPointer-objects as value to a dart map
  static Map<String, List<RedactionPointer>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RedactionPointer>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RedactionPointer.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'pointer',
  };
}

