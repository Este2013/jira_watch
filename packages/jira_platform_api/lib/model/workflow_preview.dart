//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowPreview {
  /// Returns a new [WorkflowPreview] instance.
  WorkflowPreview({
    this.description,
    this.id,
    this.loopedTransitionContainerLayout,
    this.name,
    this.queryContext = const [],
    this.scope,
    this.startPointLayout,
    this.statuses = const [],
    this.transitions = const [],
    this.version,
  });

  /// The description of the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowPreviewLayout? loopedTransitionContainerLayout;

  /// The name of the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The project and issue type context for this workflow query.
  List<ProjectIssueTypeQueryContext> queryContext;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowPreviewScope? scope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowPreviewLayout? startPointLayout;

  /// The statuses referenced in this workflow.
  List<WorkflowPreviewStatus> statuses;

  /// The transitions of the workflow.
  List<TransitionPreview> transitions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowDocumentVersionBean? version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowPreview &&
    other.description == description &&
    other.id == id &&
    other.loopedTransitionContainerLayout == loopedTransitionContainerLayout &&
    other.name == name &&
    _deepEquality.equals(other.queryContext, queryContext) &&
    other.scope == scope &&
    other.startPointLayout == startPointLayout &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.transitions, transitions) &&
    other.version == version;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (loopedTransitionContainerLayout == null ? 0 : loopedTransitionContainerLayout!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (queryContext.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (startPointLayout == null ? 0 : startPointLayout!.hashCode) +
    (statuses.hashCode) +
    (transitions.hashCode) +
    (version == null ? 0 : version!.hashCode);

  @override
  String toString() => 'WorkflowPreview[description=$description, id=$id, loopedTransitionContainerLayout=$loopedTransitionContainerLayout, name=$name, queryContext=$queryContext, scope=$scope, startPointLayout=$startPointLayout, statuses=$statuses, transitions=$transitions, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.loopedTransitionContainerLayout != null) {
      json[r'loopedTransitionContainerLayout'] = this.loopedTransitionContainerLayout;
    } else {
      json[r'loopedTransitionContainerLayout'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'queryContext'] = this.queryContext;
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.startPointLayout != null) {
      json[r'startPointLayout'] = this.startPointLayout;
    } else {
      json[r'startPointLayout'] = null;
    }
      json[r'statuses'] = this.statuses;
      json[r'transitions'] = this.transitions;
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowPreview] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowPreview? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowPreview(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        loopedTransitionContainerLayout: WorkflowPreviewLayout.fromJson(json[r'loopedTransitionContainerLayout']),
        name: mapValueOfType<String>(json, r'name'),
        queryContext: ProjectIssueTypeQueryContext.listFromJson(json[r'queryContext']),
        scope: WorkflowPreviewScope.fromJson(json[r'scope']),
        startPointLayout: WorkflowPreviewLayout.fromJson(json[r'startPointLayout']),
        statuses: WorkflowPreviewStatus.listFromJson(json[r'statuses']),
        transitions: TransitionPreview.listFromJson(json[r'transitions']),
        version: WorkflowDocumentVersionBean.fromJson(json[r'version']),
      );
    }
    return null;
  }

  static List<WorkflowPreview> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowPreview>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowPreview.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowPreview> mapFromJson(dynamic json) {
    final map = <String, WorkflowPreview>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowPreview.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowPreview-objects as value to a dart map
  static Map<String, List<WorkflowPreview>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowPreview>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowPreview.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

