//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Transition {
  /// Returns a new [Transition] instance.
  Transition({
    required this.description,
    this.from = const [],
    required this.id,
    required this.name,
    this.properties = const {},
    this.rules,
    this.screen,
    required this.to,
    required this.type,
  });

  /// The description of the transition.
  String description;

  /// The statuses the transition can start from.
  List<String> from;

  /// The ID of the transition.
  String id;

  /// The name of the transition.
  String name;

  /// The properties of the transition.
  Map<String, Object> properties;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowRules? rules;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TransitionScreenDetails? screen;

  /// The status the transition goes to.
  String to;

  /// The type of the transition.
  TransitionTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Transition &&
    other.description == description &&
    _deepEquality.equals(other.from, from) &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.properties, properties) &&
    other.rules == rules &&
    other.screen == screen &&
    other.to == to &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description.hashCode) +
    (from.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (properties.hashCode) +
    (rules == null ? 0 : rules!.hashCode) +
    (screen == null ? 0 : screen!.hashCode) +
    (to.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'Transition[description=$description, from=$from, id=$id, name=$name, properties=$properties, rules=$rules, screen=$screen, to=$to, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'description'] = this.description;
      json[r'from'] = this.from;
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'properties'] = this.properties;
    if (this.rules != null) {
      json[r'rules'] = this.rules;
    } else {
      json[r'rules'] = null;
    }
    if (this.screen != null) {
      json[r'screen'] = this.screen;
    } else {
      json[r'screen'] = null;
    }
      json[r'to'] = this.to;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [Transition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Transition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'description'), 'Required key "Transition[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "Transition[description]" has a null value in JSON.');
        assert(json.containsKey(r'from'), 'Required key "Transition[from]" is missing from JSON.');
        assert(json[r'from'] != null, 'Required key "Transition[from]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "Transition[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Transition[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "Transition[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "Transition[name]" has a null value in JSON.');
        assert(json.containsKey(r'to'), 'Required key "Transition[to]" is missing from JSON.');
        assert(json[r'to'] != null, 'Required key "Transition[to]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "Transition[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "Transition[type]" has a null value in JSON.');
        return true;
      }());

      return Transition(
        description: mapValueOfType<String>(json, r'description')!,
        from: json[r'from'] is Iterable
            ? (json[r'from'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        properties: mapCastOfType<String, Object>(json, r'properties') ?? const {},
        rules: WorkflowRules.fromJson(json[r'rules']),
        screen: TransitionScreenDetails.fromJson(json[r'screen']),
        to: mapValueOfType<String>(json, r'to')!,
        type: TransitionTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<Transition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Transition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Transition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Transition> mapFromJson(dynamic json) {
    final map = <String, Transition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Transition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Transition-objects as value to a dart map
  static Map<String, List<Transition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Transition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Transition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'from',
    'id',
    'name',
    'to',
    'type',
  };
}

/// The type of the transition.
enum TransitionTypeEnum {
  global._(r'global'),
  initial._(r'initial'),
  directed._(r'directed'),
  ;

  /// Instantiate a new enum with the provided value.
  const TransitionTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [TransitionTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static TransitionTypeEnum? fromJson(dynamic value) => TransitionTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [TransitionTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<TransitionTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransitionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransitionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TransitionTypeEnum] to String,
/// and [decode] dynamic data back to [TransitionTypeEnum].
class TransitionTypeEnumTypeTransformer {
  factory TransitionTypeEnumTypeTransformer() => _instance ??= const TransitionTypeEnumTypeTransformer._();

  const TransitionTypeEnumTypeTransformer._();

  String encode(TransitionTypeEnum data) => data._value;

  /// Returns the instance of [TransitionTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TransitionTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is TransitionTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'global': return TransitionTypeEnum.global;
        case r'initial': return TransitionTypeEnum.initial;
        case r'directed': return TransitionTypeEnum.directed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static TransitionTypeEnumTypeTransformer? _instance;
}


