//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBeanSchemaValue {
  /// Returns a new [IssueBeanSchemaValue] instance.
  IssueBeanSchemaValue({
    this.configuration = const {},
    this.custom,
    this.customId,
    this.items,
    this.system,
    required this.type,
  });

  /// If the field is a custom field, the configuration of the field.
  Map<String, Object> configuration;

  /// If the field is a custom field, the URI of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? custom;

  /// If the field is a custom field, the custom ID of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? customId;

  /// When the data type is an array, the name of the field items within the array.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? items;

  /// If the field is a system field, the name of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? system;

  /// The data type of the field.
  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBeanSchemaValue &&
    _deepEquality.equals(other.configuration, configuration) &&
    other.custom == custom &&
    other.customId == customId &&
    other.items == items &&
    other.system == system &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (configuration.hashCode) +
    (custom == null ? 0 : custom!.hashCode) +
    (customId == null ? 0 : customId!.hashCode) +
    (items == null ? 0 : items!.hashCode) +
    (system == null ? 0 : system!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'IssueBeanSchemaValue[configuration=$configuration, custom=$custom, customId=$customId, items=$items, system=$system, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'configuration'] = this.configuration;
    if (this.custom != null) {
      json[r'custom'] = this.custom;
    } else {
      json[r'custom'] = null;
    }
    if (this.customId != null) {
      json[r'customId'] = this.customId;
    } else {
      json[r'customId'] = null;
    }
    if (this.items != null) {
      json[r'items'] = this.items;
    } else {
      json[r'items'] = null;
    }
    if (this.system != null) {
      json[r'system'] = this.system;
    } else {
      json[r'system'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IssueBeanSchemaValue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBeanSchemaValue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "IssueBeanSchemaValue[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "IssueBeanSchemaValue[type]" has a null value in JSON.');
        return true;
      }());

      return IssueBeanSchemaValue(
        configuration: mapCastOfType<String, Object>(json, r'configuration') ?? const {},
        custom: mapValueOfType<String>(json, r'custom'),
        customId: mapValueOfType<int>(json, r'customId'),
        items: mapValueOfType<String>(json, r'items'),
        system: mapValueOfType<String>(json, r'system'),
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IssueBeanSchemaValue> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBeanSchemaValue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBeanSchemaValue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBeanSchemaValue> mapFromJson(dynamic json) {
    final map = <String, IssueBeanSchemaValue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBeanSchemaValue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBeanSchemaValue-objects as value to a dart map
  static Map<String, List<IssueBeanSchemaValue>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBeanSchemaValue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBeanSchemaValue.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

