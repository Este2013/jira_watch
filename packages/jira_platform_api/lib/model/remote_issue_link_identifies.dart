//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RemoteIssueLinkIdentifies {
  /// Returns a new [RemoteIssueLinkIdentifies] instance.
  RemoteIssueLinkIdentifies({
    this.id,
    this.self,
  });

  /// The ID of the remote issue link, such as the ID of the item on the remote system.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The URL of the remote issue link.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RemoteIssueLinkIdentifies &&
    other.id == id &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'RemoteIssueLinkIdentifies[id=$id, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [RemoteIssueLinkIdentifies] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RemoteIssueLinkIdentifies? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RemoteIssueLinkIdentifies(
        id: mapValueOfType<int>(json, r'id'),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<RemoteIssueLinkIdentifies> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoteIssueLinkIdentifies>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoteIssueLinkIdentifies.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RemoteIssueLinkIdentifies> mapFromJson(dynamic json) {
    final map = <String, RemoteIssueLinkIdentifies>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RemoteIssueLinkIdentifies.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RemoteIssueLinkIdentifies-objects as value to a dart map
  static Map<String, List<RemoteIssueLinkIdentifies>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RemoteIssueLinkIdentifies>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RemoteIssueLinkIdentifies.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

