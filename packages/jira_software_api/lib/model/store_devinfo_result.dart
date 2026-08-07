//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StoreDevinfoResult {
  /// Returns a new [StoreDevinfoResult] instance.
  StoreDevinfoResult({
    this.acceptedDevinfoEntities = const {},
    this.failedDevinfoEntities = const {},
    this.unknownIssueKeys = const [],
    this.unknownAssociations = const [],
  });

  /// The IDs of devinfo entities that have been accepted for submission grouped by their repository IDs. Note that a devinfo entity that isn't updated due to it's updateSequenceId being out of order is not considered a failed submission.
  Map<String, EntityIds> acceptedDevinfoEntities;

  /// IDs of devinfo entities that have not been accepted for submission and caused error descriptions, usually due to a problem with the request data. The entities (if present) will be grouped by their repository id and type. Entity IDs are listed with errors associated with that devinfo entity that have prevented it being submitted. 
  Map<String, RepositoryErrors> failedDevinfoEntities;

  /// Issue keys that are not known on this Jira instance (if any). These may be invalid keys (e.g. `UTF-8` is sometimes incorrectly identified as a Jira issue key), or they may be for projects that no longer exist. If a devinfo entity has been associated with issue keys other than those in this array it will still be stored against those valid keys. 
  List<String> unknownIssueKeys;

  /// Associations that are not known on this Jira instance (if any).  These may be invalid keys (e.g. `UTF-8` is sometimes incorrectly identified as a Jira issue key), or they may be for projects that no longer exist.  If a development information entity has been associated with any other association other than those in this array it will still be stored against those valid associations. If a development information entity was only associated with the associations in this array, it is deemed to be invalid and it won't be persisted. 
  List<IssueIdOrKeysAssociation> unknownAssociations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StoreDevinfoResult &&
    _deepEquality.equals(other.acceptedDevinfoEntities, acceptedDevinfoEntities) &&
    _deepEquality.equals(other.failedDevinfoEntities, failedDevinfoEntities) &&
    _deepEquality.equals(other.unknownIssueKeys, unknownIssueKeys) &&
    _deepEquality.equals(other.unknownAssociations, unknownAssociations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (acceptedDevinfoEntities.hashCode) +
    (failedDevinfoEntities.hashCode) +
    (unknownIssueKeys.hashCode) +
    (unknownAssociations.hashCode);

  @override
  String toString() => 'StoreDevinfoResult[acceptedDevinfoEntities=$acceptedDevinfoEntities, failedDevinfoEntities=$failedDevinfoEntities, unknownIssueKeys=$unknownIssueKeys, unknownAssociations=$unknownAssociations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'acceptedDevinfoEntities'] = this.acceptedDevinfoEntities;
      json[r'failedDevinfoEntities'] = this.failedDevinfoEntities;
      json[r'unknownIssueKeys'] = this.unknownIssueKeys;
      json[r'unknownAssociations'] = this.unknownAssociations;
    return json;
  }

  /// Returns a new [StoreDevinfoResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StoreDevinfoResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return StoreDevinfoResult(
        acceptedDevinfoEntities: EntityIds.mapFromJson(json[r'acceptedDevinfoEntities']),
        failedDevinfoEntities: RepositoryErrors.mapFromJson(json[r'failedDevinfoEntities']),
        unknownIssueKeys: json[r'unknownIssueKeys'] is Iterable
            ? (json[r'unknownIssueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        unknownAssociations: IssueIdOrKeysAssociation.listFromJson(json[r'unknownAssociations']),
      );
    }
    return null;
  }

  static List<StoreDevinfoResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StoreDevinfoResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StoreDevinfoResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StoreDevinfoResult> mapFromJson(dynamic json) {
    final map = <String, StoreDevinfoResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StoreDevinfoResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StoreDevinfoResult-objects as value to a dart map
  static Map<String, List<StoreDevinfoResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StoreDevinfoResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StoreDevinfoResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

