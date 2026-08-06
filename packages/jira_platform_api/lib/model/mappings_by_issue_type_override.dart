//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MappingsByIssueTypeOverride {
  /// Returns a new [MappingsByIssueTypeOverride] instance.
  MappingsByIssueTypeOverride({
    this.issueTypeId,
    this.statusMappings = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueTypeId;

  List<WorkflowAssociationStatusMapping> statusMappings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MappingsByIssueTypeOverride &&
    other.issueTypeId == issueTypeId &&
    _deepEquality.equals(other.statusMappings, statusMappings);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeId == null ? 0 : issueTypeId!.hashCode) +
    (statusMappings.hashCode);

  @override
  String toString() => 'MappingsByIssueTypeOverride[issueTypeId=$issueTypeId, statusMappings=$statusMappings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueTypeId != null) {
      json[r'issueTypeId'] = this.issueTypeId;
    } else {
      json[r'issueTypeId'] = null;
    }
      json[r'statusMappings'] = this.statusMappings;
    return json;
  }

  /// Returns a new [MappingsByIssueTypeOverride] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MappingsByIssueTypeOverride? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return MappingsByIssueTypeOverride(
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId'),
        statusMappings: WorkflowAssociationStatusMapping.listFromJson(json[r'statusMappings']),
      );
    }
    return null;
  }

  static List<MappingsByIssueTypeOverride> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MappingsByIssueTypeOverride>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MappingsByIssueTypeOverride.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MappingsByIssueTypeOverride> mapFromJson(dynamic json) {
    final map = <String, MappingsByIssueTypeOverride>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MappingsByIssueTypeOverride.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MappingsByIssueTypeOverride-objects as value to a dart map
  static Map<String, List<MappingsByIssueTypeOverride>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MappingsByIssueTypeOverride>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MappingsByIssueTypeOverride.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

