//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PriorityWithSequence {
  /// Returns a new [PriorityWithSequence] instance.
  PriorityWithSequence({
    this.description,
    this.iconUrl,
    this.id,
    this.isDefault,
    this.name,
    this.self,
    this.sequence,
    this.statusColor,
  });

  /// The description of the issue priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The URL of the icon for the issue priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? iconUrl;

  /// The ID of the issue priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Whether this priority is the default.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDefault;

  /// The name of the issue priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The URL of the issue priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The sequence of the issue priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sequence;

  /// The color used to indicate the issue priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusColor;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PriorityWithSequence &&
    other.description == description &&
    other.iconUrl == iconUrl &&
    other.id == id &&
    other.isDefault == isDefault &&
    other.name == name &&
    other.self == self &&
    other.sequence == sequence &&
    other.statusColor == statusColor;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (iconUrl == null ? 0 : iconUrl!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isDefault == null ? 0 : isDefault!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (sequence == null ? 0 : sequence!.hashCode) +
    (statusColor == null ? 0 : statusColor!.hashCode);

  @override
  String toString() => 'PriorityWithSequence[description=$description, iconUrl=$iconUrl, id=$id, isDefault=$isDefault, name=$name, self=$self, sequence=$sequence, statusColor=$statusColor]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.iconUrl != null) {
      json[r'iconUrl'] = this.iconUrl;
    } else {
      json[r'iconUrl'] = null;
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
    if (this.sequence != null) {
      json[r'sequence'] = this.sequence;
    } else {
      json[r'sequence'] = null;
    }
    if (this.statusColor != null) {
      json[r'statusColor'] = this.statusColor;
    } else {
      json[r'statusColor'] = null;
    }
    return json;
  }

  /// Returns a new [PriorityWithSequence] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PriorityWithSequence? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PriorityWithSequence(
        description: mapValueOfType<String>(json, r'description'),
        iconUrl: mapValueOfType<String>(json, r'iconUrl'),
        id: mapValueOfType<String>(json, r'id'),
        isDefault: mapValueOfType<bool>(json, r'isDefault'),
        name: mapValueOfType<String>(json, r'name'),
        self: mapValueOfType<String>(json, r'self'),
        sequence: mapValueOfType<String>(json, r'sequence'),
        statusColor: mapValueOfType<String>(json, r'statusColor'),
      );
    }
    return null;
  }

  static List<PriorityWithSequence> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PriorityWithSequence>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PriorityWithSequence.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PriorityWithSequence> mapFromJson(dynamic json) {
    final map = <String, PriorityWithSequence>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PriorityWithSequence.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PriorityWithSequence-objects as value to a dart map
  static Map<String, List<PriorityWithSequence>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PriorityWithSequence>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PriorityWithSequence.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

