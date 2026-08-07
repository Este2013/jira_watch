//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusMapping {
  /// Returns a new [StatusMapping] instance.
  StatusMapping({
    required this.issueTypeId,
    required this.newStatusId,
    required this.statusId,
  });

  /// The ID of the issue type.
  String issueTypeId;

  /// The ID of the new status.
  String newStatusId;

  /// The ID of the status.
  String statusId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusMapping &&
    other.issueTypeId == issueTypeId &&
    other.newStatusId == newStatusId &&
    other.statusId == statusId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeId.hashCode) +
    (newStatusId.hashCode) +
    (statusId.hashCode);

  @override
  String toString() => 'StatusMapping[issueTypeId=$issueTypeId, newStatusId=$newStatusId, statusId=$statusId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeId'] = this.issueTypeId;
      json[r'newStatusId'] = this.newStatusId;
      json[r'statusId'] = this.statusId;
    return json;
  }

  /// Returns a new [StatusMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeId'), 'Required key "StatusMapping[issueTypeId]" is missing from JSON.');
        assert(json[r'issueTypeId'] != null, 'Required key "StatusMapping[issueTypeId]" has a null value in JSON.');
        assert(json.containsKey(r'newStatusId'), 'Required key "StatusMapping[newStatusId]" is missing from JSON.');
        assert(json[r'newStatusId'] != null, 'Required key "StatusMapping[newStatusId]" has a null value in JSON.');
        assert(json.containsKey(r'statusId'), 'Required key "StatusMapping[statusId]" is missing from JSON.');
        assert(json[r'statusId'] != null, 'Required key "StatusMapping[statusId]" has a null value in JSON.');
        return true;
      }());

      return StatusMapping(
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId')!,
        newStatusId: mapValueOfType<String>(json, r'newStatusId')!,
        statusId: mapValueOfType<String>(json, r'statusId')!,
      );
    }
    return null;
  }

  static List<StatusMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusMapping> mapFromJson(dynamic json) {
    final map = <String, StatusMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusMapping-objects as value to a dart map
  static Map<String, List<StatusMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeId',
    'newStatusId',
    'statusId',
  };
}

