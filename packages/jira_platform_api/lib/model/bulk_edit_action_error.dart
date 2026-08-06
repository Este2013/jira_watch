//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkEditActionError {
  /// Returns a new [BulkEditActionError] instance.
  BulkEditActionError({
    this.errorMessages = const [],
    this.errors = const {},
  });

  /// The error messages.
  List<String> errorMessages;

  /// The errors.
  Map<String, String> errors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkEditActionError &&
    _deepEquality.equals(other.errorMessages, errorMessages) &&
    _deepEquality.equals(other.errors, errors);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errorMessages.hashCode) +
    (errors.hashCode);

  @override
  String toString() => 'BulkEditActionError[errorMessages=$errorMessages, errors=$errors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errorMessages'] = this.errorMessages;
      json[r'errors'] = this.errors;
    return json;
  }

  /// Returns a new [BulkEditActionError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkEditActionError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'errorMessages'), 'Required key "BulkEditActionError[errorMessages]" is missing from JSON.');
        assert(json[r'errorMessages'] != null, 'Required key "BulkEditActionError[errorMessages]" has a null value in JSON.');
        assert(json.containsKey(r'errors'), 'Required key "BulkEditActionError[errors]" is missing from JSON.');
        assert(json[r'errors'] != null, 'Required key "BulkEditActionError[errors]" has a null value in JSON.');
        return true;
      }());

      return BulkEditActionError(
        errorMessages: json[r'errorMessages'] is Iterable
            ? (json[r'errorMessages'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        errors: mapCastOfType<String, String>(json, r'errors')!,
      );
    }
    return null;
  }

  static List<BulkEditActionError> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkEditActionError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkEditActionError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkEditActionError> mapFromJson(dynamic json) {
    final map = <String, BulkEditActionError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkEditActionError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkEditActionError-objects as value to a dart map
  static Map<String, List<BulkEditActionError>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkEditActionError>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkEditActionError.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'errorMessages',
    'errors',
  };
}

