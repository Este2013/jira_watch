//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServiceRegistryTier {
  /// Returns a new [ServiceRegistryTier] instance.
  ServiceRegistryTier({
    this.description,
    this.id,
    this.level,
    this.name,
    this.nameKey,
  });

  /// tier description
  String? description;

  /// tier ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// tier level
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? level;

  /// tier name
  String? name;

  /// name key of the tier
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServiceRegistryTier &&
    other.description == description &&
    other.id == id &&
    other.level == level &&
    other.name == name &&
    other.nameKey == nameKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (level == null ? 0 : level!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (nameKey == null ? 0 : nameKey!.hashCode);

  @override
  String toString() => 'ServiceRegistryTier[description=$description, id=$id, level=$level, name=$name, nameKey=$nameKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.level != null) {
      json[r'level'] = this.level;
    } else {
      json[r'level'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.nameKey != null) {
      json[r'nameKey'] = this.nameKey;
    } else {
      json[r'nameKey'] = null;
    }
    return json;
  }

  /// Returns a new [ServiceRegistryTier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServiceRegistryTier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ServiceRegistryTier(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        level: mapValueOfType<int>(json, r'level'),
        name: mapValueOfType<String>(json, r'name'),
        nameKey: mapValueOfType<String>(json, r'nameKey'),
      );
    }
    return null;
  }

  static List<ServiceRegistryTier> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServiceRegistryTier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServiceRegistryTier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServiceRegistryTier> mapFromJson(dynamic json) {
    final map = <String, ServiceRegistryTier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServiceRegistryTier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServiceRegistryTier-objects as value to a dart map
  static Map<String, List<ServiceRegistryTier>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServiceRegistryTier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServiceRegistryTier.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

