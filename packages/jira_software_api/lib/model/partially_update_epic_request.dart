//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PartiallyUpdateEpicRequest {
  /// Returns a new [PartiallyUpdateEpicRequest] instance.
  PartiallyUpdateEpicRequest({
    this.color,
    this.done,
    this.name,
    this.summary,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PartiallyUpdateEpicRequestColor? color;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? done;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? summary;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PartiallyUpdateEpicRequest &&
    other.color == color &&
    other.done == done &&
    other.name == name &&
    other.summary == summary;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (color == null ? 0 : color!.hashCode) +
    (done == null ? 0 : done!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (summary == null ? 0 : summary!.hashCode);

  @override
  String toString() => 'PartiallyUpdateEpicRequest[color=$color, done=$done, name=$name, summary=$summary]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.color != null) {
      json[r'color'] = this.color;
    } else {
      json[r'color'] = null;
    }
    if (this.done != null) {
      json[r'done'] = this.done;
    } else {
      json[r'done'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
    return json;
  }

  /// Returns a new [PartiallyUpdateEpicRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PartiallyUpdateEpicRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PartiallyUpdateEpicRequest(
        color: PartiallyUpdateEpicRequestColor.fromJson(json[r'color']),
        done: mapValueOfType<bool>(json, r'done'),
        name: mapValueOfType<String>(json, r'name'),
        summary: mapValueOfType<String>(json, r'summary'),
      );
    }
    return null;
  }

  static List<PartiallyUpdateEpicRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PartiallyUpdateEpicRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PartiallyUpdateEpicRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PartiallyUpdateEpicRequest> mapFromJson(dynamic json) {
    final map = <String, PartiallyUpdateEpicRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PartiallyUpdateEpicRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PartiallyUpdateEpicRequest-objects as value to a dart map
  static Map<String, List<PartiallyUpdateEpicRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PartiallyUpdateEpicRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PartiallyUpdateEpicRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

