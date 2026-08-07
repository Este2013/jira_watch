//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBean {
  /// Returns a new [IssueBean] instance.
  IssueBean({
    this.changelog,
    this.editmeta,
    this.expand,
    this.fields = const {},
    this.fieldsToInclude,
    this.id,
    this.key,
    this.names = const {},
    this.operations,
    this.properties = const {},
    this.renderedFields = const {},
    this.schema = const {},
    this.self,
    this.transitions = const [],
    this.versionedRepresentations = const {},
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueBeanChangelog? changelog;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueBeanEditmeta? editmeta;

  /// Expand options that include additional issue details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  Map<String, Object> fields;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueBeanFieldsToInclude? fieldsToInclude;

  /// The ID of the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The key of the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The ID and name of each field present on the issue.
  Map<String, String> names;

  /// The operations that can be performed on the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Operations? operations;

  /// Details of the issue properties identified in the request.
  Map<String, Object> properties;

  /// The rendered value of each field present on the issue.
  Map<String, Object> renderedFields;

  /// The schema describing each field present on the issue.
  Map<String, IssueBeanSchemaValue> schema;

  /// The URL of the issue details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The transitions that can be performed on the issue.
  List<IssueBeanTransitionsInner> transitions;

  /// The versions of each field on the issue.
  Map<String, Object> versionedRepresentations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBean &&
    other.changelog == changelog &&
    other.editmeta == editmeta &&
    other.expand == expand &&
    _deepEquality.equals(other.fields, fields) &&
    other.fieldsToInclude == fieldsToInclude &&
    other.id == id &&
    other.key == key &&
    _deepEquality.equals(other.names, names) &&
    other.operations == operations &&
    _deepEquality.equals(other.properties, properties) &&
    _deepEquality.equals(other.renderedFields, renderedFields) &&
    _deepEquality.equals(other.schema, schema) &&
    other.self == self &&
    _deepEquality.equals(other.transitions, transitions) &&
    _deepEquality.equals(other.versionedRepresentations, versionedRepresentations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (changelog == null ? 0 : changelog!.hashCode) +
    (editmeta == null ? 0 : editmeta!.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (fields.hashCode) +
    (fieldsToInclude == null ? 0 : fieldsToInclude!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (names.hashCode) +
    (operations == null ? 0 : operations!.hashCode) +
    (properties.hashCode) +
    (renderedFields.hashCode) +
    (schema.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (transitions.hashCode) +
    (versionedRepresentations.hashCode);

  @override
  String toString() => 'IssueBean[changelog=$changelog, editmeta=$editmeta, expand=$expand, fields=$fields, fieldsToInclude=$fieldsToInclude, id=$id, key=$key, names=$names, operations=$operations, properties=$properties, renderedFields=$renderedFields, schema=$schema, self=$self, transitions=$transitions, versionedRepresentations=$versionedRepresentations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.changelog != null) {
      json[r'changelog'] = this.changelog;
    } else {
      json[r'changelog'] = null;
    }
    if (this.editmeta != null) {
      json[r'editmeta'] = this.editmeta;
    } else {
      json[r'editmeta'] = null;
    }
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
      json[r'fields'] = this.fields;
    if (this.fieldsToInclude != null) {
      json[r'fieldsToInclude'] = this.fieldsToInclude;
    } else {
      json[r'fieldsToInclude'] = null;
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
      json[r'names'] = this.names;
    if (this.operations != null) {
      json[r'operations'] = this.operations;
    } else {
      json[r'operations'] = null;
    }
      json[r'properties'] = this.properties;
      json[r'renderedFields'] = this.renderedFields;
      json[r'schema'] = this.schema;
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
      json[r'transitions'] = this.transitions;
      json[r'versionedRepresentations'] = this.versionedRepresentations;
    return json;
  }

  /// Returns a new [IssueBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueBean(
        changelog: IssueBeanChangelog.fromJson(json[r'changelog']),
        editmeta: IssueBeanEditmeta.fromJson(json[r'editmeta']),
        expand: mapValueOfType<String>(json, r'expand'),
        fields: mapCastOfType<String, Object>(json, r'fields') ?? const {},
        fieldsToInclude: IssueBeanFieldsToInclude.fromJson(json[r'fieldsToInclude']),
        id: mapValueOfType<String>(json, r'id'),
        key: mapValueOfType<String>(json, r'key'),
        names: mapCastOfType<String, String>(json, r'names') ?? const {},
        operations: Operations.fromJson(json[r'operations']),
        properties: mapCastOfType<String, Object>(json, r'properties') ?? const {},
        renderedFields: mapCastOfType<String, Object>(json, r'renderedFields') ?? const {},
        schema: IssueBeanSchemaValue.mapFromJson(json[r'schema']),
        self: mapValueOfType<String>(json, r'self'),
        transitions: IssueBeanTransitionsInner.listFromJson(json[r'transitions']),
        versionedRepresentations: mapCastOfType<String, Object>(json, r'versionedRepresentations') ?? const {},
      );
    }
    return null;
  }

  static List<IssueBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBean> mapFromJson(dynamic json) {
    final map = <String, IssueBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBean-objects as value to a dart map
  static Map<String, List<IssueBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

