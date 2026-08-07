//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldAssociationsRequest {
  /// Returns a new [FieldAssociationsRequest] instance.
  FieldAssociationsRequest({
    this.associationContexts = const [],
    this.fields = const [],
  });

  /// Contexts to associate/unassociate the fields with.
  List<AssociationContextObject> associationContexts;

  /// Fields to associate/unassociate with projects.
  List<FieldIdentifierObject> fields;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldAssociationsRequest &&
    _deepEquality.equals(other.associationContexts, associationContexts) &&
    _deepEquality.equals(other.fields, fields);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (associationContexts.hashCode) +
    (fields.hashCode);

  @override
  String toString() => 'FieldAssociationsRequest[associationContexts=$associationContexts, fields=$fields]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'associationContexts'] = this.associationContexts;
      json[r'fields'] = this.fields;
    return json;
  }

  /// Returns a new [FieldAssociationsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldAssociationsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'associationContexts'), 'Required key "FieldAssociationsRequest[associationContexts]" is missing from JSON.');
        assert(json[r'associationContexts'] != null, 'Required key "FieldAssociationsRequest[associationContexts]" has a null value in JSON.');
        assert(json.containsKey(r'fields'), 'Required key "FieldAssociationsRequest[fields]" is missing from JSON.');
        assert(json[r'fields'] != null, 'Required key "FieldAssociationsRequest[fields]" has a null value in JSON.');
        return true;
      }());

      return FieldAssociationsRequest(
        associationContexts: AssociationContextObject.listFromJson(json[r'associationContexts']),
        fields: FieldIdentifierObject.listFromJson(json[r'fields']),
      );
    }
    return null;
  }

  static List<FieldAssociationsRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldAssociationsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldAssociationsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldAssociationsRequest> mapFromJson(dynamic json) {
    final map = <String, FieldAssociationsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldAssociationsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldAssociationsRequest-objects as value to a dart map
  static Map<String, List<FieldAssociationsRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldAssociationsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldAssociationsRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'associationContexts',
    'fields',
  };
}

