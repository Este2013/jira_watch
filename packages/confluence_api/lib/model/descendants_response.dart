//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DescendantsResponse {
  /// Returns a new [DescendantsResponse] instance.
  DescendantsResponse({
    this.id,
    this.status,
    this.title,
    this.type,
    this.parentId,
    this.depth,
    this.childPosition,
  });

  /// ID of the descendant.
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
  OnlyArchivedAndCurrentContentStatus? status;

  /// Title of the descendant.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// Hierarchical content type (database/embed/folder/page/whiteboard).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  /// ID of the parent content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentId;

  /// Depth of the descendant in the content tree relative to the content specified in the request.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? depth;

  /// Numerical value indicating position of the content relative to its siblings (with the same parentId) within the content tree. If the content is sorted by childPosition, it will reflect the default content ordering within the content tree.
  int? childPosition;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DescendantsResponse &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.type == type &&
    other.parentId == parentId &&
    other.depth == depth &&
    other.childPosition == childPosition;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (depth == null ? 0 : depth!.hashCode) +
    (childPosition == null ? 0 : childPosition!.hashCode);

  @override
  String toString() => 'DescendantsResponse[id=$id, status=$status, title=$title, type=$type, parentId=$parentId, depth=$depth, childPosition=$childPosition]';

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
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.parentId != null) {
      json[r'parentId'] = this.parentId;
    } else {
      json[r'parentId'] = null;
    }
    if (this.depth != null) {
      json[r'depth'] = this.depth;
    } else {
      json[r'depth'] = null;
    }
    if (this.childPosition != null) {
      json[r'childPosition'] = this.childPosition;
    } else {
      json[r'childPosition'] = null;
    }
    return json;
  }

  /// Returns a new [DescendantsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DescendantsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return DescendantsResponse(
        id: mapValueOfType<String>(json, r'id'),
        status: OnlyArchivedAndCurrentContentStatus.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        type: mapValueOfType<String>(json, r'type'),
        parentId: mapValueOfType<String>(json, r'parentId'),
        depth: mapValueOfType<int>(json, r'depth'),
        childPosition: mapValueOfType<int>(json, r'childPosition'),
      );
    }
    return null;
  }

  static List<DescendantsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DescendantsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DescendantsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DescendantsResponse> mapFromJson(dynamic json) {
    final map = <String, DescendantsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DescendantsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DescendantsResponse-objects as value to a dart map
  static Map<String, List<DescendantsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DescendantsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DescendantsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

