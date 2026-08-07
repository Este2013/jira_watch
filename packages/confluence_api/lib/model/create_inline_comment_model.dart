//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateInlineCommentModel {
  /// Returns a new [CreateInlineCommentModel] instance.
  CreateInlineCommentModel({
    this.blogPostId,
    this.pageId,
    this.parentCommentId,
    this.body,
    this.inlineCommentProperties,
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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateFooterCommentModelBody? body;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateInlineCommentModelInlineCommentProperties? inlineCommentProperties;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateInlineCommentModel &&
    other.blogPostId == blogPostId &&
    other.pageId == pageId &&
    other.parentCommentId == parentCommentId &&
    other.body == body &&
    other.inlineCommentProperties == inlineCommentProperties;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (parentCommentId == null ? 0 : parentCommentId!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (inlineCommentProperties == null ? 0 : inlineCommentProperties!.hashCode);

  @override
  String toString() => 'CreateInlineCommentModel[blogPostId=$blogPostId, pageId=$pageId, parentCommentId=$parentCommentId, body=$body, inlineCommentProperties=$inlineCommentProperties]';

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
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.inlineCommentProperties != null) {
      json[r'inlineCommentProperties'] = this.inlineCommentProperties;
    } else {
      json[r'inlineCommentProperties'] = null;
    }
    return json;
  }

  /// Returns a new [CreateInlineCommentModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateInlineCommentModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateInlineCommentModel(
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        pageId: mapValueOfType<String>(json, r'pageId'),
        parentCommentId: mapValueOfType<String>(json, r'parentCommentId'),
        body: CreateFooterCommentModelBody.fromJson(json[r'body']),
        inlineCommentProperties: CreateInlineCommentModelInlineCommentProperties.fromJson(json[r'inlineCommentProperties']),
      );
    }
    return null;
  }

  static List<CreateInlineCommentModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateInlineCommentModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateInlineCommentModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateInlineCommentModel> mapFromJson(dynamic json) {
    final map = <String, CreateInlineCommentModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateInlineCommentModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateInlineCommentModel-objects as value to a dart map
  static Map<String, List<CreateInlineCommentModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateInlineCommentModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateInlineCommentModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

