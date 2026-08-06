//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowCreate {
  /// Returns a new [WorkflowCreate] instance.
  WorkflowCreate({
    this.description,
    this.loopedTransitionContainerLayout,
    required this.name,
    this.startPointLayout,
    this.statuses = const [],
    this.transitions = const [],
  });

  /// The description of the workflow to create.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  WorkflowLayout? loopedTransitionContainerLayout;

  /// The name of the workflow to create.
  String name;

  WorkflowLayout? startPointLayout;

  /// The statuses associated with this workflow.
  List<StatusLayoutUpdate> statuses;

  /// The transitions of this workflow.
  List<TransitionUpdateDTO> transitions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowCreate &&
    other.description == description &&
    other.loopedTransitionContainerLayout == loopedTransitionContainerLayout &&
    other.name == name &&
    other.startPointLayout == startPointLayout &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.transitions, transitions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (loopedTransitionContainerLayout == null ? 0 : loopedTransitionContainerLayout!.hashCode) +
    (name.hashCode) +
    (startPointLayout == null ? 0 : startPointLayout!.hashCode) +
    (statuses.hashCode) +
    (transitions.hashCode);

  @override
  String toString() => 'WorkflowCreate[description=$description, loopedTransitionContainerLayout=$loopedTransitionContainerLayout, name=$name, startPointLayout=$startPointLayout, statuses=$statuses, transitions=$transitions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.loopedTransitionContainerLayout != null) {
      json[r'loopedTransitionContainerLayout'] = this.loopedTransitionContainerLayout;
    } else {
      json[r'loopedTransitionContainerLayout'] = null;
    }
      json[r'name'] = this.name;
    if (this.startPointLayout != null) {
      json[r'startPointLayout'] = this.startPointLayout;
    } else {
      json[r'startPointLayout'] = null;
    }
      json[r'statuses'] = this.statuses;
      json[r'transitions'] = this.transitions;
    return json;
  }

  /// Returns a new [WorkflowCreate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowCreate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "WorkflowCreate[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "WorkflowCreate[name]" has a null value in JSON.');
        assert(json.containsKey(r'statuses'), 'Required key "WorkflowCreate[statuses]" is missing from JSON.');
        assert(json[r'statuses'] != null, 'Required key "WorkflowCreate[statuses]" has a null value in JSON.');
        assert(json.containsKey(r'transitions'), 'Required key "WorkflowCreate[transitions]" is missing from JSON.');
        assert(json[r'transitions'] != null, 'Required key "WorkflowCreate[transitions]" has a null value in JSON.');
        return true;
      }());

      return WorkflowCreate(
        description: mapValueOfType<String>(json, r'description'),
        loopedTransitionContainerLayout: WorkflowLayout.fromJson(json[r'loopedTransitionContainerLayout']),
        name: mapValueOfType<String>(json, r'name')!,
        startPointLayout: WorkflowLayout.fromJson(json[r'startPointLayout']),
        statuses: StatusLayoutUpdate.listFromJson(json[r'statuses']),
        transitions: TransitionUpdateDTO.listFromJson(json[r'transitions']),
      );
    }
    return null;
  }

  static List<WorkflowCreate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCreate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCreate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowCreate> mapFromJson(dynamic json) {
    final map = <String, WorkflowCreate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowCreate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowCreate-objects as value to a dart map
  static Map<String, List<WorkflowCreate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowCreate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowCreate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'statuses',
    'transitions',
  };
}

