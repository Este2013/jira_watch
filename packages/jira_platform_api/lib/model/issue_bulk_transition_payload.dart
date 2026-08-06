//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBulkTransitionPayload {
  /// Returns a new [IssueBulkTransitionPayload] instance.
  IssueBulkTransitionPayload({
    this.bulkTransitionInputs = const [],
    this.sendBulkNotification = true,
  });

  /// List of objects and each object has two properties:   *  Issues that will be bulk transitioned.  *  TransitionId that corresponds to a specific transition of issues that share the same workflow.
  List<BulkTransitionSubmitInput> bulkTransitionInputs;

  /// A boolean value that indicates whether to send a bulk change notification when the issues are being transitioned.  If `true`, dispatches a bulk notification email to users about the updates.
  bool? sendBulkNotification;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBulkTransitionPayload &&
    _deepEquality.equals(other.bulkTransitionInputs, bulkTransitionInputs) &&
    other.sendBulkNotification == sendBulkNotification;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bulkTransitionInputs.hashCode) +
    (sendBulkNotification == null ? 0 : sendBulkNotification!.hashCode);

  @override
  String toString() => 'IssueBulkTransitionPayload[bulkTransitionInputs=$bulkTransitionInputs, sendBulkNotification=$sendBulkNotification]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'bulkTransitionInputs'] = this.bulkTransitionInputs;
    if (this.sendBulkNotification != null) {
      json[r'sendBulkNotification'] = this.sendBulkNotification;
    } else {
      json[r'sendBulkNotification'] = null;
    }
    return json;
  }

  /// Returns a new [IssueBulkTransitionPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBulkTransitionPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'bulkTransitionInputs'), 'Required key "IssueBulkTransitionPayload[bulkTransitionInputs]" is missing from JSON.');
        assert(json[r'bulkTransitionInputs'] != null, 'Required key "IssueBulkTransitionPayload[bulkTransitionInputs]" has a null value in JSON.');
        return true;
      }());

      return IssueBulkTransitionPayload(
        bulkTransitionInputs: BulkTransitionSubmitInput.listFromJson(json[r'bulkTransitionInputs']),
        sendBulkNotification: mapValueOfType<bool>(json, r'sendBulkNotification') ?? true,
      );
    }
    return null;
  }

  static List<IssueBulkTransitionPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBulkTransitionPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBulkTransitionPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBulkTransitionPayload> mapFromJson(dynamic json) {
    final map = <String, IssueBulkTransitionPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBulkTransitionPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBulkTransitionPayload-objects as value to a dart map
  static Map<String, List<IssueBulkTransitionPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBulkTransitionPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBulkTransitionPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'bulkTransitionInputs',
  };
}

