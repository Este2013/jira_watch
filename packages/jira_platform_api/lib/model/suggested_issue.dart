//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SuggestedIssue {
  /// Returns a new [SuggestedIssue] instance.
  SuggestedIssue({
    this.id,
    this.img,
    this.key,
    this.keyHtml,
    this.summary,
    this.summaryText,
  });

  /// The ID of the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The URL of the issue type's avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? img;

  /// The key of the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The key of the issue in HTML format.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? keyHtml;

  /// The phrase containing the query string in HTML format, with the string highlighted with HTML bold tags.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? summary;

  /// The phrase containing the query string, as plain text.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? summaryText;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SuggestedIssue &&
    other.id == id &&
    other.img == img &&
    other.key == key &&
    other.keyHtml == keyHtml &&
    other.summary == summary &&
    other.summaryText == summaryText;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (img == null ? 0 : img!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (keyHtml == null ? 0 : keyHtml!.hashCode) +
    (summary == null ? 0 : summary!.hashCode) +
    (summaryText == null ? 0 : summaryText!.hashCode);

  @override
  String toString() => 'SuggestedIssue[id=$id, img=$img, key=$key, keyHtml=$keyHtml, summary=$summary, summaryText=$summaryText]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.img != null) {
      json[r'img'] = this.img;
    } else {
      json[r'img'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.keyHtml != null) {
      json[r'keyHtml'] = this.keyHtml;
    } else {
      json[r'keyHtml'] = null;
    }
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
    if (this.summaryText != null) {
      json[r'summaryText'] = this.summaryText;
    } else {
      json[r'summaryText'] = null;
    }
    return json;
  }

  /// Returns a new [SuggestedIssue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SuggestedIssue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SuggestedIssue(
        id: mapValueOfType<int>(json, r'id'),
        img: mapValueOfType<String>(json, r'img'),
        key: mapValueOfType<String>(json, r'key'),
        keyHtml: mapValueOfType<String>(json, r'keyHtml'),
        summary: mapValueOfType<String>(json, r'summary'),
        summaryText: mapValueOfType<String>(json, r'summaryText'),
      );
    }
    return null;
  }

  static List<SuggestedIssue> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SuggestedIssue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SuggestedIssue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SuggestedIssue> mapFromJson(dynamic json) {
    final map = <String, SuggestedIssue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SuggestedIssue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SuggestedIssue-objects as value to a dart map
  static Map<String, List<SuggestedIssue>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SuggestedIssue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SuggestedIssue.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

