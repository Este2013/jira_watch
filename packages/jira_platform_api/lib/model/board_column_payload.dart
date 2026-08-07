//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BoardColumnPayload {
  /// Returns a new [BoardColumnPayload] instance.
  BoardColumnPayload({
    this.maximumIssueConstraint,
    this.minimumIssueConstraint,
    this.name,
    this.statusIds = const [],
  });

  /// The maximum issue constraint for the column
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maximumIssueConstraint;

  /// The minimum issue constraint for the column
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minimumIssueConstraint;

  /// The name of the column
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The status IDs for the column
  List<ProjectCreateResourceIdentifier> statusIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BoardColumnPayload &&
    other.maximumIssueConstraint == maximumIssueConstraint &&
    other.minimumIssueConstraint == minimumIssueConstraint &&
    other.name == name &&
    _deepEquality.equals(other.statusIds, statusIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (maximumIssueConstraint == null ? 0 : maximumIssueConstraint!.hashCode) +
    (minimumIssueConstraint == null ? 0 : minimumIssueConstraint!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (statusIds.hashCode);

  @override
  String toString() => 'BoardColumnPayload[maximumIssueConstraint=$maximumIssueConstraint, minimumIssueConstraint=$minimumIssueConstraint, name=$name, statusIds=$statusIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.maximumIssueConstraint != null) {
      json[r'maximumIssueConstraint'] = this.maximumIssueConstraint;
    } else {
      json[r'maximumIssueConstraint'] = null;
    }
    if (this.minimumIssueConstraint != null) {
      json[r'minimumIssueConstraint'] = this.minimumIssueConstraint;
    } else {
      json[r'minimumIssueConstraint'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'statusIds'] = this.statusIds;
    return json;
  }

  /// Returns a new [BoardColumnPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BoardColumnPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BoardColumnPayload(
        maximumIssueConstraint: mapValueOfType<int>(json, r'maximumIssueConstraint'),
        minimumIssueConstraint: mapValueOfType<int>(json, r'minimumIssueConstraint'),
        name: mapValueOfType<String>(json, r'name'),
        statusIds: ProjectCreateResourceIdentifier.listFromJson(json[r'statusIds']),
      );
    }
    return null;
  }

  static List<BoardColumnPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardColumnPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardColumnPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BoardColumnPayload> mapFromJson(dynamic json) {
    final map = <String, BoardColumnPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BoardColumnPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BoardColumnPayload-objects as value to a dart map
  static Map<String, List<BoardColumnPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BoardColumnPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BoardColumnPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

