//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueMultipleOption {
  /// Returns a new [CustomFieldContextDefaultValueMultipleOption] instance.
  CustomFieldContextDefaultValueMultipleOption({
    required this.contextId,
    this.optionIds = const [],
    required this.type,
  });

  /// The ID of the context.
  String contextId;

  /// The list of IDs of the default options.
  List<String> optionIds;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueMultipleOption &&
    other.contextId == contextId &&
    _deepEquality.equals(other.optionIds, optionIds) &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (optionIds.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueMultipleOption[contextId=$contextId, optionIds=$optionIds, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'optionIds'] = this.optionIds;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueMultipleOption] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueMultipleOption? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueMultipleOption[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueMultipleOption[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'optionIds'), 'Required key "CustomFieldContextDefaultValueMultipleOption[optionIds]" is missing from JSON.');
        assert(json[r'optionIds'] != null, 'Required key "CustomFieldContextDefaultValueMultipleOption[optionIds]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueMultipleOption[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueMultipleOption[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueMultipleOption(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        optionIds: json[r'optionIds'] is Iterable
            ? (json[r'optionIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueMultipleOption> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueMultipleOption>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueMultipleOption.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueMultipleOption> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueMultipleOption>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueMultipleOption.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueMultipleOption-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueMultipleOption>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueMultipleOption>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueMultipleOption.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'optionIds',
    'type',
  };
}

