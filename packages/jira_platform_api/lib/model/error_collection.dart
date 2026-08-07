//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ErrorCollection {
  /// Returns a new [ErrorCollection] instance.
  ErrorCollection({
    this.errorMessages = const [],
    this.errors = const {},
    this.status,
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
  int? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ErrorCollection &&
    _deepEquality.equals(other.errorMessages, errorMessages) &&
    _deepEquality.equals(other.errors, errors) &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errorMessages.hashCode) +
    (errors.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'ErrorCollection[errorMessages=$errorMessages, errors=$errors, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errorMessages'] = this.errorMessages;
      json[r'errors'] = this.errors;
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [ErrorCollection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ErrorCollection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ErrorCollection(
        errorMessages: json[r'errorMessages'] is Iterable
            ? (json[r'errorMessages'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        errors: mapCastOfType<String, String>(json, r'errors') ?? const {},
        status: mapValueOfType<int>(json, r'status'),
      );
    }
    return null;
  }

  static List<ErrorCollection> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ErrorCollection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ErrorCollection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ErrorCollection> mapFromJson(dynamic json) {
    final map = <String, ErrorCollection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ErrorCollection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ErrorCollection-objects as value to a dart map
  static Map<String, List<ErrorCollection>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ErrorCollection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ErrorCollection.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

