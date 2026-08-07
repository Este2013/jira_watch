//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueSecurityLevelMember {
  /// Returns a new [IssueSecurityLevelMember] instance.
  IssueSecurityLevelMember({
    required this.holder,
    required this.id,
    required this.issueSecurityLevelId,
  });

  /// The user or group being granted the permission. It consists of a `type` and a type-dependent `parameter`. See [Holder object](../api-group-permission-schemes/#holder-object) in *Get all permission schemes* for more information.
  PermissionHolder holder;

  /// The ID of the issue security level member.
  int id;

  /// The ID of the issue security level.
  int issueSecurityLevelId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueSecurityLevelMember &&
    other.holder == holder &&
    other.id == id &&
    other.issueSecurityLevelId == issueSecurityLevelId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (holder.hashCode) +
    (id.hashCode) +
    (issueSecurityLevelId.hashCode);

  @override
  String toString() => 'IssueSecurityLevelMember[holder=$holder, id=$id, issueSecurityLevelId=$issueSecurityLevelId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'holder'] = this.holder;
      json[r'id'] = this.id;
      json[r'issueSecurityLevelId'] = this.issueSecurityLevelId;
    return json;
  }

  /// Returns a new [IssueSecurityLevelMember] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueSecurityLevelMember? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'holder'), 'Required key "IssueSecurityLevelMember[holder]" is missing from JSON.');
        assert(json[r'holder'] != null, 'Required key "IssueSecurityLevelMember[holder]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "IssueSecurityLevelMember[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "IssueSecurityLevelMember[id]" has a null value in JSON.');
        assert(json.containsKey(r'issueSecurityLevelId'), 'Required key "IssueSecurityLevelMember[issueSecurityLevelId]" is missing from JSON.');
        assert(json[r'issueSecurityLevelId'] != null, 'Required key "IssueSecurityLevelMember[issueSecurityLevelId]" has a null value in JSON.');
        return true;
      }());

      return IssueSecurityLevelMember(
        holder: PermissionHolder.fromJson(json[r'holder'])!,
        id: mapValueOfType<int>(json, r'id')!,
        issueSecurityLevelId: mapValueOfType<int>(json, r'issueSecurityLevelId')!,
      );
    }
    return null;
  }

  static List<IssueSecurityLevelMember> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueSecurityLevelMember>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueSecurityLevelMember.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueSecurityLevelMember> mapFromJson(dynamic json) {
    final map = <String, IssueSecurityLevelMember>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueSecurityLevelMember.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueSecurityLevelMember-objects as value to a dart map
  static Map<String, List<IssueSecurityLevelMember>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueSecurityLevelMember>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueSecurityLevelMember.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'holder',
    'id',
    'issueSecurityLevelId',
  };
}

