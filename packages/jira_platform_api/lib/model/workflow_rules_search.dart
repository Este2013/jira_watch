//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowRulesSearch {
  /// Returns a new [WorkflowRulesSearch] instance.
  WorkflowRulesSearch({
    this.expand,
    this.ruleIds = const [],
    required this.workflowEntityId,
  });

  /// Use expand to include additional information in the response. This parameter accepts `transition` which, for each rule, returns information about the transition the rule is assigned to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// The list of workflow rule IDs.
  List<String> ruleIds;

  /// The workflow ID.
  String workflowEntityId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowRulesSearch &&
    other.expand == expand &&
    _deepEquality.equals(other.ruleIds, ruleIds) &&
    other.workflowEntityId == workflowEntityId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expand == null ? 0 : expand!.hashCode) +
    (ruleIds.hashCode) +
    (workflowEntityId.hashCode);

  @override
  String toString() => 'WorkflowRulesSearch[expand=$expand, ruleIds=$ruleIds, workflowEntityId=$workflowEntityId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
      json[r'ruleIds'] = this.ruleIds;
      json[r'workflowEntityId'] = this.workflowEntityId;
    return json;
  }

  /// Returns a new [WorkflowRulesSearch] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowRulesSearch? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'ruleIds'), 'Required key "WorkflowRulesSearch[ruleIds]" is missing from JSON.');
        assert(json[r'ruleIds'] != null, 'Required key "WorkflowRulesSearch[ruleIds]" has a null value in JSON.');
        assert(json.containsKey(r'workflowEntityId'), 'Required key "WorkflowRulesSearch[workflowEntityId]" is missing from JSON.');
        assert(json[r'workflowEntityId'] != null, 'Required key "WorkflowRulesSearch[workflowEntityId]" has a null value in JSON.');
        return true;
      }());

      return WorkflowRulesSearch(
        expand: mapValueOfType<String>(json, r'expand'),
        ruleIds: json[r'ruleIds'] is Iterable
            ? (json[r'ruleIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        workflowEntityId: mapValueOfType<String>(json, r'workflowEntityId')!,
      );
    }
    return null;
  }

  static List<WorkflowRulesSearch> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowRulesSearch>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowRulesSearch.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowRulesSearch> mapFromJson(dynamic json) {
    final map = <String, WorkflowRulesSearch>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowRulesSearch.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowRulesSearch-objects as value to a dart map
  static Map<String, List<WorkflowRulesSearch>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowRulesSearch>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowRulesSearch.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'ruleIds',
    'workflowEntityId',
  };
}

