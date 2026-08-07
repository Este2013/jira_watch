//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBulkTransitionForWorkflow {
  /// Returns a new [IssueBulkTransitionForWorkflow] instance.
  IssueBulkTransitionForWorkflow({
    this.isTransitionsFiltered,
    this.issues = const [],
    this.transitions = const [],
  });

  /// Indicates whether all the transitions of this workflow are available in the transitions list or not.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isTransitionsFiltered;

  /// List of issue keys from the request which are associated with this workflow.
  List<String> issues;

  /// List of transitions available for issues from the request which are associated with this workflow.   **This list includes only those transitions that are common across the issues in this workflow and do not involve any additional field updates.** 
  List<SimplifiedIssueTransition> transitions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBulkTransitionForWorkflow &&
    other.isTransitionsFiltered == isTransitionsFiltered &&
    _deepEquality.equals(other.issues, issues) &&
    _deepEquality.equals(other.transitions, transitions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isTransitionsFiltered == null ? 0 : isTransitionsFiltered!.hashCode) +
    (issues.hashCode) +
    (transitions.hashCode);

  @override
  String toString() => 'IssueBulkTransitionForWorkflow[isTransitionsFiltered=$isTransitionsFiltered, issues=$issues, transitions=$transitions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.isTransitionsFiltered != null) {
      json[r'isTransitionsFiltered'] = this.isTransitionsFiltered;
    } else {
      json[r'isTransitionsFiltered'] = null;
    }
      json[r'issues'] = this.issues;
      json[r'transitions'] = this.transitions;
    return json;
  }

  /// Returns a new [IssueBulkTransitionForWorkflow] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBulkTransitionForWorkflow? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueBulkTransitionForWorkflow(
        isTransitionsFiltered: mapValueOfType<bool>(json, r'isTransitionsFiltered'),
        issues: json[r'issues'] is Iterable
            ? (json[r'issues'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        transitions: SimplifiedIssueTransition.listFromJson(json[r'transitions']),
      );
    }
    return null;
  }

  static List<IssueBulkTransitionForWorkflow> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBulkTransitionForWorkflow>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBulkTransitionForWorkflow.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBulkTransitionForWorkflow> mapFromJson(dynamic json) {
    final map = <String, IssueBulkTransitionForWorkflow>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBulkTransitionForWorkflow.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBulkTransitionForWorkflow-objects as value to a dart map
  static Map<String, List<IssueBulkTransitionForWorkflow>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBulkTransitionForWorkflow>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBulkTransitionForWorkflow.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

