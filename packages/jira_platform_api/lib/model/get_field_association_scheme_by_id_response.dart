//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetFieldAssociationSchemeByIdResponse {
  /// Returns a new [GetFieldAssociationSchemeByIdResponse] instance.
  GetFieldAssociationSchemeByIdResponse({
    this.description,
    this.fieldsCount,
    this.id,
    this.isDefault,
    this.links,
    this.name,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fieldsCount;

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
  bool? isDefault;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FieldAssociationSchemeLinks? links;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetFieldAssociationSchemeByIdResponse &&
    other.description == description &&
    other.fieldsCount == fieldsCount &&
    other.id == id &&
    other.isDefault == isDefault &&
    other.links == links &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (fieldsCount == null ? 0 : fieldsCount!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isDefault == null ? 0 : isDefault!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'GetFieldAssociationSchemeByIdResponse[description=$description, fieldsCount=$fieldsCount, id=$id, isDefault=$isDefault, links=$links, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.fieldsCount != null) {
      json[r'fieldsCount'] = this.fieldsCount;
    } else {
      json[r'fieldsCount'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.isDefault != null) {
      json[r'isDefault'] = this.isDefault;
    } else {
      json[r'isDefault'] = null;
    }
    if (this.links != null) {
      json[r'links'] = this.links;
    } else {
      json[r'links'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [GetFieldAssociationSchemeByIdResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetFieldAssociationSchemeByIdResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetFieldAssociationSchemeByIdResponse(
        description: mapValueOfType<String>(json, r'description'),
        fieldsCount: mapValueOfType<int>(json, r'fieldsCount'),
        id: mapValueOfType<String>(json, r'id'),
        isDefault: mapValueOfType<bool>(json, r'isDefault'),
        links: FieldAssociationSchemeLinks.fromJson(json[r'links']),
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<GetFieldAssociationSchemeByIdResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetFieldAssociationSchemeByIdResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetFieldAssociationSchemeByIdResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetFieldAssociationSchemeByIdResponse> mapFromJson(dynamic json) {
    final map = <String, GetFieldAssociationSchemeByIdResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetFieldAssociationSchemeByIdResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetFieldAssociationSchemeByIdResponse-objects as value to a dart map
  static Map<String, List<GetFieldAssociationSchemeByIdResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetFieldAssociationSchemeByIdResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetFieldAssociationSchemeByIdResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

