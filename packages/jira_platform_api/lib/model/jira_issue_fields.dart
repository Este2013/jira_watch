//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraIssueFields {
  /// Returns a new [JiraIssueFields] instance.
  JiraIssueFields({
    this.cascadingSelectFields = const [],
    this.clearableNumberFields = const [],
    this.colorFields = const [],
    this.datePickerFields = const [],
    this.dateTimePickerFields = const [],
    this.issueType,
    this.labelsFields = const [],
    this.multipleGroupPickerFields = const [],
    this.multipleSelectClearableUserPickerFields = const [],
    this.multipleSelectFields = const [],
    this.multipleVersionPickerFields = const [],
    this.multiselectComponents,
    this.originalEstimateField,
    this.priority,
    this.richTextFields = const [],
    this.singleGroupPickerFields = const [],
    this.singleLineTextFields = const [],
    this.singleSelectClearableUserPickerFields = const [],
    this.singleSelectFields = const [],
    this.singleVersionPickerFields = const [],
    this.status,
    this.timeTrackingField,
    this.urlFields = const [],
  });

  /// Add or clear a cascading select field:   *  To add, specify `optionId` for both parent and child.  *  To clear the child, set its `optionId` to null.  *  To clear both, set the parent's `optionId` to null.
  List<JiraCascadingSelectField> cascadingSelectFields;

  /// Add or clear a number field:   *  To add, specify a numeric `value`.  *  To clear, set `value` to `null`.
  List<JiraNumberField> clearableNumberFields;

  /// Add or clear a color field:   *  To add, specify the color `name`. Available colors are: `purple`, `blue`, `green`, `teal`, `yellow`, `orange`, `grey`, `dark purple`, `dark blue`, `dark green`, `dark teal`, `dark yellow`, `dark orange`, `dark grey`.  *  To clear, set the color `name` to an empty string.
  List<JiraColorField> colorFields;

  /// Add or clear a date picker field:   *  To add, specify the date in `d/mmm/yy` format or ISO format `dd-mm-yyyy`.  *  To clear, set `formattedDate` to an empty string.
  List<JiraDateField> datePickerFields;

  /// Add or clear the planned start date and time:   *  To add, specify the date and time in ISO format for `formattedDateTime`.  *  To clear, provide an empty string for `formattedDateTime`.
  List<JiraDateTimeField> dateTimePickerFields;

  /// Set the issue type field by providing an `issueTypeId`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraIssueTypeField? issueType;

  /// Edit a labels field:   *  Options include `ADD`, `REPLACE`, `REMOVE`, or `REMOVE_ALL` for bulk edits.  *  To clear labels, use the `REMOVE_ALL` option with an empty `labels` array.
  List<JiraLabelsField> labelsFields;

  /// Add or clear a multi-group picker field:   *  To add groups, provide an array of groups with `groupName`s.  *  To clear all groups, use an empty `groups` array.
  List<JiraMultipleGroupPickerField> multipleGroupPickerFields;

  /// Assign or unassign multiple users to/from a field:   *  To assign, provide an array of user `accountId`s.  *  To clear, set `users` to `null`.
  List<JiraMultipleSelectUserPickerField> multipleSelectClearableUserPickerFields;

  /// Add or clear a multi-select field:   *  To add, provide an array of options with `optionId`s.  *  To clear, use an empty `options` array.
  List<JiraMultipleSelectField> multipleSelectFields;

  /// Edit a multi-version picker field like Fix Versions/Affects Versions:   *  Options include `ADD`, `REPLACE`, `REMOVE`, or `REMOVE_ALL` for bulk edits.  *  To clear the field, use the `REMOVE_ALL` option with an empty `versions` array.
  List<JiraMultipleVersionPickerField> multipleVersionPickerFields;

  /// Edit a multi select components field:   *  Options include `ADD`, `REPLACE`, `REMOVE`, or `REMOVE_ALL` for bulk edits.  *  To clear, use the `REMOVE_ALL` option with an empty `components` array.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraMultiSelectComponentField? multiselectComponents;

  /// Edit the original estimate field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraDurationField? originalEstimateField;

  /// Set the priority of an issue by specifying a `priorityId`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraPriorityField? priority;

  /// Add or clear a rich text field:   *  To add, provide `adfValue`. Note that rich text fields only support ADF values.  *  To clear, use an empty `richText` object.  For ADF format details, refer to: [Atlassian Document Format](https://developer.atlassian.com/cloud/jira/platform/apis/document/structure).
  List<JiraRichTextField> richTextFields;

  /// Add or clear a single group picker field:   *  To add, specify the group with `groupName`.  *  To clear, set `groupName` to an empty string.
  List<JiraSingleGroupPickerField> singleGroupPickerFields;

  /// Add or clear a single line text field:   *  To add, provide the `text` value.  *  To clear, set `text` to an empty string.
  List<JiraSingleLineTextField> singleLineTextFields;

  /// Edit assignment for single select user picker fields like Assignee/Reporter:   *  To assign an issue, specify the user's `accountId`.  *  To unassign an issue, set `user` to `null`.  *  For automatic assignment, set `accountId` to `-1`.
  List<JiraSingleSelectUserPickerField> singleSelectClearableUserPickerFields;

  /// Add or clear a single select field:   *  To add, specify the option with an `optionId`.  *  To clear, pass an option with `optionId` as `-1`.
  List<JiraSingleSelectField> singleSelectFields;

  /// Add or clear a single version picker field:   *  To add, specify the version with a `versionId`.  *  To clear, set `versionId` to `-1`.
  List<JiraSingleVersionPickerField> singleVersionPickerFields;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraStatusInput? status;

  /// Edit the time tracking field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraTimeTrackingField? timeTrackingField;

  /// Add or clear a URL field:   *  To add, provide the `url` with the desired URL value.  *  To clear, set `url` to an empty string.
  List<JiraUrlField> urlFields;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraIssueFields &&
    _deepEquality.equals(other.cascadingSelectFields, cascadingSelectFields) &&
    _deepEquality.equals(other.clearableNumberFields, clearableNumberFields) &&
    _deepEquality.equals(other.colorFields, colorFields) &&
    _deepEquality.equals(other.datePickerFields, datePickerFields) &&
    _deepEquality.equals(other.dateTimePickerFields, dateTimePickerFields) &&
    other.issueType == issueType &&
    _deepEquality.equals(other.labelsFields, labelsFields) &&
    _deepEquality.equals(other.multipleGroupPickerFields, multipleGroupPickerFields) &&
    _deepEquality.equals(other.multipleSelectClearableUserPickerFields, multipleSelectClearableUserPickerFields) &&
    _deepEquality.equals(other.multipleSelectFields, multipleSelectFields) &&
    _deepEquality.equals(other.multipleVersionPickerFields, multipleVersionPickerFields) &&
    other.multiselectComponents == multiselectComponents &&
    other.originalEstimateField == originalEstimateField &&
    other.priority == priority &&
    _deepEquality.equals(other.richTextFields, richTextFields) &&
    _deepEquality.equals(other.singleGroupPickerFields, singleGroupPickerFields) &&
    _deepEquality.equals(other.singleLineTextFields, singleLineTextFields) &&
    _deepEquality.equals(other.singleSelectClearableUserPickerFields, singleSelectClearableUserPickerFields) &&
    _deepEquality.equals(other.singleSelectFields, singleSelectFields) &&
    _deepEquality.equals(other.singleVersionPickerFields, singleVersionPickerFields) &&
    other.status == status &&
    other.timeTrackingField == timeTrackingField &&
    _deepEquality.equals(other.urlFields, urlFields);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cascadingSelectFields.hashCode) +
    (clearableNumberFields.hashCode) +
    (colorFields.hashCode) +
    (datePickerFields.hashCode) +
    (dateTimePickerFields.hashCode) +
    (issueType == null ? 0 : issueType!.hashCode) +
    (labelsFields.hashCode) +
    (multipleGroupPickerFields.hashCode) +
    (multipleSelectClearableUserPickerFields.hashCode) +
    (multipleSelectFields.hashCode) +
    (multipleVersionPickerFields.hashCode) +
    (multiselectComponents == null ? 0 : multiselectComponents!.hashCode) +
    (originalEstimateField == null ? 0 : originalEstimateField!.hashCode) +
    (priority == null ? 0 : priority!.hashCode) +
    (richTextFields.hashCode) +
    (singleGroupPickerFields.hashCode) +
    (singleLineTextFields.hashCode) +
    (singleSelectClearableUserPickerFields.hashCode) +
    (singleSelectFields.hashCode) +
    (singleVersionPickerFields.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (timeTrackingField == null ? 0 : timeTrackingField!.hashCode) +
    (urlFields.hashCode);

  @override
  String toString() => 'JiraIssueFields[cascadingSelectFields=$cascadingSelectFields, clearableNumberFields=$clearableNumberFields, colorFields=$colorFields, datePickerFields=$datePickerFields, dateTimePickerFields=$dateTimePickerFields, issueType=$issueType, labelsFields=$labelsFields, multipleGroupPickerFields=$multipleGroupPickerFields, multipleSelectClearableUserPickerFields=$multipleSelectClearableUserPickerFields, multipleSelectFields=$multipleSelectFields, multipleVersionPickerFields=$multipleVersionPickerFields, multiselectComponents=$multiselectComponents, originalEstimateField=$originalEstimateField, priority=$priority, richTextFields=$richTextFields, singleGroupPickerFields=$singleGroupPickerFields, singleLineTextFields=$singleLineTextFields, singleSelectClearableUserPickerFields=$singleSelectClearableUserPickerFields, singleSelectFields=$singleSelectFields, singleVersionPickerFields=$singleVersionPickerFields, status=$status, timeTrackingField=$timeTrackingField, urlFields=$urlFields]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'cascadingSelectFields'] = this.cascadingSelectFields;
      json[r'clearableNumberFields'] = this.clearableNumberFields;
      json[r'colorFields'] = this.colorFields;
      json[r'datePickerFields'] = this.datePickerFields;
      json[r'dateTimePickerFields'] = this.dateTimePickerFields;
    if (this.issueType != null) {
      json[r'issueType'] = this.issueType;
    } else {
      json[r'issueType'] = null;
    }
      json[r'labelsFields'] = this.labelsFields;
      json[r'multipleGroupPickerFields'] = this.multipleGroupPickerFields;
      json[r'multipleSelectClearableUserPickerFields'] = this.multipleSelectClearableUserPickerFields;
      json[r'multipleSelectFields'] = this.multipleSelectFields;
      json[r'multipleVersionPickerFields'] = this.multipleVersionPickerFields;
    if (this.multiselectComponents != null) {
      json[r'multiselectComponents'] = this.multiselectComponents;
    } else {
      json[r'multiselectComponents'] = null;
    }
    if (this.originalEstimateField != null) {
      json[r'originalEstimateField'] = this.originalEstimateField;
    } else {
      json[r'originalEstimateField'] = null;
    }
    if (this.priority != null) {
      json[r'priority'] = this.priority;
    } else {
      json[r'priority'] = null;
    }
      json[r'richTextFields'] = this.richTextFields;
      json[r'singleGroupPickerFields'] = this.singleGroupPickerFields;
      json[r'singleLineTextFields'] = this.singleLineTextFields;
      json[r'singleSelectClearableUserPickerFields'] = this.singleSelectClearableUserPickerFields;
      json[r'singleSelectFields'] = this.singleSelectFields;
      json[r'singleVersionPickerFields'] = this.singleVersionPickerFields;
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.timeTrackingField != null) {
      json[r'timeTrackingField'] = this.timeTrackingField;
    } else {
      json[r'timeTrackingField'] = null;
    }
      json[r'urlFields'] = this.urlFields;
    return json;
  }

  /// Returns a new [JiraIssueFields] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraIssueFields? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JiraIssueFields(
        cascadingSelectFields: JiraCascadingSelectField.listFromJson(json[r'cascadingSelectFields']),
        clearableNumberFields: JiraNumberField.listFromJson(json[r'clearableNumberFields']),
        colorFields: JiraColorField.listFromJson(json[r'colorFields']),
        datePickerFields: JiraDateField.listFromJson(json[r'datePickerFields']),
        dateTimePickerFields: JiraDateTimeField.listFromJson(json[r'dateTimePickerFields']),
        issueType: JiraIssueTypeField.fromJson(json[r'issueType']),
        labelsFields: JiraLabelsField.listFromJson(json[r'labelsFields']),
        multipleGroupPickerFields: JiraMultipleGroupPickerField.listFromJson(json[r'multipleGroupPickerFields']),
        multipleSelectClearableUserPickerFields: JiraMultipleSelectUserPickerField.listFromJson(json[r'multipleSelectClearableUserPickerFields']),
        multipleSelectFields: JiraMultipleSelectField.listFromJson(json[r'multipleSelectFields']),
        multipleVersionPickerFields: JiraMultipleVersionPickerField.listFromJson(json[r'multipleVersionPickerFields']),
        multiselectComponents: JiraMultiSelectComponentField.fromJson(json[r'multiselectComponents']),
        originalEstimateField: JiraDurationField.fromJson(json[r'originalEstimateField']),
        priority: JiraPriorityField.fromJson(json[r'priority']),
        richTextFields: JiraRichTextField.listFromJson(json[r'richTextFields']),
        singleGroupPickerFields: JiraSingleGroupPickerField.listFromJson(json[r'singleGroupPickerFields']),
        singleLineTextFields: JiraSingleLineTextField.listFromJson(json[r'singleLineTextFields']),
        singleSelectClearableUserPickerFields: JiraSingleSelectUserPickerField.listFromJson(json[r'singleSelectClearableUserPickerFields']),
        singleSelectFields: JiraSingleSelectField.listFromJson(json[r'singleSelectFields']),
        singleVersionPickerFields: JiraSingleVersionPickerField.listFromJson(json[r'singleVersionPickerFields']),
        status: JiraStatusInput.fromJson(json[r'status']),
        timeTrackingField: JiraTimeTrackingField.fromJson(json[r'timeTrackingField']),
        urlFields: JiraUrlField.listFromJson(json[r'urlFields']),
      );
    }
    return null;
  }

  static List<JiraIssueFields> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraIssueFields>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraIssueFields.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraIssueFields> mapFromJson(dynamic json) {
    final map = <String, JiraIssueFields>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraIssueFields.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraIssueFields-objects as value to a dart map
  static Map<String, List<JiraIssueFields>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraIssueFields>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraIssueFields.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

