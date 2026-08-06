//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RemoteObject {
  /// Returns a new [RemoteObject] instance.
  RemoteObject({
    this.icon,
    this.status,
    this.summary,
    required this.title,
    required this.url,
  });

  /// Details of the icon for the item. If no icon is defined, the default link icon is used in Jira.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Icon? icon;

  /// The status of the item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Status? status;

  /// The summary details of the item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? summary;

  /// The title of the item.
  String title;

  /// The URL of the item.
  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RemoteObject &&
    other.icon == icon &&
    other.status == status &&
    other.summary == summary &&
    other.title == title &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (icon == null ? 0 : icon!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (summary == null ? 0 : summary!.hashCode) +
    (title.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'RemoteObject[icon=$icon, status=$status, summary=$summary, title=$title, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.icon != null) {
      json[r'icon'] = this.icon;
    } else {
      json[r'icon'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
      json[r'title'] = this.title;
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [RemoteObject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RemoteObject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'title'), 'Required key "RemoteObject[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "RemoteObject[title]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "RemoteObject[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "RemoteObject[url]" has a null value in JSON.');
        return true;
      }());

      return RemoteObject(
        icon: Icon.fromJson(json[r'icon']),
        status: Status.fromJson(json[r'status']),
        summary: mapValueOfType<String>(json, r'summary'),
        title: mapValueOfType<String>(json, r'title')!,
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<RemoteObject> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoteObject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoteObject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RemoteObject> mapFromJson(dynamic json) {
    final map = <String, RemoteObject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RemoteObject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RemoteObject-objects as value to a dart map
  static Map<String, List<RemoteObject>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RemoteObject>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RemoteObject.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'title',
    'url',
  };
}

