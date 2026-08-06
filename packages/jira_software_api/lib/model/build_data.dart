//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BuildData {
  /// Returns a new [BuildData] instance.
  BuildData({
    this.schemaVersion,
    required this.pipelineId,
    required this.buildNumber,
    required this.updateSequenceNumber,
    required this.displayName,
    this.description,
    this.label,
    required this.url,
    required this.state,
    required this.lastUpdated,
    this.issueKeys = const [],
    this.associations = const [],
    this.testInfo,
    this.references = const [],
  });

  /// The schema version used for this data.  Placeholder to support potential schema changes in the future. 
  BuildDataSchemaVersionEnum? schemaVersion;

  /// An ID that relates a sequence of builds. Depending on your use case this might be a project ID, pipeline ID, plan key etc. - whatever logical unit you use to group a sequence of builds.  The combination of `pipelineId` and `buildNumber` must uniquely identify a build you have provided. 
  String pipelineId;

  /// Identifies a build within the sequence of builds identified by the build `pipelineId`.  Used to identify the 'most recent' build in that sequence of builds.  The combination of `pipelineId` and `buildNumber` must uniquely identify a build you have provided. 
  int buildNumber;

  /// A number used to apply an order to the updates to the build, as identified by `pipelineId` and `buildNumber`, in the case of out-of-order receipt of update requests.  It must be a monotonically increasing number. For example, epoch time could be one way to generate the `updateSequenceNumber`.  Updates for a build that is received with an `updateSqeuenceNumber` less than or equal to what is currently stored will be ignored. 
  int updateSequenceNumber;

  /// The human-readable name for the build.  Will be shown in the UI. 
  String displayName;

  /// An optional description to attach to this build.  This may be anything that makes sense in your system. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// A human-readable string that to provide information about the build. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? label;

  /// The URL to this build in your system. 
  String url;

  /// The state of a build.  * `pending` - The build is queued, or some manual action is required. * `in_progress` - The build is currently running. * `successful` - The build completed successfully. * `failed` - The build failed. * `cancelled` - The build has been cancelled or stopped. * `unknown` - The build is in an unknown state. 
  BuildDataStateEnum state;

  /// The last-updated timestamp to present to the user as a summary of the state of the build. 
  DateTime lastUpdated;

  /// The Jira issue keys to associate the build information with.  You are free to associate issue keys in any way you like. However, we recommend that you use the name of the branch the build was executed on, and extract issue keys from that name using a simple regex. This has the advantage that it provides an intuitive association of builds to issue keys. 
  List<String> issueKeys;

  /// The Jira issue keys or IDs to associate the build with.
  List<IssueIdOrKeysAssociation> associations;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TestInfo? testInfo;

  /// Optional information that links a build to a commit, branch etc. 
  List<BuildReferences> references;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BuildData &&
    other.schemaVersion == schemaVersion &&
    other.pipelineId == pipelineId &&
    other.buildNumber == buildNumber &&
    other.updateSequenceNumber == updateSequenceNumber &&
    other.displayName == displayName &&
    other.description == description &&
    other.label == label &&
    other.url == url &&
    other.state == state &&
    other.lastUpdated == lastUpdated &&
    _deepEquality.equals(other.issueKeys, issueKeys) &&
    _deepEquality.equals(other.associations, associations) &&
    other.testInfo == testInfo &&
    _deepEquality.equals(other.references, references);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (schemaVersion == null ? 0 : schemaVersion!.hashCode) +
    (pipelineId.hashCode) +
    (buildNumber.hashCode) +
    (updateSequenceNumber.hashCode) +
    (displayName.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (label == null ? 0 : label!.hashCode) +
    (url.hashCode) +
    (state.hashCode) +
    (lastUpdated.hashCode) +
    (issueKeys.hashCode) +
    (associations.hashCode) +
    (testInfo == null ? 0 : testInfo!.hashCode) +
    (references.hashCode);

  @override
  String toString() => 'BuildData[schemaVersion=$schemaVersion, pipelineId=$pipelineId, buildNumber=$buildNumber, updateSequenceNumber=$updateSequenceNumber, displayName=$displayName, description=$description, label=$label, url=$url, state=$state, lastUpdated=$lastUpdated, issueKeys=$issueKeys, associations=$associations, testInfo=$testInfo, references=$references]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.schemaVersion != null) {
      json[r'schemaVersion'] = this.schemaVersion;
    } else {
      json[r'schemaVersion'] = null;
    }
      json[r'pipelineId'] = this.pipelineId;
      json[r'buildNumber'] = this.buildNumber;
      json[r'updateSequenceNumber'] = this.updateSequenceNumber;
      json[r'displayName'] = this.displayName;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
      json[r'url'] = this.url;
      json[r'state'] = this.state;
      json[r'lastUpdated'] = this.lastUpdated.toUtc().toIso8601String();
      json[r'issueKeys'] = this.issueKeys;
      json[r'associations'] = this.associations;
    if (this.testInfo != null) {
      json[r'testInfo'] = this.testInfo;
    } else {
      json[r'testInfo'] = null;
    }
      json[r'references'] = this.references;
    return json;
  }

  /// Returns a new [BuildData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BuildData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'pipelineId'), 'Required key "BuildData[pipelineId]" is missing from JSON.');
        assert(json[r'pipelineId'] != null, 'Required key "BuildData[pipelineId]" has a null value in JSON.');
        assert(json.containsKey(r'buildNumber'), 'Required key "BuildData[buildNumber]" is missing from JSON.');
        assert(json[r'buildNumber'] != null, 'Required key "BuildData[buildNumber]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceNumber'), 'Required key "BuildData[updateSequenceNumber]" is missing from JSON.');
        assert(json[r'updateSequenceNumber'] != null, 'Required key "BuildData[updateSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'displayName'), 'Required key "BuildData[displayName]" is missing from JSON.');
        assert(json[r'displayName'] != null, 'Required key "BuildData[displayName]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "BuildData[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "BuildData[url]" has a null value in JSON.');
        assert(json.containsKey(r'state'), 'Required key "BuildData[state]" is missing from JSON.');
        assert(json[r'state'] != null, 'Required key "BuildData[state]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "BuildData[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "BuildData[lastUpdated]" has a null value in JSON.');
        return true;
      }());

      return BuildData(
        schemaVersion: BuildDataSchemaVersionEnum.fromJson(json[r'schemaVersion']),
        pipelineId: mapValueOfType<String>(json, r'pipelineId')!,
        buildNumber: mapValueOfType<int>(json, r'buildNumber')!,
        updateSequenceNumber: mapValueOfType<int>(json, r'updateSequenceNumber')!,
        displayName: mapValueOfType<String>(json, r'displayName')!,
        description: mapValueOfType<String>(json, r'description'),
        label: mapValueOfType<String>(json, r'label'),
        url: mapValueOfType<String>(json, r'url')!,
        state: BuildDataStateEnum.fromJson(json[r'state'])!,
        lastUpdated: mapDateTime(json, r'lastUpdated', r'')!,
        issueKeys: json[r'issueKeys'] is Iterable
            ? (json[r'issueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        associations: IssueIdOrKeysAssociation.listFromJson(json[r'associations']),
        testInfo: TestInfo.fromJson(json[r'testInfo']),
        references: BuildReferences.listFromJson(json[r'references']),
      );
    }
    return null;
  }

  static List<BuildData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BuildData> mapFromJson(dynamic json) {
    final map = <String, BuildData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BuildData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BuildData-objects as value to a dart map
  static Map<String, List<BuildData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BuildData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BuildData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'pipelineId',
    'buildNumber',
    'updateSequenceNumber',
    'displayName',
    'url',
    'state',
    'lastUpdated',
  };
}

/// The schema version used for this data.  Placeholder to support potential schema changes in the future. 
enum BuildDataSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const BuildDataSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BuildDataSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BuildDataSchemaVersionEnum? fromJson(dynamic value) => BuildDataSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BuildDataSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BuildDataSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildDataSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildDataSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BuildDataSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [BuildDataSchemaVersionEnum].
class BuildDataSchemaVersionEnumTypeTransformer {
  factory BuildDataSchemaVersionEnumTypeTransformer() => _instance ??= const BuildDataSchemaVersionEnumTypeTransformer._();

  const BuildDataSchemaVersionEnumTypeTransformer._();

  String encode(BuildDataSchemaVersionEnum data) => data._value;

  /// Returns the instance of [BuildDataSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BuildDataSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BuildDataSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return BuildDataSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BuildDataSchemaVersionEnumTypeTransformer? _instance;
}


/// The state of a build.  * `pending` - The build is queued, or some manual action is required. * `in_progress` - The build is currently running. * `successful` - The build completed successfully. * `failed` - The build failed. * `cancelled` - The build has been cancelled or stopped. * `unknown` - The build is in an unknown state. 
enum BuildDataStateEnum {
  pending._(r'pending'),
  inProgress._(r'in_progress'),
  successful._(r'successful'),
  failed._(r'failed'),
  cancelled._(r'cancelled'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const BuildDataStateEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BuildDataStateEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BuildDataStateEnum? fromJson(dynamic value) => BuildDataStateEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BuildDataStateEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BuildDataStateEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildDataStateEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildDataStateEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BuildDataStateEnum] to String,
/// and [decode] dynamic data back to [BuildDataStateEnum].
class BuildDataStateEnumTypeTransformer {
  factory BuildDataStateEnumTypeTransformer() => _instance ??= const BuildDataStateEnumTypeTransformer._();

  const BuildDataStateEnumTypeTransformer._();

  String encode(BuildDataStateEnum data) => data._value;

  /// Returns the instance of [BuildDataStateEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BuildDataStateEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BuildDataStateEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'pending': return BuildDataStateEnum.pending;
        case r'in_progress': return BuildDataStateEnum.inProgress;
        case r'successful': return BuildDataStateEnum.successful;
        case r'failed': return BuildDataStateEnum.failed;
        case r'cancelled': return BuildDataStateEnum.cancelled;
        case r'unknown': return BuildDataStateEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BuildDataStateEnumTypeTransformer? _instance;
}


