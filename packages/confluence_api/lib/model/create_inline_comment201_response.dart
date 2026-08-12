//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateInlineComment201Response {
  /// Returns a new [CreateInlineComment201Response] instance.
  CreateInlineComment201Response({
    this.id,
    this.status,
    this.title,
    this.blogPostId,
    this.pageId,
    this.parentCommentId,
    this.version,
    this.body,
    this.resolutionLastModifierId,
    this.resolutionLastModifiedAt,
    this.resolutionStatus,
    this.properties,
    this.operations,
    this.likes,
    this.versions,
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
  BodySingle? body;

  /// Atlassian Account ID of last person who modified the resolve state of the comment. Null until comment is resolved or reopened.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resolutionLastModifierId;

  /// Timestamp of the last modification to the comment's resolution status. Null until comment is resolved or reopened.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? resolutionLastModifiedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  InlineCommentResolutionStatus? resolutionStatus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  InlineCommentModelProperties? properties;

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
  GetAttachmentById200ResponseAllOfLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateInlineComment201Response &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.blogPostId == blogPostId &&
    other.pageId == pageId &&
    other.parentCommentId == parentCommentId &&
    other.version == version &&
    other.body == body &&
    other.resolutionLastModifierId == resolutionLastModifierId &&
    other.resolutionLastModifiedAt == resolutionLastModifiedAt &&
    other.resolutionStatus == resolutionStatus &&
    other.properties == properties &&
    other.operations == operations &&
    other.likes == likes &&
    other.versions == versions &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (parentCommentId == null ? 0 : parentCommentId!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (resolutionLastModifierId == null ? 0 : resolutionLastModifierId!.hashCode) +
    (resolutionLastModifiedAt == null ? 0 : resolutionLastModifiedAt!.hashCode) +
    (resolutionStatus == null ? 0 : resolutionStatus!.hashCode) +
    (properties == null ? 0 : properties!.hashCode) +
    (operations == null ? 0 : operations!.hashCode) +
    (likes == null ? 0 : likes!.hashCode) +
    (versions == null ? 0 : versions!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'CreateInlineComment201Response[id=$id, status=$status, title=$title, blogPostId=$blogPostId, pageId=$pageId, parentCommentId=$parentCommentId, version=$version, body=$body, resolutionLastModifierId=$resolutionLastModifierId, resolutionLastModifiedAt=$resolutionLastModifiedAt, resolutionStatus=$resolutionStatus, properties=$properties, operations=$operations, likes=$likes, versions=$versions, links=$links]';

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
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.resolutionLastModifierId != null) {
      json[r'resolutionLastModifierId'] = this.resolutionLastModifierId;
    } else {
      json[r'resolutionLastModifierId'] = null;
    }
    if (this.resolutionLastModifiedAt != null) {
      json[r'resolutionLastModifiedAt'] = this.resolutionLastModifiedAt!.toUtc().toIso8601String();
    } else {
      json[r'resolutionLastModifiedAt'] = null;
    }
    if (this.resolutionStatus != null) {
      json[r'resolutionStatus'] = this.resolutionStatus;
    } else {
      json[r'resolutionStatus'] = null;
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
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [CreateInlineComment201Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateInlineComment201Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateInlineComment201Response(
        id: mapValueOfType<String>(json, r'id'),
        status: ContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        pageId: mapValueOfType<String>(json, r'pageId'),
        parentCommentId: mapValueOfType<String>(json, r'parentCommentId'),
        version: Version.fromJson(json[r'version']),
        body: BodySingle.fromJson(json[r'body']),
        resolutionLastModifierId: mapValueOfType<String>(json, r'resolutionLastModifierId'),
        resolutionLastModifiedAt: mapDateTime(json, r'resolutionLastModifiedAt', r''),
        resolutionStatus: InlineCommentResolutionStatus.fromJson(json[r'resolutionStatus']),
        properties: InlineCommentModelProperties.fromJson(json[r'properties']),
        operations: AttachmentSingleOperations.fromJson(json[r'operations']),
        likes: BlogPostSingleLikes.fromJson(json[r'likes']),
        versions: AttachmentSingleVersions.fromJson(json[r'versions']),
        links: GetAttachmentById200ResponseAllOfLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<CreateInlineComment201Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateInlineComment201Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateInlineComment201Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateInlineComment201Response> mapFromJson(dynamic json) {
    final map = <String, CreateInlineComment201Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateInlineComment201Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateInlineComment201Response-objects as value to a dart map
  static Map<String, List<CreateInlineComment201Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateInlineComment201Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateInlineComment201Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

