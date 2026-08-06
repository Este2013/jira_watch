//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LinkGroupHeader {
  /// Returns a new [LinkGroupHeader] instance.
  LinkGroupHeader({
    this.href,
    this.iconClass,
    this.id,
    this.label,
    this.styleClass,
    this.title,
    this.weight,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? href;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? iconClass;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? label;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? styleClass;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? weight;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LinkGroupHeader &&
    other.href == href &&
    other.iconClass == iconClass &&
    other.id == id &&
    other.label == label &&
    other.styleClass == styleClass &&
    other.title == title &&
    other.weight == weight;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (href == null ? 0 : href!.hashCode) +
    (iconClass == null ? 0 : iconClass!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (label == null ? 0 : label!.hashCode) +
    (styleClass == null ? 0 : styleClass!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (weight == null ? 0 : weight!.hashCode);

  @override
  String toString() => 'LinkGroupHeader[href=$href, iconClass=$iconClass, id=$id, label=$label, styleClass=$styleClass, title=$title, weight=$weight]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.href != null) {
      json[r'href'] = this.href;
    } else {
      json[r'href'] = null;
    }
    if (this.iconClass != null) {
      json[r'iconClass'] = this.iconClass;
    } else {
      json[r'iconClass'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    if (this.styleClass != null) {
      json[r'styleClass'] = this.styleClass;
    } else {
      json[r'styleClass'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.weight != null) {
      json[r'weight'] = this.weight;
    } else {
      json[r'weight'] = null;
    }
    return json;
  }

  /// Returns a new [LinkGroupHeader] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LinkGroupHeader? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return LinkGroupHeader(
        href: mapValueOfType<String>(json, r'href'),
        iconClass: mapValueOfType<String>(json, r'iconClass'),
        id: mapValueOfType<String>(json, r'id'),
        label: mapValueOfType<String>(json, r'label'),
        styleClass: mapValueOfType<String>(json, r'styleClass'),
        title: mapValueOfType<String>(json, r'title'),
        weight: mapValueOfType<int>(json, r'weight'),
      );
    }
    return null;
  }

  static List<LinkGroupHeader> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LinkGroupHeader>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LinkGroupHeader.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LinkGroupHeader> mapFromJson(dynamic json) {
    final map = <String, LinkGroupHeader>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LinkGroupHeader.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LinkGroupHeader-objects as value to a dart map
  static Map<String, List<LinkGroupHeader>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LinkGroupHeader>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LinkGroupHeader.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

