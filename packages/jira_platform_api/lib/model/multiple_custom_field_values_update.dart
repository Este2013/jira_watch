//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MultipleCustomFieldValuesUpdate {
  /// Returns a new [MultipleCustomFieldValuesUpdate] instance.
  MultipleCustomFieldValuesUpdate({
    required this.customField,
    this.issueIds = const [],
    required this.value,
  });

  /// The ID or key of the custom field. For example, `customfield_10010`.
  String customField;

  /// The list of issue IDs.
  List<int> issueIds;

  /// The value for the custom field. The value must be compatible with the [custom field type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/#data-types) as follows:   *  `string` the value must be a string.  *  `number` the value must be a number.  *  `datetime` the value must be a string that represents a date in the ISO format or the simplified extended ISO format. For example, `\"2023-01-18T12:00:00-03:00\"` or `\"2023-01-18T12:00:00.000Z\"`. However, the milliseconds part is ignored.  *  `user` the value must be an object that contains the `accountId` field.  *  `group` the value must be an object that contains the group `name` or `groupId` field. Because group names can change, we recommend using `groupId`.  A list of appropriate values must be provided if the field is of the `list` [collection type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/#collection-types).
  Object? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MultipleCustomFieldValuesUpdate &&
    other.customField == customField &&
    _deepEquality.equals(other.issueIds, issueIds) &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (customField.hashCode) +
    (issueIds.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'MultipleCustomFieldValuesUpdate[customField=$customField, issueIds=$issueIds, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'customField'] = this.customField;
      json[r'issueIds'] = this.issueIds;
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [MultipleCustomFieldValuesUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MultipleCustomFieldValuesUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'customField'), 'Required key "MultipleCustomFieldValuesUpdate[customField]" is missing from JSON.');
        assert(json[r'customField'] != null, 'Required key "MultipleCustomFieldValuesUpdate[customField]" has a null value in JSON.');
        assert(json.containsKey(r'issueIds'), 'Required key "MultipleCustomFieldValuesUpdate[issueIds]" is missing from JSON.');
        assert(json[r'issueIds'] != null, 'Required key "MultipleCustomFieldValuesUpdate[issueIds]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "MultipleCustomFieldValuesUpdate[value]" is missing from JSON.');
        return true;
      }());

      return MultipleCustomFieldValuesUpdate(
        customField: mapValueOfType<String>(json, r'customField')!,
        issueIds: json[r'issueIds'] is Iterable
            ? (json[r'issueIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        value: mapValueOfType<Object>(json, r'value'),
      );
    }
    return null;
  }

  static List<MultipleCustomFieldValuesUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MultipleCustomFieldValuesUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MultipleCustomFieldValuesUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MultipleCustomFieldValuesUpdate> mapFromJson(dynamic json) {
    final map = <String, MultipleCustomFieldValuesUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MultipleCustomFieldValuesUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MultipleCustomFieldValuesUpdate-objects as value to a dart map
  static Map<String, List<MultipleCustomFieldValuesUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MultipleCustomFieldValuesUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MultipleCustomFieldValuesUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'customField',
    'issueIds',
    'value',
  };
}

