//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraRichTextField {
  /// Returns a new [JiraRichTextField] instance.
  JiraRichTextField({
    required this.fieldId,
    required this.richText,
  });

  String fieldId;

  JiraRichTextInput richText;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraRichTextField &&
    other.fieldId == fieldId &&
    other.richText == richText;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldId.hashCode) +
    (richText.hashCode);

  @override
  String toString() => 'JiraRichTextField[fieldId=$fieldId, richText=$richText]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldId'] = this.fieldId;
      json[r'richText'] = this.richText;
    return json;
  }

  /// Returns a new [JiraRichTextField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraRichTextField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "JiraRichTextField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraRichTextField[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'richText'), 'Required key "JiraRichTextField[richText]" is missing from JSON.');
        assert(json[r'richText'] != null, 'Required key "JiraRichTextField[richText]" has a null value in JSON.');
        return true;
      }());

      return JiraRichTextField(
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        richText: JiraRichTextInput.fromJson(json[r'richText'])!,
      );
    }
    return null;
  }

  static List<JiraRichTextField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraRichTextField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraRichTextField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraRichTextField> mapFromJson(dynamic json) {
    final map = <String, JiraRichTextField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraRichTextField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraRichTextField-objects as value to a dart map
  static Map<String, List<JiraRichTextField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraRichTextField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraRichTextField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
    'richText',
  };
}

