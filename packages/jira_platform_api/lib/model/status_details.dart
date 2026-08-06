//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusDetails {
  /// Returns a new [StatusDetails] instance.
  StatusDetails({
    this.description,
    this.iconUrl,
    this.id,
    this.name,
    this.scope,
    this.self,
    this.statusCategory,
  });

  /// The description of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The URL of the icon used to represent the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? iconUrl;

  /// The ID of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The name of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The scope of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Scope? scope;

  /// The URL of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The category assigned to the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusCategory? statusCategory;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusDetails &&
    other.description == description &&
    other.iconUrl == iconUrl &&
    other.id == id &&
    other.name == name &&
    other.scope == scope &&
    other.self == self &&
    other.statusCategory == statusCategory;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (iconUrl == null ? 0 : iconUrl!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (statusCategory == null ? 0 : statusCategory!.hashCode);

  @override
  String toString() => 'StatusDetails[description=$description, iconUrl=$iconUrl, id=$id, name=$name, scope=$scope, self=$self, statusCategory=$statusCategory]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.iconUrl != null) {
      json[r'iconUrl'] = this.iconUrl;
    } else {
      json[r'iconUrl'] = null;
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
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.statusCategory != null) {
      json[r'statusCategory'] = this.statusCategory;
    } else {
      json[r'statusCategory'] = null;
    }
    return json;
  }

  /// Returns a new [StatusDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return StatusDetails(
        description: mapValueOfType<String>(json, r'description'),
        iconUrl: mapValueOfType<String>(json, r'iconUrl'),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        scope: Scope.fromJson(json[r'scope']),
        self: mapValueOfType<String>(json, r'self'),
        statusCategory: StatusCategory.fromJson(json[r'statusCategory']),
      );
    }
    return null;
  }

  static List<StatusDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusDetails> mapFromJson(dynamic json) {
    final map = <String, StatusDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusDetails-objects as value to a dart map
  static Map<String, List<StatusDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

