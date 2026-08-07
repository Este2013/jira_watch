//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomContentCommentModel {
  /// Returns a new [CustomContentCommentModel] instance.
  CustomContentCommentModel({
    this.id,
    this.status,
    this.title,
    this.customContentId,
    this.version,
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

  /// ID of the custom content containing the comment.
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
  CommentLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomContentCommentModel &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.customContentId == customContentId &&
    other.version == version &&
    other.body == body &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (customContentId == null ? 0 : customContentId!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'CustomContentCommentModel[id=$id, status=$status, title=$title, customContentId=$customContentId, version=$version, body=$body, links=$links]';

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
    if (this.customContentId != null) {
      json[r'customContentId'] = this.customContentId;
    } else {
      json[r'customContentId'] = null;
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
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [CustomContentCommentModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomContentCommentModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CustomContentCommentModel(
        id: mapValueOfType<String>(json, r'id'),
        status: ContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        customContentId: mapValueOfType<String>(json, r'customContentId'),
        version: Version.fromJson(json[r'version']),
        body: BodySingle.fromJson(json[r'body']),
        links: CommentLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<CustomContentCommentModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomContentCommentModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomContentCommentModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomContentCommentModel> mapFromJson(dynamic json) {
    final map = <String, CustomContentCommentModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomContentCommentModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomContentCommentModel-objects as value to a dart map
  static Map<String, List<CustomContentCommentModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomContentCommentModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomContentCommentModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

