//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ErrorMessages {
  /// Returns a new [ErrorMessages] instance.
  ErrorMessages({
    this.errorMessages = const [],
  });

  /// List of errors occurred.
  List<ErrorMessage> errorMessages;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ErrorMessages &&
    _deepEquality.equals(other.errorMessages, errorMessages);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errorMessages.hashCode);

  @override
  String toString() => 'ErrorMessages[errorMessages=$errorMessages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errorMessages'] = this.errorMessages;
    return json;
  }

  /// Returns a new [ErrorMessages] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ErrorMessages? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'errorMessages'), 'Required key "ErrorMessages[errorMessages]" is missing from JSON.');
        assert(json[r'errorMessages'] != null, 'Required key "ErrorMessages[errorMessages]" has a null value in JSON.');
        return true;
      }());

      return ErrorMessages(
        errorMessages: ErrorMessage.listFromJson(json[r'errorMessages']),
      );
    }
    return null;
  }

  static List<ErrorMessages> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ErrorMessages>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ErrorMessages.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ErrorMessages> mapFromJson(dynamic json) {
    final map = <String, ErrorMessages>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ErrorMessages.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ErrorMessages-objects as value to a dart map
  static Map<String, List<ErrorMessages>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ErrorMessages>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ErrorMessages.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'errorMessages',
  };
}

