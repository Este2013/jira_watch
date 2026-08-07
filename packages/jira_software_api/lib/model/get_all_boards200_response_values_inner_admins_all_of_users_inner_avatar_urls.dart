//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls {
  /// Returns a new [GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls] instance.
  GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls({
    this.n16x16,
    this.n24x24,
    this.n32x32,
    this.n48x48,
  });

  /// The URL of the user's 16x16 pixel avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? n16x16;

  /// The URL of the user's 24x24 pixel avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? n24x24;

  /// The URL of the user's 32x32 pixel avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? n32x32;

  /// The URL of the user's 48x48 pixel avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? n48x48;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls &&
    other.n16x16 == n16x16 &&
    other.n24x24 == n24x24 &&
    other.n32x32 == n32x32 &&
    other.n48x48 == n48x48;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (n16x16 == null ? 0 : n16x16!.hashCode) +
    (n24x24 == null ? 0 : n24x24!.hashCode) +
    (n32x32 == null ? 0 : n32x32!.hashCode) +
    (n48x48 == null ? 0 : n48x48!.hashCode);

  @override
  String toString() => 'GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls[n16x16=$n16x16, n24x24=$n24x24, n32x32=$n32x32, n48x48=$n48x48]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.n16x16 != null) {
      json[r'16x16'] = this.n16x16;
    } else {
      json[r'16x16'] = null;
    }
    if (this.n24x24 != null) {
      json[r'24x24'] = this.n24x24;
    } else {
      json[r'24x24'] = null;
    }
    if (this.n32x32 != null) {
      json[r'32x32'] = this.n32x32;
    } else {
      json[r'32x32'] = null;
    }
    if (this.n48x48 != null) {
      json[r'48x48'] = this.n48x48;
    } else {
      json[r'48x48'] = null;
    }
    return json;
  }

  /// Returns a new [GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls(
        n16x16: mapValueOfType<String>(json, r'16x16'),
        n24x24: mapValueOfType<String>(json, r'24x24'),
        n32x32: mapValueOfType<String>(json, r'32x32'),
        n48x48: mapValueOfType<String>(json, r'48x48'),
      );
    }
    return null;
  }

  static List<GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls> mapFromJson(dynamic json) {
    final map = <String, GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls-objects as value to a dart map
  static Map<String, List<GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

