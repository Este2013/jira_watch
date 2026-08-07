//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomContentSingle {
  /// Returns a new [CustomContentSingle] instance.
  CustomContentSingle({
    this.id,
    this.type,
    this.status,
    this.title,
    this.spaceId,
    this.pageId,
    this.blogPostId,
    this.customContentId,
    this.authorId,
    this.createdAt,
    this.version,
    this.labels,
    this.properties,
    this.operations,
    this.versions,
    this.body,
    this.links,
  });

  /// ID of the custom content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The type of custom content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ContentStatus? status;

  /// Title of the custom content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// ID of the space the custom content is in.  Note: This is always returned, regardless of if the custom content has a container that is a space.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? spaceId;

  /// ID of the containing page.  Note: This is only returned if the custom content has a container that is a page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pageId;

  /// ID of the containing blog post.  Note: This is only returned if the custom content has a container that is a blog post.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? blogPostId;

  /// ID of the containing custom content.  Note: This is only returned if the custom content has a container that is custom content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? customContentId;

  /// The account ID of the user who created this custom content originally.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? authorId;

  /// Date and time when the custom content was created. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

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
  AttachmentSingleLabels? labels;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AttachmentSingleProperties? properties;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AttachmentSingleOperations? operations;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AttachmentSingleVersions? versions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomContentBodySingle? body;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomContentLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomContentSingle &&
    other.id == id &&
    other.type == type &&
    other.status == status &&
    other.title == title &&
    other.spaceId == spaceId &&
    other.pageId == pageId &&
    other.blogPostId == blogPostId &&
    other.customContentId == customContentId &&
    other.authorId == authorId &&
    other.createdAt == createdAt &&
    other.version == version &&
    other.labels == labels &&
    other.properties == properties &&
    other.operations == operations &&
    other.versions == versions &&
    other.body == body &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (customContentId == null ? 0 : customContentId!.hashCode) +
    (authorId == null ? 0 : authorId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (labels == null ? 0 : labels!.hashCode) +
    (properties == null ? 0 : properties!.hashCode) +
    (operations == null ? 0 : operations!.hashCode) +
    (versions == null ? 0 : versions!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'CustomContentSingle[id=$id, type=$type, status=$status, title=$title, spaceId=$spaceId, pageId=$pageId, blogPostId=$blogPostId, customContentId=$customContentId, authorId=$authorId, createdAt=$createdAt, version=$version, labels=$labels, properties=$properties, operations=$operations, versions=$versions, body=$body, links=$links]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.spaceId != null) {
      json[r'spaceId'] = this.spaceId;
    } else {
      json[r'spaceId'] = null;
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
    if (this.authorId != null) {
      json[r'authorId'] = this.authorId;
    } else {
      json[r'authorId'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    if (this.labels != null) {
      json[r'labels'] = this.labels;
    } else {
      json[r'labels'] = null;
    }
    if (this.properties != null) {
      json[r'properties'] = this.properties;
    } else {
      json[r'properties'] = null;
    }
    if (this.operations != null) {
      json[r'operations'] = this.operations;
    } else {
      json[r'operations'] = null;
    }
    if (this.versions != null) {
      json[r'versions'] = this.versions;
    } else {
      json[r'versions'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [CustomContentSingle] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomContentSingle? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CustomContentSingle(
        id: mapValueOfType<String>(json, r'id'),
        type: mapValueOfType<String>(json, r'type'),
        status: ContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        spaceId: mapValueOfType<String>(json, r'spaceId'),
        pageId: mapValueOfType<String>(json, r'pageId'),
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        customContentId: mapValueOfType<String>(json, r'customContentId'),
        authorId: mapValueOfType<String>(json, r'authorId'),
        createdAt: mapDateTime(json, r'createdAt', r''),
        version: Version.fromJson(json[r'version']),
        labels: AttachmentSingleLabels.fromJson(json[r'labels']),
        properties: AttachmentSingleProperties.fromJson(json[r'properties']),
        operations: AttachmentSingleOperations.fromJson(json[r'operations']),
        versions: AttachmentSingleVersions.fromJson(json[r'versions']),
        body: CustomContentBodySingle.fromJson(json[r'body']),
        links: CustomContentLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<CustomContentSingle> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomContentSingle>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomContentSingle.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomContentSingle> mapFromJson(dynamic json) {
    final map = <String, CustomContentSingle>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomContentSingle.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomContentSingle-objects as value to a dart map
  static Map<String, List<CustomContentSingle>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomContentSingle>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomContentSingle.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

