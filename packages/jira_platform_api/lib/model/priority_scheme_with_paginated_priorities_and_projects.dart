//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PrioritySchemeWithPaginatedPrioritiesAndProjects {
  /// Returns a new [PrioritySchemeWithPaginatedPrioritiesAndProjects] instance.
  PrioritySchemeWithPaginatedPrioritiesAndProjects({
    this.default_,
    this.defaultPriorityId,
    this.description,
    required this.id,
    this.isDefault,
    required this.name,
    this.priorities,
    this.projects,
    this.self,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? default_;

  /// The ID of the default issue priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultPriorityId;

  /// The description of the priority scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the priority scheme.
  String id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDefault;

  /// The name of the priority scheme
  String name;

  /// The paginated list of priorities.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PageBeanPriorityWithSequence? priorities;

  /// The paginated list of projects.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PageBeanProjectDetails? projects;

  /// The URL of the priority scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PrioritySchemeWithPaginatedPrioritiesAndProjects &&
    other.default_ == default_ &&
    other.defaultPriorityId == defaultPriorityId &&
    other.description == description &&
    other.id == id &&
    other.isDefault == isDefault &&
    other.name == name &&
    other.priorities == priorities &&
    other.projects == projects &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (default_ == null ? 0 : default_!.hashCode) +
    (defaultPriorityId == null ? 0 : defaultPriorityId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (isDefault == null ? 0 : isDefault!.hashCode) +
    (name.hashCode) +
    (priorities == null ? 0 : priorities!.hashCode) +
    (projects == null ? 0 : projects!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'PrioritySchemeWithPaginatedPrioritiesAndProjects[default_=$default_, defaultPriorityId=$defaultPriorityId, description=$description, id=$id, isDefault=$isDefault, name=$name, priorities=$priorities, projects=$projects, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.default_ != null) {
      json[r'default'] = this.default_;
    } else {
      json[r'default'] = null;
    }
    if (this.defaultPriorityId != null) {
      json[r'defaultPriorityId'] = this.defaultPriorityId;
    } else {
      json[r'defaultPriorityId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
    if (this.isDefault != null) {
      json[r'isDefault'] = this.isDefault;
    } else {
      json[r'isDefault'] = null;
    }
      json[r'name'] = this.name;
    if (this.priorities != null) {
      json[r'priorities'] = this.priorities;
    } else {
      json[r'priorities'] = null;
    }
    if (this.projects != null) {
      json[r'projects'] = this.projects;
    } else {
      json[r'projects'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [PrioritySchemeWithPaginatedPrioritiesAndProjects] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PrioritySchemeWithPaginatedPrioritiesAndProjects? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "PrioritySchemeWithPaginatedPrioritiesAndProjects[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "PrioritySchemeWithPaginatedPrioritiesAndProjects[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "PrioritySchemeWithPaginatedPrioritiesAndProjects[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "PrioritySchemeWithPaginatedPrioritiesAndProjects[name]" has a null value in JSON.');
        return true;
      }());

      return PrioritySchemeWithPaginatedPrioritiesAndProjects(
        default_: mapValueOfType<bool>(json, r'default'),
        defaultPriorityId: mapValueOfType<String>(json, r'defaultPriorityId'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        isDefault: mapValueOfType<bool>(json, r'isDefault'),
        name: mapValueOfType<String>(json, r'name')!,
        priorities: PageBeanPriorityWithSequence.fromJson(json[r'priorities']),
        projects: PageBeanProjectDetails.fromJson(json[r'projects']),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<PrioritySchemeWithPaginatedPrioritiesAndProjects> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PrioritySchemeWithPaginatedPrioritiesAndProjects>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PrioritySchemeWithPaginatedPrioritiesAndProjects.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PrioritySchemeWithPaginatedPrioritiesAndProjects> mapFromJson(dynamic json) {
    final map = <String, PrioritySchemeWithPaginatedPrioritiesAndProjects>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PrioritySchemeWithPaginatedPrioritiesAndProjects.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PrioritySchemeWithPaginatedPrioritiesAndProjects-objects as value to a dart map
  static Map<String, List<PrioritySchemeWithPaginatedPrioritiesAndProjects>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PrioritySchemeWithPaginatedPrioritiesAndProjects>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PrioritySchemeWithPaginatedPrioritiesAndProjects.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
  };
}

