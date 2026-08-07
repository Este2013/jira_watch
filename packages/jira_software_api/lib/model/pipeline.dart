//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Pipeline {
  /// Returns a new [Pipeline] instance.
  Pipeline({
    required this.id,
    required this.displayName,
    required this.url,
  });

  /// The identifier of this pipeline, must be unique for the provider. 
  String id;

  /// The name of the pipeline to present to the user. 
  String displayName;

  /// A URL users can use to link to this deployment pipeline. 
  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Pipeline &&
    other.id == id &&
    other.displayName == displayName &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (displayName.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'Pipeline[id=$id, displayName=$displayName, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'displayName'] = this.displayName;
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [Pipeline] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Pipeline? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "Pipeline[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Pipeline[id]" has a null value in JSON.');
        assert(json.containsKey(r'displayName'), 'Required key "Pipeline[displayName]" is missing from JSON.');
        assert(json[r'displayName'] != null, 'Required key "Pipeline[displayName]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "Pipeline[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "Pipeline[url]" has a null value in JSON.');
        return true;
      }());

      return Pipeline(
        id: mapValueOfType<String>(json, r'id')!,
        displayName: mapValueOfType<String>(json, r'displayName')!,
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<Pipeline> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Pipeline>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Pipeline.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Pipeline> mapFromJson(dynamic json) {
    final map = <String, Pipeline>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Pipeline.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Pipeline-objects as value to a dart map
  static Map<String, List<Pipeline>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Pipeline>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Pipeline.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'displayName',
    'url',
  };
}

