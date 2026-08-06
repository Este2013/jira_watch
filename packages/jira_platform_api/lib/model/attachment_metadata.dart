//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentMetadata {
  /// Returns a new [AttachmentMetadata] instance.
  AttachmentMetadata({
    this.author,
    this.content,
    this.created,
    this.filename,
    this.id,
    this.mimeType,
    this.properties = const {},
    this.self,
    this.size,
    this.thumbnail,
  });

  /// Details of the user who attached the file.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? author;

  /// The URL of the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? content;

  /// The datetime the attachment was created.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  /// The name of the attachment file.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? filename;

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
  String? mimeType;

  /// Additional properties of the attachment.
  Map<String, Object> properties;

  /// The URL of the attachment metadata details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The size of the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  /// The URL of a thumbnail representing the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? thumbnail;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentMetadata &&
    other.author == author &&
    other.content == content &&
    other.created == created &&
    other.filename == filename &&
    other.id == id &&
    other.mimeType == mimeType &&
    _deepEquality.equals(other.properties, properties) &&
    other.self == self &&
    other.size == size &&
    other.thumbnail == thumbnail;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (author == null ? 0 : author!.hashCode) +
    (content == null ? 0 : content!.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (filename == null ? 0 : filename!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (mimeType == null ? 0 : mimeType!.hashCode) +
    (properties.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (size == null ? 0 : size!.hashCode) +
    (thumbnail == null ? 0 : thumbnail!.hashCode);

  @override
  String toString() => 'AttachmentMetadata[author=$author, content=$content, created=$created, filename=$filename, id=$id, mimeType=$mimeType, properties=$properties, self=$self, size=$size, thumbnail=$thumbnail]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.author != null) {
      json[r'author'] = this.author;
    } else {
      json[r'author'] = null;
    }
    if (this.content != null) {
      json[r'content'] = this.content;
    } else {
      json[r'content'] = null;
    }
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
    if (this.filename != null) {
      json[r'filename'] = this.filename;
    } else {
      json[r'filename'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.mimeType != null) {
      json[r'mimeType'] = this.mimeType;
    } else {
      json[r'mimeType'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    if (this.thumbnail != null) {
      json[r'thumbnail'] = this.thumbnail;
    } else {
      json[r'thumbnail'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentMetadata] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentMetadata? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentMetadata(
        author: User.fromJson(json[r'author']),
        content: mapValueOfType<String>(json, r'content'),
        created: mapDateTime(json, r'created', r''),
        filename: mapValueOfType<String>(json, r'filename'),
        id: mapValueOfType<int>(json, r'id'),
        mimeType: mapValueOfType<String>(json, r'mimeType'),
        properties: mapCastOfType<String, Object>(json, r'properties') ?? const {},
        self: mapValueOfType<String>(json, r'self'),
        size: mapValueOfType<int>(json, r'size'),
        thumbnail: mapValueOfType<String>(json, r'thumbnail'),
      );
    }
    return null;
  }

  static List<AttachmentMetadata> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentMetadata>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentMetadata.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentMetadata> mapFromJson(dynamic json) {
    final map = <String, AttachmentMetadata>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentMetadata.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentMetadata-objects as value to a dart map
  static Map<String, List<AttachmentMetadata>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentMetadata>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentMetadata.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

