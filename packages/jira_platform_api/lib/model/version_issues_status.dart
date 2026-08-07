//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VersionIssuesStatus {
  /// Returns a new [VersionIssuesStatus] instance.
  VersionIssuesStatus({
    this.done,
    this.inProgress,
    this.toDo,
    this.unmapped,
  });

  /// Count of issues with status *done*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? done;

  /// Count of issues with status *in progress*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? inProgress;

  /// Count of issues with status *to do*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? toDo;

  /// Count of issues with a status other than *to do*, *in progress*, and *done*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? unmapped;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VersionIssuesStatus &&
    other.done == done &&
    other.inProgress == inProgress &&
    other.toDo == toDo &&
    other.unmapped == unmapped;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (done == null ? 0 : done!.hashCode) +
    (inProgress == null ? 0 : inProgress!.hashCode) +
    (toDo == null ? 0 : toDo!.hashCode) +
    (unmapped == null ? 0 : unmapped!.hashCode);

  @override
  String toString() => 'VersionIssuesStatus[done=$done, inProgress=$inProgress, toDo=$toDo, unmapped=$unmapped]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.done != null) {
      json[r'done'] = this.done;
    } else {
      json[r'done'] = null;
    }
    if (this.inProgress != null) {
      json[r'inProgress'] = this.inProgress;
    } else {
      json[r'inProgress'] = null;
    }
    if (this.toDo != null) {
      json[r'toDo'] = this.toDo;
    } else {
      json[r'toDo'] = null;
    }
    if (this.unmapped != null) {
      json[r'unmapped'] = this.unmapped;
    } else {
      json[r'unmapped'] = null;
    }
    return json;
  }

  /// Returns a new [VersionIssuesStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VersionIssuesStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return VersionIssuesStatus(
        done: mapValueOfType<int>(json, r'done'),
        inProgress: mapValueOfType<int>(json, r'inProgress'),
        toDo: mapValueOfType<int>(json, r'toDo'),
        unmapped: mapValueOfType<int>(json, r'unmapped'),
      );
    }
    return null;
  }

  static List<VersionIssuesStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VersionIssuesStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VersionIssuesStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VersionIssuesStatus> mapFromJson(dynamic json) {
    final map = <String, VersionIssuesStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VersionIssuesStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VersionIssuesStatus-objects as value to a dart map
  static Map<String, List<VersionIssuesStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VersionIssuesStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VersionIssuesStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

