//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateBlogPost200Response {
  /// Returns a new [CreateBlogPost200Response] instance.
  CreateBlogPost200Response({
    this.id,
    this.status,
    this.title,
    this.spaceId,
    this.authorId,
    this.createdAt,
    this.version,
    this.body,
    this.labels,
    this.properties,
    this.operations,
    this.likes,
    this.versions,
    this.isFavoritedByCurrentUser,
    this.links,
  });

  /// ID of the blog post.
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
  BlogPostContentStatus? status;

  /// Title of the blog post.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// ID of the space the blog post is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? spaceId;

  /// The account ID of the user who created this blog post originally.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? authorId;

  /// Date and time when the blog post was created. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
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
  BodySingle? body;

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
  BlogPostSingleLikes? likes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AttachmentSingleVersions? versions;

  /// Whether the blog post has been favorited by the current user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isFavoritedByCurrentUser;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetAttachmentById200ResponseAllOfLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateBlogPost200Response &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.spaceId == spaceId &&
    other.authorId == authorId &&
    other.createdAt == createdAt &&
    other.version == version &&
    other.body == body &&
    other.labels == labels &&
    other.properties == properties &&
    other.operations == operations &&
    other.likes == likes &&
    other.versions == versions &&
    other.isFavoritedByCurrentUser == isFavoritedByCurrentUser &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (authorId == null ? 0 : authorId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (labels == null ? 0 : labels!.hashCode) +
    (properties == null ? 0 : properties!.hashCode) +
    (operations == null ? 0 : operations!.hashCode) +
    (likes == null ? 0 : likes!.hashCode) +
    (versions == null ? 0 : versions!.hashCode) +
    (isFavoritedByCurrentUser == null ? 0 : isFavoritedByCurrentUser!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'CreateBlogPost200Response[id=$id, status=$status, title=$title, spaceId=$spaceId, authorId=$authorId, createdAt=$createdAt, version=$version, body=$body, labels=$labels, properties=$properties, operations=$operations, likes=$likes, versions=$versions, isFavoritedByCurrentUser=$isFavoritedByCurrentUser, links=$links]';

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
    if (this.spaceId != null) {
      json[r'spaceId'] = this.spaceId;
    } else {
      json[r'spaceId'] = null;
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
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
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
    if (this.isFavoritedByCurrentUser != null) {
      json[r'isFavoritedByCurrentUser'] = this.isFavoritedByCurrentUser;
    } else {
      json[r'isFavoritedByCurrentUser'] = null;
    }
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [CreateBlogPost200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateBlogPost200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateBlogPost200Response(
        id: mapValueOfType<String>(json, r'id'),
        status: BlogPostContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        spaceId: mapValueOfType<String>(json, r'spaceId'),
        authorId: mapValueOfType<String>(json, r'authorId'),
        createdAt: mapDateTime(json, r'createdAt', r''),
        version: Version.fromJson(json[r'version']),
        body: BodySingle.fromJson(json[r'body']),
        labels: AttachmentSingleLabels.fromJson(json[r'labels']),
        properties: AttachmentSingleProperties.fromJson(json[r'properties']),
        operations: AttachmentSingleOperations.fromJson(json[r'operations']),
        likes: BlogPostSingleLikes.fromJson(json[r'likes']),
        versions: AttachmentSingleVersions.fromJson(json[r'versions']),
        isFavoritedByCurrentUser: mapValueOfType<bool>(json, r'isFavoritedByCurrentUser'),
        links: GetAttachmentById200ResponseAllOfLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<CreateBlogPost200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateBlogPost200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBlogPost200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateBlogPost200Response> mapFromJson(dynamic json) {
    final map = <String, CreateBlogPost200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateBlogPost200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateBlogPost200Response-objects as value to a dart map
  static Map<String, List<CreateBlogPost200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateBlogPost200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateBlogPost200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

