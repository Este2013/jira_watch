//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueFieldOption {
  /// Returns a new [IssueFieldOption] instance.
  IssueFieldOption({
    this.config,
    required this.id,
    this.properties = const {},
    required this.value,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueFieldOptionConfiguration? config;

  /// The unique identifier for the option. This is only unique within the select field's set of options.
  int id;

  /// The properties of the object, as arbitrary key-value pairs. These properties can be searched using JQL, if the extractions (see [Issue Field Option Property Index](https://developer.atlassian.com/cloud/jira/platform/modules/issue-field-option-property-index/)) are defined in the descriptor for the issue field module.
  Map<String, Object> properties;

  /// The option's name, which is displayed in Jira.
  String value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueFieldOption &&
    other.config == config &&
    other.id == id &&
    _deepEquality.equals(other.properties, properties) &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (config == null ? 0 : config!.hashCode) +
    (id.hashCode) +
    (properties.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'IssueFieldOption[config=$config, id=$id, properties=$properties, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.config != null) {
      json[r'config'] = this.config;
    } else {
      json[r'config'] = null;
    }
      json[r'id'] = this.id;
      json[r'properties'] = this.properties;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [IssueFieldOption] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueFieldOption? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "IssueFieldOption[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "IssueFieldOption[id]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "IssueFieldOption[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "IssueFieldOption[value]" has a null value in JSON.');
        return true;
      }());

      return IssueFieldOption(
        config: IssueFieldOptionConfiguration.fromJson(json[r'config']),
        id: mapValueOfType<int>(json, r'id')!,
        properties: mapCastOfType<String, Object>(json, r'properties') ?? const {},
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<IssueFieldOption> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueFieldOption>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueFieldOption.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueFieldOption> mapFromJson(dynamic json) {
    final map = <String, IssueFieldOption>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueFieldOption.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueFieldOption-objects as value to a dart map
  static Map<String, List<IssueFieldOption>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueFieldOption>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueFieldOption.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'value',
  };
}

