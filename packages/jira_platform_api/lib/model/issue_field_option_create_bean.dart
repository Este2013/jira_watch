//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueFieldOptionCreateBean {
  /// Returns a new [IssueFieldOptionCreateBean] instance.
  IssueFieldOptionCreateBean({
    this.config,
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

  /// The properties of the option as arbitrary key-value pairs. These properties can be searched using JQL, if the extractions (see https://developer.atlassian.com/cloud/jira/platform/modules/issue-field-option-property-index/) are defined in the descriptor for the issue field module.
  Map<String, Object> properties;

  /// The option's name, which is displayed in Jira.
  String value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueFieldOptionCreateBean &&
    other.config == config &&
    _deepEquality.equals(other.properties, properties) &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (config == null ? 0 : config!.hashCode) +
    (properties.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'IssueFieldOptionCreateBean[config=$config, properties=$properties, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.config != null) {
      json[r'config'] = this.config;
    } else {
      json[r'config'] = null;
    }
      json[r'properties'] = this.properties;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [IssueFieldOptionCreateBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueFieldOptionCreateBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'value'), 'Required key "IssueFieldOptionCreateBean[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "IssueFieldOptionCreateBean[value]" has a null value in JSON.');
        return true;
      }());

      return IssueFieldOptionCreateBean(
        config: IssueFieldOptionConfiguration.fromJson(json[r'config']),
        properties: mapCastOfType<String, Object>(json, r'properties') ?? const {},
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<IssueFieldOptionCreateBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueFieldOptionCreateBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueFieldOptionCreateBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueFieldOptionCreateBean> mapFromJson(dynamic json) {
    final map = <String, IssueFieldOptionCreateBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueFieldOptionCreateBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueFieldOptionCreateBean-objects as value to a dart map
  static Map<String, List<IssueFieldOptionCreateBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueFieldOptionCreateBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueFieldOptionCreateBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'value',
  };
}

