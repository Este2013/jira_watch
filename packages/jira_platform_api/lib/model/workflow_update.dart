//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowUpdate {
  /// Returns a new [WorkflowUpdate] instance.
  WorkflowUpdate({
    this.defaultStatusMappings = const [],
    this.description,
    required this.id,
    this.loopedTransitionContainerLayout,
    this.startPointLayout,
    this.statusMappings = const [],
    this.statuses = const [],
    this.transitions = const [],
    required this.version,
  });

  /// The mapping of old to new status ID.
  List<StatusMigration> defaultStatusMappings;

  /// The new description for this workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of this workflow.
  String id;

  WorkflowLayout? loopedTransitionContainerLayout;

  WorkflowLayout? startPointLayout;

  /// The mapping of old to new status ID for a specific project and issue type.
  List<StatusMappingDTO> statusMappings;

  /// The statuses associated with this workflow.
  List<StatusLayoutUpdate> statuses;

  /// The transitions of this workflow.
  List<TransitionUpdateDTO> transitions;

  DocumentVersion version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowUpdate &&
    _deepEquality.equals(other.defaultStatusMappings, defaultStatusMappings) &&
    other.description == description &&
    other.id == id &&
    other.loopedTransitionContainerLayout == loopedTransitionContainerLayout &&
    other.startPointLayout == startPointLayout &&
    _deepEquality.equals(other.statusMappings, statusMappings) &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.transitions, transitions) &&
    other.version == version;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultStatusMappings.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (loopedTransitionContainerLayout == null ? 0 : loopedTransitionContainerLayout!.hashCode) +
    (startPointLayout == null ? 0 : startPointLayout!.hashCode) +
    (statusMappings.hashCode) +
    (statuses.hashCode) +
    (transitions.hashCode) +
    (version.hashCode);

  @override
  String toString() => 'WorkflowUpdate[defaultStatusMappings=$defaultStatusMappings, description=$description, id=$id, loopedTransitionContainerLayout=$loopedTransitionContainerLayout, startPointLayout=$startPointLayout, statusMappings=$statusMappings, statuses=$statuses, transitions=$transitions, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'defaultStatusMappings'] = this.defaultStatusMappings;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
    if (this.loopedTransitionContainerLayout != null) {
      json[r'loopedTransitionContainerLayout'] = this.loopedTransitionContainerLayout;
    } else {
      json[r'loopedTransitionContainerLayout'] = null;
    }
    if (this.startPointLayout != null) {
      json[r'startPointLayout'] = this.startPointLayout;
    } else {
      json[r'startPointLayout'] = null;
    }
      json[r'statusMappings'] = this.statusMappings;
      json[r'statuses'] = this.statuses;
      json[r'transitions'] = this.transitions;
      json[r'version'] = this.version;
    return json;
  }

  /// Returns a new [WorkflowUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "WorkflowUpdate[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "WorkflowUpdate[id]" has a null value in JSON.');
        assert(json.containsKey(r'statuses'), 'Required key "WorkflowUpdate[statuses]" is missing from JSON.');
        assert(json[r'statuses'] != null, 'Required key "WorkflowUpdate[statuses]" has a null value in JSON.');
        assert(json.containsKey(r'transitions'), 'Required key "WorkflowUpdate[transitions]" is missing from JSON.');
        assert(json[r'transitions'] != null, 'Required key "WorkflowUpdate[transitions]" has a null value in JSON.');
        assert(json.containsKey(r'version'), 'Required key "WorkflowUpdate[version]" is missing from JSON.');
        assert(json[r'version'] != null, 'Required key "WorkflowUpdate[version]" has a null value in JSON.');
        return true;
      }());

      return WorkflowUpdate(
        defaultStatusMappings: StatusMigration.listFromJson(json[r'defaultStatusMappings']),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        loopedTransitionContainerLayout: WorkflowLayout.fromJson(json[r'loopedTransitionContainerLayout']),
        startPointLayout: WorkflowLayout.fromJson(json[r'startPointLayout']),
        statusMappings: StatusMappingDTO.listFromJson(json[r'statusMappings']),
        statuses: StatusLayoutUpdate.listFromJson(json[r'statuses']),
        transitions: TransitionUpdateDTO.listFromJson(json[r'transitions']),
        version: DocumentVersion.fromJson(json[r'version'])!,
      );
    }
    return null;
  }

  static List<WorkflowUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowUpdate> mapFromJson(dynamic json) {
    final map = <String, WorkflowUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowUpdate-objects as value to a dart map
  static Map<String, List<WorkflowUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'statuses',
    'transitions',
    'version',
  };
}

