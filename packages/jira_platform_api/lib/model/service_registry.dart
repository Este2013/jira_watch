//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServiceRegistry {
  /// Returns a new [ServiceRegistry] instance.
  ServiceRegistry({
    this.description,
    this.id,
    this.name,
    this.organizationId,
    this.revision,
    this.serviceTier,
  });

  /// service description
  String? description;

  /// service ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// service name
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// organization ID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? organizationId;

  /// service revision
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? revision;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ServiceRegistryTier? serviceTier;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServiceRegistry &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.organizationId == organizationId &&
    other.revision == revision &&
    other.serviceTier == serviceTier;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (organizationId == null ? 0 : organizationId!.hashCode) +
    (revision == null ? 0 : revision!.hashCode) +
    (serviceTier == null ? 0 : serviceTier!.hashCode);

  @override
  String toString() => 'ServiceRegistry[description=$description, id=$id, name=$name, organizationId=$organizationId, revision=$revision, serviceTier=$serviceTier]';

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
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.organizationId != null) {
      json[r'organizationId'] = this.organizationId;
    } else {
      json[r'organizationId'] = null;
    }
    if (this.revision != null) {
      json[r'revision'] = this.revision;
    } else {
      json[r'revision'] = null;
    }
    if (this.serviceTier != null) {
      json[r'serviceTier'] = this.serviceTier;
    } else {
      json[r'serviceTier'] = null;
    }
    return json;
  }

  /// Returns a new [ServiceRegistry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServiceRegistry? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ServiceRegistry(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        organizationId: mapValueOfType<String>(json, r'organizationId'),
        revision: mapValueOfType<String>(json, r'revision'),
        serviceTier: ServiceRegistryTier.fromJson(json[r'serviceTier']),
      );
    }
    return null;
  }

  static List<ServiceRegistry> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServiceRegistry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServiceRegistry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServiceRegistry> mapFromJson(dynamic json) {
    final map = <String, ServiceRegistry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServiceRegistry.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServiceRegistry-objects as value to a dart map
  static Map<String, List<ServiceRegistry>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServiceRegistry>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServiceRegistry.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

