//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeploymentData {
  /// Returns a new [DeploymentData] instance.
  DeploymentData({
    required this.deploymentSequenceNumber,
    required this.updateSequenceNumber,
    this.issueKeys = const [],
    this.associations = const [],
    required this.displayName,
    required this.url,
    required this.description,
    required this.lastUpdated,
    this.label,
    this.duration,
    required this.state,
    required this.pipeline,
    required this.environment,
    this.commands = const [],
    this.schemaVersion,
  });

  /// This is the identifier for the deployment. It must be unique for the specified pipeline and environment. It must be a monotonically increasing number, as this is used to sequence the deployments. 
  int deploymentSequenceNumber;

  /// A number used to apply an order to the updates to the deployment, as identified by the deploymentSequenceNumber, in the case of out-of-order receipt of update requests. It must be a monotonically increasing number. For example, epoch time could be one way to generate the updateSequenceNumber. 
  int updateSequenceNumber;

  /// Deprecated. The Jira issue keys to associate the Deployment information with. Should replace this field with the \"associations\" field to associate Deployment information with issueKeys or other types of associations. 
  List<String> issueKeys;

  /// The entities to associate the Deployment information with.
  List<DeploymentDataAssociationsInner> associations;

  /// The human-readable name for the deployment. Will be shown in the UI. 
  String displayName;

  /// A URL users can use to link to this deployment, in this environment. 
  String url;

  /// A short description of the deployment 
  String description;

  /// The last-updated timestamp to present to the user as a summary of the state of the deployment. 
  DateTime lastUpdated;

  /// An (optional) additional label that may be displayed with deployment information. Can be used to display version information etc. for the deployment. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? label;

  /// The duration of the deployment (in seconds). 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? duration;

  /// The state of the deployment 
  DeploymentDataStateEnum state;

  Pipeline pipeline;

  Environment environment;

  /// A list of commands to be actioned for this Deployment 
  List<Command> commands;

  /// The DeploymentData schema version used for this deployment data.  Placeholder to support potential schema changes in the future. 
  DeploymentDataSchemaVersionEnum? schemaVersion;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeploymentData &&
    other.deploymentSequenceNumber == deploymentSequenceNumber &&
    other.updateSequenceNumber == updateSequenceNumber &&
    _deepEquality.equals(other.issueKeys, issueKeys) &&
    _deepEquality.equals(other.associations, associations) &&
    other.displayName == displayName &&
    other.url == url &&
    other.description == description &&
    other.lastUpdated == lastUpdated &&
    other.label == label &&
    other.duration == duration &&
    other.state == state &&
    other.pipeline == pipeline &&
    other.environment == environment &&
    _deepEquality.equals(other.commands, commands) &&
    other.schemaVersion == schemaVersion;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (deploymentSequenceNumber.hashCode) +
    (updateSequenceNumber.hashCode) +
    (issueKeys.hashCode) +
    (associations.hashCode) +
    (displayName.hashCode) +
    (url.hashCode) +
    (description.hashCode) +
    (lastUpdated.hashCode) +
    (label == null ? 0 : label!.hashCode) +
    (duration == null ? 0 : duration!.hashCode) +
    (state.hashCode) +
    (pipeline.hashCode) +
    (environment.hashCode) +
    (commands.hashCode) +
    (schemaVersion == null ? 0 : schemaVersion!.hashCode);

  @override
  String toString() => 'DeploymentData[deploymentSequenceNumber=$deploymentSequenceNumber, updateSequenceNumber=$updateSequenceNumber, issueKeys=$issueKeys, associations=$associations, displayName=$displayName, url=$url, description=$description, lastUpdated=$lastUpdated, label=$label, duration=$duration, state=$state, pipeline=$pipeline, environment=$environment, commands=$commands, schemaVersion=$schemaVersion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'deploymentSequenceNumber'] = this.deploymentSequenceNumber;
      json[r'updateSequenceNumber'] = this.updateSequenceNumber;
      json[r'issueKeys'] = this.issueKeys;
      json[r'associations'] = this.associations;
      json[r'displayName'] = this.displayName;
      json[r'url'] = this.url;
      json[r'description'] = this.description;
      json[r'lastUpdated'] = this.lastUpdated.toUtc().toIso8601String();
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
      json[r'state'] = this.state;
      json[r'pipeline'] = this.pipeline;
      json[r'environment'] = this.environment;
      json[r'commands'] = this.commands;
    if (this.schemaVersion != null) {
      json[r'schemaVersion'] = this.schemaVersion;
    } else {
      json[r'schemaVersion'] = null;
    }
    return json;
  }

  /// Returns a new [DeploymentData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeploymentData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'deploymentSequenceNumber'), 'Required key "DeploymentData[deploymentSequenceNumber]" is missing from JSON.');
        assert(json[r'deploymentSequenceNumber'] != null, 'Required key "DeploymentData[deploymentSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceNumber'), 'Required key "DeploymentData[updateSequenceNumber]" is missing from JSON.');
        assert(json[r'updateSequenceNumber'] != null, 'Required key "DeploymentData[updateSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'displayName'), 'Required key "DeploymentData[displayName]" is missing from JSON.');
        assert(json[r'displayName'] != null, 'Required key "DeploymentData[displayName]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "DeploymentData[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "DeploymentData[url]" has a null value in JSON.');
        assert(json.containsKey(r'description'), 'Required key "DeploymentData[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "DeploymentData[description]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "DeploymentData[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "DeploymentData[lastUpdated]" has a null value in JSON.');
        assert(json.containsKey(r'state'), 'Required key "DeploymentData[state]" is missing from JSON.');
        assert(json[r'state'] != null, 'Required key "DeploymentData[state]" has a null value in JSON.');
        assert(json.containsKey(r'pipeline'), 'Required key "DeploymentData[pipeline]" is missing from JSON.');
        assert(json[r'pipeline'] != null, 'Required key "DeploymentData[pipeline]" has a null value in JSON.');
        assert(json.containsKey(r'environment'), 'Required key "DeploymentData[environment]" is missing from JSON.');
        assert(json[r'environment'] != null, 'Required key "DeploymentData[environment]" has a null value in JSON.');
        return true;
      }());

      return DeploymentData(
        deploymentSequenceNumber: mapValueOfType<int>(json, r'deploymentSequenceNumber')!,
        updateSequenceNumber: mapValueOfType<int>(json, r'updateSequenceNumber')!,
        issueKeys: json[r'issueKeys'] is Iterable
            ? (json[r'issueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        associations: DeploymentDataAssociationsInner.listFromJson(json[r'associations']),
        displayName: mapValueOfType<String>(json, r'displayName')!,
        url: mapValueOfType<String>(json, r'url')!,
        description: mapValueOfType<String>(json, r'description')!,
        lastUpdated: mapDateTime(json, r'lastUpdated', r'')!,
        label: mapValueOfType<String>(json, r'label'),
        duration: mapValueOfType<int>(json, r'duration'),
        state: DeploymentDataStateEnum.fromJson(json[r'state'])!,
        pipeline: Pipeline.fromJson(json[r'pipeline'])!,
        environment: Environment.fromJson(json[r'environment'])!,
        commands: Command.listFromJson(json[r'commands']),
        schemaVersion: DeploymentDataSchemaVersionEnum.fromJson(json[r'schemaVersion']),
      );
    }
    return null;
  }

  static List<DeploymentData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeploymentData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeploymentData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeploymentData> mapFromJson(dynamic json) {
    final map = <String, DeploymentData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeploymentData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeploymentData-objects as value to a dart map
  static Map<String, List<DeploymentData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DeploymentData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeploymentData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'deploymentSequenceNumber',
    'updateSequenceNumber',
    'displayName',
    'url',
    'description',
    'lastUpdated',
    'state',
    'pipeline',
    'environment',
  };
}

/// The state of the deployment 
enum DeploymentDataStateEnum {
  unknown._(r'unknown'),
  pending._(r'pending'),
  inProgress._(r'in_progress'),
  cancelled._(r'cancelled'),
  failed._(r'failed'),
  rolledBack._(r'rolled_back'),
  successful._(r'successful'),
  ;

  /// Instantiate a new enum with the provided value.
  const DeploymentDataStateEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [DeploymentDataStateEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static DeploymentDataStateEnum? fromJson(dynamic value) => DeploymentDataStateEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [DeploymentDataStateEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<DeploymentDataStateEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeploymentDataStateEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeploymentDataStateEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DeploymentDataStateEnum] to String,
/// and [decode] dynamic data back to [DeploymentDataStateEnum].
class DeploymentDataStateEnumTypeTransformer {
  factory DeploymentDataStateEnumTypeTransformer() => _instance ??= const DeploymentDataStateEnumTypeTransformer._();

  const DeploymentDataStateEnumTypeTransformer._();

  String encode(DeploymentDataStateEnum data) => data._value;

  /// Returns the instance of [DeploymentDataStateEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DeploymentDataStateEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is DeploymentDataStateEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'unknown': return DeploymentDataStateEnum.unknown;
        case r'pending': return DeploymentDataStateEnum.pending;
        case r'in_progress': return DeploymentDataStateEnum.inProgress;
        case r'cancelled': return DeploymentDataStateEnum.cancelled;
        case r'failed': return DeploymentDataStateEnum.failed;
        case r'rolled_back': return DeploymentDataStateEnum.rolledBack;
        case r'successful': return DeploymentDataStateEnum.successful;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static DeploymentDataStateEnumTypeTransformer? _instance;
}


/// The DeploymentData schema version used for this deployment data.  Placeholder to support potential schema changes in the future. 
enum DeploymentDataSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const DeploymentDataSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [DeploymentDataSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static DeploymentDataSchemaVersionEnum? fromJson(dynamic value) => DeploymentDataSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [DeploymentDataSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<DeploymentDataSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeploymentDataSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeploymentDataSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DeploymentDataSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [DeploymentDataSchemaVersionEnum].
class DeploymentDataSchemaVersionEnumTypeTransformer {
  factory DeploymentDataSchemaVersionEnumTypeTransformer() => _instance ??= const DeploymentDataSchemaVersionEnumTypeTransformer._();

  const DeploymentDataSchemaVersionEnumTypeTransformer._();

  String encode(DeploymentDataSchemaVersionEnum data) => data._value;

  /// Returns the instance of [DeploymentDataSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DeploymentDataSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is DeploymentDataSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return DeploymentDataSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static DeploymentDataSchemaVersionEnumTypeTransformer? _instance;
}


