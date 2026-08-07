//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecurityLevelPayload {
  /// Returns a new [SecurityLevelPayload] instance.
  SecurityLevelPayload({
    this.description,
    this.isDefault,
    this.name,
    this.pcri,
    this.securityLevelMembers = const [],
  });

  /// The description of the security level
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Whether the security level is default for the security scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDefault;

  /// The name of the security level
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
  ProjectCreateResourceIdentifier? pcri;

  /// The members of the security level
  List<SecurityLevelMemberPayload> securityLevelMembers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecurityLevelPayload &&
    other.description == description &&
    other.isDefault == isDefault &&
    other.name == name &&
    other.pcri == pcri &&
    _deepEquality.equals(other.securityLevelMembers, securityLevelMembers);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (isDefault == null ? 0 : isDefault!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (securityLevelMembers.hashCode);

  @override
  String toString() => 'SecurityLevelPayload[description=$description, isDefault=$isDefault, name=$name, pcri=$pcri, securityLevelMembers=$securityLevelMembers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.isDefault != null) {
      json[r'isDefault'] = this.isDefault;
    } else {
      json[r'isDefault'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
      json[r'securityLevelMembers'] = this.securityLevelMembers;
    return json;
  }

  /// Returns a new [SecurityLevelPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecurityLevelPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SecurityLevelPayload(
        description: mapValueOfType<String>(json, r'description'),
        isDefault: mapValueOfType<bool>(json, r'isDefault'),
        name: mapValueOfType<String>(json, r'name'),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        securityLevelMembers: SecurityLevelMemberPayload.listFromJson(json[r'securityLevelMembers']),
      );
    }
    return null;
  }

  static List<SecurityLevelPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecurityLevelPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecurityLevelPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecurityLevelPayload> mapFromJson(dynamic json) {
    final map = <String, SecurityLevelPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecurityLevelPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecurityLevelPayload-objects as value to a dart map
  static Map<String, List<SecurityLevelPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecurityLevelPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecurityLevelPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

