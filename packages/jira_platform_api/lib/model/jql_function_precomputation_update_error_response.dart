//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlFunctionPrecomputationUpdateErrorResponse {
  /// Returns a new [JqlFunctionPrecomputationUpdateErrorResponse] instance.
  JqlFunctionPrecomputationUpdateErrorResponse({
    this.errorMessages = const [],
    this.notFoundPrecomputationIDs = const [],
  });

  /// The list of error messages produced by this operation.
  List<String> errorMessages;

  /// List of precomputations that were not found.
  List<String> notFoundPrecomputationIDs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlFunctionPrecomputationUpdateErrorResponse &&
    _deepEquality.equals(other.errorMessages, errorMessages) &&
    _deepEquality.equals(other.notFoundPrecomputationIDs, notFoundPrecomputationIDs);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errorMessages.hashCode) +
    (notFoundPrecomputationIDs.hashCode);

  @override
  String toString() => 'JqlFunctionPrecomputationUpdateErrorResponse[errorMessages=$errorMessages, notFoundPrecomputationIDs=$notFoundPrecomputationIDs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errorMessages'] = this.errorMessages;
      json[r'notFoundPrecomputationIDs'] = this.notFoundPrecomputationIDs;
    return json;
  }

  /// Returns a new [JqlFunctionPrecomputationUpdateErrorResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlFunctionPrecomputationUpdateErrorResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JqlFunctionPrecomputationUpdateErrorResponse(
        errorMessages: json[r'errorMessages'] is Iterable
            ? (json[r'errorMessages'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        notFoundPrecomputationIDs: json[r'notFoundPrecomputationIDs'] is Iterable
            ? (json[r'notFoundPrecomputationIDs'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<JqlFunctionPrecomputationUpdateErrorResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlFunctionPrecomputationUpdateErrorResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlFunctionPrecomputationUpdateErrorResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlFunctionPrecomputationUpdateErrorResponse> mapFromJson(dynamic json) {
    final map = <String, JqlFunctionPrecomputationUpdateErrorResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlFunctionPrecomputationUpdateErrorResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlFunctionPrecomputationUpdateErrorResponse-objects as value to a dart map
  static Map<String, List<JqlFunctionPrecomputationUpdateErrorResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlFunctionPrecomputationUpdateErrorResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlFunctionPrecomputationUpdateErrorResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

