//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ComponentJsonBean {
  /// Returns a new [ComponentJsonBean] instance.
  ComponentJsonBean({
    this.ari,
    this.description,
    this.id,
    this.metadata = const {},
    this.name,
    this.self,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ari;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  Map<String, String> metadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ComponentJsonBean &&
    other.ari == ari &&
    other.description == description &&
    other.id == id &&
    _deepEquality.equals(other.metadata, metadata) &&
    other.name == name &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ari == null ? 0 : ari!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (metadata.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'ComponentJsonBean[ari=$ari, description=$description, id=$id, metadata=$metadata, name=$name, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ari != null) {
      json[r'ari'] = this.ari;
    } else {
      json[r'ari'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'metadata'] = this.metadata;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [ComponentJsonBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ComponentJsonBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ComponentJsonBean(
        ari: mapValueOfType<String>(json, r'ari'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        metadata: mapCastOfType<String, String>(json, r'metadata') ?? const {},
        name: mapValueOfType<String>(json, r'name'),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<ComponentJsonBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ComponentJsonBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ComponentJsonBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ComponentJsonBean> mapFromJson(dynamic json) {
    final map = <String, ComponentJsonBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ComponentJsonBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ComponentJsonBean-objects as value to a dart map
  static Map<String, List<ComponentJsonBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ComponentJsonBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ComponentJsonBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

