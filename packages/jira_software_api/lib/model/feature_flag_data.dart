//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureFlagData {
  /// Returns a new [FeatureFlagData] instance.
  FeatureFlagData({
    this.schemaVersion,
    required this.id,
    required this.key,
    required this.updateSequenceId,
    this.displayName,
    this.issueKeys = const [],
    this.associations = const [],
    required this.summary,
    this.details = const [],
  });

  /// The FeatureFlagData schema version used for this flag data.   Placeholder to support potential schema changes in the future. 
  FeatureFlagDataSchemaVersionEnum? schemaVersion;

  /// The identifier for the Feature Flag. Must be unique for a given Provider. 
  String id;

  /// The identifier that users would use to reference the Feature Flag in their source code etc.  Will be made available via the UI for users to copy into their source code etc. 
  String key;

  /// An ID used to apply an ordering to updates for this Feature Flag in the case of out-of-order receipt of update requests.  This can be any monotonically increasing number. A suggested implementation is to use epoch millis from the Provider system, but other alternatives are valid (e.g. a Provider could store a counter against each Feature Flag and increment that on each update to Jira).  Updates for a Feature Flag that are received with an updateSqeuenceId lower than what is currently stored will be ignored. 
  int updateSequenceId;

  /// The human-readable name for the Feature Flag. Will be shown in the UI.  If not provided, will use the ID for display. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// The Jira issue keys to associate the Feature Flag information with. 
  List<String> issueKeys;

  /// The Jira issue keys or IDs to associate the feature flag with.
  List<IssueIdOrKeysAssociation> associations;

  FeatureFlagSummary summary;

  /// Detail information for this Feature Flag.  This may be information for each environment the Feature Flag is defined in or a selection of environments made by the user, as appropriate. 
  List<FeatureFlagDetails> details;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureFlagData &&
    other.schemaVersion == schemaVersion &&
    other.id == id &&
    other.key == key &&
    other.updateSequenceId == updateSequenceId &&
    other.displayName == displayName &&
    _deepEquality.equals(other.issueKeys, issueKeys) &&
    _deepEquality.equals(other.associations, associations) &&
    other.summary == summary &&
    _deepEquality.equals(other.details, details);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (schemaVersion == null ? 0 : schemaVersion!.hashCode) +
    (id.hashCode) +
    (key.hashCode) +
    (updateSequenceId.hashCode) +
    (displayName == null ? 0 : displayName!.hashCode) +
    (issueKeys.hashCode) +
    (associations.hashCode) +
    (summary.hashCode) +
    (details.hashCode);

  @override
  String toString() => 'FeatureFlagData[schemaVersion=$schemaVersion, id=$id, key=$key, updateSequenceId=$updateSequenceId, displayName=$displayName, issueKeys=$issueKeys, associations=$associations, summary=$summary, details=$details]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.schemaVersion != null) {
      json[r'schemaVersion'] = this.schemaVersion;
    } else {
      json[r'schemaVersion'] = null;
    }
      json[r'id'] = this.id;
      json[r'key'] = this.key;
      json[r'updateSequenceId'] = this.updateSequenceId;
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
    }
      json[r'issueKeys'] = this.issueKeys;
      json[r'associations'] = this.associations;
      json[r'summary'] = this.summary;
      json[r'details'] = this.details;
    return json;
  }

  /// Returns a new [FeatureFlagData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeatureFlagData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "FeatureFlagData[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "FeatureFlagData[id]" has a null value in JSON.');
        assert(json.containsKey(r'key'), 'Required key "FeatureFlagData[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "FeatureFlagData[key]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceId'), 'Required key "FeatureFlagData[updateSequenceId]" is missing from JSON.');
        assert(json[r'updateSequenceId'] != null, 'Required key "FeatureFlagData[updateSequenceId]" has a null value in JSON.');
        assert(json.containsKey(r'summary'), 'Required key "FeatureFlagData[summary]" is missing from JSON.');
        assert(json[r'summary'] != null, 'Required key "FeatureFlagData[summary]" has a null value in JSON.');
        assert(json.containsKey(r'details'), 'Required key "FeatureFlagData[details]" is missing from JSON.');
        assert(json[r'details'] != null, 'Required key "FeatureFlagData[details]" has a null value in JSON.');
        return true;
      }());

      return FeatureFlagData(
        schemaVersion: FeatureFlagDataSchemaVersionEnum.fromJson(json[r'schemaVersion']),
        id: mapValueOfType<String>(json, r'id')!,
        key: mapValueOfType<String>(json, r'key')!,
        updateSequenceId: mapValueOfType<int>(json, r'updateSequenceId')!,
        displayName: mapValueOfType<String>(json, r'displayName'),
        issueKeys: json[r'issueKeys'] is Iterable
            ? (json[r'issueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        associations: IssueIdOrKeysAssociation.listFromJson(json[r'associations']),
        summary: FeatureFlagSummary.fromJson(json[r'summary'])!,
        details: FeatureFlagDetails.listFromJson(json[r'details']),
      );
    }
    return null;
  }

  static List<FeatureFlagData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureFlagData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureFlagData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeatureFlagData> mapFromJson(dynamic json) {
    final map = <String, FeatureFlagData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeatureFlagData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeatureFlagData-objects as value to a dart map
  static Map<String, List<FeatureFlagData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeatureFlagData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeatureFlagData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'key',
    'updateSequenceId',
    'summary',
    'details',
  };
}

/// The FeatureFlagData schema version used for this flag data.   Placeholder to support potential schema changes in the future. 
enum FeatureFlagDataSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const FeatureFlagDataSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FeatureFlagDataSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FeatureFlagDataSchemaVersionEnum? fromJson(dynamic value) => FeatureFlagDataSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FeatureFlagDataSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FeatureFlagDataSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureFlagDataSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureFlagDataSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FeatureFlagDataSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [FeatureFlagDataSchemaVersionEnum].
class FeatureFlagDataSchemaVersionEnumTypeTransformer {
  factory FeatureFlagDataSchemaVersionEnumTypeTransformer() => _instance ??= const FeatureFlagDataSchemaVersionEnumTypeTransformer._();

  const FeatureFlagDataSchemaVersionEnumTypeTransformer._();

  String encode(FeatureFlagDataSchemaVersionEnum data) => data._value;

  /// Returns the instance of [FeatureFlagDataSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FeatureFlagDataSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FeatureFlagDataSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return FeatureFlagDataSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FeatureFlagDataSchemaVersionEnumTypeTransformer? _instance;
}


