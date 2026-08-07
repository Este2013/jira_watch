//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RemoteIssueLinkRequest {
  /// Returns a new [RemoteIssueLinkRequest] instance.
  RemoteIssueLinkRequest({
    this.application,
    this.globalId,
    required this.object,
    this.relationship,
  });

  /// Details of the remote application the linked item is in. For example, trello.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Application? application;

  /// An identifier for the remote item in the remote system. For example, the global ID for a remote item in Confluence would consist of the app ID and page ID, like this: `appId=456&pageId=123`.  Setting this field enables the remote issue link details to be updated or deleted using remote system and item details as the record identifier, rather than using the record's Jira ID.  The maximum length is 255 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? globalId;

  /// Details of the item linked to.
  RemoteObject object;

  /// Description of the relationship between the issue and the linked item. If not set, the relationship description \"links to\" is used in Jira.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? relationship;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RemoteIssueLinkRequest &&
    other.application == application &&
    other.globalId == globalId &&
    other.object == object &&
    other.relationship == relationship;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (application == null ? 0 : application!.hashCode) +
    (globalId == null ? 0 : globalId!.hashCode) +
    (object.hashCode) +
    (relationship == null ? 0 : relationship!.hashCode);

  @override
  String toString() => 'RemoteIssueLinkRequest[application=$application, globalId=$globalId, object=$object, relationship=$relationship]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.application != null) {
      json[r'application'] = this.application;
    } else {
      json[r'application'] = null;
    }
    if (this.globalId != null) {
      json[r'globalId'] = this.globalId;
    } else {
      json[r'globalId'] = null;
    }
      json[r'object'] = this.object;
    if (this.relationship != null) {
      json[r'relationship'] = this.relationship;
    } else {
      json[r'relationship'] = null;
    }
    return json;
  }

  /// Returns a new [RemoteIssueLinkRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RemoteIssueLinkRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'object'), 'Required key "RemoteIssueLinkRequest[object]" is missing from JSON.');
        assert(json[r'object'] != null, 'Required key "RemoteIssueLinkRequest[object]" has a null value in JSON.');
        return true;
      }());

      return RemoteIssueLinkRequest(
        application: Application.fromJson(json[r'application']),
        globalId: mapValueOfType<String>(json, r'globalId'),
        object: RemoteObject.fromJson(json[r'object'])!,
        relationship: mapValueOfType<String>(json, r'relationship'),
      );
    }
    return null;
  }

  static List<RemoteIssueLinkRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoteIssueLinkRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoteIssueLinkRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RemoteIssueLinkRequest> mapFromJson(dynamic json) {
    final map = <String, RemoteIssueLinkRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RemoteIssueLinkRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RemoteIssueLinkRequest-objects as value to a dart map
  static Map<String, List<RemoteIssueLinkRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RemoteIssueLinkRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RemoteIssueLinkRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'object',
  };
}

