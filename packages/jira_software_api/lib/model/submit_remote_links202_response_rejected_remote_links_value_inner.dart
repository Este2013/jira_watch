//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner {
  /// Returns a new [SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner] instance.
  SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner({
    required this.message,
    this.errorTraceId,
  });

  /// A human-readable message describing the error.
  String message;

  /// An optional trace ID that can be used by Jira developers to locate the source of the error.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? errorTraceId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner &&
    other.message == message &&
    other.errorTraceId == errorTraceId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message.hashCode) +
    (errorTraceId == null ? 0 : errorTraceId!.hashCode);

  @override
  String toString() => 'SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner[message=$message, errorTraceId=$errorTraceId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'message'] = this.message;
    if (this.errorTraceId != null) {
      json[r'errorTraceId'] = this.errorTraceId;
    } else {
      json[r'errorTraceId'] = null;
    }
    return json;
  }

  /// Returns a new [SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'message'), 'Required key "SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner[message]" is missing from JSON.');
        assert(json[r'message'] != null, 'Required key "SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner[message]" has a null value in JSON.');
        return true;
      }());

      return SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner(
        message: mapValueOfType<String>(json, r'message')!,
        errorTraceId: mapValueOfType<String>(json, r'errorTraceId'),
      );
    }
    return null;
  }

  static List<SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner> mapFromJson(dynamic json) {
    final map = <String, SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner-objects as value to a dart map
  static Map<String, List<SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
  };
}

