//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldDetails {
  /// Returns a new [FieldDetails] instance.
  FieldDetails({
    this.clauseNames = const [],
    this.custom,
    this.id,
    this.key,
    this.name,
    this.navigable,
    this.orderable,
    this.schema,
    this.scope,
    this.searchable,
  });

  /// The names that can be used to reference the field in an advanced search. For more information, see [Advanced searching - fields reference](https://confluence.atlassian.com/x/gwORLQ).
  List<String> clauseNames;

  /// Whether the field is a custom field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? custom;

  /// The ID of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The key of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The name of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Whether the field can be used as a column on the issue navigator.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? navigable;

  /// Whether the content of the field can be used to order lists.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? orderable;

  /// The data schema for the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JsonTypeBean? schema;

  /// The scope of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Scope? scope;

  /// Whether the content of the field can be searched.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? searchable;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldDetails &&
    _deepEquality.equals(other.clauseNames, clauseNames) &&
    other.custom == custom &&
    other.id == id &&
    other.key == key &&
    other.name == name &&
    other.navigable == navigable &&
    other.orderable == orderable &&
    other.schema == schema &&
    other.scope == scope &&
    other.searchable == searchable;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (clauseNames.hashCode) +
    (custom == null ? 0 : custom!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (navigable == null ? 0 : navigable!.hashCode) +
    (orderable == null ? 0 : orderable!.hashCode) +
    (schema == null ? 0 : schema!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (searchable == null ? 0 : searchable!.hashCode);

  @override
  String toString() => 'FieldDetails[clauseNames=$clauseNames, custom=$custom, id=$id, key=$key, name=$name, navigable=$navigable, orderable=$orderable, schema=$schema, scope=$scope, searchable=$searchable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'clauseNames'] = this.clauseNames;
    if (this.custom != null) {
      json[r'custom'] = this.custom;
    } else {
      json[r'custom'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.navigable != null) {
      json[r'navigable'] = this.navigable;
    } else {
      json[r'navigable'] = null;
    }
    if (this.orderable != null) {
      json[r'orderable'] = this.orderable;
    } else {
      json[r'orderable'] = null;
    }
    if (this.schema != null) {
      json[r'schema'] = this.schema;
    } else {
      json[r'schema'] = null;
    }
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.searchable != null) {
      json[r'searchable'] = this.searchable;
    } else {
      json[r'searchable'] = null;
    }
    return json;
  }

  /// Returns a new [FieldDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldDetails(
        clauseNames: json[r'clauseNames'] is Iterable
            ? (json[r'clauseNames'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        custom: mapValueOfType<bool>(json, r'custom'),
        id: mapValueOfType<String>(json, r'id'),
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
        navigable: mapValueOfType<bool>(json, r'navigable'),
        orderable: mapValueOfType<bool>(json, r'orderable'),
        schema: JsonTypeBean.fromJson(json[r'schema']),
        scope: Scope.fromJson(json[r'scope']),
        searchable: mapValueOfType<bool>(json, r'searchable'),
      );
    }
    return null;
  }

  static List<FieldDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldDetails> mapFromJson(dynamic json) {
    final map = <String, FieldDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldDetails-objects as value to a dart map
  static Map<String, List<FieldDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

