//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Worklog {
  /// Returns a new [Worklog] instance.
  Worklog({
    this.author,
    this.comment,
    this.created,
    this.id,
    this.issueId,
    this.properties = const [],
    this.self,
    this.started,
    this.timeSpent,
    this.timeSpentSeconds,
    this.updateAuthor,
    this.updated,
    this.visibility,
  });

  /// Details of the user who created the worklog.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserDetails? author;

  /// A comment about the worklog in [Atlassian Document Format](https://developer.atlassian.com/cloud/jira/platform/apis/document/structure/). Optional when creating or updating a worklog.
  Object? comment;

  /// The datetime on which the worklog was created.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  /// The ID of the worklog record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The ID of the issue this worklog is for.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueId;

  /// Details of properties for the worklog. Optional when creating or updating a worklog.
  List<EntityProperty> properties;

  /// The URL of the worklog item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The datetime on which the worklog effort was started. Required when creating a worklog. Optional when updating a worklog.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? started;

  /// The time spent working on the issue as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). Required when creating a worklog if `timeSpentSeconds` isn't provided. Optional when updating a worklog. Cannot be provided if `timeSpentSecond` is provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeSpent;

  /// The time in seconds spent working on the issue. Required when creating a worklog if `timeSpent` isn't provided. Optional when updating a worklog. Cannot be provided if `timeSpent` is provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? timeSpentSeconds;

  /// Details of the user who last updated the worklog.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserDetails? updateAuthor;

  /// The datetime on which the worklog was last updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updated;

  /// Details about any restrictions in the visibility of the worklog. Optional when creating or updating a worklog.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Visibility? visibility;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Worklog &&
    other.author == author &&
    other.comment == comment &&
    other.created == created &&
    other.id == id &&
    other.issueId == issueId &&
    _deepEquality.equals(other.properties, properties) &&
    other.self == self &&
    other.started == started &&
    other.timeSpent == timeSpent &&
    other.timeSpentSeconds == timeSpentSeconds &&
    other.updateAuthor == updateAuthor &&
    other.updated == updated &&
    other.visibility == visibility;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (author == null ? 0 : author!.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (issueId == null ? 0 : issueId!.hashCode) +
    (properties.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (started == null ? 0 : started!.hashCode) +
    (timeSpent == null ? 0 : timeSpent!.hashCode) +
    (timeSpentSeconds == null ? 0 : timeSpentSeconds!.hashCode) +
    (updateAuthor == null ? 0 : updateAuthor!.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (visibility == null ? 0 : visibility!.hashCode);

  @override
  String toString() => 'Worklog[author=$author, comment=$comment, created=$created, id=$id, issueId=$issueId, properties=$properties, self=$self, started=$started, timeSpent=$timeSpent, timeSpentSeconds=$timeSpentSeconds, updateAuthor=$updateAuthor, updated=$updated, visibility=$visibility]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.author != null) {
      json[r'author'] = this.author;
    } else {
      json[r'author'] = null;
    }
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.issueId != null) {
      json[r'issueId'] = this.issueId;
    } else {
      json[r'issueId'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.started != null) {
      json[r'started'] = this.started!.toUtc().toIso8601String();
    } else {
      json[r'started'] = null;
    }
    if (this.timeSpent != null) {
      json[r'timeSpent'] = this.timeSpent;
    } else {
      json[r'timeSpent'] = null;
    }
    if (this.timeSpentSeconds != null) {
      json[r'timeSpentSeconds'] = this.timeSpentSeconds;
    } else {
      json[r'timeSpentSeconds'] = null;
    }
    if (this.updateAuthor != null) {
      json[r'updateAuthor'] = this.updateAuthor;
    } else {
      json[r'updateAuthor'] = null;
    }
    if (this.updated != null) {
      json[r'updated'] = this.updated!.toUtc().toIso8601String();
    } else {
      json[r'updated'] = null;
    }
    if (this.visibility != null) {
      json[r'visibility'] = this.visibility;
    } else {
      json[r'visibility'] = null;
    }
    return json;
  }

  /// Returns a new [Worklog] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Worklog? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Worklog(
        author: UserDetails.fromJson(json[r'author']),
        comment: mapValueOfType<Object>(json, r'comment'),
        created: mapDateTime(json, r'created', r''),
        id: mapValueOfType<String>(json, r'id'),
        issueId: mapValueOfType<String>(json, r'issueId'),
        properties: EntityProperty.listFromJson(json[r'properties']),
        self: mapValueOfType<String>(json, r'self'),
        started: mapDateTime(json, r'started', r''),
        timeSpent: mapValueOfType<String>(json, r'timeSpent'),
        timeSpentSeconds: mapValueOfType<int>(json, r'timeSpentSeconds'),
        updateAuthor: UserDetails.fromJson(json[r'updateAuthor']),
        updated: mapDateTime(json, r'updated', r''),
        visibility: Visibility.fromJson(json[r'visibility']),
      );
    }
    return null;
  }

  static List<Worklog> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Worklog>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Worklog.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Worklog> mapFromJson(dynamic json) {
    final map = <String, Worklog>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Worklog.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Worklog-objects as value to a dart map
  static Map<String, List<Worklog>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Worklog>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Worklog.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

