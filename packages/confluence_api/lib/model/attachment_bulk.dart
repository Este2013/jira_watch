//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentBulk {
  /// Returns a new [AttachmentBulk] instance.
  AttachmentBulk({
    this.id,
    this.status,
    this.title,
    this.createdAt,
    this.pageId,
    this.blogPostId,
    this.customContentId,
    this.mediaType,
    this.mediaTypeDescription,
    this.comment,
    this.fileId,
    this.fileSize,
    this.webuiLink,
    this.downloadLink,
    this.version,
    this.links,
  });

  /// ID of the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ContentStatus? status;

  /// Title of the comment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// Date and time when the attachment was created. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  /// ID of the containing page.  Note: This is only returned if the attachment has a container that is a page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pageId;

  /// ID of the containing blog post.  Note: This is only returned if the attachment has a container that is a blog post.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? blogPostId;

  /// ID of the containing custom content.  Note: This is only returned if the attachment has a container that is custom content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? customContentId;

  /// Media Type for the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mediaType;

  /// Media Type description for the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mediaTypeDescription;

  /// Comment for the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? comment;

  /// File ID of the attachment. This is the ID referenced in `atlas_doc_format` bodies and is distinct from the attachment ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fileId;

  /// File size of the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fileSize;

  /// WebUI link of the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? webuiLink;

  /// Download link of the attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? downloadLink;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Version? version;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AttachmentLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentBulk &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.createdAt == createdAt &&
    other.pageId == pageId &&
    other.blogPostId == blogPostId &&
    other.customContentId == customContentId &&
    other.mediaType == mediaType &&
    other.mediaTypeDescription == mediaTypeDescription &&
    other.comment == comment &&
    other.fileId == fileId &&
    other.fileSize == fileSize &&
    other.webuiLink == webuiLink &&
    other.downloadLink == downloadLink &&
    other.version == version &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (customContentId == null ? 0 : customContentId!.hashCode) +
    (mediaType == null ? 0 : mediaType!.hashCode) +
    (mediaTypeDescription == null ? 0 : mediaTypeDescription!.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (fileId == null ? 0 : fileId!.hashCode) +
    (fileSize == null ? 0 : fileSize!.hashCode) +
    (webuiLink == null ? 0 : webuiLink!.hashCode) +
    (downloadLink == null ? 0 : downloadLink!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'AttachmentBulk[id=$id, status=$status, title=$title, createdAt=$createdAt, pageId=$pageId, blogPostId=$blogPostId, customContentId=$customContentId, mediaType=$mediaType, mediaTypeDescription=$mediaTypeDescription, comment=$comment, fileId=$fileId, fileSize=$fileSize, webuiLink=$webuiLink, downloadLink=$downloadLink, version=$version, links=$links]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.pageId != null) {
      json[r'pageId'] = this.pageId;
    } else {
      json[r'pageId'] = null;
    }
    if (this.blogPostId != null) {
      json[r'blogPostId'] = this.blogPostId;
    } else {
      json[r'blogPostId'] = null;
    }
    if (this.customContentId != null) {
      json[r'customContentId'] = this.customContentId;
    } else {
      json[r'customContentId'] = null;
    }
    if (this.mediaType != null) {
      json[r'mediaType'] = this.mediaType;
    } else {
      json[r'mediaType'] = null;
    }
    if (this.mediaTypeDescription != null) {
      json[r'mediaTypeDescription'] = this.mediaTypeDescription;
    } else {
      json[r'mediaTypeDescription'] = null;
    }
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
    if (this.fileId != null) {
      json[r'fileId'] = this.fileId;
    } else {
      json[r'fileId'] = null;
    }
    if (this.fileSize != null) {
      json[r'fileSize'] = this.fileSize;
    } else {
      json[r'fileSize'] = null;
    }
    if (this.webuiLink != null) {
      json[r'webuiLink'] = this.webuiLink;
    } else {
      json[r'webuiLink'] = null;
    }
    if (this.downloadLink != null) {
      json[r'downloadLink'] = this.downloadLink;
    } else {
      json[r'downloadLink'] = null;
    }
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentBulk] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentBulk? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentBulk(
        id: mapValueOfType<String>(json, r'id'),
        status: ContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        createdAt: mapDateTime(json, r'createdAt', r''),
        pageId: mapValueOfType<String>(json, r'pageId'),
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        customContentId: mapValueOfType<String>(json, r'customContentId'),
        mediaType: mapValueOfType<String>(json, r'mediaType'),
        mediaTypeDescription: mapValueOfType<String>(json, r'mediaTypeDescription'),
        comment: mapValueOfType<String>(json, r'comment'),
        fileId: mapValueOfType<String>(json, r'fileId'),
        fileSize: mapValueOfType<int>(json, r'fileSize'),
        webuiLink: mapValueOfType<String>(json, r'webuiLink'),
        downloadLink: mapValueOfType<String>(json, r'downloadLink'),
        version: Version.fromJson(json[r'version']),
        links: AttachmentLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<AttachmentBulk> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentBulk>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentBulk.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentBulk> mapFromJson(dynamic json) {
    final map = <String, AttachmentBulk>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentBulk.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentBulk-objects as value to a dart map
  static Map<String, List<AttachmentBulk>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentBulk>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentBulk.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

