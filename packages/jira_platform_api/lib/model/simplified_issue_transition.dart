//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SimplifiedIssueTransition {
  /// Returns a new [SimplifiedIssueTransition] instance.
  SimplifiedIssueTransition({
    this.to,
    this.transitionId,
    this.transitionName,
  });

  /// The issue status change of the transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueTransitionStatus? to;

  /// The unique ID of the transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? transitionId;

  /// The name of the transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? transitionName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SimplifiedIssueTransition &&
    other.to == to &&
    other.transitionId == transitionId &&
    other.transitionName == transitionName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (to == null ? 0 : to!.hashCode) +
    (transitionId == null ? 0 : transitionId!.hashCode) +
    (transitionName == null ? 0 : transitionName!.hashCode);

  @override
  String toString() => 'SimplifiedIssueTransition[to=$to, transitionId=$transitionId, transitionName=$transitionName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
    }
    if (this.transitionId != null) {
      json[r'transitionId'] = this.transitionId;
    } else {
      json[r'transitionId'] = null;
    }
    if (this.transitionName != null) {
      json[r'transitionName'] = this.transitionName;
    } else {
      json[r'transitionName'] = null;
    }
    return json;
  }

  /// Returns a new [SimplifiedIssueTransition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SimplifiedIssueTransition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SimplifiedIssueTransition(
        to: IssueTransitionStatus.fromJson(json[r'to']),
        transitionId: mapValueOfType<int>(json, r'transitionId'),
        transitionName: mapValueOfType<String>(json, r'transitionName'),
      );
    }
    return null;
  }

  static List<SimplifiedIssueTransition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SimplifiedIssueTransition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SimplifiedIssueTransition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SimplifiedIssueTransition> mapFromJson(dynamic json) {
    final map = <String, SimplifiedIssueTransition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SimplifiedIssueTransition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SimplifiedIssueTransition-objects as value to a dart map
  static Map<String, List<SimplifiedIssueTransition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SimplifiedIssueTransition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SimplifiedIssueTransition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

