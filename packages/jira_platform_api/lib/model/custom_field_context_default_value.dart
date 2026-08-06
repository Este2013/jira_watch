//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValue {
  /// Returns a new [CustomFieldContextDefaultValue] instance.
  CustomFieldContextDefaultValue({
    this.cascadingOptionId,
    required this.contextId,
    required this.optionId,
    required this.type,
    this.optionIds = const [],
    required this.accountId,
    required this.userFilter,
    this.accountIds = const [],
    required this.groupId,
    this.groupIds = const [],
    this.date,
    this.useCurrent = false,
    this.dateTime,
    required this.url,
    required this.projectId,
    required this.number,
    this.labels = const [],
    this.text,
    required this.versionId,
    this.versionOrder,
    this.versionIds = const [],
    this.values = const [],
    this.object,
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

  /// The list of IDs of the default options.
  List<String> optionIds;

  /// The ID of the default user.
  String accountId;

  UserFilter userFilter;

  /// The IDs of the default users.
  List<String> accountIds;

  /// The ID of the the default group.
  String groupId;

  /// The IDs of the default groups.
  List<String> groupIds;

  /// The default date in ISO format. Ignored if `useCurrent` is true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? date;

  /// Whether to use the current date.
  bool useCurrent;

  /// The default date-time in ISO format. Ignored if `useCurrent` is true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dateTime;

  /// The default URL.
  String url;

  /// The ID of the default project.
  String projectId;

  /// The default floating-point number.
  double number;

  /// The default labels value.
  List<String> labels;

  /// The default text. The maximum length is 254 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? text;

  /// The ID of the default version.
  String versionId;

  /// The order the pickable versions are displayed in. If not provided, the released-first order is used. Available version orders are `\"releasedFirst\"` and `\"unreleasedFirst\"`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? versionOrder;

  /// The IDs of the default versions.
  List<String> versionIds;

  /// List of string values. The maximum length for a value is 254 characters.
  List<String> values;

  /// The default JSON object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? object;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValue &&
    other.cascadingOptionId == cascadingOptionId &&
    other.contextId == contextId &&
    other.optionId == optionId &&
    other.type == type &&
    _deepEquality.equals(other.optionIds, optionIds) &&
    other.accountId == accountId &&
    other.userFilter == userFilter &&
    _deepEquality.equals(other.accountIds, accountIds) &&
    other.groupId == groupId &&
    _deepEquality.equals(other.groupIds, groupIds) &&
    other.date == date &&
    other.useCurrent == useCurrent &&
    other.dateTime == dateTime &&
    other.url == url &&
    other.projectId == projectId &&
    other.number == number &&
    _deepEquality.equals(other.labels, labels) &&
    other.text == text &&
    other.versionId == versionId &&
    other.versionOrder == versionOrder &&
    _deepEquality.equals(other.versionIds, versionIds) &&
    _deepEquality.equals(other.values, values) &&
    other.object == object;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cascadingOptionId == null ? 0 : cascadingOptionId!.hashCode) +
    (contextId.hashCode) +
    (optionId.hashCode) +
    (type.hashCode) +
    (optionIds.hashCode) +
    (accountId.hashCode) +
    (userFilter.hashCode) +
    (accountIds.hashCode) +
    (groupId.hashCode) +
    (groupIds.hashCode) +
    (date == null ? 0 : date!.hashCode) +
    (useCurrent.hashCode) +
    (dateTime == null ? 0 : dateTime!.hashCode) +
    (url.hashCode) +
    (projectId.hashCode) +
    (number.hashCode) +
    (labels.hashCode) +
    (text == null ? 0 : text!.hashCode) +
    (versionId.hashCode) +
    (versionOrder == null ? 0 : versionOrder!.hashCode) +
    (versionIds.hashCode) +
    (values.hashCode) +
    (object == null ? 0 : object!.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValue[cascadingOptionId=$cascadingOptionId, contextId=$contextId, optionId=$optionId, type=$type, optionIds=$optionIds, accountId=$accountId, userFilter=$userFilter, accountIds=$accountIds, groupId=$groupId, groupIds=$groupIds, date=$date, useCurrent=$useCurrent, dateTime=$dateTime, url=$url, projectId=$projectId, number=$number, labels=$labels, text=$text, versionId=$versionId, versionOrder=$versionOrder, versionIds=$versionIds, values=$values, object=$object]';

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
      json[r'optionIds'] = this.optionIds;
      json[r'accountId'] = this.accountId;
      json[r'userFilter'] = this.userFilter;
      json[r'accountIds'] = this.accountIds;
      json[r'groupId'] = this.groupId;
      json[r'groupIds'] = this.groupIds;
    if (this.date != null) {
      json[r'date'] = this.date;
    } else {
      json[r'date'] = null;
    }
      json[r'useCurrent'] = this.useCurrent;
    if (this.dateTime != null) {
      json[r'dateTime'] = this.dateTime;
    } else {
      json[r'dateTime'] = null;
    }
      json[r'url'] = this.url;
      json[r'projectId'] = this.projectId;
      json[r'number'] = this.number;
      json[r'labels'] = this.labels;
    if (this.text != null) {
      json[r'text'] = this.text;
    } else {
      json[r'text'] = null;
    }
      json[r'versionId'] = this.versionId;
    if (this.versionOrder != null) {
      json[r'versionOrder'] = this.versionOrder;
    } else {
      json[r'versionOrder'] = null;
    }
      json[r'versionIds'] = this.versionIds;
      json[r'values'] = this.values;
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValue[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValue[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'optionId'), 'Required key "CustomFieldContextDefaultValue[optionId]" is missing from JSON.');
        assert(json[r'optionId'] != null, 'Required key "CustomFieldContextDefaultValue[optionId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValue[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValue[type]" has a null value in JSON.');
        assert(json.containsKey(r'optionIds'), 'Required key "CustomFieldContextDefaultValue[optionIds]" is missing from JSON.');
        assert(json[r'optionIds'] != null, 'Required key "CustomFieldContextDefaultValue[optionIds]" has a null value in JSON.');
        assert(json.containsKey(r'accountId'), 'Required key "CustomFieldContextDefaultValue[accountId]" is missing from JSON.');
        assert(json[r'accountId'] != null, 'Required key "CustomFieldContextDefaultValue[accountId]" has a null value in JSON.');
        assert(json.containsKey(r'userFilter'), 'Required key "CustomFieldContextDefaultValue[userFilter]" is missing from JSON.');
        assert(json[r'userFilter'] != null, 'Required key "CustomFieldContextDefaultValue[userFilter]" has a null value in JSON.');
        assert(json.containsKey(r'accountIds'), 'Required key "CustomFieldContextDefaultValue[accountIds]" is missing from JSON.');
        assert(json[r'accountIds'] != null, 'Required key "CustomFieldContextDefaultValue[accountIds]" has a null value in JSON.');
        assert(json.containsKey(r'groupId'), 'Required key "CustomFieldContextDefaultValue[groupId]" is missing from JSON.');
        assert(json[r'groupId'] != null, 'Required key "CustomFieldContextDefaultValue[groupId]" has a null value in JSON.');
        assert(json.containsKey(r'groupIds'), 'Required key "CustomFieldContextDefaultValue[groupIds]" is missing from JSON.');
        assert(json[r'groupIds'] != null, 'Required key "CustomFieldContextDefaultValue[groupIds]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "CustomFieldContextDefaultValue[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "CustomFieldContextDefaultValue[url]" has a null value in JSON.');
        assert(json.containsKey(r'projectId'), 'Required key "CustomFieldContextDefaultValue[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "CustomFieldContextDefaultValue[projectId]" has a null value in JSON.');
        assert(json.containsKey(r'number'), 'Required key "CustomFieldContextDefaultValue[number]" is missing from JSON.');
        assert(json[r'number'] != null, 'Required key "CustomFieldContextDefaultValue[number]" has a null value in JSON.');
        assert(json.containsKey(r'labels'), 'Required key "CustomFieldContextDefaultValue[labels]" is missing from JSON.');
        assert(json[r'labels'] != null, 'Required key "CustomFieldContextDefaultValue[labels]" has a null value in JSON.');
        assert(json.containsKey(r'versionId'), 'Required key "CustomFieldContextDefaultValue[versionId]" is missing from JSON.');
        assert(json[r'versionId'] != null, 'Required key "CustomFieldContextDefaultValue[versionId]" has a null value in JSON.');
        assert(json.containsKey(r'versionIds'), 'Required key "CustomFieldContextDefaultValue[versionIds]" is missing from JSON.');
        assert(json[r'versionIds'] != null, 'Required key "CustomFieldContextDefaultValue[versionIds]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValue(
        cascadingOptionId: mapValueOfType<String>(json, r'cascadingOptionId'),
        contextId: mapValueOfType<String>(json, r'contextId')!,
        optionId: mapValueOfType<String>(json, r'optionId')!,
        type: mapValueOfType<String>(json, r'type')!,
        optionIds: json[r'optionIds'] is Iterable
            ? (json[r'optionIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        accountId: mapValueOfType<String>(json, r'accountId')!,
        userFilter: UserFilter.fromJson(json[r'userFilter'])!,
        accountIds: json[r'accountIds'] is Iterable
            ? (json[r'accountIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        groupId: mapValueOfType<String>(json, r'groupId')!,
        groupIds: json[r'groupIds'] is Iterable
            ? (json[r'groupIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        date: mapValueOfType<String>(json, r'date'),
        useCurrent: mapValueOfType<bool>(json, r'useCurrent') ?? false,
        dateTime: mapValueOfType<String>(json, r'dateTime'),
        url: mapValueOfType<String>(json, r'url')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
        number: mapValueOfType<double>(json, r'number')!,
        labels: json[r'labels'] is Iterable
            ? (json[r'labels'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        text: mapValueOfType<String>(json, r'text'),
        versionId: mapValueOfType<String>(json, r'versionId')!,
        versionOrder: mapValueOfType<String>(json, r'versionOrder'),
        versionIds: json[r'versionIds'] is Iterable
            ? (json[r'versionIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        values: json[r'values'] is Iterable
            ? (json[r'values'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        object: mapValueOfType<Object>(json, r'object'),
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValue> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValue> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValue-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValue>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValue.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'optionId',
    'type',
    'optionIds',
    'accountId',
    'userFilter',
    'accountIds',
    'groupId',
    'groupIds',
    'url',
    'projectId',
    'number',
    'labels',
    'versionId',
    'versionIds',
  };
}

