//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBulkMovePayload {
  /// Returns a new [IssueBulkMovePayload] instance.
  IssueBulkMovePayload({
    this.sendBulkNotification = true,
    this.targetToSourcesMapping = const {},
  });

  /// A boolean value that indicates whether to send a bulk change notification when the issues are being moved.  If `true`, dispatches a bulk notification email to users about the updates.
  bool? sendBulkNotification;

  /// An object representing the mapping of issues and data related to destination entities, like fields and statuses, that are required during a bulk move.  The key is a string that is created by concatenating the following three entities in order, separated by commas. The format is `<project ID or key>,<issueType ID>,<parent ID or key>`. It should be unique across mappings provided in the payload. If you provide multiple mappings for the same key, only one will be processed. However, the operation won't fail, so the error may be hard to track down.   *  ***Destination project*** (Required): ID or key of the project to which the issues are being moved.  *  ***Destination issueType*** (Required): ID of the issueType to which the issues are being moved.  *  ***Destination parent ID or key*** (Optional): ID or key of the issue which will become the parent of the issues being moved. Only required when the destination issueType is a subtask.
  Map<String, TargetToSourcesMapping> targetToSourcesMapping;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBulkMovePayload &&
    other.sendBulkNotification == sendBulkNotification &&
    _deepEquality.equals(other.targetToSourcesMapping, targetToSourcesMapping);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sendBulkNotification == null ? 0 : sendBulkNotification!.hashCode) +
    (targetToSourcesMapping.hashCode);

  @override
  String toString() => 'IssueBulkMovePayload[sendBulkNotification=$sendBulkNotification, targetToSourcesMapping=$targetToSourcesMapping]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.sendBulkNotification != null) {
      json[r'sendBulkNotification'] = this.sendBulkNotification;
    } else {
      json[r'sendBulkNotification'] = null;
    }
      json[r'targetToSourcesMapping'] = this.targetToSourcesMapping;
    return json;
  }

  /// Returns a new [IssueBulkMovePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBulkMovePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueBulkMovePayload(
        sendBulkNotification: mapValueOfType<bool>(json, r'sendBulkNotification') ?? true,
        targetToSourcesMapping: TargetToSourcesMapping.mapFromJson(json[r'targetToSourcesMapping']),
      );
    }
    return null;
  }

  static List<IssueBulkMovePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBulkMovePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBulkMovePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBulkMovePayload> mapFromJson(dynamic json) {
    final map = <String, IssueBulkMovePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBulkMovePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBulkMovePayload-objects as value to a dart map
  static Map<String, List<IssueBulkMovePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBulkMovePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBulkMovePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

