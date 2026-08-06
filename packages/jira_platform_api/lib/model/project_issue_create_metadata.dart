//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectIssueCreateMetadata {
  /// Returns a new [ProjectIssueCreateMetadata] instance.
  ProjectIssueCreateMetadata({
    this.avatarUrls,
    this.expand,
    this.id,
    this.issuetypes = const [],
    this.key,
    this.name,
    this.self,
  });

  /// List of the project's avatars, returning the avatar size and associated URL.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AvatarUrlsBean? avatarUrls;

  /// Expand options that include additional project issue create metadata details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// The ID of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// List of the issue types supported by the project.
  List<IssueTypeIssueCreateMetadata> issuetypes;

  /// The key of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The name of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The URL of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectIssueCreateMetadata &&
    other.avatarUrls == avatarUrls &&
    other.expand == expand &&
    other.id == id &&
    _deepEquality.equals(other.issuetypes, issuetypes) &&
    other.key == key &&
    other.name == name &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (avatarUrls == null ? 0 : avatarUrls!.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (issuetypes.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'ProjectIssueCreateMetadata[avatarUrls=$avatarUrls, expand=$expand, id=$id, issuetypes=$issuetypes, key=$key, name=$name, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.avatarUrls != null) {
      json[r'avatarUrls'] = this.avatarUrls;
    } else {
      json[r'avatarUrls'] = null;
    }
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'issuetypes'] = this.issuetypes;
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectIssueCreateMetadata] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectIssueCreateMetadata? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectIssueCreateMetadata(
        avatarUrls: AvatarUrlsBean.fromJson(json[r'avatarUrls']),
        expand: mapValueOfType<String>(json, r'expand'),
        id: mapValueOfType<String>(json, r'id'),
        issuetypes: IssueTypeIssueCreateMetadata.listFromJson(json[r'issuetypes']),
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<ProjectIssueCreateMetadata> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectIssueCreateMetadata>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectIssueCreateMetadata.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectIssueCreateMetadata> mapFromJson(dynamic json) {
    final map = <String, ProjectIssueCreateMetadata>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectIssueCreateMetadata.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectIssueCreateMetadata-objects as value to a dart map
  static Map<String, List<ProjectIssueCreateMetadata>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectIssueCreateMetadata>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectIssueCreateMetadata.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

