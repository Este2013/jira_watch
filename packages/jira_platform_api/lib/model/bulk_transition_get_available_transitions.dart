//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionGetAvailableTransitions {
  /// Returns a new [BulkTransitionGetAvailableTransitions] instance.
  BulkTransitionGetAvailableTransitions({
    this.availableTransitions = const [],
    this.endingBefore,
    this.startingAfter,
  });

  /// List of available transitions for bulk transition operation for requested issues grouped by workflow
  List<IssueBulkTransitionForWorkflow> availableTransitions;

  /// The end cursor for use in pagination.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? endingBefore;

  /// The start cursor for use in pagination.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? startingAfter;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionGetAvailableTransitions &&
    _deepEquality.equals(other.availableTransitions, availableTransitions) &&
    other.endingBefore == endingBefore &&
    other.startingAfter == startingAfter;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (availableTransitions.hashCode) +
    (endingBefore == null ? 0 : endingBefore!.hashCode) +
    (startingAfter == null ? 0 : startingAfter!.hashCode);

  @override
  String toString() => 'BulkTransitionGetAvailableTransitions[availableTransitions=$availableTransitions, endingBefore=$endingBefore, startingAfter=$startingAfter]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'availableTransitions'] = this.availableTransitions;
    if (this.endingBefore != null) {
      json[r'endingBefore'] = this.endingBefore;
    } else {
      json[r'endingBefore'] = null;
    }
    if (this.startingAfter != null) {
      json[r'startingAfter'] = this.startingAfter;
    } else {
      json[r'startingAfter'] = null;
    }
    return json;
  }

  /// Returns a new [BulkTransitionGetAvailableTransitions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionGetAvailableTransitions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkTransitionGetAvailableTransitions(
        availableTransitions: IssueBulkTransitionForWorkflow.listFromJson(json[r'availableTransitions']),
        endingBefore: mapValueOfType<String>(json, r'endingBefore'),
        startingAfter: mapValueOfType<String>(json, r'startingAfter'),
      );
    }
    return null;
  }

  static List<BulkTransitionGetAvailableTransitions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionGetAvailableTransitions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionGetAvailableTransitions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionGetAvailableTransitions> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionGetAvailableTransitions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionGetAvailableTransitions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionGetAvailableTransitions-objects as value to a dart map
  static Map<String, List<BulkTransitionGetAvailableTransitions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionGetAvailableTransitions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionGetAvailableTransitions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

