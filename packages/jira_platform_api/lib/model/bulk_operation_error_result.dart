//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkOperationErrorResult {
  /// Returns a new [BulkOperationErrorResult] instance.
  BulkOperationErrorResult({
    this.elementErrors,
    this.failedElementNumber,
    this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ErrorCollection? elementErrors;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failedElementNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkOperationErrorResult &&
    other.elementErrors == elementErrors &&
    other.failedElementNumber == failedElementNumber &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (elementErrors == null ? 0 : elementErrors!.hashCode) +
    (failedElementNumber == null ? 0 : failedElementNumber!.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'BulkOperationErrorResult[elementErrors=$elementErrors, failedElementNumber=$failedElementNumber, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.elementErrors != null) {
      json[r'elementErrors'] = this.elementErrors;
    } else {
      json[r'elementErrors'] = null;
    }
    if (this.failedElementNumber != null) {
      json[r'failedElementNumber'] = this.failedElementNumber;
    } else {
      json[r'failedElementNumber'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [BulkOperationErrorResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkOperationErrorResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkOperationErrorResult(
        elementErrors: ErrorCollection.fromJson(json[r'elementErrors']),
        failedElementNumber: mapValueOfType<int>(json, r'failedElementNumber'),
        status: mapValueOfType<int>(json, r'status'),
      );
    }
    return null;
  }

  static List<BulkOperationErrorResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkOperationErrorResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkOperationErrorResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkOperationErrorResult> mapFromJson(dynamic json) {
    final map = <String, BulkOperationErrorResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkOperationErrorResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkOperationErrorResult-objects as value to a dart map
  static Map<String, List<BulkOperationErrorResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkOperationErrorResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkOperationErrorResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

