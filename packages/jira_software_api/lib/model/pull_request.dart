//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PullRequest {
  /// Returns a new [PullRequest] instance.
  PullRequest({
    required this.id,
    this.issueKeys = const [],
    this.associations = const [],
    required this.updateSequenceId,
    required this.status,
    required this.title,
    required this.author,
    required this.commentCount,
    required this.sourceBranch,
    this.sourceBranchUrl,
    required this.lastUpdate,
    this.destinationBranch,
    this.destinationBranchUrl,
    this.reviewers = const [],
    required this.url,
    required this.displayId,
  });

  /// The ID of this entity. Will be used for cross entity linking. Must be unique by entity type within a repository, i.e., only one commit can have ID 'X' in repository 'Y'. But adding, e.g., a branch with ID 'X' to repository 'Y' is acceptable. Only alphanumeric characters, and '~.-_', are allowed. Max length is 1024 characters
  String id;

  /// List of issues keys that this entity is associated with. They must be valid Jira issue keys.
  List<String> issueKeys;

  /// The Jira issue keys or IDs to associate the pull request with.
  List<IssueIdOrKeysAssociation> associations;

  /// An ID used to apply an ordering to updates for this entity in the case of out-of-order receipt of update requests. This can be any monotonically increasing number. A suggested implementation is to use epoch millis from the provider system, but other alternatives are valid (e.g. a provider could store a counter against each entity and increment that on each update to Jira). Updates for an entity that are received with an updateSqeuenceId lower than what is currently stored will be ignored.
  int updateSequenceId;

  /// The status of the pull request. In the case of concurrent updates, priority is given in the order OPEN, MERGED, DECLINED, UNKNOWN
  PullRequestStatusEnum status;

  /// Title of the pull request. Max length is 1024 characters.
  String title;

  Author author;

  /// The number of comments on the pull request
  int commentCount;

  /// The name of the source branch of this PR. Max length is 255 characters.
  String sourceBranch;

  /// The url of the source branch of this PR. This is used to match this PR against the branch. Max length is 2000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sourceBranchUrl;

  /// The most recent update to this PR. Formatted as a UTC ISO 8601 date time format.
  String lastUpdate;

  /// The name of destination branch of this PR. Max length is 255 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? destinationBranch;

  /// The url of the destination branch of this PR. Max length is 2000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? destinationBranchUrl;

  /// The list of reviewers of this pull request
  List<Reviewer> reviewers;

  /// The URL of this pull request. Max length is 2000 characters.
  String url;

  /// Shortened identifier for this pull request, used for display. Max length is 255 characters.
  String displayId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PullRequest &&
    other.id == id &&
    _deepEquality.equals(other.issueKeys, issueKeys) &&
    _deepEquality.equals(other.associations, associations) &&
    other.updateSequenceId == updateSequenceId &&
    other.status == status &&
    other.title == title &&
    other.author == author &&
    other.commentCount == commentCount &&
    other.sourceBranch == sourceBranch &&
    other.sourceBranchUrl == sourceBranchUrl &&
    other.lastUpdate == lastUpdate &&
    other.destinationBranch == destinationBranch &&
    other.destinationBranchUrl == destinationBranchUrl &&
    _deepEquality.equals(other.reviewers, reviewers) &&
    other.url == url &&
    other.displayId == displayId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (issueKeys.hashCode) +
    (associations.hashCode) +
    (updateSequenceId.hashCode) +
    (status.hashCode) +
    (title.hashCode) +
    (author.hashCode) +
    (commentCount.hashCode) +
    (sourceBranch.hashCode) +
    (sourceBranchUrl == null ? 0 : sourceBranchUrl!.hashCode) +
    (lastUpdate.hashCode) +
    (destinationBranch == null ? 0 : destinationBranch!.hashCode) +
    (destinationBranchUrl == null ? 0 : destinationBranchUrl!.hashCode) +
    (reviewers.hashCode) +
    (url.hashCode) +
    (displayId.hashCode);

  @override
  String toString() => 'PullRequest[id=$id, issueKeys=$issueKeys, associations=$associations, updateSequenceId=$updateSequenceId, status=$status, title=$title, author=$author, commentCount=$commentCount, sourceBranch=$sourceBranch, sourceBranchUrl=$sourceBranchUrl, lastUpdate=$lastUpdate, destinationBranch=$destinationBranch, destinationBranchUrl=$destinationBranchUrl, reviewers=$reviewers, url=$url, displayId=$displayId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'issueKeys'] = this.issueKeys;
      json[r'associations'] = this.associations;
      json[r'updateSequenceId'] = this.updateSequenceId;
      json[r'status'] = this.status;
      json[r'title'] = this.title;
      json[r'author'] = this.author;
      json[r'commentCount'] = this.commentCount;
      json[r'sourceBranch'] = this.sourceBranch;
    if (this.sourceBranchUrl != null) {
      json[r'sourceBranchUrl'] = this.sourceBranchUrl;
    } else {
      json[r'sourceBranchUrl'] = null;
    }
      json[r'lastUpdate'] = this.lastUpdate;
    if (this.destinationBranch != null) {
      json[r'destinationBranch'] = this.destinationBranch;
    } else {
      json[r'destinationBranch'] = null;
    }
    if (this.destinationBranchUrl != null) {
      json[r'destinationBranchUrl'] = this.destinationBranchUrl;
    } else {
      json[r'destinationBranchUrl'] = null;
    }
      json[r'reviewers'] = this.reviewers;
      json[r'url'] = this.url;
      json[r'displayId'] = this.displayId;
    return json;
  }

  /// Returns a new [PullRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PullRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "PullRequest[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "PullRequest[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceId'), 'Required key "PullRequest[updateSequenceId]" is missing from JSON.');
        assert(json[r'updateSequenceId'] != null, 'Required key "PullRequest[updateSequenceId]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "PullRequest[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "PullRequest[status]" has a null value in JSON.');
        assert(json.containsKey(r'title'), 'Required key "PullRequest[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "PullRequest[title]" has a null value in JSON.');
        assert(json.containsKey(r'author'), 'Required key "PullRequest[author]" is missing from JSON.');
        assert(json[r'author'] != null, 'Required key "PullRequest[author]" has a null value in JSON.');
        assert(json.containsKey(r'commentCount'), 'Required key "PullRequest[commentCount]" is missing from JSON.');
        assert(json[r'commentCount'] != null, 'Required key "PullRequest[commentCount]" has a null value in JSON.');
        assert(json.containsKey(r'sourceBranch'), 'Required key "PullRequest[sourceBranch]" is missing from JSON.');
        assert(json[r'sourceBranch'] != null, 'Required key "PullRequest[sourceBranch]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdate'), 'Required key "PullRequest[lastUpdate]" is missing from JSON.');
        assert(json[r'lastUpdate'] != null, 'Required key "PullRequest[lastUpdate]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "PullRequest[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "PullRequest[url]" has a null value in JSON.');
        assert(json.containsKey(r'displayId'), 'Required key "PullRequest[displayId]" is missing from JSON.');
        assert(json[r'displayId'] != null, 'Required key "PullRequest[displayId]" has a null value in JSON.');
        return true;
      }());

      return PullRequest(
        id: mapValueOfType<String>(json, r'id')!,
        issueKeys: json[r'issueKeys'] is Iterable
            ? (json[r'issueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        associations: IssueIdOrKeysAssociation.listFromJson(json[r'associations']),
        updateSequenceId: mapValueOfType<int>(json, r'updateSequenceId')!,
        status: PullRequestStatusEnum.fromJson(json[r'status'])!,
        title: mapValueOfType<String>(json, r'title')!,
        author: Author.fromJson(json[r'author'])!,
        commentCount: mapValueOfType<int>(json, r'commentCount')!,
        sourceBranch: mapValueOfType<String>(json, r'sourceBranch')!,
        sourceBranchUrl: mapValueOfType<String>(json, r'sourceBranchUrl'),
        lastUpdate: mapValueOfType<String>(json, r'lastUpdate')!,
        destinationBranch: mapValueOfType<String>(json, r'destinationBranch'),
        destinationBranchUrl: mapValueOfType<String>(json, r'destinationBranchUrl'),
        reviewers: Reviewer.listFromJson(json[r'reviewers']),
        url: mapValueOfType<String>(json, r'url')!,
        displayId: mapValueOfType<String>(json, r'displayId')!,
      );
    }
    return null;
  }

  static List<PullRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PullRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PullRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PullRequest> mapFromJson(dynamic json) {
    final map = <String, PullRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PullRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PullRequest-objects as value to a dart map
  static Map<String, List<PullRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PullRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PullRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'updateSequenceId',
    'status',
    'title',
    'author',
    'commentCount',
    'sourceBranch',
    'lastUpdate',
    'url',
    'displayId',
  };
}

/// The status of the pull request. In the case of concurrent updates, priority is given in the order OPEN, MERGED, DECLINED, UNKNOWN
enum PullRequestStatusEnum {
  OPEN._(r'OPEN'),
  MERGED._(r'MERGED'),
  DECLINED._(r'DECLINED'),
  UNKNOWN._(r'UNKNOWN'),
  ;

  /// Instantiate a new enum with the provided value.
  const PullRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PullRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PullRequestStatusEnum? fromJson(dynamic value) => PullRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PullRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PullRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PullRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PullRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PullRequestStatusEnum] to String,
/// and [decode] dynamic data back to [PullRequestStatusEnum].
class PullRequestStatusEnumTypeTransformer {
  factory PullRequestStatusEnumTypeTransformer() => _instance ??= const PullRequestStatusEnumTypeTransformer._();

  const PullRequestStatusEnumTypeTransformer._();

  String encode(PullRequestStatusEnum data) => data._value;

  /// Returns the instance of [PullRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PullRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is PullRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'OPEN': return PullRequestStatusEnum.OPEN;
        case r'MERGED': return PullRequestStatusEnum.MERGED;
        case r'DECLINED': return PullRequestStatusEnum.DECLINED;
        case r'UNKNOWN': return PullRequestStatusEnum.UNKNOWN;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PullRequestStatusEnumTypeTransformer? _instance;
}


