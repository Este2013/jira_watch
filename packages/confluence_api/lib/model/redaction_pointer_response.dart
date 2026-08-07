//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RedactionPointerResponse {
  /// Returns a new [RedactionPointerResponse] instance.
  RedactionPointerResponse({
    this.pointer,
    this.from,
    this.to,
    this.reason,
    this.redactionId,
  });

  /// JSON pointer indicating where the redaction was applied
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pointer;

  /// Starting character index where redaction was applied
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? from;

  /// Ending character index where redaction was applied
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? to;

  /// Reason for the redaction
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// Unique identifier for this redaction. Can be used to restore the redacted content later. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? redactionId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RedactionPointerResponse &&
    other.pointer == pointer &&
    other.from == from &&
    other.to == to &&
    other.reason == reason &&
    other.redactionId == redactionId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (pointer == null ? 0 : pointer!.hashCode) +
    (from == null ? 0 : from!.hashCode) +
    (to == null ? 0 : to!.hashCode) +
    (reason == null ? 0 : reason!.hashCode) +
    (redactionId == null ? 0 : redactionId!.hashCode);

  @override
  String toString() => 'RedactionPointerResponse[pointer=$pointer, from=$from, to=$to, reason=$reason, redactionId=$redactionId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.pointer != null) {
      json[r'pointer'] = this.pointer;
    } else {
      json[r'pointer'] = null;
    }
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
    if (this.redactionId != null) {
      json[r'redactionId'] = this.redactionId;
    } else {
      json[r'redactionId'] = null;
    }
    return json;
  }

  /// Returns a new [RedactionPointerResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RedactionPointerResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RedactionPointerResponse(
        pointer: mapValueOfType<String>(json, r'pointer'),
        from: mapValueOfType<int>(json, r'from'),
        to: mapValueOfType<int>(json, r'to'),
        reason: mapValueOfType<String>(json, r'reason'),
        redactionId: mapValueOfType<String>(json, r'redactionId'),
      );
    }
    return null;
  }

  static List<RedactionPointerResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RedactionPointerResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RedactionPointerResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RedactionPointerResponse> mapFromJson(dynamic json) {
    final map = <String, RedactionPointerResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RedactionPointerResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RedactionPointerResponse-objects as value to a dart map
  static Map<String, List<RedactionPointerResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RedactionPointerResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RedactionPointerResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

