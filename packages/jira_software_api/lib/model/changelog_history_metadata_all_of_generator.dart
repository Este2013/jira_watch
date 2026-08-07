//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangelogHistoryMetadataAllOfGenerator {
  /// Returns a new [ChangelogHistoryMetadataAllOfGenerator] instance.
  ChangelogHistoryMetadataAllOfGenerator({
    this.avatarUrl,
    this.displayName,
    this.displayNameKey,
    this.id,
    this.type,
    this.url,
  });

  /// The URL to an avatar for the user or system associated with a history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatarUrl;

  /// The display name of the user or system associated with a history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// The key of the display name of the user or system associated with a history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayNameKey;

  /// The ID of the user or system associated with a history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The type of the user or system associated with a history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  /// The URL of the user or system associated with a history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangelogHistoryMetadataAllOfGenerator &&
    other.avatarUrl == avatarUrl &&
    other.displayName == displayName &&
    other.displayNameKey == displayNameKey &&
    other.id == id &&
    other.type == type &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (avatarUrl == null ? 0 : avatarUrl!.hashCode) +
    (displayName == null ? 0 : displayName!.hashCode) +
    (displayNameKey == null ? 0 : displayNameKey!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (url == null ? 0 : url!.hashCode);

  @override
  String toString() => 'ChangelogHistoryMetadataAllOfGenerator[avatarUrl=$avatarUrl, displayName=$displayName, displayNameKey=$displayNameKey, id=$id, type=$type, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.avatarUrl != null) {
      json[r'avatarUrl'] = this.avatarUrl;
    } else {
      json[r'avatarUrl'] = null;
    }
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
    }
    if (this.displayNameKey != null) {
      json[r'displayNameKey'] = this.displayNameKey;
    } else {
      json[r'displayNameKey'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [ChangelogHistoryMetadataAllOfGenerator] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangelogHistoryMetadataAllOfGenerator? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ChangelogHistoryMetadataAllOfGenerator(
        avatarUrl: mapValueOfType<String>(json, r'avatarUrl'),
        displayName: mapValueOfType<String>(json, r'displayName'),
        displayNameKey: mapValueOfType<String>(json, r'displayNameKey'),
        id: mapValueOfType<String>(json, r'id'),
        type: mapValueOfType<String>(json, r'type'),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<ChangelogHistoryMetadataAllOfGenerator> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChangelogHistoryMetadataAllOfGenerator>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangelogHistoryMetadataAllOfGenerator.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangelogHistoryMetadataAllOfGenerator> mapFromJson(dynamic json) {
    final map = <String, ChangelogHistoryMetadataAllOfGenerator>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangelogHistoryMetadataAllOfGenerator.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangelogHistoryMetadataAllOfGenerator-objects as value to a dart map
  static Map<String, List<ChangelogHistoryMetadataAllOfGenerator>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangelogHistoryMetadataAllOfGenerator>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChangelogHistoryMetadataAllOfGenerator.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

