//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueSingleOption {
  /// Returns a new [CustomFieldContextDefaultValueSingleOption] instance.
  CustomFieldContextDefaultValueSingleOption({
    required this.contextId,
    required this.optionId,
    required this.type,
  });

  /// The ID of the context.
  String contextId;

  /// The ID of the default option.
  String optionId;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueSingleOption &&
    other.contextId == contextId &&
    other.optionId == optionId &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (optionId.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueSingleOption[contextId=$contextId, optionId=$optionId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'optionId'] = this.optionId;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueSingleOption] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueSingleOption? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueSingleOption[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueSingleOption[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'optionId'), 'Required key "CustomFieldContextDefaultValueSingleOption[optionId]" is missing from JSON.');
        assert(json[r'optionId'] != null, 'Required key "CustomFieldContextDefaultValueSingleOption[optionId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueSingleOption[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueSingleOption[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueSingleOption(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        optionId: mapValueOfType<String>(json, r'optionId')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueSingleOption> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueSingleOption>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueSingleOption.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueSingleOption> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueSingleOption>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueSingleOption.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueSingleOption-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueSingleOption>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueSingleOption>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueSingleOption.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'optionId',
    'type',
  };
}

