//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowScheme {
  /// Returns a new [WorkflowScheme] instance.
  WorkflowScheme({
    this.defaultWorkflow,
    this.description,
    this.draft,
    this.id,
    this.issueTypeMappings = const {},
    this.issueTypes = const {},
    this.lastModified,
    this.lastModifiedUser,
    this.name,
    this.originalDefaultWorkflow,
    this.originalIssueTypeMappings = const {},
    this.self,
    this.updateDraftIfNeeded,
  });

  /// The name of the default workflow for the workflow scheme. The default workflow has *All Unassigned Issue Types* assigned to it in Jira. If `defaultWorkflow` is not specified when creating a workflow scheme, it is set to *Jira Workflow (jira)*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultWorkflow;

  /// The description of the workflow scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Whether the workflow scheme is a draft or not.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? draft;

  /// The ID of the workflow scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The issue type to workflow mappings, where each mapping is an issue type ID and workflow name pair. Note that an issue type can only be mapped to one workflow in a workflow scheme.
  Map<String, String> issueTypeMappings;

  /// The issue types available in Jira.
  Map<String, IssueTypeDetails> issueTypes;

  /// The date-time that the draft workflow scheme was last modified. A modification is a change to the issue type-project mappings only. This property does not apply to non-draft workflows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastModified;

  /// The user that last modified the draft workflow scheme. A modification is a change to the issue type-project mappings only. This property does not apply to non-draft workflows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? lastModifiedUser;

  /// The name of the workflow scheme. The name must be unique. The maximum length is 255 characters. Required when creating a workflow scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// For draft workflow schemes, this property is the name of the default workflow for the original workflow scheme. The default workflow has *All Unassigned Issue Types* assigned to it in Jira.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? originalDefaultWorkflow;

  /// For draft workflow schemes, this property is the issue type to workflow mappings for the original workflow scheme, where each mapping is an issue type ID and workflow name pair. Note that an issue type can only be mapped to one workflow in a workflow scheme.
  Map<String, String> originalIssueTypeMappings;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// Whether to create or update a draft workflow scheme when updating an active workflow scheme. An active workflow scheme is a workflow scheme that is used by at least one project. The following examples show how this property works:   *  Update an active workflow scheme with `updateDraftIfNeeded` set to `true`: If a draft workflow scheme exists, it is updated. Otherwise, a draft workflow scheme is created.  *  Update an active workflow scheme with `updateDraftIfNeeded` set to `false`: An error is returned, as active workflow schemes cannot be updated.  *  Update an inactive workflow scheme with `updateDraftIfNeeded` set to `true`: The workflow scheme is updated, as inactive workflow schemes do not require drafts to update.  Defaults to `false`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? updateDraftIfNeeded;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowScheme &&
    other.defaultWorkflow == defaultWorkflow &&
    other.description == description &&
    other.draft == draft &&
    other.id == id &&
    _deepEquality.equals(other.issueTypeMappings, issueTypeMappings) &&
    _deepEquality.equals(other.issueTypes, issueTypes) &&
    other.lastModified == lastModified &&
    other.lastModifiedUser == lastModifiedUser &&
    other.name == name &&
    other.originalDefaultWorkflow == originalDefaultWorkflow &&
    _deepEquality.equals(other.originalIssueTypeMappings, originalIssueTypeMappings) &&
    other.self == self &&
    other.updateDraftIfNeeded == updateDraftIfNeeded;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultWorkflow == null ? 0 : defaultWorkflow!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (draft == null ? 0 : draft!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (issueTypeMappings.hashCode) +
    (issueTypes.hashCode) +
    (lastModified == null ? 0 : lastModified!.hashCode) +
    (lastModifiedUser == null ? 0 : lastModifiedUser!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (originalDefaultWorkflow == null ? 0 : originalDefaultWorkflow!.hashCode) +
    (originalIssueTypeMappings.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (updateDraftIfNeeded == null ? 0 : updateDraftIfNeeded!.hashCode);

  @override
  String toString() => 'WorkflowScheme[defaultWorkflow=$defaultWorkflow, description=$description, draft=$draft, id=$id, issueTypeMappings=$issueTypeMappings, issueTypes=$issueTypes, lastModified=$lastModified, lastModifiedUser=$lastModifiedUser, name=$name, originalDefaultWorkflow=$originalDefaultWorkflow, originalIssueTypeMappings=$originalIssueTypeMappings, self=$self, updateDraftIfNeeded=$updateDraftIfNeeded]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultWorkflow != null) {
      json[r'defaultWorkflow'] = this.defaultWorkflow;
    } else {
      json[r'defaultWorkflow'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.draft != null) {
      json[r'draft'] = this.draft;
    } else {
      json[r'draft'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'issueTypeMappings'] = this.issueTypeMappings;
      json[r'issueTypes'] = this.issueTypes;
    if (this.lastModified != null) {
      json[r'lastModified'] = this.lastModified;
    } else {
      json[r'lastModified'] = null;
    }
    if (this.lastModifiedUser != null) {
      json[r'lastModifiedUser'] = this.lastModifiedUser;
    } else {
      json[r'lastModifiedUser'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.originalDefaultWorkflow != null) {
      json[r'originalDefaultWorkflow'] = this.originalDefaultWorkflow;
    } else {
      json[r'originalDefaultWorkflow'] = null;
    }
      json[r'originalIssueTypeMappings'] = this.originalIssueTypeMappings;
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.updateDraftIfNeeded != null) {
      json[r'updateDraftIfNeeded'] = this.updateDraftIfNeeded;
    } else {
      json[r'updateDraftIfNeeded'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowScheme] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowScheme? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowScheme(
        defaultWorkflow: mapValueOfType<String>(json, r'defaultWorkflow'),
        description: mapValueOfType<String>(json, r'description'),
        draft: mapValueOfType<bool>(json, r'draft'),
        id: mapValueOfType<int>(json, r'id'),
        issueTypeMappings: mapCastOfType<String, String>(json, r'issueTypeMappings') ?? const {},
        issueTypes: IssueTypeDetails.mapFromJson(json[r'issueTypes']),
        lastModified: mapValueOfType<String>(json, r'lastModified'),
        lastModifiedUser: User.fromJson(json[r'lastModifiedUser']),
        name: mapValueOfType<String>(json, r'name'),
        originalDefaultWorkflow: mapValueOfType<String>(json, r'originalDefaultWorkflow'),
        originalIssueTypeMappings: mapCastOfType<String, String>(json, r'originalIssueTypeMappings') ?? const {},
        self: mapValueOfType<String>(json, r'self'),
        updateDraftIfNeeded: mapValueOfType<bool>(json, r'updateDraftIfNeeded'),
      );
    }
    return null;
  }

  static List<WorkflowScheme> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowScheme>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowScheme.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowScheme> mapFromJson(dynamic json) {
    final map = <String, WorkflowScheme>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowScheme.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowScheme-objects as value to a dart map
  static Map<String, List<WorkflowScheme>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowScheme>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowScheme.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

