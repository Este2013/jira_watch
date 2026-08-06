//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBulkDeletePayload {
  /// Returns a new [IssueBulkDeletePayload] instance.
  IssueBulkDeletePayload({
    this.selectedIssueIdsOrKeys = const [],
    this.sendBulkNotification = true,
  });

  /// List of issue IDs or keys which are to be bulk deleted. These IDs or keys can be from different projects and issue types.
  List<String> selectedIssueIdsOrKeys;

  /// A boolean value that indicates whether to send a bulk change notification when the issues are being deleted.  If `true`, dispatches a bulk notification email to users about the updates.
  bool? sendBulkNotification;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBulkDeletePayload &&
    _deepEquality.equals(other.selectedIssueIdsOrKeys, selectedIssueIdsOrKeys) &&
    other.sendBulkNotification == sendBulkNotification;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (selectedIssueIdsOrKeys.hashCode) +
    (sendBulkNotification == null ? 0 : sendBulkNotification!.hashCode);

  @override
  String toString() => 'IssueBulkDeletePayload[selectedIssueIdsOrKeys=$selectedIssueIdsOrKeys, sendBulkNotification=$sendBulkNotification]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'selectedIssueIdsOrKeys'] = this.selectedIssueIdsOrKeys;
    if (this.sendBulkNotification != null) {
      json[r'sendBulkNotification'] = this.sendBulkNotification;
    } else {
      json[r'sendBulkNotification'] = null;
    }
    return json;
  }

  /// Returns a new [IssueBulkDeletePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBulkDeletePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'selectedIssueIdsOrKeys'), 'Required key "IssueBulkDeletePayload[selectedIssueIdsOrKeys]" is missing from JSON.');
        assert(json[r'selectedIssueIdsOrKeys'] != null, 'Required key "IssueBulkDeletePayload[selectedIssueIdsOrKeys]" has a null value in JSON.');
        return true;
      }());

      return IssueBulkDeletePayload(
        selectedIssueIdsOrKeys: json[r'selectedIssueIdsOrKeys'] is Iterable
            ? (json[r'selectedIssueIdsOrKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        sendBulkNotification: mapValueOfType<bool>(json, r'sendBulkNotification') ?? true,
      );
    }
    return null;
  }

  static List<IssueBulkDeletePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBulkDeletePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBulkDeletePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBulkDeletePayload> mapFromJson(dynamic json) {
    final map = <String, IssueBulkDeletePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBulkDeletePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBulkDeletePayload-objects as value to a dart map
  static Map<String, List<IssueBulkDeletePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBulkDeletePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBulkDeletePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'selectedIssueIdsOrKeys',
  };
}

