//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AvailableDashboardGadget {
  /// Returns a new [AvailableDashboardGadget] instance.
  AvailableDashboardGadget({
    this.moduleKey,
    required this.title,
    this.uri,
  });

  /// The module key of the gadget type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? moduleKey;

  /// The title of the gadget.
  String title;

  /// The URI of the gadget type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AvailableDashboardGadget &&
    other.moduleKey == moduleKey &&
    other.title == title &&
    other.uri == uri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (moduleKey == null ? 0 : moduleKey!.hashCode) +
    (title.hashCode) +
    (uri == null ? 0 : uri!.hashCode);

  @override
  String toString() => 'AvailableDashboardGadget[moduleKey=$moduleKey, title=$title, uri=$uri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.moduleKey != null) {
      json[r'moduleKey'] = this.moduleKey;
    } else {
      json[r'moduleKey'] = null;
    }
      json[r'title'] = this.title;
    if (this.uri != null) {
      json[r'uri'] = this.uri;
    } else {
      json[r'uri'] = null;
    }
    return json;
  }

  /// Returns a new [AvailableDashboardGadget] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AvailableDashboardGadget? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'title'), 'Required key "AvailableDashboardGadget[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "AvailableDashboardGadget[title]" has a null value in JSON.');
        return true;
      }());

      return AvailableDashboardGadget(
        moduleKey: mapValueOfType<String>(json, r'moduleKey'),
        title: mapValueOfType<String>(json, r'title')!,
        uri: mapValueOfType<String>(json, r'uri'),
      );
    }
    return null;
  }

  static List<AvailableDashboardGadget> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableDashboardGadget>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableDashboardGadget.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AvailableDashboardGadget> mapFromJson(dynamic json) {
    final map = <String, AvailableDashboardGadget>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AvailableDashboardGadget.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AvailableDashboardGadget-objects as value to a dart map
  static Map<String, List<AvailableDashboardGadget>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AvailableDashboardGadget>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AvailableDashboardGadget.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'title',
  };
}

