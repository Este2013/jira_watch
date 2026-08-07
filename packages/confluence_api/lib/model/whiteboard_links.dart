//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WhiteboardLinks {
  /// Returns a new [WhiteboardLinks] instance.
  WhiteboardLinks({
    this.webui,
    this.editui,
  });

  /// Web UI link of the content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? webui;

  /// Edit UI link of the content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? editui;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WhiteboardLinks &&
    other.webui == webui &&
    other.editui == editui;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (webui == null ? 0 : webui!.hashCode) +
    (editui == null ? 0 : editui!.hashCode);

  @override
  String toString() => 'WhiteboardLinks[webui=$webui, editui=$editui]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.webui != null) {
      json[r'webui'] = this.webui;
    } else {
      json[r'webui'] = null;
    }
    if (this.editui != null) {
      json[r'editui'] = this.editui;
    } else {
      json[r'editui'] = null;
    }
    return json;
  }

  /// Returns a new [WhiteboardLinks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WhiteboardLinks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WhiteboardLinks(
        webui: mapValueOfType<String>(json, r'webui'),
        editui: mapValueOfType<String>(json, r'editui'),
      );
    }
    return null;
  }

  static List<WhiteboardLinks> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WhiteboardLinks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WhiteboardLinks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WhiteboardLinks> mapFromJson(dynamic json) {
    final map = <String, WhiteboardLinks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WhiteboardLinks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WhiteboardLinks-objects as value to a dart map
  static Map<String, List<WhiteboardLinks>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WhiteboardLinks>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WhiteboardLinks.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

