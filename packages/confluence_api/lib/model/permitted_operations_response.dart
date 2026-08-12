//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PermittedOperationsResponse {
  /// Returns a new [PermittedOperationsResponse] instance.
  PermittedOperationsResponse({
    this.operations = const [],
  });

  List<Operation> operations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PermittedOperationsResponse &&
    _deepEquality.equals(other.operations, operations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (operations.hashCode);

  @override
  String toString() => 'PermittedOperationsResponse[operations=$operations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'operations'] = this.operations;
    return json;
  }

  /// Returns a new [PermittedOperationsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PermittedOperationsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PermittedOperationsResponse(
        operations: Operation.listFromJson(json[r'operations']),
      );
    }
    return null;
  }

  static List<PermittedOperationsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PermittedOperationsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermittedOperationsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PermittedOperationsResponse> mapFromJson(dynamic json) {
    final map = <String, PermittedOperationsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PermittedOperationsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PermittedOperationsResponse-objects as value to a dart map
  static Map<String, List<PermittedOperationsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PermittedOperationsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PermittedOperationsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

