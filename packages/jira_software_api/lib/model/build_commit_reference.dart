//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BuildCommitReference {
  /// Returns a new [BuildCommitReference] instance.
  BuildCommitReference({
    required this.id,
    required this.repositoryUri,
  });

  /// The ID of the commit. E.g. for a Git repository this would be the SHA1 hash. 
  String id;

  /// An identifier for the repository containing the commit.  In most cases this should be the URL of the repository in the SCM provider.  For cases where the build was executed against a local repository etc. this should be some identifier that is unique to that repository. 
  String repositoryUri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BuildCommitReference &&
    other.id == id &&
    other.repositoryUri == repositoryUri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (repositoryUri.hashCode);

  @override
  String toString() => 'BuildCommitReference[id=$id, repositoryUri=$repositoryUri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'repositoryUri'] = this.repositoryUri;
    return json;
  }

  /// Returns a new [BuildCommitReference] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BuildCommitReference? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "BuildCommitReference[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "BuildCommitReference[id]" has a null value in JSON.');
        assert(json.containsKey(r'repositoryUri'), 'Required key "BuildCommitReference[repositoryUri]" is missing from JSON.');
        assert(json[r'repositoryUri'] != null, 'Required key "BuildCommitReference[repositoryUri]" has a null value in JSON.');
        return true;
      }());

      return BuildCommitReference(
        id: mapValueOfType<String>(json, r'id')!,
        repositoryUri: mapValueOfType<String>(json, r'repositoryUri')!,
      );
    }
    return null;
  }

  static List<BuildCommitReference> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildCommitReference>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildCommitReference.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BuildCommitReference> mapFromJson(dynamic json) {
    final map = <String, BuildCommitReference>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BuildCommitReference.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BuildCommitReference-objects as value to a dart map
  static Map<String, List<BuildCommitReference>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BuildCommitReference>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BuildCommitReference.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'repositoryUri',
  };
}

