//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultWorkflow {
  /// Returns a new [DefaultWorkflow] instance.
  DefaultWorkflow({
    this.updateDraftIfNeeded,
    required this.workflow,
  });

  /// Whether a draft workflow scheme is created or updated when updating an active workflow scheme. The draft is updated with the new default workflow. Defaults to `false`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? updateDraftIfNeeded;

  /// The name of the workflow to set as the default workflow.
  String workflow;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DefaultWorkflow &&
    other.updateDraftIfNeeded == updateDraftIfNeeded &&
    other.workflow == workflow;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (updateDraftIfNeeded == null ? 0 : updateDraftIfNeeded!.hashCode) +
    (workflow.hashCode);

  @override
  String toString() => 'DefaultWorkflow[updateDraftIfNeeded=$updateDraftIfNeeded, workflow=$workflow]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.updateDraftIfNeeded != null) {
      json[r'updateDraftIfNeeded'] = this.updateDraftIfNeeded;
    } else {
      json[r'updateDraftIfNeeded'] = null;
    }
      json[r'workflow'] = this.workflow;
    return json;
  }

  /// Returns a new [DefaultWorkflow] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DefaultWorkflow? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'workflow'), 'Required key "DefaultWorkflow[workflow]" is missing from JSON.');
        assert(json[r'workflow'] != null, 'Required key "DefaultWorkflow[workflow]" has a null value in JSON.');
        return true;
      }());

      return DefaultWorkflow(
        updateDraftIfNeeded: mapValueOfType<bool>(json, r'updateDraftIfNeeded'),
        workflow: mapValueOfType<String>(json, r'workflow')!,
      );
    }
    return null;
  }

  static List<DefaultWorkflow> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DefaultWorkflow>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DefaultWorkflow.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DefaultWorkflow> mapFromJson(dynamic json) {
    final map = <String, DefaultWorkflow>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DefaultWorkflow.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DefaultWorkflow-objects as value to a dart map
  static Map<String, List<DefaultWorkflow>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DefaultWorkflow>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DefaultWorkflow.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workflow',
  };
}

