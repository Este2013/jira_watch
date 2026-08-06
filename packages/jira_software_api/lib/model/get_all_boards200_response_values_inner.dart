//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetAllBoards200ResponseValuesInner {
  /// Returns a new [GetAllBoards200ResponseValuesInner] instance.
  GetAllBoards200ResponseValuesInner({
    this.admins,
    this.canEdit,
    this.favourite,
    this.id,
    this.isPrivate,
    this.location,
    this.name,
    this.self,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetAllBoards200ResponseValuesInnerAdmins? admins;

  /// Whether the board can be edited.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? canEdit;

  /// Whether the board is selected as a favorite.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? favourite;

  /// The ID of the board.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// Whether the board is private.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isPrivate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetAllBoards200ResponseValuesInnerLocation? location;

  /// The name of the board.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The URL of the board.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The type the board.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetAllBoards200ResponseValuesInner &&
    other.admins == admins &&
    other.canEdit == canEdit &&
    other.favourite == favourite &&
    other.id == id &&
    other.isPrivate == isPrivate &&
    other.location == location &&
    other.name == name &&
    other.self == self &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (admins == null ? 0 : admins!.hashCode) +
    (canEdit == null ? 0 : canEdit!.hashCode) +
    (favourite == null ? 0 : favourite!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isPrivate == null ? 0 : isPrivate!.hashCode) +
    (location == null ? 0 : location!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'GetAllBoards200ResponseValuesInner[admins=$admins, canEdit=$canEdit, favourite=$favourite, id=$id, isPrivate=$isPrivate, location=$location, name=$name, self=$self, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.admins != null) {
      json[r'admins'] = this.admins;
    } else {
      json[r'admins'] = null;
    }
    if (this.canEdit != null) {
      json[r'canEdit'] = this.canEdit;
    } else {
      json[r'canEdit'] = null;
    }
    if (this.favourite != null) {
      json[r'favourite'] = this.favourite;
    } else {
      json[r'favourite'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.isPrivate != null) {
      json[r'isPrivate'] = this.isPrivate;
    } else {
      json[r'isPrivate'] = null;
    }
    if (this.location != null) {
      json[r'location'] = this.location;
    } else {
      json[r'location'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [GetAllBoards200ResponseValuesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetAllBoards200ResponseValuesInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetAllBoards200ResponseValuesInner(
        admins: GetAllBoards200ResponseValuesInnerAdmins.fromJson(json[r'admins']),
        canEdit: mapValueOfType<bool>(json, r'canEdit'),
        favourite: mapValueOfType<bool>(json, r'favourite'),
        id: mapValueOfType<int>(json, r'id'),
        isPrivate: mapValueOfType<bool>(json, r'isPrivate'),
        location: GetAllBoards200ResponseValuesInnerLocation.fromJson(json[r'location']),
        name: mapValueOfType<String>(json, r'name'),
        self: mapValueOfType<String>(json, r'self'),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<GetAllBoards200ResponseValuesInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetAllBoards200ResponseValuesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetAllBoards200ResponseValuesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetAllBoards200ResponseValuesInner> mapFromJson(dynamic json) {
    final map = <String, GetAllBoards200ResponseValuesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetAllBoards200ResponseValuesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetAllBoards200ResponseValuesInner-objects as value to a dart map
  static Map<String, List<GetAllBoards200ResponseValuesInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetAllBoards200ResponseValuesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetAllBoards200ResponseValuesInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

