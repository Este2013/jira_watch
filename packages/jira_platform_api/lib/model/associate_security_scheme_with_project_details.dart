//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AssociateSecuritySchemeWithProjectDetails {
  /// Returns a new [AssociateSecuritySchemeWithProjectDetails] instance.
  AssociateSecuritySchemeWithProjectDetails({
    this.oldToNewSecurityLevelMappings = const [],
    required this.projectId,
    required this.schemeId,
  });

  /// The list of scheme levels which should be remapped to new levels of the issue security scheme.
  List<OldToNewSecurityLevelMappingsBean> oldToNewSecurityLevelMappings;

  /// The ID of the project.
  String projectId;

  /// The ID of the issue security scheme. Providing null will clear the association with the issue security scheme.
  String schemeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AssociateSecuritySchemeWithProjectDetails &&
    _deepEquality.equals(other.oldToNewSecurityLevelMappings, oldToNewSecurityLevelMappings) &&
    other.projectId == projectId &&
    other.schemeId == schemeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (oldToNewSecurityLevelMappings.hashCode) +
    (projectId.hashCode) +
    (schemeId.hashCode);

  @override
  String toString() => 'AssociateSecuritySchemeWithProjectDetails[oldToNewSecurityLevelMappings=$oldToNewSecurityLevelMappings, projectId=$projectId, schemeId=$schemeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'oldToNewSecurityLevelMappings'] = this.oldToNewSecurityLevelMappings;
      json[r'projectId'] = this.projectId;
      json[r'schemeId'] = this.schemeId;
    return json;
  }

  /// Returns a new [AssociateSecuritySchemeWithProjectDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AssociateSecuritySchemeWithProjectDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'projectId'), 'Required key "AssociateSecuritySchemeWithProjectDetails[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "AssociateSecuritySchemeWithProjectDetails[projectId]" has a null value in JSON.');
        assert(json.containsKey(r'schemeId'), 'Required key "AssociateSecuritySchemeWithProjectDetails[schemeId]" is missing from JSON.');
        assert(json[r'schemeId'] != null, 'Required key "AssociateSecuritySchemeWithProjectDetails[schemeId]" has a null value in JSON.');
        return true;
      }());

      return AssociateSecuritySchemeWithProjectDetails(
        oldToNewSecurityLevelMappings: OldToNewSecurityLevelMappingsBean.listFromJson(json[r'oldToNewSecurityLevelMappings']),
        projectId: mapValueOfType<String>(json, r'projectId')!,
        schemeId: mapValueOfType<String>(json, r'schemeId')!,
      );
    }
    return null;
  }

  static List<AssociateSecuritySchemeWithProjectDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AssociateSecuritySchemeWithProjectDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssociateSecuritySchemeWithProjectDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AssociateSecuritySchemeWithProjectDetails> mapFromJson(dynamic json) {
    final map = <String, AssociateSecuritySchemeWithProjectDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssociateSecuritySchemeWithProjectDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AssociateSecuritySchemeWithProjectDetails-objects as value to a dart map
  static Map<String, List<AssociateSecuritySchemeWithProjectDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AssociateSecuritySchemeWithProjectDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AssociateSecuritySchemeWithProjectDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectId',
    'schemeId',
  };
}

