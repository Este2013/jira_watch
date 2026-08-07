//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextOption {
  /// Returns a new [CustomFieldContextOption] instance.
  CustomFieldContextOption({
    required this.disabled,
    required this.id,
    this.optionId,
    required this.value,
  });

  /// Whether the option is disabled.
  bool disabled;

  /// The ID of the custom field option.
  String id;

  /// For cascading options, the ID of the custom field option containing the cascading option.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? optionId;

  /// The value of the custom field option.
  String value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextOption &&
    other.disabled == disabled &&
    other.id == id &&
    other.optionId == optionId &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (disabled.hashCode) +
    (id.hashCode) +
    (optionId == null ? 0 : optionId!.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'CustomFieldContextOption[disabled=$disabled, id=$id, optionId=$optionId, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'disabled'] = this.disabled;
      json[r'id'] = this.id;
    if (this.optionId != null) {
      json[r'optionId'] = this.optionId;
    } else {
      json[r'optionId'] = null;
    }
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [CustomFieldContextOption] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextOption? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'disabled'), 'Required key "CustomFieldContextOption[disabled]" is missing from JSON.');
        assert(json[r'disabled'] != null, 'Required key "CustomFieldContextOption[disabled]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "CustomFieldContextOption[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "CustomFieldContextOption[id]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "CustomFieldContextOption[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "CustomFieldContextOption[value]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextOption(
        disabled: mapValueOfType<bool>(json, r'disabled')!,
        id: mapValueOfType<String>(json, r'id')!,
        optionId: mapValueOfType<String>(json, r'optionId'),
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextOption> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextOption>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextOption.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextOption> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextOption>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextOption.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextOption-objects as value to a dart map
  static Map<String, List<CustomFieldContextOption>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextOption>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextOption.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'disabled',
    'id',
    'value',
  };
}

