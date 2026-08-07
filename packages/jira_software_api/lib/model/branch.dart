//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Branch {
  /// Returns a new [Branch] instance.
  Branch({
    required this.id,
    this.issueKeys = const [],
    this.associations = const [],
    required this.updateSequenceId,
    required this.name,
    required this.lastCommit,
    this.createPullRequestUrl,
    required this.url,
  });

  /// The ID of this entity. Will be used for cross entity linking. Must be unique by entity type within a repository, i.e., only one commit can have ID 'X' in repository 'Y'. But adding, e.g., a branch with ID 'X' to repository 'Y' is acceptable. Only alphanumeric characters, and '~.-_', are allowed. Max length is 1024 characters.
  String id;

  /// List of issues keys that this entity is associated with. They must be valid Jira issue keys.
  List<String> issueKeys;

  /// The Jira issue keys or IDs to associate the branch with.
  List<IssueIdOrKeysAssociation> associations;

  /// An ID used to apply an ordering to updates for this entity in the case of out-of-order receipt of update requests. This can be any monotonically increasing number. A suggested implementation is to use epoch millis from the provider system, but other alternatives are valid (e.g. a provider could store a counter against each entity and increment that on each update to Jira). Updates for an entity that are received with an updateSqeuenceId lower than what is currently stored will be ignored.
  int updateSequenceId;

  /// The name of the branch. Max length is 512 characters.
  String name;

  Commit1 lastCommit;

  /// The URL of the page for creating a pull request from this branch. Max length is 2000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createPullRequestUrl;

  /// The URL of the branch. Max length is 2000 characters.
  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Branch &&
    other.id == id &&
    _deepEquality.equals(other.issueKeys, issueKeys) &&
    _deepEquality.equals(other.associations, associations) &&
    other.updateSequenceId == updateSequenceId &&
    other.name == name &&
    other.lastCommit == lastCommit &&
    other.createPullRequestUrl == createPullRequestUrl &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (issueKeys.hashCode) +
    (associations.hashCode) +
    (updateSequenceId.hashCode) +
    (name.hashCode) +
    (lastCommit.hashCode) +
    (createPullRequestUrl == null ? 0 : createPullRequestUrl!.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'Branch[id=$id, issueKeys=$issueKeys, associations=$associations, updateSequenceId=$updateSequenceId, name=$name, lastCommit=$lastCommit, createPullRequestUrl=$createPullRequestUrl, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'issueKeys'] = this.issueKeys;
      json[r'associations'] = this.associations;
      json[r'updateSequenceId'] = this.updateSequenceId;
      json[r'name'] = this.name;
      json[r'lastCommit'] = this.lastCommit;
    if (this.createPullRequestUrl != null) {
      json[r'createPullRequestUrl'] = this.createPullRequestUrl;
    } else {
      json[r'createPullRequestUrl'] = null;
    }
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [Branch] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Branch? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "Branch[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Branch[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceId'), 'Required key "Branch[updateSequenceId]" is missing from JSON.');
        assert(json[r'updateSequenceId'] != null, 'Required key "Branch[updateSequenceId]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "Branch[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "Branch[name]" has a null value in JSON.');
        assert(json.containsKey(r'lastCommit'), 'Required key "Branch[lastCommit]" is missing from JSON.');
        assert(json[r'lastCommit'] != null, 'Required key "Branch[lastCommit]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "Branch[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "Branch[url]" has a null value in JSON.');
        return true;
      }());

      return Branch(
        id: mapValueOfType<String>(json, r'id')!,
        issueKeys: json[r'issueKeys'] is Iterable
            ? (json[r'issueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        associations: IssueIdOrKeysAssociation.listFromJson(json[r'associations']),
        updateSequenceId: mapValueOfType<int>(json, r'updateSequenceId')!,
        name: mapValueOfType<String>(json, r'name')!,
        lastCommit: Commit1.fromJson(json[r'lastCommit'])!,
        createPullRequestUrl: mapValueOfType<String>(json, r'createPullRequestUrl'),
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<Branch> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Branch>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Branch.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Branch> mapFromJson(dynamic json) {
    final map = <String, Branch>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Branch.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Branch-objects as value to a dart map
  static Map<String, List<Branch>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Branch>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Branch.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'updateSequenceId',
    'name',
    'lastCommit',
    'url',
  };
}

