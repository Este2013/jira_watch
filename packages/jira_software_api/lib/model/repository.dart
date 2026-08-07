//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Repository {
  /// Returns a new [Repository] instance.
  Repository({
    required this.name,
    this.description,
    this.forkOf,
    required this.url,
    this.commits = const [],
    this.branches = const [],
    this.pullRequests = const [],
    this.avatar,
    this.avatarDescription,
    required this.id,
    required this.updateSequenceId,
  });

  /// The name of this repository. Max length is 255 characters.
  String name;

  /// Description of this repository. Max length is 1024 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the repository this repository was forked from, if it's a fork. Max length is 1024 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? forkOf;

  /// The URL of this repository. Max length is 2000 characters.
  String url;

  /// List of commits to update in this repository. Must not contain duplicate entity IDs. Maximum number of commits is 400
  List<Commit> commits;

  /// List of branches to update in this repository. Must not contain duplicate entity IDs. Maximum number of branches is 400.
  List<Branch> branches;

  /// List of pull requests to update in this repository. Must not contain duplicate entity IDs. Maximum number of pull requests is 400
  List<PullRequest> pullRequests;

  /// The URL of the avatar for this repository. Max length is 2000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatar;

  /// Description of the avatar for this repository. Max length is 1024 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatarDescription;

  /// The ID of this entity. Will be used for cross entity linking. Must be unique by entity type within a repository, i.e., only one commit can have ID 'X' in repository 'Y'. But adding, e.g., a branch with ID 'X' to repository 'Y' is acceptable. Only alphanumeric characters, and '~.-_', are allowed. Max length is 1024 characters.
  String id;

  ///  An ID used to apply an ordering to updates for this entity in the case of out-of-order receipt of update requests. This can be any monotonically increasing number. A suggested implementation is to use epoch millis from the provider system, but other alternatives are valid (e.g. a provider could store a counter against each entity and increment that on each update to Jira). Updates for an entity that are received with an updateSqeuenceId lower than what is currently stored will be ignored.
  int updateSequenceId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Repository &&
    other.name == name &&
    other.description == description &&
    other.forkOf == forkOf &&
    other.url == url &&
    _deepEquality.equals(other.commits, commits) &&
    _deepEquality.equals(other.branches, branches) &&
    _deepEquality.equals(other.pullRequests, pullRequests) &&
    other.avatar == avatar &&
    other.avatarDescription == avatarDescription &&
    other.id == id &&
    other.updateSequenceId == updateSequenceId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (forkOf == null ? 0 : forkOf!.hashCode) +
    (url.hashCode) +
    (commits.hashCode) +
    (branches.hashCode) +
    (pullRequests.hashCode) +
    (avatar == null ? 0 : avatar!.hashCode) +
    (avatarDescription == null ? 0 : avatarDescription!.hashCode) +
    (id.hashCode) +
    (updateSequenceId.hashCode);

  @override
  String toString() => 'Repository[name=$name, description=$description, forkOf=$forkOf, url=$url, commits=$commits, branches=$branches, pullRequests=$pullRequests, avatar=$avatar, avatarDescription=$avatarDescription, id=$id, updateSequenceId=$updateSequenceId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.forkOf != null) {
      json[r'forkOf'] = this.forkOf;
    } else {
      json[r'forkOf'] = null;
    }
      json[r'url'] = this.url;
      json[r'commits'] = this.commits;
      json[r'branches'] = this.branches;
      json[r'pullRequests'] = this.pullRequests;
    if (this.avatar != null) {
      json[r'avatar'] = this.avatar;
    } else {
      json[r'avatar'] = null;
    }
    if (this.avatarDescription != null) {
      json[r'avatarDescription'] = this.avatarDescription;
    } else {
      json[r'avatarDescription'] = null;
    }
      json[r'id'] = this.id;
      json[r'updateSequenceId'] = this.updateSequenceId;
    return json;
  }

  /// Returns a new [Repository] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Repository? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "Repository[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "Repository[name]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "Repository[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "Repository[url]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "Repository[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Repository[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceId'), 'Required key "Repository[updateSequenceId]" is missing from JSON.');
        assert(json[r'updateSequenceId'] != null, 'Required key "Repository[updateSequenceId]" has a null value in JSON.');
        return true;
      }());

      return Repository(
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description'),
        forkOf: mapValueOfType<String>(json, r'forkOf'),
        url: mapValueOfType<String>(json, r'url')!,
        commits: Commit.listFromJson(json[r'commits']),
        branches: Branch.listFromJson(json[r'branches']),
        pullRequests: PullRequest.listFromJson(json[r'pullRequests']),
        avatar: mapValueOfType<String>(json, r'avatar'),
        avatarDescription: mapValueOfType<String>(json, r'avatarDescription'),
        id: mapValueOfType<String>(json, r'id')!,
        updateSequenceId: mapValueOfType<int>(json, r'updateSequenceId')!,
      );
    }
    return null;
  }

  static List<Repository> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Repository>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Repository.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Repository> mapFromJson(dynamic json) {
    final map = <String, Repository>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Repository.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Repository-objects as value to a dart map
  static Map<String, List<Repository>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Repository>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Repository.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'url',
    'id',
    'updateSequenceId',
  };
}

