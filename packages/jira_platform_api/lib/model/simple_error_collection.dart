//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SimpleErrorCollection {
  /// Returns a new [SimpleErrorCollection] instance.
  SimpleErrorCollection({
    this.errorMessages = const [],
    this.errors = const {},
    this.httpStatusCode,
  });

  /// The list of error messages produced by this operation. For example, \"input parameter 'key' must be provided\"
  List<String> errorMessages;

  /// The list of errors by parameter returned by the operation. For example,\"projectKey\": \"Project keys must start with an uppercase letter, followed by one or more uppercase alphanumeric characters.\"
  Map<String, String> errors;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? httpStatusCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SimpleErrorCollection &&
    _deepEquality.equals(other.errorMessages, errorMessages) &&
    _deepEquality.equals(other.errors, errors) &&
    other.httpStatusCode == httpStatusCode;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errorMessages.hashCode) +
    (errors.hashCode) +
    (httpStatusCode == null ? 0 : httpStatusCode!.hashCode);

  @override
  String toString() => 'SimpleErrorCollection[errorMessages=$errorMessages, errors=$errors, httpStatusCode=$httpStatusCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errorMessages'] = this.errorMessages;
      json[r'errors'] = this.errors;
    if (this.httpStatusCode != null) {
      json[r'httpStatusCode'] = this.httpStatusCode;
    } else {
      json[r'httpStatusCode'] = null;
    }
    return json;
  }

  /// Returns a new [SimpleErrorCollection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SimpleErrorCollection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SimpleErrorCollection(
        errorMessages: json[r'errorMessages'] is Iterable
            ? (json[r'errorMessages'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        errors: mapCastOfType<String, String>(json, r'errors') ?? const {},
        httpStatusCode: mapValueOfType<int>(json, r'httpStatusCode'),
      );
    }
    return null;
  }

  static List<SimpleErrorCollection> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SimpleErrorCollection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SimpleErrorCollection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SimpleErrorCollection> mapFromJson(dynamic json) {
    final map = <String, SimpleErrorCollection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SimpleErrorCollection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SimpleErrorCollection-objects as value to a dart map
  static Map<String, List<SimpleErrorCollection>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SimpleErrorCollection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SimpleErrorCollection.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

