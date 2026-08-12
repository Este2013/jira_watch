//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSmartLinkRequest {
  /// Returns a new [CreateSmartLinkRequest] instance.
  CreateSmartLinkRequest({
    required this.spaceId,
    this.title,
    this.parentId,
    this.embedUrl,
  });

  /// ID of the space.
  String spaceId;

  /// Title of the Smart Link in the content tree.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// The parent content ID of the Smart Link in the content tree.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentId;

  /// The URL that the Smart Link in the content tree should be populated with.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? embedUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateSmartLinkRequest &&
    other.spaceId == spaceId &&
    other.title == title &&
    other.parentId == parentId &&
    other.embedUrl == embedUrl;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (spaceId.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (embedUrl == null ? 0 : embedUrl!.hashCode);

  @override
  String toString() => 'CreateSmartLinkRequest[spaceId=$spaceId, title=$title, parentId=$parentId, embedUrl=$embedUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'spaceId'] = this.spaceId;
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
    if (this.embedUrl != null) {
      json[r'embedUrl'] = this.embedUrl;
    } else {
      json[r'embedUrl'] = null;
    }
    return json;
  }

  /// Returns a new [CreateSmartLinkRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSmartLinkRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'spaceId'), 'Required key "CreateSmartLinkRequest[spaceId]" is missing from JSON.');
        assert(json[r'spaceId'] != null, 'Required key "CreateSmartLinkRequest[spaceId]" has a null value in JSON.');
        return true;
      }());

      return CreateSmartLinkRequest(
        spaceId: mapValueOfType<String>(json, r'spaceId')!,
        title: mapValueOfType<String>(json, r'title'),
        parentId: mapValueOfType<String>(json, r'parentId'),
        embedUrl: mapValueOfType<String>(json, r'embedUrl'),
      );
    }
    return null;
  }

  static List<CreateSmartLinkRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateSmartLinkRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSmartLinkRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSmartLinkRequest> mapFromJson(dynamic json) {
    final map = <String, CreateSmartLinkRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateSmartLinkRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSmartLinkRequest-objects as value to a dart map
  static Map<String, List<CreateSmartLinkRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateSmartLinkRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateSmartLinkRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'spaceId',
  };
}

