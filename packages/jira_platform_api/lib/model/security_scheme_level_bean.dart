//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecuritySchemeLevelBean {
  /// Returns a new [SecuritySchemeLevelBean] instance.
  SecuritySchemeLevelBean({
    this.description,
    this.isDefault,
    this.members = const [],
    required this.name,
  });

  /// The description of the issue security scheme level.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Specifies whether the level is the default level. False by default.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDefault;

  /// The list of level members which should be added to the issue security scheme level.
  List<SecuritySchemeLevelMemberBean> members;

  /// The name of the issue security scheme level. Must be unique.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecuritySchemeLevelBean &&
    other.description == description &&
    other.isDefault == isDefault &&
    _deepEquality.equals(other.members, members) &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (isDefault == null ? 0 : isDefault!.hashCode) +
    (members.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'SecuritySchemeLevelBean[description=$description, isDefault=$isDefault, members=$members, name=$name]';

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
      json[r'members'] = this.members;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [SecuritySchemeLevelBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecuritySchemeLevelBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "SecuritySchemeLevelBean[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "SecuritySchemeLevelBean[name]" has a null value in JSON.');
        return true;
      }());

      return SecuritySchemeLevelBean(
        description: mapValueOfType<String>(json, r'description'),
        isDefault: mapValueOfType<bool>(json, r'isDefault'),
        members: SecuritySchemeLevelMemberBean.listFromJson(json[r'members']),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<SecuritySchemeLevelBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecuritySchemeLevelBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecuritySchemeLevelBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecuritySchemeLevelBean> mapFromJson(dynamic json) {
    final map = <String, SecuritySchemeLevelBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecuritySchemeLevelBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecuritySchemeLevelBean-objects as value to a dart map
  static Map<String, List<SecuritySchemeLevelBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecuritySchemeLevelBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecuritySchemeLevelBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

