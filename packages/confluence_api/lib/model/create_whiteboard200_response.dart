//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateWhiteboard200Response {
  /// Returns a new [CreateWhiteboard200Response] instance.
  CreateWhiteboard200Response({
    this.id,
    this.type,
    this.status,
    this.title,
    this.parentId,
    this.parentType,
    this.position,
    this.authorId,
    this.ownerId,
    this.createdAt,
    this.spaceId,
    this.version,
    this.links,
  });

  /// ID of the whiteboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The content type of the object.
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

  /// Title of the whiteboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// ID of the parent content, or null if there is no parent content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ParentContentType? parentType;

  /// Position of the whiteboard within the given parent page tree.
  int? position;

  /// The account ID of the user who created this whiteboard originally.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? authorId;

  /// The account ID of the user who owns this whiteboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ownerId;

  /// Date and time when the whiteboard was created. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  /// ID of the space the whiteboard is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? spaceId;

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
  GetAttachmentById200ResponseAllOfLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateWhiteboard200Response &&
    other.id == id &&
    other.type == type &&
    other.status == status &&
    other.title == title &&
    other.parentId == parentId &&
    other.parentType == parentType &&
    other.position == position &&
    other.authorId == authorId &&
    other.ownerId == ownerId &&
    other.createdAt == createdAt &&
    other.spaceId == spaceId &&
    other.version == version &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (parentType == null ? 0 : parentType!.hashCode) +
    (position == null ? 0 : position!.hashCode) +
    (authorId == null ? 0 : authorId!.hashCode) +
    (ownerId == null ? 0 : ownerId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'CreateWhiteboard200Response[id=$id, type=$type, status=$status, title=$title, parentId=$parentId, parentType=$parentType, position=$position, authorId=$authorId, ownerId=$ownerId, createdAt=$createdAt, spaceId=$spaceId, version=$version, links=$links]';

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
    if (this.parentId != null) {
      json[r'parentId'] = this.parentId;
    } else {
      json[r'parentId'] = null;
    }
    if (this.parentType != null) {
      json[r'parentType'] = this.parentType;
    } else {
      json[r'parentType'] = null;
    }
    if (this.position != null) {
      json[r'position'] = this.position;
    } else {
      json[r'position'] = null;
    }
    if (this.authorId != null) {
      json[r'authorId'] = this.authorId;
    } else {
      json[r'authorId'] = null;
    }
    if (this.ownerId != null) {
      json[r'ownerId'] = this.ownerId;
    } else {
      json[r'ownerId'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.spaceId != null) {
      json[r'spaceId'] = this.spaceId;
    } else {
      json[r'spaceId'] = null;
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

  /// Returns a new [CreateWhiteboard200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateWhiteboard200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateWhiteboard200Response(
        id: mapValueOfType<String>(json, r'id'),
        type: mapValueOfType<String>(json, r'type'),
        status: ContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        parentId: mapValueOfType<String>(json, r'parentId'),
        parentType: ParentContentType.fromJson(json[r'parentType']),
        position: mapValueOfType<int>(json, r'position'),
        authorId: mapValueOfType<String>(json, r'authorId'),
        ownerId: mapValueOfType<String>(json, r'ownerId'),
        createdAt: mapDateTime(json, r'createdAt', r''),
        spaceId: mapValueOfType<String>(json, r'spaceId'),
        version: Version.fromJson(json[r'version']),
        links: GetAttachmentById200ResponseAllOfLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<CreateWhiteboard200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateWhiteboard200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateWhiteboard200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateWhiteboard200Response> mapFromJson(dynamic json) {
    final map = <String, CreateWhiteboard200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateWhiteboard200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateWhiteboard200Response-objects as value to a dart map
  static Map<String, List<CreateWhiteboard200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateWhiteboard200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateWhiteboard200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

