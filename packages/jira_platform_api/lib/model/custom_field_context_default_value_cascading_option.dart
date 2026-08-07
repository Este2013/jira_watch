//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueCascadingOption {
  /// Returns a new [CustomFieldContextDefaultValueCascadingOption] instance.
  CustomFieldContextDefaultValueCascadingOption({
    this.cascadingOptionId,
    required this.contextId,
    required this.optionId,
    required this.type,
  });

  /// The ID of the default cascading option.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? cascadingOptionId;

  /// The ID of the context.
  String contextId;

  /// The ID of the default option.
  String optionId;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueCascadingOption &&
    other.cascadingOptionId == cascadingOptionId &&
    other.contextId == contextId &&
    other.optionId == optionId &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cascadingOptionId == null ? 0 : cascadingOptionId!.hashCode) +
    (contextId.hashCode) +
    (optionId.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueCascadingOption[cascadingOptionId=$cascadingOptionId, contextId=$contextId, optionId=$optionId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cascadingOptionId != null) {
      json[r'cascadingOptionId'] = this.cascadingOptionId;
    } else {
      json[r'cascadingOptionId'] = null;
    }
      json[r'contextId'] = this.contextId;
      json[r'optionId'] = this.optionId;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueCascadingOption] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueCascadingOption? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueCascadingOption[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueCascadingOption[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'optionId'), 'Required key "CustomFieldContextDefaultValueCascadingOption[optionId]" is missing from JSON.');
        assert(json[r'optionId'] != null, 'Required key "CustomFieldContextDefaultValueCascadingOption[optionId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueCascadingOption[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueCascadingOption[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueCascadingOption(
        cascadingOptionId: mapValueOfType<String>(json, r'cascadingOptionId'),
        contextId: mapValueOfType<String>(json, r'contextId')!,
        optionId: mapValueOfType<String>(json, r'optionId')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueCascadingOption> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueCascadingOption>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueCascadingOption.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueCascadingOption> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueCascadingOption>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueCascadingOption.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueCascadingOption-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueCascadingOption>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueCascadingOption>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueCascadingOption.listFromJson(entry.value, growable: growable,);
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

