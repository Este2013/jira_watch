//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DetailedErrorCollection {
  /// Returns a new [DetailedErrorCollection] instance.
  DetailedErrorCollection({
    this.details = const {},
    this.errorMessages = const [],
    this.errors = const {},
  });

  /// Map of objects representing additional details for an error
  Map<String, Object> details;

  /// The list of error messages produced by this operation. For example, \"input parameter 'key' must be provided\"
  List<String> errorMessages;

  /// The list of errors by parameter returned by the operation. For example,\"projectKey\": \"Project keys must start with an uppercase letter, followed by one or more uppercase alphanumeric characters.\"
  Map<String, String> errors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DetailedErrorCollection &&
    _deepEquality.equals(other.details, details) &&
    _deepEquality.equals(other.errorMessages, errorMessages) &&
    _deepEquality.equals(other.errors, errors);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (details.hashCode) +
    (errorMessages.hashCode) +
    (errors.hashCode);

  @override
  String toString() => 'DetailedErrorCollection[details=$details, errorMessages=$errorMessages, errors=$errors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'details'] = this.details;
      json[r'errorMessages'] = this.errorMessages;
      json[r'errors'] = this.errors;
    return json;
  }

  /// Returns a new [DetailedErrorCollection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DetailedErrorCollection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return DetailedErrorCollection(
        details: mapCastOfType<String, Object>(json, r'details') ?? const {},
        errorMessages: json[r'errorMessages'] is Iterable
            ? (json[r'errorMessages'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        errors: mapCastOfType<String, String>(json, r'errors') ?? const {},
      );
    }
    return null;
  }

  static List<DetailedErrorCollection> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DetailedErrorCollection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DetailedErrorCollection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DetailedErrorCollection> mapFromJson(dynamic json) {
    final map = <String, DetailedErrorCollection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DetailedErrorCollection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DetailedErrorCollection-objects as value to a dart map
  static Map<String, List<DetailedErrorCollection>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DetailedErrorCollection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DetailedErrorCollection.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

