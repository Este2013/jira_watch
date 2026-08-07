//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldMetadata {
  /// Returns a new [FieldMetadata] instance.
  FieldMetadata({
    this.allowedValues = const [],
    this.autoCompleteUrl,
    this.configuration = const {},
    this.defaultValue,
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
  bool operator ==(Object other) => identical(this, other) || other is FieldMetadata &&
    _deepEquality.equals(other.allowedValues, allowedValues) &&
    other.autoCompleteUrl == autoCompleteUrl &&
    _deepEquality.equals(other.configuration, configuration) &&
    other.defaultValue == defaultValue &&
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
    (hasDefaultValue == null ? 0 : hasDefaultValue!.hashCode) +
    (key.hashCode) +
    (name.hashCode) +
    (operations.hashCode) +
    (required_.hashCode) +
    (schema.hashCode);

  @override
  String toString() => 'FieldMetadata[allowedValues=$allowedValues, autoCompleteUrl=$autoCompleteUrl, configuration=$configuration, defaultValue=$defaultValue, hasDefaultValue=$hasDefaultValue, key=$key, name=$name, operations=$operations, required_=$required_, schema=$schema]';

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

  /// Returns a new [FieldMetadata] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldMetadata? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'key'), 'Required key "FieldMetadata[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "FieldMetadata[key]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "FieldMetadata[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "FieldMetadata[name]" has a null value in JSON.');
        assert(json.containsKey(r'operations'), 'Required key "FieldMetadata[operations]" is missing from JSON.');
        assert(json[r'operations'] != null, 'Required key "FieldMetadata[operations]" has a null value in JSON.');
        assert(json.containsKey(r'required'), 'Required key "FieldMetadata[required]" is missing from JSON.');
        assert(json[r'required'] != null, 'Required key "FieldMetadata[required]" has a null value in JSON.');
        assert(json.containsKey(r'schema'), 'Required key "FieldMetadata[schema]" is missing from JSON.');
        assert(json[r'schema'] != null, 'Required key "FieldMetadata[schema]" has a null value in JSON.');
        return true;
      }());

      return FieldMetadata(
        allowedValues: json[r'allowedValues'] is Iterable
            ? (json[r'allowedValues'] as Iterable).cast<Object>().toList(growable: false)
            : const [],
        autoCompleteUrl: mapValueOfType<String>(json, r'autoCompleteUrl'),
        configuration: mapCastOfType<String, Object>(json, r'configuration') ?? const {},
        defaultValue: mapValueOfType<Object>(json, r'defaultValue'),
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

  static List<FieldMetadata> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldMetadata>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldMetadata.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldMetadata> mapFromJson(dynamic json) {
    final map = <String, FieldMetadata>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldMetadata.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldMetadata-objects as value to a dart map
  static Map<String, List<FieldMetadata>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldMetadata>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldMetadata.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'key',
    'name',
    'operations',
    'required',
    'schema',
  };
}

