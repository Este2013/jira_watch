//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatedIssue {
  /// Returns a new [CreatedIssue] instance.
  CreatedIssue({
    this.id,
    this.key,
    this.self,
    this.transition,
    this.watchers,
  });

  /// The ID of the created issue or subtask.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The key of the created issue or subtask.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The URL of the created issue or subtask.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The response code and messages related to any requested transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  NestedResponse? transition;

  /// The response code and messages related to any requested watchers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  NestedResponse? watchers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreatedIssue &&
    other.id == id &&
    other.key == key &&
    other.self == self &&
    other.transition == transition &&
    other.watchers == watchers;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (transition == null ? 0 : transition!.hashCode) +
    (watchers == null ? 0 : watchers!.hashCode);

  @override
  String toString() => 'CreatedIssue[id=$id, key=$key, self=$self, transition=$transition, watchers=$watchers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.transition != null) {
      json[r'transition'] = this.transition;
    } else {
      json[r'transition'] = null;
    }
    if (this.watchers != null) {
      json[r'watchers'] = this.watchers;
    } else {
      json[r'watchers'] = null;
    }
    return json;
  }

  /// Returns a new [CreatedIssue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatedIssue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreatedIssue(
        id: mapValueOfType<String>(json, r'id'),
        key: mapValueOfType<String>(json, r'key'),
        self: mapValueOfType<String>(json, r'self'),
        transition: NestedResponse.fromJson(json[r'transition']),
        watchers: NestedResponse.fromJson(json[r'watchers']),
      );
    }
    return null;
  }

  static List<CreatedIssue> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatedIssue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatedIssue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatedIssue> mapFromJson(dynamic json) {
    final map = <String, CreatedIssue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatedIssue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatedIssue-objects as value to a dart map
  static Map<String, List<CreatedIssue>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreatedIssue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatedIssue.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

