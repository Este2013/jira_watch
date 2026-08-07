//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AssociatedItemBean {
  /// Returns a new [AssociatedItemBean] instance.
  AssociatedItemBean({
    this.id,
    this.name,
    this.parentId,
    this.parentName,
    this.typeName,
  });

  /// The ID of the associated record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The name of the associated record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The ID of the associated parent record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentId;

  /// The name of the associated parent record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentName;

  /// The type of the associated record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? typeName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AssociatedItemBean &&
    other.id == id &&
    other.name == name &&
    other.parentId == parentId &&
    other.parentName == parentName &&
    other.typeName == typeName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (parentName == null ? 0 : parentName!.hashCode) +
    (typeName == null ? 0 : typeName!.hashCode);

  @override
  String toString() => 'AssociatedItemBean[id=$id, name=$name, parentId=$parentId, parentName=$parentName, typeName=$typeName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.parentId != null) {
      json[r'parentId'] = this.parentId;
    } else {
      json[r'parentId'] = null;
    }
    if (this.parentName != null) {
      json[r'parentName'] = this.parentName;
    } else {
      json[r'parentName'] = null;
    }
    if (this.typeName != null) {
      json[r'typeName'] = this.typeName;
    } else {
      json[r'typeName'] = null;
    }
    return json;
  }

  /// Returns a new [AssociatedItemBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AssociatedItemBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AssociatedItemBean(
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        parentId: mapValueOfType<String>(json, r'parentId'),
        parentName: mapValueOfType<String>(json, r'parentName'),
        typeName: mapValueOfType<String>(json, r'typeName'),
      );
    }
    return null;
  }

  static List<AssociatedItemBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AssociatedItemBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssociatedItemBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AssociatedItemBean> mapFromJson(dynamic json) {
    final map = <String, AssociatedItemBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssociatedItemBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AssociatedItemBean-objects as value to a dart map
  static Map<String, List<AssociatedItemBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AssociatedItemBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AssociatedItemBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

