//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkOperationErrorResponse {
  /// Returns a new [BulkOperationErrorResponse] instance.
  BulkOperationErrorResponse({
    this.errors = const [],
  });

  List<ErrorMessage> errors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkOperationErrorResponse &&
    _deepEquality.equals(other.errors, errors);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errors.hashCode);

  @override
  String toString() => 'BulkOperationErrorResponse[errors=$errors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errors'] = this.errors;
    return json;
  }

  /// Returns a new [BulkOperationErrorResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkOperationErrorResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkOperationErrorResponse(
        errors: ErrorMessage.listFromJson(json[r'errors']),
      );
    }
    return null;
  }

  static List<BulkOperationErrorResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkOperationErrorResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkOperationErrorResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkOperationErrorResponse> mapFromJson(dynamic json) {
    final map = <String, BulkOperationErrorResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkOperationErrorResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkOperationErrorResponse-objects as value to a dart map
  static Map<String, List<BulkOperationErrorResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkOperationErrorResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkOperationErrorResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

