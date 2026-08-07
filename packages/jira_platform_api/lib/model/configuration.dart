//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Configuration {
  /// Returns a new [Configuration] instance.
  Configuration({
    this.attachmentsEnabled,
    this.issueLinkingEnabled,
    this.subTasksEnabled,
    this.timeTrackingConfiguration,
    this.timeTrackingEnabled,
    this.unassignedIssuesAllowed,
    this.votingEnabled,
    this.watchingEnabled,
  });

  /// Whether the ability to add attachments to issues is enabled.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? attachmentsEnabled;

  /// Whether the ability to link issues is enabled.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? issueLinkingEnabled;

  /// Whether the ability to create subtasks for issues is enabled.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? subTasksEnabled;

  /// The configuration of time tracking.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TimeTrackingConfiguration? timeTrackingConfiguration;

  /// Whether the ability to track time is enabled. This property is deprecated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? timeTrackingEnabled;

  /// Whether the ability to create unassigned issues is enabled. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? unassignedIssuesAllowed;

  /// Whether the ability for users to vote on issues is enabled. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? votingEnabled;

  /// Whether the ability for users to watch issues is enabled. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? watchingEnabled;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Configuration &&
    other.attachmentsEnabled == attachmentsEnabled &&
    other.issueLinkingEnabled == issueLinkingEnabled &&
    other.subTasksEnabled == subTasksEnabled &&
    other.timeTrackingConfiguration == timeTrackingConfiguration &&
    other.timeTrackingEnabled == timeTrackingEnabled &&
    other.unassignedIssuesAllowed == unassignedIssuesAllowed &&
    other.votingEnabled == votingEnabled &&
    other.watchingEnabled == watchingEnabled;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (attachmentsEnabled == null ? 0 : attachmentsEnabled!.hashCode) +
    (issueLinkingEnabled == null ? 0 : issueLinkingEnabled!.hashCode) +
    (subTasksEnabled == null ? 0 : subTasksEnabled!.hashCode) +
    (timeTrackingConfiguration == null ? 0 : timeTrackingConfiguration!.hashCode) +
    (timeTrackingEnabled == null ? 0 : timeTrackingEnabled!.hashCode) +
    (unassignedIssuesAllowed == null ? 0 : unassignedIssuesAllowed!.hashCode) +
    (votingEnabled == null ? 0 : votingEnabled!.hashCode) +
    (watchingEnabled == null ? 0 : watchingEnabled!.hashCode);

  @override
  String toString() => 'Configuration[attachmentsEnabled=$attachmentsEnabled, issueLinkingEnabled=$issueLinkingEnabled, subTasksEnabled=$subTasksEnabled, timeTrackingConfiguration=$timeTrackingConfiguration, timeTrackingEnabled=$timeTrackingEnabled, unassignedIssuesAllowed=$unassignedIssuesAllowed, votingEnabled=$votingEnabled, watchingEnabled=$watchingEnabled]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.attachmentsEnabled != null) {
      json[r'attachmentsEnabled'] = this.attachmentsEnabled;
    } else {
      json[r'attachmentsEnabled'] = null;
    }
    if (this.issueLinkingEnabled != null) {
      json[r'issueLinkingEnabled'] = this.issueLinkingEnabled;
    } else {
      json[r'issueLinkingEnabled'] = null;
    }
    if (this.subTasksEnabled != null) {
      json[r'subTasksEnabled'] = this.subTasksEnabled;
    } else {
      json[r'subTasksEnabled'] = null;
    }
    if (this.timeTrackingConfiguration != null) {
      json[r'timeTrackingConfiguration'] = this.timeTrackingConfiguration;
    } else {
      json[r'timeTrackingConfiguration'] = null;
    }
    if (this.timeTrackingEnabled != null) {
      json[r'timeTrackingEnabled'] = this.timeTrackingEnabled;
    } else {
      json[r'timeTrackingEnabled'] = null;
    }
    if (this.unassignedIssuesAllowed != null) {
      json[r'unassignedIssuesAllowed'] = this.unassignedIssuesAllowed;
    } else {
      json[r'unassignedIssuesAllowed'] = null;
    }
    if (this.votingEnabled != null) {
      json[r'votingEnabled'] = this.votingEnabled;
    } else {
      json[r'votingEnabled'] = null;
    }
    if (this.watchingEnabled != null) {
      json[r'watchingEnabled'] = this.watchingEnabled;
    } else {
      json[r'watchingEnabled'] = null;
    }
    return json;
  }

  /// Returns a new [Configuration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Configuration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Configuration(
        attachmentsEnabled: mapValueOfType<bool>(json, r'attachmentsEnabled'),
        issueLinkingEnabled: mapValueOfType<bool>(json, r'issueLinkingEnabled'),
        subTasksEnabled: mapValueOfType<bool>(json, r'subTasksEnabled'),
        timeTrackingConfiguration: TimeTrackingConfiguration.fromJson(json[r'timeTrackingConfiguration']),
        timeTrackingEnabled: mapValueOfType<bool>(json, r'timeTrackingEnabled'),
        unassignedIssuesAllowed: mapValueOfType<bool>(json, r'unassignedIssuesAllowed'),
        votingEnabled: mapValueOfType<bool>(json, r'votingEnabled'),
        watchingEnabled: mapValueOfType<bool>(json, r'watchingEnabled'),
      );
    }
    return null;
  }

  static List<Configuration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Configuration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Configuration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Configuration> mapFromJson(dynamic json) {
    final map = <String, Configuration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Configuration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Configuration-objects as value to a dart map
  static Map<String, List<Configuration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Configuration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Configuration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

