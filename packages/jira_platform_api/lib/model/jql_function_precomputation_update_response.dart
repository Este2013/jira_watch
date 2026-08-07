//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlFunctionPrecomputationUpdateResponse {
  /// Returns a new [JqlFunctionPrecomputationUpdateResponse] instance.
  JqlFunctionPrecomputationUpdateResponse({
    this.notFoundPrecomputationIDs = const [],
  });

  /// List of precomputations that were not found and skipped. Only returned if the request passed skipNotFoundPrecomputations=true.
  List<String> notFoundPrecomputationIDs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlFunctionPrecomputationUpdateResponse &&
    _deepEquality.equals(other.notFoundPrecomputationIDs, notFoundPrecomputationIDs);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (notFoundPrecomputationIDs.hashCode);

  @override
  String toString() => 'JqlFunctionPrecomputationUpdateResponse[notFoundPrecomputationIDs=$notFoundPrecomputationIDs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'notFoundPrecomputationIDs'] = this.notFoundPrecomputationIDs;
    return json;
  }

  /// Returns a new [JqlFunctionPrecomputationUpdateResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlFunctionPrecomputationUpdateResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JqlFunctionPrecomputationUpdateResponse(
        notFoundPrecomputationIDs: json[r'notFoundPrecomputationIDs'] is Iterable
            ? (json[r'notFoundPrecomputationIDs'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<JqlFunctionPrecomputationUpdateResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlFunctionPrecomputationUpdateResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlFunctionPrecomputationUpdateResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlFunctionPrecomputationUpdateResponse> mapFromJson(dynamic json) {
    final map = <String, JqlFunctionPrecomputationUpdateResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlFunctionPrecomputationUpdateResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlFunctionPrecomputationUpdateResponse-objects as value to a dart map
  static Map<String, List<JqlFunctionPrecomputationUpdateResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlFunctionPrecomputationUpdateResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlFunctionPrecomputationUpdateResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

