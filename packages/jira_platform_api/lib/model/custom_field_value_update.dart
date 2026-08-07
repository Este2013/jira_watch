//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldValueUpdate {
  /// Returns a new [CustomFieldValueUpdate] instance.
  CustomFieldValueUpdate({
    this.issueIds = const [],
    required this.value,
  });

  /// The list of issue IDs.
  List<int> issueIds;

  /// The value for the custom field. The value must be compatible with the [custom field type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/#data-types) as follows:   *  `string` the value must be a string.  *  `number` the value must be a number.  *  `datetime` the value must be a string that represents a date in the ISO format or the simplified extended ISO format. For example, `\"2023-01-18T12:00:00-03:00\"` or `\"2023-01-18T12:00:00.000Z\"`. However, the milliseconds part is ignored.  *  `user` the value must be an object that contains the `accountId` field.  *  `group` the value must be an object that contains the group `name` or `groupId` field. Because group names can change, we recommend using `groupId`.  A list of appropriate values must be provided if the field is of the `list` [collection type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/#collection-types).
  Object? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldValueUpdate &&
    _deepEquality.equals(other.issueIds, issueIds) &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueIds.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'CustomFieldValueUpdate[issueIds=$issueIds, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueIds'] = this.issueIds;
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [CustomFieldValueUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldValueUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueIds'), 'Required key "CustomFieldValueUpdate[issueIds]" is missing from JSON.');
        assert(json[r'issueIds'] != null, 'Required key "CustomFieldValueUpdate[issueIds]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "CustomFieldValueUpdate[value]" is missing from JSON.');
        return true;
      }());

      return CustomFieldValueUpdate(
        issueIds: json[r'issueIds'] is Iterable
            ? (json[r'issueIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        value: mapValueOfType<Object>(json, r'value'),
      );
    }
    return null;
  }

  static List<CustomFieldValueUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldValueUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldValueUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldValueUpdate> mapFromJson(dynamic json) {
    final map = <String, CustomFieldValueUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldValueUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldValueUpdate-objects as value to a dart map
  static Map<String, List<CustomFieldValueUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldValueUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldValueUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueIds',
    'value',
  };
}

