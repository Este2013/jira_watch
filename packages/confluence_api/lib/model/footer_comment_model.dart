//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FooterCommentModel {
  /// Returns a new [FooterCommentModel] instance.
  FooterCommentModel({
    this.id,
    this.status,
    this.title,
    this.blogPostId,
    this.pageId,
    this.attachmentId,
    this.customContentId,
    this.parentCommentId,
    this.version,
    this.properties,
    this.operations,
    this.likes,
    this.versions,
    this.body,
    this.links,
  });

  /// ID of the comment.
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

  /// ID of the blog post containing the comment if the comment is on a blog post.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? blogPostId;

  /// ID of the page containing the comment if the comment is on a page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pageId;

  /// ID of the attachment containing the comment if the comment is on an attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? attachmentId;

  /// ID of the custom content containing the comment if the comment is on a custom content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? customContentId;

  /// ID of the parent comment if the comment is a reply.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentCommentId;

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
  BlogPostSingleLikes? likes;

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
  BodySingle? body;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommentLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FooterCommentModel &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.blogPostId == blogPostId &&
    other.pageId == pageId &&
    other.attachmentId == attachmentId &&
    other.customContentId == customContentId &&
    other.parentCommentId == parentCommentId &&
    other.version == version &&
    other.properties == properties &&
    other.operations == operations &&
    other.likes == likes &&
    other.versions == versions &&
    other.body == body &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (attachmentId == null ? 0 : attachmentId!.hashCode) +
    (customContentId == null ? 0 : customContentId!.hashCode) +
    (parentCommentId == null ? 0 : parentCommentId!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (properties == null ? 0 : properties!.hashCode) +
    (operations == null ? 0 : operations!.hashCode) +
    (likes == null ? 0 : likes!.hashCode) +
    (versions == null ? 0 : versions!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'FooterCommentModel[id=$id, status=$status, title=$title, blogPostId=$blogPostId, pageId=$pageId, attachmentId=$attachmentId, customContentId=$customContentId, parentCommentId=$parentCommentId, version=$version, properties=$properties, operations=$operations, likes=$likes, versions=$versions, body=$body, links=$links]';

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
    if (this.blogPostId != null) {
      json[r'blogPostId'] = this.blogPostId;
    } else {
      json[r'blogPostId'] = null;
    }
    if (this.pageId != null) {
      json[r'pageId'] = this.pageId;
    } else {
      json[r'pageId'] = null;
    }
    if (this.attachmentId != null) {
      json[r'attachmentId'] = this.attachmentId;
    } else {
      json[r'attachmentId'] = null;
    }
    if (this.customContentId != null) {
      json[r'customContentId'] = this.customContentId;
    } else {
      json[r'customContentId'] = null;
    }
    if (this.parentCommentId != null) {
      json[r'parentCommentId'] = this.parentCommentId;
    } else {
      json[r'parentCommentId'] = null;
    }
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
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
    if (this.likes != null) {
      json[r'likes'] = this.likes;
    } else {
      json[r'likes'] = null;
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

  /// Returns a new [FooterCommentModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FooterCommentModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FooterCommentModel(
        id: mapValueOfType<String>(json, r'id'),
        status: ContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        pageId: mapValueOfType<String>(json, r'pageId'),
        attachmentId: mapValueOfType<String>(json, r'attachmentId'),
        customContentId: mapValueOfType<String>(json, r'customContentId'),
        parentCommentId: mapValueOfType<String>(json, r'parentCommentId'),
        version: Version.fromJson(json[r'version']),
        properties: AttachmentSingleProperties.fromJson(json[r'properties']),
        operations: AttachmentSingleOperations.fromJson(json[r'operations']),
        likes: BlogPostSingleLikes.fromJson(json[r'likes']),
        versions: AttachmentSingleVersions.fromJson(json[r'versions']),
        body: BodySingle.fromJson(json[r'body']),
        links: CommentLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<FooterCommentModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FooterCommentModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FooterCommentModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FooterCommentModel> mapFromJson(dynamic json) {
    final map = <String, FooterCommentModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FooterCommentModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FooterCommentModel-objects as value to a dart map
  static Map<String, List<FooterCommentModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FooterCommentModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FooterCommentModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

