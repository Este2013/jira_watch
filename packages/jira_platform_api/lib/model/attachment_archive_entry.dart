//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentArchiveEntry {
  /// Returns a new [AttachmentArchiveEntry] instance.
  AttachmentArchiveEntry({
    this.abbreviatedName,
    this.entryIndex,
    this.mediaType,
    this.name,
    this.size,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? abbreviatedName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? entryIndex;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mediaType;

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
  int? size;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentArchiveEntry &&
    other.abbreviatedName == abbreviatedName &&
    other.entryIndex == entryIndex &&
    other.mediaType == mediaType &&
    other.name == name &&
    other.size == size;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (abbreviatedName == null ? 0 : abbreviatedName!.hashCode) +
    (entryIndex == null ? 0 : entryIndex!.hashCode) +
    (mediaType == null ? 0 : mediaType!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (size == null ? 0 : size!.hashCode);

  @override
  String toString() => 'AttachmentArchiveEntry[abbreviatedName=$abbreviatedName, entryIndex=$entryIndex, mediaType=$mediaType, name=$name, size=$size]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.abbreviatedName != null) {
      json[r'abbreviatedName'] = this.abbreviatedName;
    } else {
      json[r'abbreviatedName'] = null;
    }
    if (this.entryIndex != null) {
      json[r'entryIndex'] = this.entryIndex;
    } else {
      json[r'entryIndex'] = null;
    }
    if (this.mediaType != null) {
      json[r'mediaType'] = this.mediaType;
    } else {
      json[r'mediaType'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentArchiveEntry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentArchiveEntry? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentArchiveEntry(
        abbreviatedName: mapValueOfType<String>(json, r'abbreviatedName'),
        entryIndex: mapValueOfType<int>(json, r'entryIndex'),
        mediaType: mapValueOfType<String>(json, r'mediaType'),
        name: mapValueOfType<String>(json, r'name'),
        size: mapValueOfType<int>(json, r'size'),
      );
    }
    return null;
  }

  static List<AttachmentArchiveEntry> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentArchiveEntry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentArchiveEntry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentArchiveEntry> mapFromJson(dynamic json) {
    final map = <String, AttachmentArchiveEntry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentArchiveEntry.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentArchiveEntry-objects as value to a dart map
  static Map<String, List<AttachmentArchiveEntry>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentArchiveEntry>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentArchiveEntry.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

