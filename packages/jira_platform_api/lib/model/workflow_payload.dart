//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowPayload {
  /// Returns a new [WorkflowPayload] instance.
  WorkflowPayload({
    this.description,
    this.loopedTransitionContainerLayout,
    this.name,
    this.onConflict,
    this.pcri,
    this.startPointLayout,
    this.statuses = const [],
    this.transitions = const [],
  });

  /// The description of the workflow
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
  WorkflowStatusLayoutPayload? loopedTransitionContainerLayout;

  /// The name of the workflow
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The strategy to use if there is a conflict with another workflow
  WorkflowPayloadOnConflictEnum? onConflict;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowStatusLayoutPayload? startPointLayout;

  /// The statuses to be used in the workflow
  List<WorkflowStatusPayload> statuses;

  /// The transitions for the workflow
  List<TransitionPayload> transitions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowPayload &&
    other.description == description &&
    other.loopedTransitionContainerLayout == loopedTransitionContainerLayout &&
    other.name == name &&
    other.onConflict == onConflict &&
    other.pcri == pcri &&
    other.startPointLayout == startPointLayout &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.transitions, transitions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (loopedTransitionContainerLayout == null ? 0 : loopedTransitionContainerLayout!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (onConflict == null ? 0 : onConflict!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (startPointLayout == null ? 0 : startPointLayout!.hashCode) +
    (statuses.hashCode) +
    (transitions.hashCode);

  @override
  String toString() => 'WorkflowPayload[description=$description, loopedTransitionContainerLayout=$loopedTransitionContainerLayout, name=$name, onConflict=$onConflict, pcri=$pcri, startPointLayout=$startPointLayout, statuses=$statuses, transitions=$transitions]';

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
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.onConflict != null) {
      json[r'onConflict'] = this.onConflict;
    } else {
      json[r'onConflict'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
    if (this.startPointLayout != null) {
      json[r'startPointLayout'] = this.startPointLayout;
    } else {
      json[r'startPointLayout'] = null;
    }
      json[r'statuses'] = this.statuses;
      json[r'transitions'] = this.transitions;
    return json;
  }

  /// Returns a new [WorkflowPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowPayload(
        description: mapValueOfType<String>(json, r'description'),
        loopedTransitionContainerLayout: WorkflowStatusLayoutPayload.fromJson(json[r'loopedTransitionContainerLayout']),
        name: mapValueOfType<String>(json, r'name'),
        onConflict: WorkflowPayloadOnConflictEnum.fromJson(json[r'onConflict']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        startPointLayout: WorkflowStatusLayoutPayload.fromJson(json[r'startPointLayout']),
        statuses: WorkflowStatusPayload.listFromJson(json[r'statuses']),
        transitions: TransitionPayload.listFromJson(json[r'transitions']),
      );
    }
    return null;
  }

  static List<WorkflowPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowPayload> mapFromJson(dynamic json) {
    final map = <String, WorkflowPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowPayload-objects as value to a dart map
  static Map<String, List<WorkflowPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The strategy to use if there is a conflict with another workflow
enum WorkflowPayloadOnConflictEnum {
  FAIL._(r'FAIL'),
  USE._(r'USE'),
  NEW._(r'NEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowPayloadOnConflictEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowPayloadOnConflictEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowPayloadOnConflictEnum? fromJson(dynamic value) => WorkflowPayloadOnConflictEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowPayloadOnConflictEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowPayloadOnConflictEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowPayloadOnConflictEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowPayloadOnConflictEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowPayloadOnConflictEnum] to String,
/// and [decode] dynamic data back to [WorkflowPayloadOnConflictEnum].
class WorkflowPayloadOnConflictEnumTypeTransformer {
  factory WorkflowPayloadOnConflictEnumTypeTransformer() => _instance ??= const WorkflowPayloadOnConflictEnumTypeTransformer._();

  const WorkflowPayloadOnConflictEnumTypeTransformer._();

  String encode(WorkflowPayloadOnConflictEnum data) => data._value;

  /// Returns the instance of [WorkflowPayloadOnConflictEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowPayloadOnConflictEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowPayloadOnConflictEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FAIL': return WorkflowPayloadOnConflictEnum.FAIL;
        case r'USE': return WorkflowPayloadOnConflictEnum.USE;
        case r'NEW': return WorkflowPayloadOnConflictEnum.NEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowPayloadOnConflictEnumTypeTransformer? _instance;
}


