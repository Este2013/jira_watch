//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Icon {
  /// Returns a new [Icon] instance.
  Icon({
    this.link,
    this.title,
    this.url16x16,
  });

  /// The URL of the tooltip, used only for a status icon. If not set, the status icon in Jira is not clickable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? link;

  /// The title of the icon. This is used as follows:   *  For a status icon it is used as a tooltip on the icon. If not set, the status icon doesn't display a tooltip in Jira.  *  For the remote object icon it is used in conjunction with the application name to display a tooltip for the link's icon. The tooltip takes the format \"\\[application name\\] icon title\". Blank itemsare excluded from the tooltip title. If both items are blank, the icon tooltop displays as \"Web Link\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// The URL of an icon that displays at 16x16 pixel in Jira.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url16x16;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Icon &&
    other.link == link &&
    other.title == title &&
    other.url16x16 == url16x16;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (link == null ? 0 : link!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (url16x16 == null ? 0 : url16x16!.hashCode);

  @override
  String toString() => 'Icon[link=$link, title=$title, url16x16=$url16x16]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.link != null) {
      json[r'link'] = this.link;
    } else {
      json[r'link'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.url16x16 != null) {
      json[r'url16x16'] = this.url16x16;
    } else {
      json[r'url16x16'] = null;
    }
    return json;
  }

  /// Returns a new [Icon] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Icon? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Icon(
        link: mapValueOfType<String>(json, r'link'),
        title: mapValueOfType<String>(json, r'title'),
        url16x16: mapValueOfType<String>(json, r'url16x16'),
      );
    }
    return null;
  }

  static List<Icon> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Icon>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Icon.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Icon> mapFromJson(dynamic json) {
    final map = <String, Icon>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Icon.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Icon-objects as value to a dart map
  static Map<String, List<Icon>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Icon>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Icon.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

