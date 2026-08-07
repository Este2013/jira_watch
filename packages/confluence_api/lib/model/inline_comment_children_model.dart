//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineCommentChildrenModel {
  /// Returns a new [InlineCommentChildrenModel] instance.
  InlineCommentChildrenModel({
    this.id,
    this.status,
    this.title,
    this.parentCommentId,
    this.version,
    this.body,
    this.resolutionStatus,
    this.properties,
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

  /// ID of the parent comment the child comment is in.
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
  BodyBulk? body;

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
  InlineCommentProperties? properties;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommentLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineCommentChildrenModel &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.parentCommentId == parentCommentId &&
    other.version == version &&
    other.body == body &&
    other.resolutionStatus == resolutionStatus &&
    other.properties == properties &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (parentCommentId == null ? 0 : parentCommentId!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (resolutionStatus == null ? 0 : resolutionStatus!.hashCode) +
    (properties == null ? 0 : properties!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'InlineCommentChildrenModel[id=$id, status=$status, title=$title, parentCommentId=$parentCommentId, version=$version, body=$body, resolutionStatus=$resolutionStatus, properties=$properties, links=$links]';

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
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [InlineCommentChildrenModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineCommentChildrenModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return InlineCommentChildrenModel(
        id: mapValueOfType<String>(json, r'id'),
        status: ContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        parentCommentId: mapValueOfType<String>(json, r'parentCommentId'),
        version: Version.fromJson(json[r'version']),
        body: BodyBulk.fromJson(json[r'body']),
        resolutionStatus: InlineCommentResolutionStatus.fromJson(json[r'resolutionStatus']),
        properties: InlineCommentProperties.fromJson(json[r'properties']),
        links: CommentLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<InlineCommentChildrenModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <InlineCommentChildrenModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InlineCommentChildrenModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InlineCommentChildrenModel> mapFromJson(dynamic json) {
    final map = <String, InlineCommentChildrenModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InlineCommentChildrenModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InlineCommentChildrenModel-objects as value to a dart map
  static Map<String, List<InlineCommentChildrenModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<InlineCommentChildrenModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InlineCommentChildrenModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

