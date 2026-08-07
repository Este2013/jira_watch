//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SoftwareNavigationInfo {
  /// Returns a new [SoftwareNavigationInfo] instance.
  SoftwareNavigationInfo({
    this.boardId,
    this.boardName,
    this.simpleBoard,
    this.totalBoardsInProject,
  });

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
  bool? simpleBoard;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalBoardsInProject;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SoftwareNavigationInfo &&
    other.boardId == boardId &&
    other.boardName == boardName &&
    other.simpleBoard == simpleBoard &&
    other.totalBoardsInProject == totalBoardsInProject;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (boardId == null ? 0 : boardId!.hashCode) +
    (boardName == null ? 0 : boardName!.hashCode) +
    (simpleBoard == null ? 0 : simpleBoard!.hashCode) +
    (totalBoardsInProject == null ? 0 : totalBoardsInProject!.hashCode);

  @override
  String toString() => 'SoftwareNavigationInfo[boardId=$boardId, boardName=$boardName, simpleBoard=$simpleBoard, totalBoardsInProject=$totalBoardsInProject]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.simpleBoard != null) {
      json[r'simpleBoard'] = this.simpleBoard;
    } else {
      json[r'simpleBoard'] = null;
    }
    if (this.totalBoardsInProject != null) {
      json[r'totalBoardsInProject'] = this.totalBoardsInProject;
    } else {
      json[r'totalBoardsInProject'] = null;
    }
    return json;
  }

  /// Returns a new [SoftwareNavigationInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SoftwareNavigationInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SoftwareNavigationInfo(
        boardId: mapValueOfType<int>(json, r'boardId'),
        boardName: mapValueOfType<String>(json, r'boardName'),
        simpleBoard: mapValueOfType<bool>(json, r'simpleBoard'),
        totalBoardsInProject: mapValueOfType<int>(json, r'totalBoardsInProject'),
      );
    }
    return null;
  }

  static List<SoftwareNavigationInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SoftwareNavigationInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SoftwareNavigationInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SoftwareNavigationInfo> mapFromJson(dynamic json) {
    final map = <String, SoftwareNavigationInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SoftwareNavigationInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SoftwareNavigationInfo-objects as value to a dart map
  static Map<String, List<SoftwareNavigationInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SoftwareNavigationInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SoftwareNavigationInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

