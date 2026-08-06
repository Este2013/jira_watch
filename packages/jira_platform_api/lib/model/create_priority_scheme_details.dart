//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatePrioritySchemeDetails {
  /// Returns a new [CreatePrioritySchemeDetails] instance.
  CreatePrioritySchemeDetails({
    required this.defaultPriorityId,
    this.description,
    this.mappings,
    required this.name,
    this.priorityIds = const [],
    this.projectIds = const [],
  });

  /// The ID of the default priority for the priority scheme.
  int defaultPriorityId;

  /// The description of the priority scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Instructions to migrate the priorities of issues.  `in` mappings are used to migrate the priorities of issues to priorities used within the priority scheme.  `out` mappings are used to migrate the priorities of issues to priorities not used within the priority scheme.   *  When **priorities** are **added** to the new priority scheme, no mapping needs to be provided as the new priorities are not used by any issues.  *  When **priorities** are **removed** from the new priority scheme, no mapping needs to be provided as the removed priorities are not used by any issues.  *  When **projects** are **added** to the priority scheme, the priorities of issues in those projects might need to be migrated to new priorities used by the priority scheme. This can occur when the current scheme does not use all the priorities in the project(s)' priority scheme(s).           *  An `in` mapping must be provided for each of these priorities.  *  When **projects** are **removed** from the priority scheme, no mapping needs to be provided as the removed projects are not using the priorities of the new priority scheme.  For more information on `in` and `out` mappings, see the child properties documentation for the `PriorityMapping` object below.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PriorityMapping? mappings;

  /// The name of the priority scheme. Must be unique.
  String name;

  /// The IDs of priorities in the scheme.
  List<int> priorityIds;

  /// The IDs of projects that will use the priority scheme.
  List<int> projectIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreatePrioritySchemeDetails &&
    other.defaultPriorityId == defaultPriorityId &&
    other.description == description &&
    other.mappings == mappings &&
    other.name == name &&
    _deepEquality.equals(other.priorityIds, priorityIds) &&
    _deepEquality.equals(other.projectIds, projectIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultPriorityId.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (mappings == null ? 0 : mappings!.hashCode) +
    (name.hashCode) +
    (priorityIds.hashCode) +
    (projectIds.hashCode);

  @override
  String toString() => 'CreatePrioritySchemeDetails[defaultPriorityId=$defaultPriorityId, description=$description, mappings=$mappings, name=$name, priorityIds=$priorityIds, projectIds=$projectIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'defaultPriorityId'] = this.defaultPriorityId;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.mappings != null) {
      json[r'mappings'] = this.mappings;
    } else {
      json[r'mappings'] = null;
    }
      json[r'name'] = this.name;
      json[r'priorityIds'] = this.priorityIds;
      json[r'projectIds'] = this.projectIds;
    return json;
  }

  /// Returns a new [CreatePrioritySchemeDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatePrioritySchemeDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'defaultPriorityId'), 'Required key "CreatePrioritySchemeDetails[defaultPriorityId]" is missing from JSON.');
        assert(json[r'defaultPriorityId'] != null, 'Required key "CreatePrioritySchemeDetails[defaultPriorityId]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "CreatePrioritySchemeDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreatePrioritySchemeDetails[name]" has a null value in JSON.');
        assert(json.containsKey(r'priorityIds'), 'Required key "CreatePrioritySchemeDetails[priorityIds]" is missing from JSON.');
        assert(json[r'priorityIds'] != null, 'Required key "CreatePrioritySchemeDetails[priorityIds]" has a null value in JSON.');
        return true;
      }());

      return CreatePrioritySchemeDetails(
        defaultPriorityId: mapValueOfType<int>(json, r'defaultPriorityId')!,
        description: mapValueOfType<String>(json, r'description'),
        mappings: PriorityMapping.fromJson(json[r'mappings']),
        name: mapValueOfType<String>(json, r'name')!,
        priorityIds: json[r'priorityIds'] is Iterable
            ? (json[r'priorityIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<CreatePrioritySchemeDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePrioritySchemeDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePrioritySchemeDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatePrioritySchemeDetails> mapFromJson(dynamic json) {
    final map = <String, CreatePrioritySchemeDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatePrioritySchemeDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatePrioritySchemeDetails-objects as value to a dart map
  static Map<String, List<CreatePrioritySchemeDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreatePrioritySchemeDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatePrioritySchemeDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'defaultPriorityId',
    'name',
    'priorityIds',
  };
}

