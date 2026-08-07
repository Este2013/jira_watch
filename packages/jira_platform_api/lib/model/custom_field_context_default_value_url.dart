//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueURL {
  /// Returns a new [CustomFieldContextDefaultValueURL] instance.
  CustomFieldContextDefaultValueURL({
    required this.contextId,
    required this.type,
    required this.url,
  });

  /// The ID of the context.
  String contextId;

  String type;

  /// The default URL.
  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueURL &&
    other.contextId == contextId &&
    other.type == type &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (type.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueURL[contextId=$contextId, type=$type, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'type'] = this.type;
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueURL] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueURL? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueURL[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueURL[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueURL[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueURL[type]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "CustomFieldContextDefaultValueURL[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "CustomFieldContextDefaultValueURL[url]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueURL(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        type: mapValueOfType<String>(json, r'type')!,
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueURL> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueURL>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueURL.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueURL> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueURL>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueURL.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueURL-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueURL>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueURL>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueURL.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'type',
    'url',
  };
}

