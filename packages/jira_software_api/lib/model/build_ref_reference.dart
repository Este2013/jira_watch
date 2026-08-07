//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BuildRefReference {
  /// Returns a new [BuildRefReference] instance.
  BuildRefReference({
    required this.name,
    required this.uri,
  });

  /// The name of the ref the build ran on 
  String name;

  /// An identifer for the ref.  In most cases this should be the URL of the tag/branch etc. in the SCM provider.  For cases where the build was executed against a local repository etc. this should be something that uniquely identifies the ref. 
  String uri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BuildRefReference &&
    other.name == name &&
    other.uri == uri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (uri.hashCode);

  @override
  String toString() => 'BuildRefReference[name=$name, uri=$uri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'uri'] = this.uri;
    return json;
  }

  /// Returns a new [BuildRefReference] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BuildRefReference? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "BuildRefReference[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "BuildRefReference[name]" has a null value in JSON.');
        assert(json.containsKey(r'uri'), 'Required key "BuildRefReference[uri]" is missing from JSON.');
        assert(json[r'uri'] != null, 'Required key "BuildRefReference[uri]" has a null value in JSON.');
        return true;
      }());

      return BuildRefReference(
        name: mapValueOfType<String>(json, r'name')!,
        uri: mapValueOfType<String>(json, r'uri')!,
      );
    }
    return null;
  }

  static List<BuildRefReference> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildRefReference>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildRefReference.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BuildRefReference> mapFromJson(dynamic json) {
    final map = <String, BuildRefReference>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BuildRefReference.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BuildRefReference-objects as value to a dart map
  static Map<String, List<BuildRefReference>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BuildRefReference>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BuildRefReference.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'uri',
  };
}

