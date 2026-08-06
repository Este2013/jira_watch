//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeUpdateBean {
  /// Returns a new [IssueTypeUpdateBean] instance.
  IssueTypeUpdateBean({
    this.avatarId,
    this.description,
    this.name,
  });

  /// The ID of an issue type avatar. This can be obtained be obtained from the following endpoints:   *  [System issue type avatar IDs only](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-avatars/#api-rest-api-3-avatar-type-system-get)  *  [System and custom issue type avatar IDs](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-avatars/#api-rest-api-3-universal-avatar-type-type-owner-entityid-get)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? avatarId;

  /// The description of the issue type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The unique name for the issue type. The maximum length is 60 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeUpdateBean &&
    other.avatarId == avatarId &&
    other.description == description &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (avatarId == null ? 0 : avatarId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'IssueTypeUpdateBean[avatarId=$avatarId, description=$description, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.avatarId != null) {
      json[r'avatarId'] = this.avatarId;
    } else {
      json[r'avatarId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTypeUpdateBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeUpdateBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypeUpdateBean(
        avatarId: mapValueOfType<int>(json, r'avatarId'),
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<IssueTypeUpdateBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeUpdateBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeUpdateBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeUpdateBean> mapFromJson(dynamic json) {
    final map = <String, IssueTypeUpdateBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeUpdateBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeUpdateBean-objects as value to a dart map
  static Map<String, List<IssueTypeUpdateBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeUpdateBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeUpdateBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

