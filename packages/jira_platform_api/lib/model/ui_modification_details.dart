//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UiModificationDetails {
  /// Returns a new [UiModificationDetails] instance.
  UiModificationDetails({
    this.contexts = const [],
    this.data,
    this.description,
    required this.id,
    required this.name,
    required this.self,
  });

  /// List of contexts of the UI modification. The maximum number of contexts is 1000.
  List<UiModificationContextDetails> contexts;

  /// The data of the UI modification. The maximum size of the data is 50000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? data;

  /// The description of the UI modification. The maximum length is 255 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the UI modification.
  String id;

  /// The name of the UI modification. The maximum length is 255 characters.
  String name;

  /// The URL of the UI modification.
  String self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UiModificationDetails &&
    _deepEquality.equals(other.contexts, contexts) &&
    other.data == data &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contexts.hashCode) +
    (data == null ? 0 : data!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (self.hashCode);

  @override
  String toString() => 'UiModificationDetails[contexts=$contexts, data=$data, description=$description, id=$id, name=$name, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contexts'] = this.contexts;
    if (this.data != null) {
      json[r'data'] = this.data;
    } else {
      json[r'data'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'self'] = this.self;
    return json;
  }

  /// Returns a new [UiModificationDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UiModificationDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "UiModificationDetails[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "UiModificationDetails[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "UiModificationDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "UiModificationDetails[name]" has a null value in JSON.');
        assert(json.containsKey(r'self'), 'Required key "UiModificationDetails[self]" is missing from JSON.');
        assert(json[r'self'] != null, 'Required key "UiModificationDetails[self]" has a null value in JSON.');
        return true;
      }());

      return UiModificationDetails(
        contexts: UiModificationContextDetails.listFromJson(json[r'contexts']),
        data: mapValueOfType<String>(json, r'data'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        self: mapValueOfType<String>(json, r'self')!,
      );
    }
    return null;
  }

  static List<UiModificationDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UiModificationDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UiModificationDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UiModificationDetails> mapFromJson(dynamic json) {
    final map = <String, UiModificationDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UiModificationDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UiModificationDetails-objects as value to a dart map
  static Map<String, List<UiModificationDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UiModificationDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UiModificationDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'self',
  };
}

