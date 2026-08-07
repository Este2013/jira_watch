//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentArchiveMetadataReadable {
  /// Returns a new [AttachmentArchiveMetadataReadable] instance.
  AttachmentArchiveMetadataReadable({
    this.entries = const [],
    this.id,
    this.mediaType,
    this.name,
    this.totalEntryCount,
  });

  /// The list of the items included in the archive.
  List<AttachmentArchiveItemReadable> entries;

  /// The ID of the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The MIME type of the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mediaType;

  /// The name of the archive file.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The number of items included in the archive.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalEntryCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentArchiveMetadataReadable &&
    _deepEquality.equals(other.entries, entries) &&
    other.id == id &&
    other.mediaType == mediaType &&
    other.name == name &&
    other.totalEntryCount == totalEntryCount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (entries.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (mediaType == null ? 0 : mediaType!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (totalEntryCount == null ? 0 : totalEntryCount!.hashCode);

  @override
  String toString() => 'AttachmentArchiveMetadataReadable[entries=$entries, id=$id, mediaType=$mediaType, name=$name, totalEntryCount=$totalEntryCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'entries'] = this.entries;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
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
    if (this.totalEntryCount != null) {
      json[r'totalEntryCount'] = this.totalEntryCount;
    } else {
      json[r'totalEntryCount'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentArchiveMetadataReadable] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentArchiveMetadataReadable? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentArchiveMetadataReadable(
        entries: AttachmentArchiveItemReadable.listFromJson(json[r'entries']),
        id: mapValueOfType<int>(json, r'id'),
        mediaType: mapValueOfType<String>(json, r'mediaType'),
        name: mapValueOfType<String>(json, r'name'),
        totalEntryCount: mapValueOfType<int>(json, r'totalEntryCount'),
      );
    }
    return null;
  }

  static List<AttachmentArchiveMetadataReadable> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentArchiveMetadataReadable>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentArchiveMetadataReadable.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentArchiveMetadataReadable> mapFromJson(dynamic json) {
    final map = <String, AttachmentArchiveMetadataReadable>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentArchiveMetadataReadable.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentArchiveMetadataReadable-objects as value to a dart map
  static Map<String, List<AttachmentArchiveMetadataReadable>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentArchiveMetadataReadable>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentArchiveMetadataReadable.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

