//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectLandingPageInfo {
  /// Returns a new [ProjectLandingPageInfo] instance.
  ProjectLandingPageInfo({
    this.attributes = const {},
    this.boardId,
    this.boardName,
    this.projectKey,
    this.projectType,
    this.queueCategory,
    this.queueId,
    this.queueName,
    this.simpleBoard,
    this.simplified,
    this.url,
  });

  Map<String, String> attributes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? boardId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? boardName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectKey;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? queueCategory;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? queueId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? queueName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? simpleBoard;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? simplified;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectLandingPageInfo &&
    _deepEquality.equals(other.attributes, attributes) &&
    other.boardId == boardId &&
    other.boardName == boardName &&
    other.projectKey == projectKey &&
    other.projectType == projectType &&
    other.queueCategory == queueCategory &&
    other.queueId == queueId &&
    other.queueName == queueName &&
    other.simpleBoard == simpleBoard &&
    other.simplified == simplified &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (attributes.hashCode) +
    (boardId == null ? 0 : boardId!.hashCode) +
    (boardName == null ? 0 : boardName!.hashCode) +
    (projectKey == null ? 0 : projectKey!.hashCode) +
    (projectType == null ? 0 : projectType!.hashCode) +
    (queueCategory == null ? 0 : queueCategory!.hashCode) +
    (queueId == null ? 0 : queueId!.hashCode) +
    (queueName == null ? 0 : queueName!.hashCode) +
    (simpleBoard == null ? 0 : simpleBoard!.hashCode) +
    (simplified == null ? 0 : simplified!.hashCode) +
    (url == null ? 0 : url!.hashCode);

  @override
  String toString() => 'ProjectLandingPageInfo[attributes=$attributes, boardId=$boardId, boardName=$boardName, projectKey=$projectKey, projectType=$projectType, queueCategory=$queueCategory, queueId=$queueId, queueName=$queueName, simpleBoard=$simpleBoard, simplified=$simplified, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'attributes'] = this.attributes;
    if (this.boardId != null) {
      json[r'boardId'] = this.boardId;
    } else {
      json[r'boardId'] = null;
    }
    if (this.boardName != null) {
      json[r'boardName'] = this.boardName;
    } else {
      json[r'boardName'] = null;
    }
    if (this.projectKey != null) {
      json[r'projectKey'] = this.projectKey;
    } else {
      json[r'projectKey'] = null;
    }
    if (this.projectType != null) {
      json[r'projectType'] = this.projectType;
    } else {
      json[r'projectType'] = null;
    }
    if (this.queueCategory != null) {
      json[r'queueCategory'] = this.queueCategory;
    } else {
      json[r'queueCategory'] = null;
    }
    if (this.queueId != null) {
      json[r'queueId'] = this.queueId;
    } else {
      json[r'queueId'] = null;
    }
    if (this.queueName != null) {
      json[r'queueName'] = this.queueName;
    } else {
      json[r'queueName'] = null;
    }
    if (this.simpleBoard != null) {
      json[r'simpleBoard'] = this.simpleBoard;
    } else {
      json[r'simpleBoard'] = null;
    }
    if (this.simplified != null) {
      json[r'simplified'] = this.simplified;
    } else {
      json[r'simplified'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectLandingPageInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectLandingPageInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectLandingPageInfo(
        attributes: mapCastOfType<String, String>(json, r'attributes') ?? const {},
        boardId: mapValueOfType<int>(json, r'boardId'),
        boardName: mapValueOfType<String>(json, r'boardName'),
        projectKey: mapValueOfType<String>(json, r'projectKey'),
        projectType: mapValueOfType<String>(json, r'projectType'),
        queueCategory: mapValueOfType<String>(json, r'queueCategory'),
        queueId: mapValueOfType<int>(json, r'queueId'),
        queueName: mapValueOfType<String>(json, r'queueName'),
        simpleBoard: mapValueOfType<bool>(json, r'simpleBoard'),
        simplified: mapValueOfType<bool>(json, r'simplified'),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<ProjectLandingPageInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectLandingPageInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectLandingPageInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectLandingPageInfo> mapFromJson(dynamic json) {
    final map = <String, ProjectLandingPageInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectLandingPageInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectLandingPageInfo-objects as value to a dart map
  static Map<String, List<ProjectLandingPageInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectLandingPageInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectLandingPageInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

