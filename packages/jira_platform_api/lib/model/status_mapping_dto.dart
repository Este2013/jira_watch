//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusMappingDTO {
  /// Returns a new [StatusMappingDTO] instance.
  StatusMappingDTO({
    required this.issueTypeId,
    required this.projectId,
    this.statusMigrations = const [],
  });

  /// The issue type for the status mapping.
  String issueTypeId;

  /// The project for the status mapping.
  String projectId;

  /// The list of old and new status ID mappings for the specified project and issue type.
  List<StatusMigration> statusMigrations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusMappingDTO &&
    other.issueTypeId == issueTypeId &&
    other.projectId == projectId &&
    _deepEquality.equals(other.statusMigrations, statusMigrations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeId.hashCode) +
    (projectId.hashCode) +
    (statusMigrations.hashCode);

  @override
  String toString() => 'StatusMappingDTO[issueTypeId=$issueTypeId, projectId=$projectId, statusMigrations=$statusMigrations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeId'] = this.issueTypeId;
      json[r'projectId'] = this.projectId;
      json[r'statusMigrations'] = this.statusMigrations;
    return json;
  }

  /// Returns a new [StatusMappingDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusMappingDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeId'), 'Required key "StatusMappingDTO[issueTypeId]" is missing from JSON.');
        assert(json[r'issueTypeId'] != null, 'Required key "StatusMappingDTO[issueTypeId]" has a null value in JSON.');
        assert(json.containsKey(r'projectId'), 'Required key "StatusMappingDTO[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "StatusMappingDTO[projectId]" has a null value in JSON.');
        assert(json.containsKey(r'statusMigrations'), 'Required key "StatusMappingDTO[statusMigrations]" is missing from JSON.');
        assert(json[r'statusMigrations'] != null, 'Required key "StatusMappingDTO[statusMigrations]" has a null value in JSON.');
        return true;
      }());

      return StatusMappingDTO(
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
        statusMigrations: StatusMigration.listFromJson(json[r'statusMigrations']),
      );
    }
    return null;
  }

  static List<StatusMappingDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusMappingDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusMappingDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusMappingDTO> mapFromJson(dynamic json) {
    final map = <String, StatusMappingDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusMappingDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusMappingDTO-objects as value to a dart map
  static Map<String, List<StatusMappingDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusMappingDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusMappingDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeId',
    'projectId',
    'statusMigrations',
  };
}

