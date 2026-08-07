//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowDocumentDTO {
  /// Returns a new [WorkflowDocumentDTO] instance.
  WorkflowDocumentDTO({
    this.created,
    this.description,
    this.id,
    this.lastUpdateAuthorAAID,
    this.loopedTransitionContainerLayout,
    this.name,
    this.scope,
    this.startPointLayout,
    this.statuses = const [],
    this.transitions = const [],
    this.updated,
    this.version,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? created;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

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
  String? lastUpdateAuthorAAID;

  WorkflowLayout? loopedTransitionContainerLayout;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowScope? scope;

  WorkflowLayout? startPointLayout;

  List<WorkflowReferenceStatus> statuses;

  List<WorkflowTransitions> transitions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updated;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DocumentVersion? version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowDocumentDTO &&
    other.created == created &&
    other.description == description &&
    other.id == id &&
    other.lastUpdateAuthorAAID == lastUpdateAuthorAAID &&
    other.loopedTransitionContainerLayout == loopedTransitionContainerLayout &&
    other.name == name &&
    other.scope == scope &&
    other.startPointLayout == startPointLayout &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.transitions, transitions) &&
    other.updated == updated &&
    other.version == version;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (lastUpdateAuthorAAID == null ? 0 : lastUpdateAuthorAAID!.hashCode) +
    (loopedTransitionContainerLayout == null ? 0 : loopedTransitionContainerLayout!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (startPointLayout == null ? 0 : startPointLayout!.hashCode) +
    (statuses.hashCode) +
    (transitions.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (version == null ? 0 : version!.hashCode);

  @override
  String toString() => 'WorkflowDocumentDTO[created=$created, description=$description, id=$id, lastUpdateAuthorAAID=$lastUpdateAuthorAAID, loopedTransitionContainerLayout=$loopedTransitionContainerLayout, name=$name, scope=$scope, startPointLayout=$startPointLayout, statuses=$statuses, transitions=$transitions, updated=$updated, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.created != null) {
      json[r'created'] = this.created;
    } else {
      json[r'created'] = null;
    }
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
    if (this.lastUpdateAuthorAAID != null) {
      json[r'lastUpdateAuthorAAID'] = this.lastUpdateAuthorAAID;
    } else {
      json[r'lastUpdateAuthorAAID'] = null;
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
    if (this.updated != null) {
      json[r'updated'] = this.updated;
    } else {
      json[r'updated'] = null;
    }
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowDocumentDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowDocumentDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowDocumentDTO(
        created: mapValueOfType<String>(json, r'created'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        lastUpdateAuthorAAID: mapValueOfType<String>(json, r'lastUpdateAuthorAAID'),
        loopedTransitionContainerLayout: WorkflowLayout.fromJson(json[r'loopedTransitionContainerLayout']),
        name: mapValueOfType<String>(json, r'name'),
        scope: WorkflowScope.fromJson(json[r'scope']),
        startPointLayout: WorkflowLayout.fromJson(json[r'startPointLayout']),
        statuses: WorkflowReferenceStatus.listFromJson(json[r'statuses']),
        transitions: WorkflowTransitions.listFromJson(json[r'transitions']),
        updated: mapValueOfType<String>(json, r'updated'),
        version: DocumentVersion.fromJson(json[r'version']),
      );
    }
    return null;
  }

  static List<WorkflowDocumentDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowDocumentDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowDocumentDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowDocumentDTO> mapFromJson(dynamic json) {
    final map = <String, WorkflowDocumentDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowDocumentDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowDocumentDTO-objects as value to a dart map
  static Map<String, List<WorkflowDocumentDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowDocumentDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowDocumentDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

