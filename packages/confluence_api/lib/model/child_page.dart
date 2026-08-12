//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChildPage {
  /// Returns a new [ChildPage] instance.
  ChildPage({
    this.id,
    this.status,
    this.title,
    this.spaceId,
    this.childPosition,
  });

  /// ID of the page.
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
  OnlyArchivedAndCurrentContentStatus? status;

  /// Title of the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// ID of the space the page is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? spaceId;

  /// Position of child page within the given parent page tree.
  int? childPosition;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChildPage &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.spaceId == spaceId &&
    other.childPosition == childPosition;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (childPosition == null ? 0 : childPosition!.hashCode);

  @override
  String toString() => 'ChildPage[id=$id, status=$status, title=$title, spaceId=$spaceId, childPosition=$childPosition]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.spaceId != null) {
      json[r'spaceId'] = this.spaceId;
    } else {
      json[r'spaceId'] = null;
    }
    if (this.childPosition != null) {
      json[r'childPosition'] = this.childPosition;
    } else {
      json[r'childPosition'] = null;
    }
    return json;
  }

  /// Returns a new [ChildPage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChildPage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ChildPage(
        id: mapValueOfType<String>(json, r'id'),
        status: OnlyArchivedAndCurrentContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        spaceId: mapValueOfType<String>(json, r'spaceId'),
        childPosition: mapValueOfType<int>(json, r'childPosition'),
      );
    }
    return null;
  }

  static List<ChildPage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChildPage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChildPage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChildPage> mapFromJson(dynamic json) {
    final map = <String, ChildPage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChildPage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChildPage-objects as value to a dart map
  static Map<String, List<ChildPage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChildPage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChildPage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

