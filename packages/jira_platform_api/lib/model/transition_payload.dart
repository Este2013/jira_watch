//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TransitionPayload {
  /// Returns a new [TransitionPayload] instance.
  TransitionPayload({
    this.actions = const [],
    this.conditions,
    this.customIssueEventId,
    this.description,
    this.from = const [],
    this.id,
    this.name,
    this.properties = const {},
    this.to,
    this.transitionScreen,
    this.triggers = const [],
    this.type,
    this.validators = const [],
  });

  /// The actions that are performed when the transition is made
  List<RulePayload> actions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ConditionGroupPayload? conditions;

  /// Mechanism in Jira for triggering certain actions, like notifications, automations, etc. Unless a custom notification scheme is configure, it's better not to provide any value here
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? customIssueEventId;

  /// The description of the transition
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The statuses that the transition can be made from
  List<FromLayoutPayload> from;

  /// The id of the transition
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The name of the transition
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The properties of the transition
  Map<String, String> properties;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ToLayoutPayload? to;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RulePayload? transitionScreen;

  /// The triggers that are performed when the transition is made
  List<RulePayload> triggers;

  /// The type of the transition
  TransitionPayloadTypeEnum? type;

  /// The validators that are performed when the transition is made
  List<RulePayload> validators;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TransitionPayload &&
    _deepEquality.equals(other.actions, actions) &&
    other.conditions == conditions &&
    other.customIssueEventId == customIssueEventId &&
    other.description == description &&
    _deepEquality.equals(other.from, from) &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.properties, properties) &&
    other.to == to &&
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
    (from.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (properties.hashCode) +
    (to == null ? 0 : to!.hashCode) +
    (transitionScreen == null ? 0 : transitionScreen!.hashCode) +
    (triggers.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (validators.hashCode);

  @override
  String toString() => 'TransitionPayload[actions=$actions, conditions=$conditions, customIssueEventId=$customIssueEventId, description=$description, from=$from, id=$id, name=$name, properties=$properties, to=$to, transitionScreen=$transitionScreen, triggers=$triggers, type=$type, validators=$validators]';

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
      json[r'from'] = this.from;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
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

  /// Returns a new [TransitionPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TransitionPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return TransitionPayload(
        actions: RulePayload.listFromJson(json[r'actions']),
        conditions: ConditionGroupPayload.fromJson(json[r'conditions']),
        customIssueEventId: mapValueOfType<String>(json, r'customIssueEventId'),
        description: mapValueOfType<String>(json, r'description'),
        from: FromLayoutPayload.listFromJson(json[r'from']),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        to: ToLayoutPayload.fromJson(json[r'to']),
        transitionScreen: RulePayload.fromJson(json[r'transitionScreen']),
        triggers: RulePayload.listFromJson(json[r'triggers']),
        type: TransitionPayloadTypeEnum.fromJson(json[r'type']),
        validators: RulePayload.listFromJson(json[r'validators']),
      );
    }
    return null;
  }

  static List<TransitionPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransitionPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransitionPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TransitionPayload> mapFromJson(dynamic json) {
    final map = <String, TransitionPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TransitionPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TransitionPayload-objects as value to a dart map
  static Map<String, List<TransitionPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TransitionPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TransitionPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of the transition
enum TransitionPayloadTypeEnum {
  global._(r'global'),
  initial._(r'initial'),
  directed._(r'directed'),
  ;

  /// Instantiate a new enum with the provided value.
  const TransitionPayloadTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [TransitionPayloadTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static TransitionPayloadTypeEnum? fromJson(dynamic value) => TransitionPayloadTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [TransitionPayloadTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<TransitionPayloadTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransitionPayloadTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransitionPayloadTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TransitionPayloadTypeEnum] to String,
/// and [decode] dynamic data back to [TransitionPayloadTypeEnum].
class TransitionPayloadTypeEnumTypeTransformer {
  factory TransitionPayloadTypeEnumTypeTransformer() => _instance ??= const TransitionPayloadTypeEnumTypeTransformer._();

  const TransitionPayloadTypeEnumTypeTransformer._();

  String encode(TransitionPayloadTypeEnum data) => data._value;

  /// Returns the instance of [TransitionPayloadTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TransitionPayloadTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is TransitionPayloadTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'global': return TransitionPayloadTypeEnum.global;
        case r'initial': return TransitionPayloadTypeEnum.initial;
        case r'directed': return TransitionPayloadTypeEnum.directed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static TransitionPayloadTypeEnumTypeTransformer? _instance;
}


