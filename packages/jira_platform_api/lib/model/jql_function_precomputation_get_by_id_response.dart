//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlFunctionPrecomputationGetByIdResponse {
  /// Returns a new [JqlFunctionPrecomputationGetByIdResponse] instance.
  JqlFunctionPrecomputationGetByIdResponse({
    this.notFoundPrecomputationIDs = const [],
    this.precomputations = const [],
  });

  /// List of precomputations that were not found.
  List<String> notFoundPrecomputationIDs;

  /// The list of precomputations.
  List<JqlFunctionPrecomputationBean> precomputations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlFunctionPrecomputationGetByIdResponse &&
    _deepEquality.equals(other.notFoundPrecomputationIDs, notFoundPrecomputationIDs) &&
    _deepEquality.equals(other.precomputations, precomputations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (notFoundPrecomputationIDs.hashCode) +
    (precomputations.hashCode);

  @override
  String toString() => 'JqlFunctionPrecomputationGetByIdResponse[notFoundPrecomputationIDs=$notFoundPrecomputationIDs, precomputations=$precomputations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'notFoundPrecomputationIDs'] = this.notFoundPrecomputationIDs;
      json[r'precomputations'] = this.precomputations;
    return json;
  }

  /// Returns a new [JqlFunctionPrecomputationGetByIdResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlFunctionPrecomputationGetByIdResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JqlFunctionPrecomputationGetByIdResponse(
        notFoundPrecomputationIDs: json[r'notFoundPrecomputationIDs'] is Iterable
            ? (json[r'notFoundPrecomputationIDs'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        precomputations: JqlFunctionPrecomputationBean.listFromJson(json[r'precomputations']),
      );
    }
    return null;
  }

  static List<JqlFunctionPrecomputationGetByIdResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlFunctionPrecomputationGetByIdResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlFunctionPrecomputationGetByIdResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlFunctionPrecomputationGetByIdResponse> mapFromJson(dynamic json) {
    final map = <String, JqlFunctionPrecomputationGetByIdResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlFunctionPrecomputationGetByIdResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlFunctionPrecomputationGetByIdResponse-objects as value to a dart map
  static Map<String, List<JqlFunctionPrecomputationGetByIdResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlFunctionPrecomputationGetByIdResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlFunctionPrecomputationGetByIdResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

