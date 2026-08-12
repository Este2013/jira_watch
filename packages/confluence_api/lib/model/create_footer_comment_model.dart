//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateFooterCommentModel {
  /// Returns a new [CreateFooterCommentModel] instance.
  CreateFooterCommentModel({
    this.blogPostId,
    this.pageId,
    this.parentCommentId,
    this.attachmentId,
    this.customContentId,
    this.body,
  });

  /// ID of the containing blog post, if intending to create a top level footer comment. Do not provide if creating a reply.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? blogPostId;

  /// ID of the containing page, if intending to create a top level footer comment. Do not provide if creating a reply.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pageId;

  /// ID of the parent comment, if intending to create a reply. Do not provide if creating a top level comment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentCommentId;

  /// ID of the attachment, if intending to create a comment against an attachment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? attachmentId;

  /// ID of the custom content, if intending to create a comment against a custom content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? customContentId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateFooterCommentModelBody? body;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateFooterCommentModel &&
    other.blogPostId == blogPostId &&
    other.pageId == pageId &&
    other.parentCommentId == parentCommentId &&
    other.attachmentId == attachmentId &&
    other.customContentId == customContentId &&
    other.body == body;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (parentCommentId == null ? 0 : parentCommentId!.hashCode) +
    (attachmentId == null ? 0 : attachmentId!.hashCode) +
    (customContentId == null ? 0 : customContentId!.hashCode) +
    (body == null ? 0 : body!.hashCode);

  @override
  String toString() => 'CreateFooterCommentModel[blogPostId=$blogPostId, pageId=$pageId, parentCommentId=$parentCommentId, attachmentId=$attachmentId, customContentId=$customContentId, body=$body]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    return json;
  }

  /// Returns a new [CreateFooterCommentModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateFooterCommentModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateFooterCommentModel(
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        pageId: mapValueOfType<String>(json, r'pageId'),
        parentCommentId: mapValueOfType<String>(json, r'parentCommentId'),
        attachmentId: mapValueOfType<String>(json, r'attachmentId'),
        customContentId: mapValueOfType<String>(json, r'customContentId'),
        body: CreateFooterCommentModelBody.fromJson(json[r'body']),
      );
    }
    return null;
  }

  static List<CreateFooterCommentModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateFooterCommentModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateFooterCommentModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateFooterCommentModel> mapFromJson(dynamic json) {
    final map = <String, CreateFooterCommentModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateFooterCommentModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateFooterCommentModel-objects as value to a dart map
  static Map<String, List<CreateFooterCommentModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateFooterCommentModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateFooterCommentModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

