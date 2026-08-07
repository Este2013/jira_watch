//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Commit {
  /// Returns a new [Commit] instance.
  Commit({
    required this.id,
    this.issueKeys = const [],
    this.associations = const [],
    required this.updateSequenceId,
    this.hash,
    this.flags = const [],
    required this.message,
    required this.author,
    required this.fileCount,
    required this.url,
    this.files = const [],
    required this.authorTimestamp,
    required this.displayId,
  });

  /// The identifier or hash of the commit. Will be used for cross entity linking. Must be unique for all commits within a repository, i.e., only one commit can have ID 'X' in repository 'Y'. But adding, e.g., a branch with ID 'X' to repository 'Y' is acceptable. Only alphanumeric characters, and '~.-_', are allowed. Max length is 1024 characters
  String id;

  /// List of issues keys that this entity is associated with. They must be valid Jira issue keys.
  List<String> issueKeys;

  /// The Jira issue keys or IDs to associate the commit with.
  List<IssueIdOrKeysAssociation> associations;

  /// An ID used to apply an ordering to updates for this entity in the case of out-of-order receipt of update requests. This can be any monotonically increasing number. A suggested implementation is to use epoch millis from the provider system, but other alternatives are valid (e.g. a provider could store a counter against each entity and increment that on each update to Jira). Updates for an entity that are received with an updateSqeuenceId lower than what is currently stored will be ignored.
  int updateSequenceId;

  /// Deprecated. Use the id field instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hash;

  /// The set of flags for this commit
  List<CommitFlagsEnum> flags;

  /// The commit message. Max length is 1024 characters. If anything longer is supplied, it will be truncated down to 1024 characters.
  String message;

  Author author;

  /// The total number of files added, removed, or modified by this commit
  ///
  /// Minimum value: 0
  int fileCount;

  /// The URL of this commit. Max length is 2000 characters.
  String url;

  /// List of file changes. Max number of files is 10. Currently, only the first 5 files are shown (sorted by path) in the UI. This UI behavior may change without notice.
  List<File> files;

  /// The author timestamp of this commit. Formatted as a UTC ISO 8601 date time format.
  String authorTimestamp;

  /// Shortened identifier for this commit, used for display. Max length is 255 characters.
  String displayId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Commit &&
    other.id == id &&
    _deepEquality.equals(other.issueKeys, issueKeys) &&
    _deepEquality.equals(other.associations, associations) &&
    other.updateSequenceId == updateSequenceId &&
    other.hash == hash &&
    _deepEquality.equals(other.flags, flags) &&
    other.message == message &&
    other.author == author &&
    other.fileCount == fileCount &&
    other.url == url &&
    _deepEquality.equals(other.files, files) &&
    other.authorTimestamp == authorTimestamp &&
    other.displayId == displayId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (issueKeys.hashCode) +
    (associations.hashCode) +
    (updateSequenceId.hashCode) +
    (hash == null ? 0 : hash!.hashCode) +
    (flags.hashCode) +
    (message.hashCode) +
    (author.hashCode) +
    (fileCount.hashCode) +
    (url.hashCode) +
    (files.hashCode) +
    (authorTimestamp.hashCode) +
    (displayId.hashCode);

  @override
  String toString() => 'Commit[id=$id, issueKeys=$issueKeys, associations=$associations, updateSequenceId=$updateSequenceId, hash=$hash, flags=$flags, message=$message, author=$author, fileCount=$fileCount, url=$url, files=$files, authorTimestamp=$authorTimestamp, displayId=$displayId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'issueKeys'] = this.issueKeys;
      json[r'associations'] = this.associations;
      json[r'updateSequenceId'] = this.updateSequenceId;
    if (this.hash != null) {
      json[r'hash'] = this.hash;
    } else {
      json[r'hash'] = null;
    }
      json[r'flags'] = this.flags;
      json[r'message'] = this.message;
      json[r'author'] = this.author;
      json[r'fileCount'] = this.fileCount;
      json[r'url'] = this.url;
      json[r'files'] = this.files;
      json[r'authorTimestamp'] = this.authorTimestamp;
      json[r'displayId'] = this.displayId;
    return json;
  }

  /// Returns a new [Commit] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Commit? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "Commit[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Commit[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceId'), 'Required key "Commit[updateSequenceId]" is missing from JSON.');
        assert(json[r'updateSequenceId'] != null, 'Required key "Commit[updateSequenceId]" has a null value in JSON.');
        assert(json.containsKey(r'message'), 'Required key "Commit[message]" is missing from JSON.');
        assert(json[r'message'] != null, 'Required key "Commit[message]" has a null value in JSON.');
        assert(json.containsKey(r'author'), 'Required key "Commit[author]" is missing from JSON.');
        assert(json[r'author'] != null, 'Required key "Commit[author]" has a null value in JSON.');
        assert(json.containsKey(r'fileCount'), 'Required key "Commit[fileCount]" is missing from JSON.');
        assert(json[r'fileCount'] != null, 'Required key "Commit[fileCount]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "Commit[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "Commit[url]" has a null value in JSON.');
        assert(json.containsKey(r'authorTimestamp'), 'Required key "Commit[authorTimestamp]" is missing from JSON.');
        assert(json[r'authorTimestamp'] != null, 'Required key "Commit[authorTimestamp]" has a null value in JSON.');
        assert(json.containsKey(r'displayId'), 'Required key "Commit[displayId]" is missing from JSON.');
        assert(json[r'displayId'] != null, 'Required key "Commit[displayId]" has a null value in JSON.');
        return true;
      }());

      return Commit(
        id: mapValueOfType<String>(json, r'id')!,
        issueKeys: json[r'issueKeys'] is Iterable
            ? (json[r'issueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        associations: IssueIdOrKeysAssociation.listFromJson(json[r'associations']),
        updateSequenceId: mapValueOfType<int>(json, r'updateSequenceId')!,
        hash: mapValueOfType<String>(json, r'hash'),
        flags: CommitFlagsEnum.listFromJson(json[r'flags']),
        message: mapValueOfType<String>(json, r'message')!,
        author: Author.fromJson(json[r'author'])!,
        fileCount: mapValueOfType<int>(json, r'fileCount')!,
        url: mapValueOfType<String>(json, r'url')!,
        files: File.listFromJson(json[r'files']),
        authorTimestamp: mapValueOfType<String>(json, r'authorTimestamp')!,
        displayId: mapValueOfType<String>(json, r'displayId')!,
      );
    }
    return null;
  }

  static List<Commit> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Commit>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Commit.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Commit> mapFromJson(dynamic json) {
    final map = <String, Commit>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Commit.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Commit-objects as value to a dart map
  static Map<String, List<Commit>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Commit>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Commit.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'updateSequenceId',
    'message',
    'author',
    'fileCount',
    'url',
    'authorTimestamp',
    'displayId',
  };
}


enum CommitFlagsEnum {
  MERGE_COMMIT._(r'MERGE_COMMIT'),
  ;

  /// Instantiate a new enum with the provided value.
  const CommitFlagsEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CommitFlagsEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CommitFlagsEnum? fromJson(dynamic value) => CommitFlagsEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CommitFlagsEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CommitFlagsEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CommitFlagsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommitFlagsEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommitFlagsEnum] to String,
/// and [decode] dynamic data back to [CommitFlagsEnum].
class CommitFlagsEnumTypeTransformer {
  factory CommitFlagsEnumTypeTransformer() => _instance ??= const CommitFlagsEnumTypeTransformer._();

  const CommitFlagsEnumTypeTransformer._();

  String encode(CommitFlagsEnum data) => data._value;

  /// Returns the instance of [CommitFlagsEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommitFlagsEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CommitFlagsEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'MERGE_COMMIT': return CommitFlagsEnum.MERGE_COMMIT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CommitFlagsEnumTypeTransformer? _instance;
}


