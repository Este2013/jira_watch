//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetRemoteIssueLinks200Response {
  /// Returns a new [GetRemoteIssueLinks200Response] instance.
  GetRemoteIssueLinks200Response({
    this.application,
    this.globalId,
    this.id,
    this.object,
    this.relationship,
    this.self,
  });

  /// Details of the remote application the linked item is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Application? application;

  /// The global ID of the link, such as the ID of the item on the remote system.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? globalId;

  /// The ID of the link.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// Details of the item linked to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RemoteObject? object;

  /// Description of the relationship between the issue and the linked item.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? relationship;

  /// The URL of the link.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetRemoteIssueLinks200Response &&
    other.application == application &&
    other.globalId == globalId &&
    other.id == id &&
    other.object == object &&
    other.relationship == relationship &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (application == null ? 0 : application!.hashCode) +
    (globalId == null ? 0 : globalId!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (object == null ? 0 : object!.hashCode) +
    (relationship == null ? 0 : relationship!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'GetRemoteIssueLinks200Response[application=$application, globalId=$globalId, id=$id, object=$object, relationship=$relationship, self=$self]';

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
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    if (this.relationship != null) {
      json[r'relationship'] = this.relationship;
    } else {
      json[r'relationship'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [GetRemoteIssueLinks200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetRemoteIssueLinks200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetRemoteIssueLinks200Response(
        application: Application.fromJson(json[r'application']),
        globalId: mapValueOfType<String>(json, r'globalId'),
        id: mapValueOfType<int>(json, r'id'),
        object: RemoteObject.fromJson(json[r'object']),
        relationship: mapValueOfType<String>(json, r'relationship'),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<GetRemoteIssueLinks200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetRemoteIssueLinks200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetRemoteIssueLinks200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetRemoteIssueLinks200Response> mapFromJson(dynamic json) {
    final map = <String, GetRemoteIssueLinks200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetRemoteIssueLinks200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetRemoteIssueLinks200Response-objects as value to a dart map
  static Map<String, List<GetRemoteIssueLinks200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetRemoteIssueLinks200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetRemoteIssueLinks200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

