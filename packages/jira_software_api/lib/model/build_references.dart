//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BuildReferences {
  /// Returns a new [BuildReferences] instance.
  BuildReferences({
    this.commit,
    this.ref,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BuildCommitReference? commit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BuildRefReference? ref;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BuildReferences &&
    other.commit == commit &&
    other.ref == ref;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (commit == null ? 0 : commit!.hashCode) +
    (ref == null ? 0 : ref!.hashCode);

  @override
  String toString() => 'BuildReferences[commit=$commit, ref=$ref]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.commit != null) {
      json[r'commit'] = this.commit;
    } else {
      json[r'commit'] = null;
    }
    if (this.ref != null) {
      json[r'ref'] = this.ref;
    } else {
      json[r'ref'] = null;
    }
    return json;
  }

  /// Returns a new [BuildReferences] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BuildReferences? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BuildReferences(
        commit: BuildCommitReference.fromJson(json[r'commit']),
        ref: BuildRefReference.fromJson(json[r'ref']),
      );
    }
    return null;
  }

  static List<BuildReferences> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildReferences>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildReferences.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BuildReferences> mapFromJson(dynamic json) {
    final map = <String, BuildReferences>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BuildReferences.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BuildReferences-objects as value to a dart map
  static Map<String, List<BuildReferences>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BuildReferences>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BuildReferences.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

