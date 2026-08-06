//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Commit2 {
  /// Returns a new [Commit2] instance.
  Commit2({
    required this.commitHash,
    required this.repositoryId,
  });

  /// The hash for the Commit. 
  String commitHash;

  /// The ID of the Repository that the Commit belongs to. 
  String repositoryId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Commit2 &&
    other.commitHash == commitHash &&
    other.repositoryId == repositoryId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (commitHash.hashCode) +
    (repositoryId.hashCode);

  @override
  String toString() => 'Commit2[commitHash=$commitHash, repositoryId=$repositoryId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'commitHash'] = this.commitHash;
      json[r'repositoryId'] = this.repositoryId;
    return json;
  }

  /// Returns a new [Commit2] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Commit2? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'commitHash'), 'Required key "Commit2[commitHash]" is missing from JSON.');
        assert(json[r'commitHash'] != null, 'Required key "Commit2[commitHash]" has a null value in JSON.');
        assert(json.containsKey(r'repositoryId'), 'Required key "Commit2[repositoryId]" is missing from JSON.');
        assert(json[r'repositoryId'] != null, 'Required key "Commit2[repositoryId]" has a null value in JSON.');
        return true;
      }());

      return Commit2(
        commitHash: mapValueOfType<String>(json, r'commitHash')!,
        repositoryId: mapValueOfType<String>(json, r'repositoryId')!,
      );
    }
    return null;
  }

  static List<Commit2> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Commit2>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Commit2.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Commit2> mapFromJson(dynamic json) {
    final map = <String, Commit2>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Commit2.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Commit2-objects as value to a dart map
  static Map<String, List<Commit2>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Commit2>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Commit2.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'commitHash',
    'repositoryId',
  };
}

