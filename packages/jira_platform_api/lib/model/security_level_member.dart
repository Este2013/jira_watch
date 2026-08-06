//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecurityLevelMember {
  /// Returns a new [SecurityLevelMember] instance.
  SecurityLevelMember({
    required this.holder,
    required this.id,
    required this.issueSecurityLevelId,
    required this.issueSecuritySchemeId,
    this.managed,
  });

  /// The user or group being granted the permission. It consists of a `type` and a type-dependent `parameter`. See [Holder object](../api-group-permission-schemes/#holder-object) in *Get all permission schemes* for more information.
  PermissionHolder holder;

  /// The ID of the issue security level member.
  String id;

  /// The ID of the issue security level.
  String issueSecurityLevelId;

  /// The ID of the issue security scheme.
  String issueSecuritySchemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? managed;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecurityLevelMember &&
    other.holder == holder &&
    other.id == id &&
    other.issueSecurityLevelId == issueSecurityLevelId &&
    other.issueSecuritySchemeId == issueSecuritySchemeId &&
    other.managed == managed;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (holder.hashCode) +
    (id.hashCode) +
    (issueSecurityLevelId.hashCode) +
    (issueSecuritySchemeId.hashCode) +
    (managed == null ? 0 : managed!.hashCode);

  @override
  String toString() => 'SecurityLevelMember[holder=$holder, id=$id, issueSecurityLevelId=$issueSecurityLevelId, issueSecuritySchemeId=$issueSecuritySchemeId, managed=$managed]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'holder'] = this.holder;
      json[r'id'] = this.id;
      json[r'issueSecurityLevelId'] = this.issueSecurityLevelId;
      json[r'issueSecuritySchemeId'] = this.issueSecuritySchemeId;
    if (this.managed != null) {
      json[r'managed'] = this.managed;
    } else {
      json[r'managed'] = null;
    }
    return json;
  }

  /// Returns a new [SecurityLevelMember] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecurityLevelMember? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'holder'), 'Required key "SecurityLevelMember[holder]" is missing from JSON.');
        assert(json[r'holder'] != null, 'Required key "SecurityLevelMember[holder]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "SecurityLevelMember[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "SecurityLevelMember[id]" has a null value in JSON.');
        assert(json.containsKey(r'issueSecurityLevelId'), 'Required key "SecurityLevelMember[issueSecurityLevelId]" is missing from JSON.');
        assert(json[r'issueSecurityLevelId'] != null, 'Required key "SecurityLevelMember[issueSecurityLevelId]" has a null value in JSON.');
        assert(json.containsKey(r'issueSecuritySchemeId'), 'Required key "SecurityLevelMember[issueSecuritySchemeId]" is missing from JSON.');
        assert(json[r'issueSecuritySchemeId'] != null, 'Required key "SecurityLevelMember[issueSecuritySchemeId]" has a null value in JSON.');
        return true;
      }());

      return SecurityLevelMember(
        holder: PermissionHolder.fromJson(json[r'holder'])!,
        id: mapValueOfType<String>(json, r'id')!,
        issueSecurityLevelId: mapValueOfType<String>(json, r'issueSecurityLevelId')!,
        issueSecuritySchemeId: mapValueOfType<String>(json, r'issueSecuritySchemeId')!,
        managed: mapValueOfType<bool>(json, r'managed'),
      );
    }
    return null;
  }

  static List<SecurityLevelMember> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecurityLevelMember>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecurityLevelMember.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecurityLevelMember> mapFromJson(dynamic json) {
    final map = <String, SecurityLevelMember>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecurityLevelMember.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecurityLevelMember-objects as value to a dart map
  static Map<String, List<SecurityLevelMember>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecurityLevelMember>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecurityLevelMember.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'holder',
    'id',
    'issueSecurityLevelId',
    'issueSecuritySchemeId',
  };
}

