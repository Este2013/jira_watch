//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeScreenScheme {
  /// Returns a new [IssueTypeScreenScheme] instance.
  IssueTypeScreenScheme({
    this.description,
    required this.id,
    required this.name,
  });

  /// The description of the issue type screen scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the issue type screen scheme.
  String id;

  /// The name of the issue type screen scheme.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeScreenScheme &&
    other.description == description &&
    other.id == id &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'IssueTypeScreenScheme[description=$description, id=$id, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [IssueTypeScreenScheme] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeScreenScheme? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "IssueTypeScreenScheme[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "IssueTypeScreenScheme[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "IssueTypeScreenScheme[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "IssueTypeScreenScheme[name]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeScreenScheme(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<IssueTypeScreenScheme> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeScreenScheme>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeScreenScheme.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeScreenScheme> mapFromJson(dynamic json) {
    final map = <String, IssueTypeScreenScheme>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeScreenScheme.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeScreenScheme-objects as value to a dart map
  static Map<String, List<IssueTypeScreenScheme>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeScreenScheme>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeScreenScheme.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
  };
}

