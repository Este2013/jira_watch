//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldCreateMetadata {
  /// Returns a new [FieldCreateMetadata] instance.
  FieldCreateMetadata({
    this.allowedValues = const [],
    this.autoCompleteUrl,
    this.configuration = const {},
    this.defaultValue,
    required this.fieldId,
    this.hasDefaultValue,
    required this.key,
    required this.name,
    this.operations = const [],
    required this.required_,
    required this.schema,
  });

  /// The list of values allowed in the field.
  List<Object> allowedValues;

  /// The URL that can be used to automatically complete the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? autoCompleteUrl;

  /// The configuration properties.
  Map<String, Object> configuration;

  /// The default value of the field.
  Object? defaultValue;

  /// The field id.
  String fieldId;

  /// Whether the field has a default value.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hasDefaultValue;

  /// The key of the field.
  String key;

  /// The name of the field.
  String name;

  /// The list of operations that can be performed on the field.
  List<String> operations;

  /// Whether the field is required.
  bool required_;

  /// The data type of the field.
  JsonTypeBean schema;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldCreateMetadata &&
    _deepEquality.equals(other.allowedValues, allowedValues) &&
    other.autoCompleteUrl == autoCompleteUrl &&
    _deepEquality.equals(other.configuration, configuration) &&
    other.defaultValue == defaultValue &&
    other.fieldId == fieldId &&
    other.hasDefaultValue == hasDefaultValue &&
    other.key == key &&
    other.name == name &&
    _deepEquality.equals(other.operations, operations) &&
    other.required_ == required_ &&
    other.schema == schema;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (allowedValues.hashCode) +
    (autoCompleteUrl == null ? 0 : autoCompleteUrl!.hashCode) +
    (configuration.hashCode) +
    (defaultValue == null ? 0 : defaultValue!.hashCode) +
    (fieldId.hashCode) +
    (hasDefaultValue == null ? 0 : hasDefaultValue!.hashCode) +
    (key.hashCode) +
    (name.hashCode) +
    (operations.hashCode) +
    (required_.hashCode) +
    (schema.hashCode);

  @override
  String toString() => 'FieldCreateMetadata[allowedValues=$allowedValues, autoCompleteUrl=$autoCompleteUrl, configuration=$configuration, defaultValue=$defaultValue, fieldId=$fieldId, hasDefaultValue=$hasDefaultValue, key=$key, name=$name, operations=$operations, required_=$required_, schema=$schema]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'allowedValues'] = this.allowedValues;
    if (this.autoCompleteUrl != null) {
      json[r'autoCompleteUrl'] = this.autoCompleteUrl;
    } else {
      json[r'autoCompleteUrl'] = null;
    }
      json[r'configuration'] = this.configuration;
    if (this.defaultValue != null) {
      json[r'defaultValue'] = this.defaultValue;
    } else {
      json[r'defaultValue'] = null;
    }
      json[r'fieldId'] = this.fieldId;
    if (this.hasDefaultValue != null) {
      json[r'hasDefaultValue'] = this.hasDefaultValue;
    } else {
      json[r'hasDefaultValue'] = null;
    }
      json[r'key'] = this.key;
      json[r'name'] = this.name;
      json[r'operations'] = this.operations;
      json[r'required'] = this.required_;
      json[r'schema'] = this.schema;
    return json;
  }

  /// Returns a new [FieldCreateMetadata] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldCreateMetadata? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "FieldCreateMetadata[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "FieldCreateMetadata[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'key'), 'Required key "FieldCreateMetadata[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "FieldCreateMetadata[key]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "FieldCreateMetadata[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "FieldCreateMetadata[name]" has a null value in JSON.');
        assert(json.containsKey(r'operations'), 'Required key "FieldCreateMetadata[operations]" is missing from JSON.');
        assert(json[r'operations'] != null, 'Required key "FieldCreateMetadata[operations]" has a null value in JSON.');
        assert(json.containsKey(r'required'), 'Required key "FieldCreateMetadata[required]" is missing from JSON.');
        assert(json[r'required'] != null, 'Required key "FieldCreateMetadata[required]" has a null value in JSON.');
        assert(json.containsKey(r'schema'), 'Required key "FieldCreateMetadata[schema]" is missing from JSON.');
        assert(json[r'schema'] != null, 'Required key "FieldCreateMetadata[schema]" has a null value in JSON.');
        return true;
      }());

      return FieldCreateMetadata(
        allowedValues: json[r'allowedValues'] is Iterable
            ? (json[r'allowedValues'] as Iterable).cast<Object>().toList(growable: false)
            : const [],
        autoCompleteUrl: mapValueOfType<String>(json, r'autoCompleteUrl'),
        configuration: mapCastOfType<String, Object>(json, r'configuration') ?? const {},
        defaultValue: mapValueOfType<Object>(json, r'defaultValue'),
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        hasDefaultValue: mapValueOfType<bool>(json, r'hasDefaultValue'),
        key: mapValueOfType<String>(json, r'key')!,
        name: mapValueOfType<String>(json, r'name')!,
        operations: json[r'operations'] is Iterable
            ? (json[r'operations'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        required_: mapValueOfType<bool>(json, r'required')!,
        schema: JsonTypeBean.fromJson(json[r'schema'])!,
      );
    }
    return null;
  }

  static List<FieldCreateMetadata> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldCreateMetadata>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldCreateMetadata.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldCreateMetadata> mapFromJson(dynamic json) {
    final map = <String, FieldCreateMetadata>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldCreateMetadata.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldCreateMetadata-objects as value to a dart map
  static Map<String, List<FieldCreateMetadata>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldCreateMetadata>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldCreateMetadata.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
    'key',
    'name',
    'operations',
    'required',
    'schema',
  };
}

