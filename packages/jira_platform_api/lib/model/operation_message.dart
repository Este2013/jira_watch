//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OperationMessage {
  /// Returns a new [OperationMessage] instance.
  OperationMessage({
    required this.message,
    required this.statusCode,
  });

  /// The human-readable message that describes the result.
  String message;

  /// The status code of the response.
  int statusCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OperationMessage &&
    other.message == message &&
    other.statusCode == statusCode;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message.hashCode) +
    (statusCode.hashCode);

  @override
  String toString() => 'OperationMessage[message=$message, statusCode=$statusCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'message'] = this.message;
      json[r'statusCode'] = this.statusCode;
    return json;
  }

  /// Returns a new [OperationMessage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OperationMessage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'message'), 'Required key "OperationMessage[message]" is missing from JSON.');
        assert(json[r'message'] != null, 'Required key "OperationMessage[message]" has a null value in JSON.');
        assert(json.containsKey(r'statusCode'), 'Required key "OperationMessage[statusCode]" is missing from JSON.');
        assert(json[r'statusCode'] != null, 'Required key "OperationMessage[statusCode]" has a null value in JSON.');
        return true;
      }());

      return OperationMessage(
        message: mapValueOfType<String>(json, r'message')!,
        statusCode: mapValueOfType<int>(json, r'statusCode')!,
      );
    }
    return null;
  }

  static List<OperationMessage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OperationMessage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OperationMessage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OperationMessage> mapFromJson(dynamic json) {
    final map = <String, OperationMessage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OperationMessage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OperationMessage-objects as value to a dart map
  static Map<String, List<OperationMessage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OperationMessage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OperationMessage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'statusCode',
  };
}

