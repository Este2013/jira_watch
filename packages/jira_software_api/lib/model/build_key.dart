//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BuildKey {
  /// Returns a new [BuildKey] instance.
  BuildKey({
    required this.pipelineId,
    required this.buildNumber,
  });

  /// An ID that relates a sequence of builds. Depending on your system this might be a project ID, pipeline ID, plan key etc. - whatever logical unit you use to group a sequence of builds.  The combination of `pipelineId` and `buildNumber` must uniquely identify the build. 
  String pipelineId;

  /// Identifies a build within the sequence of builds identified by the build `pipelineId`.  Used to identify the 'most recent' build in that sequence of builds.  The combination of `pipelineId` and `buildNumber` must uniquely identify the build. 
  int buildNumber;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BuildKey &&
    other.pipelineId == pipelineId &&
    other.buildNumber == buildNumber;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (pipelineId.hashCode) +
    (buildNumber.hashCode);

  @override
  String toString() => 'BuildKey[pipelineId=$pipelineId, buildNumber=$buildNumber]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'pipelineId'] = this.pipelineId;
      json[r'buildNumber'] = this.buildNumber;
    return json;
  }

  /// Returns a new [BuildKey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BuildKey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'pipelineId'), 'Required key "BuildKey[pipelineId]" is missing from JSON.');
        assert(json[r'pipelineId'] != null, 'Required key "BuildKey[pipelineId]" has a null value in JSON.');
        assert(json.containsKey(r'buildNumber'), 'Required key "BuildKey[buildNumber]" is missing from JSON.');
        assert(json[r'buildNumber'] != null, 'Required key "BuildKey[buildNumber]" has a null value in JSON.');
        return true;
      }());

      return BuildKey(
        pipelineId: mapValueOfType<String>(json, r'pipelineId')!,
        buildNumber: mapValueOfType<int>(json, r'buildNumber')!,
      );
    }
    return null;
  }

  static List<BuildKey> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildKey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildKey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BuildKey> mapFromJson(dynamic json) {
    final map = <String, BuildKey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BuildKey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BuildKey-objects as value to a dart map
  static Map<String, List<BuildKey>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BuildKey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BuildKey.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'pipelineId',
    'buildNumber',
  };
}

