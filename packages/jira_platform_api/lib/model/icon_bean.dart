//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IconBean {
  /// Returns a new [IconBean] instance.
  IconBean({
    this.link,
    this.title,
    this.url16x16,
  });

  /// The URL of the tooltip, used only for a status icon.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? link;

  /// The title of the icon, for use as a tooltip on the icon.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// The URL of a 16x16 pixel icon.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url16x16;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IconBean &&
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
  String toString() => 'IconBean[link=$link, title=$title, url16x16=$url16x16]';

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

  /// Returns a new [IconBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IconBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IconBean(
        link: mapValueOfType<String>(json, r'link'),
        title: mapValueOfType<String>(json, r'title'),
        url16x16: mapValueOfType<String>(json, r'url16x16'),
      );
    }
    return null;
  }

  static List<IconBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IconBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IconBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IconBean> mapFromJson(dynamic json) {
    final map = <String, IconBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IconBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IconBean-objects as value to a dart map
  static Map<String, List<IconBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IconBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IconBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

