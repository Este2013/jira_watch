//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Comment {
  /// Returns a new [Comment] instance.
  Comment({
    this.author,
    this.body,
    this.created,
    this.id,
    this.jsdAuthorCanSeeRequest,
    this.jsdPublic,
    this.properties = const [],
    this.renderedBody,
    this.self,
    this.updateAuthor,
    this.updated,
    this.visibility,
  });

  /// The ID of the user who created the comment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserDetails? author;

  /// The comment text in [Atlassian Document Format](https://developer.atlassian.com/cloud/jira/platform/apis/document/structure/).
  Object? body;

  /// The date and time at which the comment was created.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  /// The ID of the comment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Whether the comment was added from an email sent by a person who is not part of the issue. See [Allow external emails to be added as comments on issues](https://support.atlassian.com/jira-service-management-cloud/docs/allow-external-emails-to-be-added-as-comments-on-issues/)for information on setting up this feature.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? jsdAuthorCanSeeRequest;

  /// Whether the comment is visible in Jira Service Desk. Defaults to true when comments are created in the Jira Cloud Platform. This includes when the site doesn't use Jira Service Desk or the project isn't a Jira Service Desk project and, therefore, there is no Jira Service Desk for the issue to be visible on. To create a comment with its visibility in Jira Service Desk set to false, use the Jira Service Desk REST API [Create request comment](https://developer.atlassian.com/cloud/jira/service-desk/rest/#api-rest-servicedeskapi-request-issueIdOrKey-comment-post) operation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? jsdPublic;

  /// A list of comment properties. Optional on create and update.
  List<EntityProperty> properties;

  /// The rendered version of the comment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? renderedBody;

  /// The URL of the comment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The ID of the user who updated the comment last.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserDetails? updateAuthor;

  /// The date and time at which the comment was updated last.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updated;

  /// The group or role to which this comment is visible. Optional on create and update.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Visibility? visibility;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Comment &&
    other.author == author &&
    other.body == body &&
    other.created == created &&
    other.id == id &&
    other.jsdAuthorCanSeeRequest == jsdAuthorCanSeeRequest &&
    other.jsdPublic == jsdPublic &&
    _deepEquality.equals(other.properties, properties) &&
    other.renderedBody == renderedBody &&
    other.self == self &&
    other.updateAuthor == updateAuthor &&
    other.updated == updated &&
    other.visibility == visibility;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (author == null ? 0 : author!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (jsdAuthorCanSeeRequest == null ? 0 : jsdAuthorCanSeeRequest!.hashCode) +
    (jsdPublic == null ? 0 : jsdPublic!.hashCode) +
    (properties.hashCode) +
    (renderedBody == null ? 0 : renderedBody!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (updateAuthor == null ? 0 : updateAuthor!.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (visibility == null ? 0 : visibility!.hashCode);

  @override
  String toString() => 'Comment[author=$author, body=$body, created=$created, id=$id, jsdAuthorCanSeeRequest=$jsdAuthorCanSeeRequest, jsdPublic=$jsdPublic, properties=$properties, renderedBody=$renderedBody, self=$self, updateAuthor=$updateAuthor, updated=$updated, visibility=$visibility]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.author != null) {
      json[r'author'] = this.author;
    } else {
      json[r'author'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.jsdAuthorCanSeeRequest != null) {
      json[r'jsdAuthorCanSeeRequest'] = this.jsdAuthorCanSeeRequest;
    } else {
      json[r'jsdAuthorCanSeeRequest'] = null;
    }
    if (this.jsdPublic != null) {
      json[r'jsdPublic'] = this.jsdPublic;
    } else {
      json[r'jsdPublic'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.renderedBody != null) {
      json[r'renderedBody'] = this.renderedBody;
    } else {
      json[r'renderedBody'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.updateAuthor != null) {
      json[r'updateAuthor'] = this.updateAuthor;
    } else {
      json[r'updateAuthor'] = null;
    }
    if (this.updated != null) {
      json[r'updated'] = this.updated!.toUtc().toIso8601String();
    } else {
      json[r'updated'] = null;
    }
    if (this.visibility != null) {
      json[r'visibility'] = this.visibility;
    } else {
      json[r'visibility'] = null;
    }
    return json;
  }

  /// Returns a new [Comment] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Comment? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Comment(
        author: UserDetails.fromJson(json[r'author']),
        body: mapValueOfType<Object>(json, r'body'),
        created: mapDateTime(json, r'created', r''),
        id: mapValueOfType<String>(json, r'id'),
        jsdAuthorCanSeeRequest: mapValueOfType<bool>(json, r'jsdAuthorCanSeeRequest'),
        jsdPublic: mapValueOfType<bool>(json, r'jsdPublic'),
        properties: EntityProperty.listFromJson(json[r'properties']),
        renderedBody: mapValueOfType<String>(json, r'renderedBody'),
        self: mapValueOfType<String>(json, r'self'),
        updateAuthor: UserDetails.fromJson(json[r'updateAuthor']),
        updated: mapDateTime(json, r'updated', r''),
        visibility: Visibility.fromJson(json[r'visibility']),
      );
    }
    return null;
  }

  static List<Comment> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Comment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Comment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Comment> mapFromJson(dynamic json) {
    final map = <String, Comment>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Comment.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Comment-objects as value to a dart map
  static Map<String, List<Comment>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Comment>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Comment.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

