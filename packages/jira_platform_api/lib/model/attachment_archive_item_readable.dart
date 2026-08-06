//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentArchiveItemReadable {
  /// Returns a new [AttachmentArchiveItemReadable] instance.
  AttachmentArchiveItemReadable({
    this.index,
    this.label,
    this.mediaType,
    this.path,
    this.size,
  });

  /// The position of the item within the archive.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? index;

  /// The label for the archive item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? label;

  /// The MIME type of the archive item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mediaType;

  /// The path of the archive item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  /// The size of the archive item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? size;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentArchiveItemReadable &&
    other.index == index &&
    other.label == label &&
    other.mediaType == mediaType &&
    other.path == path &&
    other.size == size;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (index == null ? 0 : index!.hashCode) +
    (label == null ? 0 : label!.hashCode) +
    (mediaType == null ? 0 : mediaType!.hashCode) +
    (path == null ? 0 : path!.hashCode) +
    (size == null ? 0 : size!.hashCode);

  @override
  String toString() => 'AttachmentArchiveItemReadable[index=$index, label=$label, mediaType=$mediaType, path=$path, size=$size]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.index != null) {
      json[r'index'] = this.index;
    } else {
      json[r'index'] = null;
    }
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    if (this.mediaType != null) {
      json[r'mediaType'] = this.mediaType;
    } else {
      json[r'mediaType'] = null;
    }
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentArchiveItemReadable] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentArchiveItemReadable? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentArchiveItemReadable(
        index: mapValueOfType<int>(json, r'index'),
        label: mapValueOfType<String>(json, r'label'),
        mediaType: mapValueOfType<String>(json, r'mediaType'),
        path: mapValueOfType<String>(json, r'path'),
        size: mapValueOfType<String>(json, r'size'),
      );
    }
    return null;
  }

  static List<AttachmentArchiveItemReadable> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentArchiveItemReadable>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentArchiveItemReadable.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentArchiveItemReadable> mapFromJson(dynamic json) {
    final map = <String, AttachmentArchiveItemReadable>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentArchiveItemReadable.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentArchiveItemReadable-objects as value to a dart map
  static Map<String, List<AttachmentArchiveItemReadable>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentArchiveItemReadable>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentArchiveItemReadable.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

