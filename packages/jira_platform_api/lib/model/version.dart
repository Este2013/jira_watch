//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Version {
  /// Returns a new [Version] instance.
  Version({
    this.approvers = const [],
    this.archived,
    this.description,
    this.driver,
    this.expand,
    this.id,
    this.issuesStatusForFixVersion,
    this.moveUnfixedIssuesTo,
    this.name,
    this.operations = const [],
    this.overdue,
    this.project,
    this.projectId,
    this.releaseDate,
    this.released,
    this.self,
    this.startDate,
    this.userReleaseDate,
    this.userStartDate,
  });

  /// If the expand option `approvers` is used, returns a list containing the approvers for this version.
  List<VersionApprover> approvers;

  /// Indicates that the version is archived. Optional when creating or updating a version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? archived;

  /// The description of the version. Optional when creating or updating a version. The maximum size is 16,384 bytes.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The Atlassian account ID of the version driver. Optional when creating or updating a version. If the expand option `driver` is used, returns the Atlassian account ID of the driver.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? driver;

  /// Use [expand](em>#expansion) to include additional information about version in the response. This parameter accepts a comma-separated list. Expand options include:   *  `operations` Returns the list of operations available for this version.  *  `issuesstatus` Returns the count of issues in this version for each of the status categories *to do*, *in progress*, *done*, and *unmapped*. The *unmapped* property contains a count of issues with a status other than *to do*, *in progress*, and *done*.  *  `driver` Returns the Atlassian account ID of the version driver.  *  `approvers` Returns a list containing approvers for this version.  Optional for create and update.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// The ID of the version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// If the expand option `issuesstatus` is used, returns the count of issues in this version for each of the status categories *to do*, *in progress*, *done*, and *unmapped*. The *unmapped* property contains a count of issues with a status other than *to do*, *in progress*, and *done*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  VersionIssuesStatus? issuesStatusForFixVersion;

  /// The URL of the self link to the version to which all unfixed issues are moved when a version is released. Not applicable when creating a version. Optional when updating a version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? moveUnfixedIssuesTo;

  /// The unique name of the version. Required when creating a version. Optional when updating a version. The maximum length is 255 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// If the expand option `operations` is used, returns the list of operations available for this version.
  List<SimpleLink> operations;

  /// Indicates that the version is overdue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? overdue;

  /// Deprecated. Use `projectId`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? project;

  /// The ID of the project to which this version is attached. Required when creating a version. Not applicable when updating a version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  /// The release date of the version. Expressed in ISO 8601 format (yyyy-mm-dd). Optional when creating or updating a version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? releaseDate;

  /// Indicates that the version is released. If the version is released a request to release again is ignored. Not applicable when creating a version. Optional when updating a version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? released;

  /// The URL of the version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The start date of the version. Expressed in ISO 8601 format (yyyy-mm-dd). Optional when creating or updating a version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startDate;

  /// The date on which work on this version is expected to finish, expressed in the instance's *Day/Month/Year Format* date format.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userReleaseDate;

  /// The date on which work on this version is expected to start, expressed in the instance's *Day/Month/Year Format* date format.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userStartDate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Version &&
    _deepEquality.equals(other.approvers, approvers) &&
    other.archived == archived &&
    other.description == description &&
    other.driver == driver &&
    other.expand == expand &&
    other.id == id &&
    other.issuesStatusForFixVersion == issuesStatusForFixVersion &&
    other.moveUnfixedIssuesTo == moveUnfixedIssuesTo &&
    other.name == name &&
    _deepEquality.equals(other.operations, operations) &&
    other.overdue == overdue &&
    other.project == project &&
    other.projectId == projectId &&
    other.releaseDate == releaseDate &&
    other.released == released &&
    other.self == self &&
    other.startDate == startDate &&
    other.userReleaseDate == userReleaseDate &&
    other.userStartDate == userStartDate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (approvers.hashCode) +
    (archived == null ? 0 : archived!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (driver == null ? 0 : driver!.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (issuesStatusForFixVersion == null ? 0 : issuesStatusForFixVersion!.hashCode) +
    (moveUnfixedIssuesTo == null ? 0 : moveUnfixedIssuesTo!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (operations.hashCode) +
    (overdue == null ? 0 : overdue!.hashCode) +
    (project == null ? 0 : project!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (releaseDate == null ? 0 : releaseDate!.hashCode) +
    (released == null ? 0 : released!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (startDate == null ? 0 : startDate!.hashCode) +
    (userReleaseDate == null ? 0 : userReleaseDate!.hashCode) +
    (userStartDate == null ? 0 : userStartDate!.hashCode);

  @override
  String toString() => 'Version[approvers=$approvers, archived=$archived, description=$description, driver=$driver, expand=$expand, id=$id, issuesStatusForFixVersion=$issuesStatusForFixVersion, moveUnfixedIssuesTo=$moveUnfixedIssuesTo, name=$name, operations=$operations, overdue=$overdue, project=$project, projectId=$projectId, releaseDate=$releaseDate, released=$released, self=$self, startDate=$startDate, userReleaseDate=$userReleaseDate, userStartDate=$userStartDate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'approvers'] = this.approvers;
    if (this.archived != null) {
      json[r'archived'] = this.archived;
    } else {
      json[r'archived'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.driver != null) {
      json[r'driver'] = this.driver;
    } else {
      json[r'driver'] = null;
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
    if (this.issuesStatusForFixVersion != null) {
      json[r'issuesStatusForFixVersion'] = this.issuesStatusForFixVersion;
    } else {
      json[r'issuesStatusForFixVersion'] = null;
    }
    if (this.moveUnfixedIssuesTo != null) {
      json[r'moveUnfixedIssuesTo'] = this.moveUnfixedIssuesTo;
    } else {
      json[r'moveUnfixedIssuesTo'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'operations'] = this.operations;
    if (this.overdue != null) {
      json[r'overdue'] = this.overdue;
    } else {
      json[r'overdue'] = null;
    }
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.releaseDate != null) {
      json[r'releaseDate'] = _dateFormatter.format(this.releaseDate!.toUtc());
    } else {
      json[r'releaseDate'] = null;
    }
    if (this.released != null) {
      json[r'released'] = this.released;
    } else {
      json[r'released'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.startDate != null) {
      json[r'startDate'] = _dateFormatter.format(this.startDate!.toUtc());
    } else {
      json[r'startDate'] = null;
    }
    if (this.userReleaseDate != null) {
      json[r'userReleaseDate'] = this.userReleaseDate;
    } else {
      json[r'userReleaseDate'] = null;
    }
    if (this.userStartDate != null) {
      json[r'userStartDate'] = this.userStartDate;
    } else {
      json[r'userStartDate'] = null;
    }
    return json;
  }

  /// Returns a new [Version] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Version? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Version(
        approvers: VersionApprover.listFromJson(json[r'approvers']),
        archived: mapValueOfType<bool>(json, r'archived'),
        description: mapValueOfType<String>(json, r'description'),
        driver: mapValueOfType<String>(json, r'driver'),
        expand: mapValueOfType<String>(json, r'expand'),
        id: mapValueOfType<String>(json, r'id'),
        issuesStatusForFixVersion: VersionIssuesStatus.fromJson(json[r'issuesStatusForFixVersion']),
        moveUnfixedIssuesTo: mapValueOfType<String>(json, r'moveUnfixedIssuesTo'),
        name: mapValueOfType<String>(json, r'name'),
        operations: SimpleLink.listFromJson(json[r'operations']),
        overdue: mapValueOfType<bool>(json, r'overdue'),
        project: mapValueOfType<String>(json, r'project'),
        projectId: mapValueOfType<int>(json, r'projectId'),
        releaseDate: mapDateTime(json, r'releaseDate', r''),
        released: mapValueOfType<bool>(json, r'released'),
        self: mapValueOfType<String>(json, r'self'),
        startDate: mapDateTime(json, r'startDate', r''),
        userReleaseDate: mapValueOfType<String>(json, r'userReleaseDate'),
        userStartDate: mapValueOfType<String>(json, r'userStartDate'),
      );
    }
    return null;
  }

  static List<Version> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Version>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Version.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Version> mapFromJson(dynamic json) {
    final map = <String, Version>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Version.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Version-objects as value to a dart map
  static Map<String, List<Version>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Version>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Version.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

