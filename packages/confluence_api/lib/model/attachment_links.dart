//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentLinks {
  /// Returns a new [AttachmentLinks] instance.
  AttachmentLinks({
    this.webui,
    this.download,
  });

  /// Web UI link of the content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? webui;

  /// Download link of the content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? download;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentLinks &&
    other.webui == webui &&
    other.download == download;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (webui == null ? 0 : webui!.hashCode) +
    (download == null ? 0 : download!.hashCode);

  @override
  String toString() => 'AttachmentLinks[webui=$webui, download=$download]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.webui != null) {
      json[r'webui'] = this.webui;
    } else {
      json[r'webui'] = null;
    }
    if (this.download != null) {
      json[r'download'] = this.download;
    } else {
      json[r'download'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentLinks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentLinks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentLinks(
        webui: mapValueOfType<String>(json, r'webui'),
        download: mapValueOfType<String>(json, r'download'),
      );
    }
    return null;
  }

  static List<AttachmentLinks> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentLinks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentLinks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentLinks> mapFromJson(dynamic json) {
    final map = <String, AttachmentLinks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentLinks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentLinks-objects as value to a dart map
  static Map<String, List<AttachmentLinks>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentLinks>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentLinks.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

