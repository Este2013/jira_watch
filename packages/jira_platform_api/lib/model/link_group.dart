//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LinkGroup {
  /// Returns a new [LinkGroup] instance.
  LinkGroup({
    this.groups = const [],
    this.header,
    this.id,
    this.links = const [],
    this.styleClass,
    this.weight,
  });

  List<LinkGroup> groups;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SimpleLink? header;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  List<SimpleLink> links;

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
  int? weight;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LinkGroup &&
    _deepEquality.equals(other.groups, groups) &&
    other.header == header &&
    other.id == id &&
    _deepEquality.equals(other.links, links) &&
    other.styleClass == styleClass &&
    other.weight == weight;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (groups.hashCode) +
    (header == null ? 0 : header!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (links.hashCode) +
    (styleClass == null ? 0 : styleClass!.hashCode) +
    (weight == null ? 0 : weight!.hashCode);

  @override
  String toString() => 'LinkGroup[groups=$groups, header=$header, id=$id, links=$links, styleClass=$styleClass, weight=$weight]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'groups'] = this.groups;
    if (this.header != null) {
      json[r'header'] = this.header;
    } else {
      json[r'header'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'links'] = this.links;
    if (this.styleClass != null) {
      json[r'styleClass'] = this.styleClass;
    } else {
      json[r'styleClass'] = null;
    }
    if (this.weight != null) {
      json[r'weight'] = this.weight;
    } else {
      json[r'weight'] = null;
    }
    return json;
  }

  /// Returns a new [LinkGroup] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LinkGroup? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return LinkGroup(
        groups: LinkGroup.listFromJson(json[r'groups']),
        header: SimpleLink.fromJson(json[r'header']),
        id: mapValueOfType<String>(json, r'id'),
        links: SimpleLink.listFromJson(json[r'links']),
        styleClass: mapValueOfType<String>(json, r'styleClass'),
        weight: mapValueOfType<int>(json, r'weight'),
      );
    }
    return null;
  }

  static List<LinkGroup> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LinkGroup>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LinkGroup.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LinkGroup> mapFromJson(dynamic json) {
    final map = <String, LinkGroup>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LinkGroup.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LinkGroup-objects as value to a dart map
  static Map<String, List<LinkGroup>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LinkGroup>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LinkGroup.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

