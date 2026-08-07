//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecuritySchemeMembersRequest {
  /// Returns a new [SecuritySchemeMembersRequest] instance.
  SecuritySchemeMembersRequest({
    this.members = const [],
  });

  /// The list of level members which should be added to the issue security scheme level.
  List<SecuritySchemeLevelMemberBean> members;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecuritySchemeMembersRequest &&
    _deepEquality.equals(other.members, members);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (members.hashCode);

  @override
  String toString() => 'SecuritySchemeMembersRequest[members=$members]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'members'] = this.members;
    return json;
  }

  /// Returns a new [SecuritySchemeMembersRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecuritySchemeMembersRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SecuritySchemeMembersRequest(
        members: SecuritySchemeLevelMemberBean.listFromJson(json[r'members']),
      );
    }
    return null;
  }

  static List<SecuritySchemeMembersRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecuritySchemeMembersRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecuritySchemeMembersRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecuritySchemeMembersRequest> mapFromJson(dynamic json) {
    final map = <String, SecuritySchemeMembersRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecuritySchemeMembersRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecuritySchemeMembersRequest-objects as value to a dart map
  static Map<String, List<SecuritySchemeMembersRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecuritySchemeMembersRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecuritySchemeMembersRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

