//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldAssociationItemPayload {
  /// Returns a new [FieldAssociationItemPayload] instance.
  FieldAssociationItemPayload({
    this.description,
    this.pcri,
    this.qualifierId,
    this.qualifierType,
    this.rendererType,
    this.required_,
  });

  /// The description of the field association item
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
  ProjectCreateResourceIdentifier? pcri;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? qualifierId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? qualifierType;

  /// The renderer type of the field
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rendererType;

  /// Whether the field is required
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? required_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldAssociationItemPayload &&
    other.description == description &&
    other.pcri == pcri &&
    other.qualifierId == qualifierId &&
    other.qualifierType == qualifierType &&
    other.rendererType == rendererType &&
    other.required_ == required_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (qualifierId == null ? 0 : qualifierId!.hashCode) +
    (qualifierType == null ? 0 : qualifierType!.hashCode) +
    (rendererType == null ? 0 : rendererType!.hashCode) +
    (required_ == null ? 0 : required_!.hashCode);

  @override
  String toString() => 'FieldAssociationItemPayload[description=$description, pcri=$pcri, qualifierId=$qualifierId, qualifierType=$qualifierType, rendererType=$rendererType, required_=$required_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
    if (this.qualifierId != null) {
      json[r'qualifierId'] = this.qualifierId;
    } else {
      json[r'qualifierId'] = null;
    }
    if (this.qualifierType != null) {
      json[r'qualifierType'] = this.qualifierType;
    } else {
      json[r'qualifierType'] = null;
    }
    if (this.rendererType != null) {
      json[r'rendererType'] = this.rendererType;
    } else {
      json[r'rendererType'] = null;
    }
    if (this.required_ != null) {
      json[r'required'] = this.required_;
    } else {
      json[r'required'] = null;
    }
    return json;
  }

  /// Returns a new [FieldAssociationItemPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldAssociationItemPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldAssociationItemPayload(
        description: mapValueOfType<String>(json, r'description'),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        qualifierId: ProjectCreateResourceIdentifier.fromJson(json[r'qualifierId']),
        qualifierType: ProjectCreateResourceIdentifier.fromJson(json[r'qualifierType']),
        rendererType: mapValueOfType<String>(json, r'rendererType'),
        required_: mapValueOfType<bool>(json, r'required'),
      );
    }
    return null;
  }

  static List<FieldAssociationItemPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldAssociationItemPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldAssociationItemPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldAssociationItemPayload> mapFromJson(dynamic json) {
    final map = <String, FieldAssociationItemPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldAssociationItemPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldAssociationItemPayload-objects as value to a dart map
  static Map<String, List<FieldAssociationItemPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldAssociationItemPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldAssociationItemPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

