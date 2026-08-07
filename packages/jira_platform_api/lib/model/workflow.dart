//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Workflow {
  /// Returns a new [Workflow] instance.
  Workflow({
    this.created,
    required this.description,
    this.hasDraftWorkflow,
    required this.id,
    this.isDefault,
    this.operations,
    this.projects = const [],
    this.schemes = const [],
    this.statuses = const [],
    this.transitions = const [],
    this.updated,
  });

  /// The creation date of the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  /// The description of the workflow.
  String description;

  /// Whether the workflow has a draft version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hasDraftWorkflow;

  PublishedWorkflowId id;

  /// Whether this is the default workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDefault;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowOperations? operations;

  /// The projects the workflow is assigned to, through workflow schemes.
  List<ProjectDetails> projects;

  /// The workflow schemes the workflow is assigned to.
  List<WorkflowSchemeIdName> schemes;

  /// The statuses of the workflow.
  List<WorkflowStatus> statuses;

  /// The transitions of the workflow.
  List<Transition> transitions;

  /// The last edited date of the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updated;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Workflow &&
    other.created == created &&
    other.description == description &&
    other.hasDraftWorkflow == hasDraftWorkflow &&
    other.id == id &&
    other.isDefault == isDefault &&
    other.operations == operations &&
    _deepEquality.equals(other.projects, projects) &&
    _deepEquality.equals(other.schemes, schemes) &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.transitions, transitions) &&
    other.updated == updated;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (description.hashCode) +
    (hasDraftWorkflow == null ? 0 : hasDraftWorkflow!.hashCode) +
    (id.hashCode) +
    (isDefault == null ? 0 : isDefault!.hashCode) +
    (operations == null ? 0 : operations!.hashCode) +
    (projects.hashCode) +
    (schemes.hashCode) +
    (statuses.hashCode) +
    (transitions.hashCode) +
    (updated == null ? 0 : updated!.hashCode);

  @override
  String toString() => 'Workflow[created=$created, description=$description, hasDraftWorkflow=$hasDraftWorkflow, id=$id, isDefault=$isDefault, operations=$operations, projects=$projects, schemes=$schemes, statuses=$statuses, transitions=$transitions, updated=$updated]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
      json[r'description'] = this.description;
    if (this.hasDraftWorkflow != null) {
      json[r'hasDraftWorkflow'] = this.hasDraftWorkflow;
    } else {
      json[r'hasDraftWorkflow'] = null;
    }
      json[r'id'] = this.id;
    if (this.isDefault != null) {
      json[r'isDefault'] = this.isDefault;
    } else {
      json[r'isDefault'] = null;
    }
    if (this.operations != null) {
      json[r'operations'] = this.operations;
    } else {
      json[r'operations'] = null;
    }
      json[r'projects'] = this.projects;
      json[r'schemes'] = this.schemes;
      json[r'statuses'] = this.statuses;
      json[r'transitions'] = this.transitions;
    if (this.updated != null) {
      json[r'updated'] = this.updated!.toUtc().toIso8601String();
    } else {
      json[r'updated'] = null;
    }
    return json;
  }

  /// Returns a new [Workflow] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Workflow? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'description'), 'Required key "Workflow[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "Workflow[description]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "Workflow[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Workflow[id]" has a null value in JSON.');
        return true;
      }());

      return Workflow(
        created: mapDateTime(json, r'created', r''),
        description: mapValueOfType<String>(json, r'description')!,
        hasDraftWorkflow: mapValueOfType<bool>(json, r'hasDraftWorkflow'),
        id: PublishedWorkflowId.fromJson(json[r'id'])!,
        isDefault: mapValueOfType<bool>(json, r'isDefault'),
        operations: WorkflowOperations.fromJson(json[r'operations']),
        projects: ProjectDetails.listFromJson(json[r'projects']),
        schemes: WorkflowSchemeIdName.listFromJson(json[r'schemes']),
        statuses: WorkflowStatus.listFromJson(json[r'statuses']),
        transitions: Transition.listFromJson(json[r'transitions']),
        updated: mapDateTime(json, r'updated', r''),
      );
    }
    return null;
  }

  static List<Workflow> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Workflow>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Workflow.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Workflow> mapFromJson(dynamic json) {
    final map = <String, Workflow>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Workflow.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Workflow-objects as value to a dart map
  static Map<String, List<Workflow>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Workflow>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Workflow.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'id',
  };
}

