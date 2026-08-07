//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TargetToSourcesMapping {
  /// Returns a new [TargetToSourcesMapping] instance.
  TargetToSourcesMapping({
    required this.inferClassificationDefaults,
    required this.inferFieldDefaults,
    required this.inferStatusDefaults,
    required this.inferSubtaskTypeDefault,
    this.issueIdsOrKeys = const [],
    this.targetClassification = const [],
    this.targetMandatoryFields = const [],
    this.targetStatus = const [],
  });

  /// If `true`, when issues are moved into this target group, they will adopt the target project's default classification, if they don't have a classification already. If they do have a classification, it will be kept the same even after the move. Leave `targetClassification` empty when using this.  If `false`, you must provide a `targetClassification` mapping for each classification associated with the selected issues.  [Benefit from data classification](https://support.atlassian.com/security-and-access-policies/docs/what-is-data-classification/)
  bool inferClassificationDefaults;

  /// If `true`, values from the source issues will be retained for the mandatory fields in the field configuration of the destination project. The `targetMandatoryFields` property shouldn't be defined.  If `false`, the user is required to set values for mandatory fields present in the field configuration of the destination project. Provide input by defining the `targetMandatoryFields` property
  bool inferFieldDefaults;

  /// If `true`, the statuses of issues being moved in this target group that are not present in the target workflow will be changed to the default status of the target workflow (see below). Leave `targetStatus` empty when using this.  If `false`, you must provide a `targetStatus` for each status not present in the target workflow.  The default status in a workflow is referred to as the \"initial status\". Each workflow has its own unique initial status. When an issue is created, it is automatically assigned to this initial status. Read more about configuring initial statuses: [Configure the initial status | Atlassian Support.](https://support.atlassian.com/jira-cloud-administration/docs/configure-the-initial-status/)
  bool inferStatusDefaults;

  /// When an issue is moved, its subtasks (if there are any) need to be moved with it. `inferSubtaskTypeDefault` helps with moving the subtasks by picking a random subtask type in the target project.  If `true`, subtasks will automatically move to the same project as their parent.  When they move:   *  Their `issueType` will be set to the default for subtasks in the target project.  *  Values for mandatory fields will be retained from the source issues  *  Specifying separate mapping for implicit subtasks won’t be allowed.  If `false`, you must manually move the subtasks. They will retain the parent which they had in the current project after being moved.
  bool inferSubtaskTypeDefault;

  /// List of issue IDs or keys to be moved.
  List<String> issueIdsOrKeys;

  /// List of the objects containing classifications in the source issues and their new values which need to be set during the bulk move operation.  It is mandatory to provide source classification to target classification mapping when the source classification is invalid for the target project and issue type.   *  **You should only define this property when `inferClassificationDefaults` is `false`.**  *  **In order to provide mapping for issues which don't have a classification, use `\"-1\"`.**
  List<TargetClassification>? targetClassification;

  /// List of objects containing mandatory fields in the target field configuration and new values that need to be set during the bulk move operation.  The new values will only be applied if the field is mandatory in the target project and at least one issue from the source has that field empty, or if the field context is different in the target project (e.g. project-scoped version fields).  **You should only define this property when `inferFieldDefaults` is `false`.**
  List<TargetMandatoryFields>? targetMandatoryFields;

  /// List of the objects containing statuses in the source workflow and their new values which need to be set during the bulk move operation.  The new values will only be applied if the source status is invalid for the target project and issue type.  It is mandatory to provide source status to target status mapping when the source status is invalid for the target project and issue type.  **You should only define this property when `inferStatusDefaults` is `false`.**
  List<TargetStatus>? targetStatus;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TargetToSourcesMapping &&
    other.inferClassificationDefaults == inferClassificationDefaults &&
    other.inferFieldDefaults == inferFieldDefaults &&
    other.inferStatusDefaults == inferStatusDefaults &&
    other.inferSubtaskTypeDefault == inferSubtaskTypeDefault &&
    _deepEquality.equals(other.issueIdsOrKeys, issueIdsOrKeys) &&
    _deepEquality.equals(other.targetClassification, targetClassification) &&
    _deepEquality.equals(other.targetMandatoryFields, targetMandatoryFields) &&
    _deepEquality.equals(other.targetStatus, targetStatus);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (inferClassificationDefaults.hashCode) +
    (inferFieldDefaults.hashCode) +
    (inferStatusDefaults.hashCode) +
    (inferSubtaskTypeDefault.hashCode) +
    (issueIdsOrKeys.hashCode) +
    (targetClassification == null ? 0 : targetClassification!.hashCode) +
    (targetMandatoryFields == null ? 0 : targetMandatoryFields!.hashCode) +
    (targetStatus == null ? 0 : targetStatus!.hashCode);

  @override
  String toString() => 'TargetToSourcesMapping[inferClassificationDefaults=$inferClassificationDefaults, inferFieldDefaults=$inferFieldDefaults, inferStatusDefaults=$inferStatusDefaults, inferSubtaskTypeDefault=$inferSubtaskTypeDefault, issueIdsOrKeys=$issueIdsOrKeys, targetClassification=$targetClassification, targetMandatoryFields=$targetMandatoryFields, targetStatus=$targetStatus]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'inferClassificationDefaults'] = this.inferClassificationDefaults;
      json[r'inferFieldDefaults'] = this.inferFieldDefaults;
      json[r'inferStatusDefaults'] = this.inferStatusDefaults;
      json[r'inferSubtaskTypeDefault'] = this.inferSubtaskTypeDefault;
      json[r'issueIdsOrKeys'] = this.issueIdsOrKeys;
    if (this.targetClassification != null) {
      json[r'targetClassification'] = this.targetClassification;
    } else {
      json[r'targetClassification'] = null;
    }
    if (this.targetMandatoryFields != null) {
      json[r'targetMandatoryFields'] = this.targetMandatoryFields;
    } else {
      json[r'targetMandatoryFields'] = null;
    }
    if (this.targetStatus != null) {
      json[r'targetStatus'] = this.targetStatus;
    } else {
      json[r'targetStatus'] = null;
    }
    return json;
  }

  /// Returns a new [TargetToSourcesMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TargetToSourcesMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'inferClassificationDefaults'), 'Required key "TargetToSourcesMapping[inferClassificationDefaults]" is missing from JSON.');
        assert(json[r'inferClassificationDefaults'] != null, 'Required key "TargetToSourcesMapping[inferClassificationDefaults]" has a null value in JSON.');
        assert(json.containsKey(r'inferFieldDefaults'), 'Required key "TargetToSourcesMapping[inferFieldDefaults]" is missing from JSON.');
        assert(json[r'inferFieldDefaults'] != null, 'Required key "TargetToSourcesMapping[inferFieldDefaults]" has a null value in JSON.');
        assert(json.containsKey(r'inferStatusDefaults'), 'Required key "TargetToSourcesMapping[inferStatusDefaults]" is missing from JSON.');
        assert(json[r'inferStatusDefaults'] != null, 'Required key "TargetToSourcesMapping[inferStatusDefaults]" has a null value in JSON.');
        assert(json.containsKey(r'inferSubtaskTypeDefault'), 'Required key "TargetToSourcesMapping[inferSubtaskTypeDefault]" is missing from JSON.');
        assert(json[r'inferSubtaskTypeDefault'] != null, 'Required key "TargetToSourcesMapping[inferSubtaskTypeDefault]" has a null value in JSON.');
        return true;
      }());

      return TargetToSourcesMapping(
        inferClassificationDefaults: mapValueOfType<bool>(json, r'inferClassificationDefaults')!,
        inferFieldDefaults: mapValueOfType<bool>(json, r'inferFieldDefaults')!,
        inferStatusDefaults: mapValueOfType<bool>(json, r'inferStatusDefaults')!,
        inferSubtaskTypeDefault: mapValueOfType<bool>(json, r'inferSubtaskTypeDefault')!,
        issueIdsOrKeys: json[r'issueIdsOrKeys'] is Iterable
            ? (json[r'issueIdsOrKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        targetClassification: TargetClassification.listFromJson(json[r'targetClassification']),
        targetMandatoryFields: TargetMandatoryFields.listFromJson(json[r'targetMandatoryFields']),
        targetStatus: TargetStatus.listFromJson(json[r'targetStatus']),
      );
    }
    return null;
  }

  static List<TargetToSourcesMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TargetToSourcesMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TargetToSourcesMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TargetToSourcesMapping> mapFromJson(dynamic json) {
    final map = <String, TargetToSourcesMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TargetToSourcesMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TargetToSourcesMapping-objects as value to a dart map
  static Map<String, List<TargetToSourcesMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TargetToSourcesMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TargetToSourcesMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'inferClassificationDefaults',
    'inferFieldDefaults',
    'inferStatusDefaults',
    'inferSubtaskTypeDefault',
  };
}

