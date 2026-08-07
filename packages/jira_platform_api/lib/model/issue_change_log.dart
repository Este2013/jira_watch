//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueChangeLog {
  /// Returns a new [IssueChangeLog] instance.
  IssueChangeLog({
    this.changeHistories = const [],
    this.issueId,
  });

  /// List of changelogs that belongs to given issueId.
  List<Changelog> changeHistories;

  /// The ID of the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueChangeLog &&
    _deepEquality.equals(other.changeHistories, changeHistories) &&
    other.issueId == issueId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (changeHistories.hashCode) +
    (issueId == null ? 0 : issueId!.hashCode);

  @override
  String toString() => 'IssueChangeLog[changeHistories=$changeHistories, issueId=$issueId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'changeHistories'] = this.changeHistories;
    if (this.issueId != null) {
      json[r'issueId'] = this.issueId;
    } else {
      json[r'issueId'] = null;
    }
    return json;
  }

  /// Returns a new [IssueChangeLog] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueChangeLog? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueChangeLog(
        changeHistories: Changelog.listFromJson(json[r'changeHistories']),
        issueId: mapValueOfType<String>(json, r'issueId'),
      );
    }
    return null;
  }

  static List<IssueChangeLog> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueChangeLog>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueChangeLog.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueChangeLog> mapFromJson(dynamic json) {
    final map = <String, IssueChangeLog>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueChangeLog.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueChangeLog-objects as value to a dart map
  static Map<String, List<IssueChangeLog>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueChangeLog>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueChangeLog.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

