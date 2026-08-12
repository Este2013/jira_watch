//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetSpaceById200Response {
  /// Returns a new [GetSpaceById200Response] instance.
  GetSpaceById200Response({
    this.id,
    this.key,
    this.name,
    this.type,
    this.status,
    this.authorId,
    this.spaceOwnerId,
    this.createdAt,
    this.homepageId,
    this.description,
    this.icon,
    this.labels,
    this.properties,
    this.operations,
    this.permissions,
    this.links,
  });

  /// ID of the space.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Key of the space.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// Name of the space.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SpaceType? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SpaceStatus? status;

  /// The account ID of the user who created this space originally.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? authorId;

  /// The account ID of the user who owns this space.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? spaceOwnerId;

  /// Date and time when the space was created. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  /// ID of the space's homepage.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? homepageId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SpaceDescription? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SpaceIcon? icon;

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
  SpaceSingleProperties? properties;

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
  SpaceSinglePermissions? permissions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetAttachmentById200ResponseAllOfLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetSpaceById200Response &&
    other.id == id &&
    other.key == key &&
    other.name == name &&
    other.type == type &&
    other.status == status &&
    other.authorId == authorId &&
    other.spaceOwnerId == spaceOwnerId &&
    other.createdAt == createdAt &&
    other.homepageId == homepageId &&
    other.description == description &&
    other.icon == icon &&
    other.labels == labels &&
    other.properties == properties &&
    other.operations == operations &&
    other.permissions == permissions &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (authorId == null ? 0 : authorId!.hashCode) +
    (spaceOwnerId == null ? 0 : spaceOwnerId!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (homepageId == null ? 0 : homepageId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (icon == null ? 0 : icon!.hashCode) +
    (labels == null ? 0 : labels!.hashCode) +
    (properties == null ? 0 : properties!.hashCode) +
    (operations == null ? 0 : operations!.hashCode) +
    (permissions == null ? 0 : permissions!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'GetSpaceById200Response[id=$id, key=$key, name=$name, type=$type, status=$status, authorId=$authorId, spaceOwnerId=$spaceOwnerId, createdAt=$createdAt, homepageId=$homepageId, description=$description, icon=$icon, labels=$labels, properties=$properties, operations=$operations, permissions=$permissions, links=$links]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
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
    if (this.authorId != null) {
      json[r'authorId'] = this.authorId;
    } else {
      json[r'authorId'] = null;
    }
    if (this.spaceOwnerId != null) {
      json[r'spaceOwnerId'] = this.spaceOwnerId;
    } else {
      json[r'spaceOwnerId'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.homepageId != null) {
      json[r'homepageId'] = this.homepageId;
    } else {
      json[r'homepageId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.icon != null) {
      json[r'icon'] = this.icon;
    } else {
      json[r'icon'] = null;
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
    if (this.permissions != null) {
      json[r'permissions'] = this.permissions;
    } else {
      json[r'permissions'] = null;
    }
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [GetSpaceById200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetSpaceById200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetSpaceById200Response(
        id: mapValueOfType<String>(json, r'id'),
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
        type: SpaceType.fromJson(json[r'type']),
        status: SpaceStatus.fromJson(json[r'status']),
        authorId: mapValueOfType<String>(json, r'authorId'),
        spaceOwnerId: mapValueOfType<String>(json, r'spaceOwnerId'),
        createdAt: mapDateTime(json, r'createdAt', r''),
        homepageId: mapValueOfType<String>(json, r'homepageId'),
        description: SpaceDescription.fromJson(json[r'description']),
        icon: SpaceIcon.fromJson(json[r'icon']),
        labels: AttachmentSingleLabels.fromJson(json[r'labels']),
        properties: SpaceSingleProperties.fromJson(json[r'properties']),
        operations: AttachmentSingleOperations.fromJson(json[r'operations']),
        permissions: SpaceSinglePermissions.fromJson(json[r'permissions']),
        links: GetAttachmentById200ResponseAllOfLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<GetSpaceById200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetSpaceById200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetSpaceById200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetSpaceById200Response> mapFromJson(dynamic json) {
    final map = <String, GetSpaceById200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetSpaceById200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetSpaceById200Response-objects as value to a dart map
  static Map<String, List<GetSpaceById200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetSpaceById200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetSpaceById200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

