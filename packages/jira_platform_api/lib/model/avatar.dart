//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Avatar {
  /// Returns a new [Avatar] instance.
  Avatar({
    this.fileName,
    required this.id,
    this.isDeletable,
    this.isSelected,
    this.isSystemAvatar,
    this.owner,
    this.urls = const {},
  });

  /// The file name of the avatar icon. Returned for system avatars.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fileName;

  /// The ID of the avatar.
  String id;

  /// Whether the avatar can be deleted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDeletable;

  /// Whether the avatar is used in Jira. For example, shown as a project's avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isSelected;

  /// Whether the avatar is a system avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isSystemAvatar;

  /// The owner of the avatar. For a system avatar the owner is null (and nothing is returned). For non-system avatars this is the appropriate identifier, such as the ID for a project or the account ID for a user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? owner;

  /// The list of avatar icon URLs.
  Map<String, String> urls;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Avatar &&
    other.fileName == fileName &&
    other.id == id &&
    other.isDeletable == isDeletable &&
    other.isSelected == isSelected &&
    other.isSystemAvatar == isSystemAvatar &&
    other.owner == owner &&
    _deepEquality.equals(other.urls, urls);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fileName == null ? 0 : fileName!.hashCode) +
    (id.hashCode) +
    (isDeletable == null ? 0 : isDeletable!.hashCode) +
    (isSelected == null ? 0 : isSelected!.hashCode) +
    (isSystemAvatar == null ? 0 : isSystemAvatar!.hashCode) +
    (owner == null ? 0 : owner!.hashCode) +
    (urls.hashCode);

  @override
  String toString() => 'Avatar[fileName=$fileName, id=$id, isDeletable=$isDeletable, isSelected=$isSelected, isSystemAvatar=$isSystemAvatar, owner=$owner, urls=$urls]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fileName != null) {
      json[r'fileName'] = this.fileName;
    } else {
      json[r'fileName'] = null;
    }
      json[r'id'] = this.id;
    if (this.isDeletable != null) {
      json[r'isDeletable'] = this.isDeletable;
    } else {
      json[r'isDeletable'] = null;
    }
    if (this.isSelected != null) {
      json[r'isSelected'] = this.isSelected;
    } else {
      json[r'isSelected'] = null;
    }
    if (this.isSystemAvatar != null) {
      json[r'isSystemAvatar'] = this.isSystemAvatar;
    } else {
      json[r'isSystemAvatar'] = null;
    }
    if (this.owner != null) {
      json[r'owner'] = this.owner;
    } else {
      json[r'owner'] = null;
    }
      json[r'urls'] = this.urls;
    return json;
  }

  /// Returns a new [Avatar] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Avatar? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "Avatar[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Avatar[id]" has a null value in JSON.');
        return true;
      }());

      return Avatar(
        fileName: mapValueOfType<String>(json, r'fileName'),
        id: mapValueOfType<String>(json, r'id')!,
        isDeletable: mapValueOfType<bool>(json, r'isDeletable'),
        isSelected: mapValueOfType<bool>(json, r'isSelected'),
        isSystemAvatar: mapValueOfType<bool>(json, r'isSystemAvatar'),
        owner: mapValueOfType<String>(json, r'owner'),
        urls: mapCastOfType<String, String>(json, r'urls') ?? const {},
      );
    }
    return null;
  }

  static List<Avatar> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Avatar>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Avatar.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Avatar> mapFromJson(dynamic json) {
    final map = <String, Avatar>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Avatar.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Avatar-objects as value to a dart map
  static Map<String, List<Avatar>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Avatar>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Avatar.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

