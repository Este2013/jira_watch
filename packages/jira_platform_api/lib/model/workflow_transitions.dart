//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTransitions {
  /// Returns a new [WorkflowTransitions] instance.
  WorkflowTransitions({
    this.actions = const [],
    this.conditions,
    this.customIssueEventId,
    this.description,
    this.id,
    this.links = const [],
    this.name,
    this.properties = const {},
    this.toStatusReference,
    this.transitionScreen,
    this.triggers = const [],
    this.type,
    this.validators = const [],
  });

  /// The post-functions of the transition.
  List<WorkflowRuleConfiguration> actions;

  ConditionGroupConfiguration? conditions;

  /// The custom event ID of the transition.
  String? customIssueEventId;

  /// The description of the transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The statuses the transition can start from, and the mapping of ports between the statuses.
  List<WorkflowTransitionLinks> links;

  /// The name of the transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The properties of the transition.
  Map<String, String> properties;

  /// The status the transition goes to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? toStatusReference;

  WorkflowRuleConfiguration? transitionScreen;

  /// The triggers of the transition.
  List<WorkflowTrigger> triggers;

  /// The transition type.
  WorkflowTransitionsTypeEnum? type;

  /// The validators of the transition.
  List<WorkflowRuleConfiguration> validators;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTransitions &&
    _deepEquality.equals(other.actions, actions) &&
    other.conditions == conditions &&
    other.customIssueEventId == customIssueEventId &&
    other.description == description &&
    other.id == id &&
    _deepEquality.equals(other.links, links) &&
    other.name == name &&
    _deepEquality.equals(other.properties, properties) &&
    other.toStatusReference == toStatusReference &&
    other.transitionScreen == transitionScreen &&
    _deepEquality.equals(other.triggers, triggers) &&
    other.type == type &&
    _deepEquality.equals(other.validators, validators);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (actions.hashCode) +
    (conditions == null ? 0 : conditions!.hashCode) +
    (customIssueEventId == null ? 0 : customIssueEventId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (links.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (properties.hashCode) +
    (toStatusReference == null ? 0 : toStatusReference!.hashCode) +
    (transitionScreen == null ? 0 : transitionScreen!.hashCode) +
    (triggers.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (validators.hashCode);

  @override
  String toString() => 'WorkflowTransitions[actions=$actions, conditions=$conditions, customIssueEventId=$customIssueEventId, description=$description, id=$id, links=$links, name=$name, properties=$properties, toStatusReference=$toStatusReference, transitionScreen=$transitionScreen, triggers=$triggers, type=$type, validators=$validators]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'actions'] = this.actions;
    if (this.conditions != null) {
      json[r'conditions'] = this.conditions;
    } else {
      json[r'conditions'] = null;
    }
    if (this.customIssueEventId != null) {
      json[r'customIssueEventId'] = this.customIssueEventId;
    } else {
      json[r'customIssueEventId'] = null;
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
      json[r'links'] = this.links;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.toStatusReference != null) {
      json[r'toStatusReference'] = this.toStatusReference;
    } else {
      json[r'toStatusReference'] = null;
    }
    if (this.transitionScreen != null) {
      json[r'transitionScreen'] = this.transitionScreen;
    } else {
      json[r'transitionScreen'] = null;
    }
      json[r'triggers'] = this.triggers;
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
      json[r'validators'] = this.validators;
    return json;
  }

  /// Returns a new [WorkflowTransitions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTransitions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowTransitions(
        actions: WorkflowRuleConfiguration.listFromJson(json[r'actions']),
        conditions: ConditionGroupConfiguration.fromJson(json[r'conditions']),
        customIssueEventId: mapValueOfType<String>(json, r'customIssueEventId'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        links: WorkflowTransitionLinks.listFromJson(json[r'links']),
        name: mapValueOfType<String>(json, r'name'),
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        toStatusReference: mapValueOfType<String>(json, r'toStatusReference'),
        transitionScreen: WorkflowRuleConfiguration.fromJson(json[r'transitionScreen']),
        triggers: WorkflowTrigger.listFromJson(json[r'triggers']),
        type: WorkflowTransitionsTypeEnum.fromJson(json[r'type']),
        validators: WorkflowRuleConfiguration.listFromJson(json[r'validators']),
      );
    }
    return null;
  }

  static List<WorkflowTransitions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransitions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransitions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTransitions> mapFromJson(dynamic json) {
    final map = <String, WorkflowTransitions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTransitions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTransitions-objects as value to a dart map
  static Map<String, List<WorkflowTransitions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTransitions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTransitions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The transition type.
enum WorkflowTransitionsTypeEnum {
  INITIAL._(r'INITIAL'),
  GLOBAL._(r'GLOBAL'),
  DIRECTED._(r'DIRECTED'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowTransitionsTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowTransitionsTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowTransitionsTypeEnum? fromJson(dynamic value) => WorkflowTransitionsTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowTransitionsTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowTransitionsTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransitionsTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransitionsTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowTransitionsTypeEnum] to String,
/// and [decode] dynamic data back to [WorkflowTransitionsTypeEnum].
class WorkflowTransitionsTypeEnumTypeTransformer {
  factory WorkflowTransitionsTypeEnumTypeTransformer() => _instance ??= const WorkflowTransitionsTypeEnumTypeTransformer._();

  const WorkflowTransitionsTypeEnumTypeTransformer._();

  String encode(WorkflowTransitionsTypeEnum data) => data._value;

  /// Returns the instance of [WorkflowTransitionsTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowTransitionsTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowTransitionsTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'INITIAL': return WorkflowTransitionsTypeEnum.INITIAL;
        case r'GLOBAL': return WorkflowTransitionsTypeEnum.GLOBAL;
        case r'DIRECTED': return WorkflowTransitionsTypeEnum.DIRECTED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowTransitionsTypeEnumTypeTransformer? _instance;
}


