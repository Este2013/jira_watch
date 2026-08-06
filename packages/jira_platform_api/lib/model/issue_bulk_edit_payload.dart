//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBulkEditPayload {
  /// Returns a new [IssueBulkEditPayload] instance.
  IssueBulkEditPayload({
    required this.editedFieldsInput,
    this.selectedActions = const [],
    this.selectedIssueIdsOrKeys = const [],
    this.sendBulkNotification = true,
  });

  /// An object that defines the values to be updated in specified fields of an issue. The structure and content of this parameter vary depending on the type of field being edited. Although the order is not significant, ensure that field IDs align with those in selectedActions.
  JiraIssueFields editedFieldsInput;

  /// List of all the field IDs that are to be bulk edited. Each field ID in this list corresponds to a specific attribute of an issue that is set to be modified in the bulk edit operation. The relevant field ID can be obtained by calling the Bulk Edit Get Fields REST API (documentation available on this page itself).
  List<String> selectedActions;

  /// List of issue IDs or keys which are to be bulk edited. These IDs or keys can be from different projects and issue types.
  List<String> selectedIssueIdsOrKeys;

  /// A boolean value that indicates whether to send a bulk change notification when the issues are being edited.  If `true`, dispatches a bulk notification email to users about the updates.
  bool? sendBulkNotification;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBulkEditPayload &&
    other.editedFieldsInput == editedFieldsInput &&
    _deepEquality.equals(other.selectedActions, selectedActions) &&
    _deepEquality.equals(other.selectedIssueIdsOrKeys, selectedIssueIdsOrKeys) &&
    other.sendBulkNotification == sendBulkNotification;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (editedFieldsInput.hashCode) +
    (selectedActions.hashCode) +
    (selectedIssueIdsOrKeys.hashCode) +
    (sendBulkNotification == null ? 0 : sendBulkNotification!.hashCode);

  @override
  String toString() => 'IssueBulkEditPayload[editedFieldsInput=$editedFieldsInput, selectedActions=$selectedActions, selectedIssueIdsOrKeys=$selectedIssueIdsOrKeys, sendBulkNotification=$sendBulkNotification]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'editedFieldsInput'] = this.editedFieldsInput;
      json[r'selectedActions'] = this.selectedActions;
      json[r'selectedIssueIdsOrKeys'] = this.selectedIssueIdsOrKeys;
    if (this.sendBulkNotification != null) {
      json[r'sendBulkNotification'] = this.sendBulkNotification;
    } else {
      json[r'sendBulkNotification'] = null;
    }
    return json;
  }

  /// Returns a new [IssueBulkEditPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBulkEditPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'editedFieldsInput'), 'Required key "IssueBulkEditPayload[editedFieldsInput]" is missing from JSON.');
        assert(json[r'editedFieldsInput'] != null, 'Required key "IssueBulkEditPayload[editedFieldsInput]" has a null value in JSON.');
        assert(json.containsKey(r'selectedActions'), 'Required key "IssueBulkEditPayload[selectedActions]" is missing from JSON.');
        assert(json[r'selectedActions'] != null, 'Required key "IssueBulkEditPayload[selectedActions]" has a null value in JSON.');
        assert(json.containsKey(r'selectedIssueIdsOrKeys'), 'Required key "IssueBulkEditPayload[selectedIssueIdsOrKeys]" is missing from JSON.');
        assert(json[r'selectedIssueIdsOrKeys'] != null, 'Required key "IssueBulkEditPayload[selectedIssueIdsOrKeys]" has a null value in JSON.');
        return true;
      }());

      return IssueBulkEditPayload(
        editedFieldsInput: JiraIssueFields.fromJson(json[r'editedFieldsInput'])!,
        selectedActions: json[r'selectedActions'] is Iterable
            ? (json[r'selectedActions'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        selectedIssueIdsOrKeys: json[r'selectedIssueIdsOrKeys'] is Iterable
            ? (json[r'selectedIssueIdsOrKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        sendBulkNotification: mapValueOfType<bool>(json, r'sendBulkNotification') ?? true,
      );
    }
    return null;
  }

  static List<IssueBulkEditPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBulkEditPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBulkEditPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBulkEditPayload> mapFromJson(dynamic json) {
    final map = <String, IssueBulkEditPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBulkEditPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBulkEditPayload-objects as value to a dart map
  static Map<String, List<IssueBulkEditPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBulkEditPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBulkEditPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'editedFieldsInput',
    'selectedActions',
    'selectedIssueIdsOrKeys',
  };
}

