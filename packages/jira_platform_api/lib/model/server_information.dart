//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServerInformation {
  /// Returns a new [ServerInformation] instance.
  ServerInformation({
    this.baseUrl,
    this.buildDate,
    this.buildNumber,
    this.deploymentType,
    this.displayUrl,
    this.displayUrlConfluence,
    this.displayUrlServicedeskHelpCenter,
    this.healthChecks = const [],
    this.scmInfo,
    this.serverTime,
    this.serverTimeZone,
    this.serverTitle,
    this.version,
    this.versionNumbers = const [],
  });

  /// The base URL of the Jira instance.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? baseUrl;

  /// The timestamp when the Jira version was built.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? buildDate;

  /// The build number of the Jira version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? buildNumber;

  /// The type of server deployment. This is always returned as *Cloud*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? deploymentType;

  /// The display URL of the Jira instance.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayUrl;

  /// The display URL of Confluence.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayUrlConfluence;

  /// The display URL of the Servicedesk Help Center.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayUrlServicedeskHelpCenter;

  /// Jira instance health check results. Deprecated and no longer returned.
  List<HealthCheckResult> healthChecks;

  /// The unique identifier of the Jira version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? scmInfo;

  /// The time in Jira when this request was responded to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? serverTime;

  /// The default timezone of the Jira server. In a format known as Olson Time Zones, IANA Time Zones or TZ Database Time Zones.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serverTimeZone;

  /// The name of the Jira instance.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serverTitle;

  /// The version of Jira.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  /// The major, minor, and revision version numbers of the Jira version.
  List<int> versionNumbers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServerInformation &&
    other.baseUrl == baseUrl &&
    other.buildDate == buildDate &&
    other.buildNumber == buildNumber &&
    other.deploymentType == deploymentType &&
    other.displayUrl == displayUrl &&
    other.displayUrlConfluence == displayUrlConfluence &&
    other.displayUrlServicedeskHelpCenter == displayUrlServicedeskHelpCenter &&
    _deepEquality.equals(other.healthChecks, healthChecks) &&
    other.scmInfo == scmInfo &&
    other.serverTime == serverTime &&
    other.serverTimeZone == serverTimeZone &&
    other.serverTitle == serverTitle &&
    other.version == version &&
    _deepEquality.equals(other.versionNumbers, versionNumbers);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (baseUrl == null ? 0 : baseUrl!.hashCode) +
    (buildDate == null ? 0 : buildDate!.hashCode) +
    (buildNumber == null ? 0 : buildNumber!.hashCode) +
    (deploymentType == null ? 0 : deploymentType!.hashCode) +
    (displayUrl == null ? 0 : displayUrl!.hashCode) +
    (displayUrlConfluence == null ? 0 : displayUrlConfluence!.hashCode) +
    (displayUrlServicedeskHelpCenter == null ? 0 : displayUrlServicedeskHelpCenter!.hashCode) +
    (healthChecks.hashCode) +
    (scmInfo == null ? 0 : scmInfo!.hashCode) +
    (serverTime == null ? 0 : serverTime!.hashCode) +
    (serverTimeZone == null ? 0 : serverTimeZone!.hashCode) +
    (serverTitle == null ? 0 : serverTitle!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (versionNumbers.hashCode);

  @override
  String toString() => 'ServerInformation[baseUrl=$baseUrl, buildDate=$buildDate, buildNumber=$buildNumber, deploymentType=$deploymentType, displayUrl=$displayUrl, displayUrlConfluence=$displayUrlConfluence, displayUrlServicedeskHelpCenter=$displayUrlServicedeskHelpCenter, healthChecks=$healthChecks, scmInfo=$scmInfo, serverTime=$serverTime, serverTimeZone=$serverTimeZone, serverTitle=$serverTitle, version=$version, versionNumbers=$versionNumbers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.baseUrl != null) {
      json[r'baseUrl'] = this.baseUrl;
    } else {
      json[r'baseUrl'] = null;
    }
    if (this.buildDate != null) {
      json[r'buildDate'] = this.buildDate!.toUtc().toIso8601String();
    } else {
      json[r'buildDate'] = null;
    }
    if (this.buildNumber != null) {
      json[r'buildNumber'] = this.buildNumber;
    } else {
      json[r'buildNumber'] = null;
    }
    if (this.deploymentType != null) {
      json[r'deploymentType'] = this.deploymentType;
    } else {
      json[r'deploymentType'] = null;
    }
    if (this.displayUrl != null) {
      json[r'displayUrl'] = this.displayUrl;
    } else {
      json[r'displayUrl'] = null;
    }
    if (this.displayUrlConfluence != null) {
      json[r'displayUrlConfluence'] = this.displayUrlConfluence;
    } else {
      json[r'displayUrlConfluence'] = null;
    }
    if (this.displayUrlServicedeskHelpCenter != null) {
      json[r'displayUrlServicedeskHelpCenter'] = this.displayUrlServicedeskHelpCenter;
    } else {
      json[r'displayUrlServicedeskHelpCenter'] = null;
    }
      json[r'healthChecks'] = this.healthChecks;
    if (this.scmInfo != null) {
      json[r'scmInfo'] = this.scmInfo;
    } else {
      json[r'scmInfo'] = null;
    }
    if (this.serverTime != null) {
      json[r'serverTime'] = this.serverTime!.toUtc().toIso8601String();
    } else {
      json[r'serverTime'] = null;
    }
    if (this.serverTimeZone != null) {
      json[r'serverTimeZone'] = this.serverTimeZone;
    } else {
      json[r'serverTimeZone'] = null;
    }
    if (this.serverTitle != null) {
      json[r'serverTitle'] = this.serverTitle;
    } else {
      json[r'serverTitle'] = null;
    }
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
      json[r'versionNumbers'] = this.versionNumbers;
    return json;
  }

  /// Returns a new [ServerInformation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServerInformation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ServerInformation(
        baseUrl: mapValueOfType<String>(json, r'baseUrl'),
        buildDate: mapDateTime(json, r'buildDate', r''),
        buildNumber: mapValueOfType<int>(json, r'buildNumber'),
        deploymentType: mapValueOfType<String>(json, r'deploymentType'),
        displayUrl: mapValueOfType<String>(json, r'displayUrl'),
        displayUrlConfluence: mapValueOfType<String>(json, r'displayUrlConfluence'),
        displayUrlServicedeskHelpCenter: mapValueOfType<String>(json, r'displayUrlServicedeskHelpCenter'),
        healthChecks: HealthCheckResult.listFromJson(json[r'healthChecks']),
        scmInfo: mapValueOfType<String>(json, r'scmInfo'),
        serverTime: mapDateTime(json, r'serverTime', r''),
        serverTimeZone: mapValueOfType<String>(json, r'serverTimeZone'),
        serverTitle: mapValueOfType<String>(json, r'serverTitle'),
        version: mapValueOfType<String>(json, r'version'),
        versionNumbers: json[r'versionNumbers'] is Iterable
            ? (json[r'versionNumbers'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ServerInformation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServerInformation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServerInformation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServerInformation> mapFromJson(dynamic json) {
    final map = <String, ServerInformation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServerInformation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServerInformation-objects as value to a dart map
  static Map<String, List<ServerInformation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServerInformation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServerInformation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

