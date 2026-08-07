//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectCustomFieldValue {
  /// Returns a new [ConnectCustomFieldValue] instance.
  ConnectCustomFieldValue({
    required this.type,
    required this.fieldID,
    required this.issueID,
    this.number,
    this.optionID,
    this.richText,
    this.string,
    this.text,
  });

  /// The type of custom field.
  ConnectCustomFieldValueTypeEnum type;

  /// The custom field ID.
  int fieldID;

  /// The issue ID.
  int issueID;

  /// The value of number type custom field when `_type` is `NumberIssueField`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? number;

  /// The value of single select and multiselect custom field type when `_type` is `SingleSelectIssueField` or `MultiSelectIssueField`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? optionID;

  /// The value of richText type custom field when `_type` is `RichTextIssueField`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? richText;

  /// The value of string type custom field when `_type` is `StringIssueField`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? string;

  /// The value of of text custom field type when `_type` is `TextIssueField`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? text;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConnectCustomFieldValue &&
    other.type == type &&
    other.fieldID == fieldID &&
    other.issueID == issueID &&
    other.number == number &&
    other.optionID == optionID &&
    other.richText == richText &&
    other.string == string &&
    other.text == text;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (fieldID.hashCode) +
    (issueID.hashCode) +
    (number == null ? 0 : number!.hashCode) +
    (optionID == null ? 0 : optionID!.hashCode) +
    (richText == null ? 0 : richText!.hashCode) +
    (string == null ? 0 : string!.hashCode) +
    (text == null ? 0 : text!.hashCode);

  @override
  String toString() => 'ConnectCustomFieldValue[type=$type, fieldID=$fieldID, issueID=$issueID, number=$number, optionID=$optionID, richText=$richText, string=$string, text=$text]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'_type'] = this.type;
      json[r'fieldID'] = this.fieldID;
      json[r'issueID'] = this.issueID;
    if (this.number != null) {
      json[r'number'] = this.number;
    } else {
      json[r'number'] = null;
    }
    if (this.optionID != null) {
      json[r'optionID'] = this.optionID;
    } else {
      json[r'optionID'] = null;
    }
    if (this.richText != null) {
      json[r'richText'] = this.richText;
    } else {
      json[r'richText'] = null;
    }
    if (this.string != null) {
      json[r'string'] = this.string;
    } else {
      json[r'string'] = null;
    }
    if (this.text != null) {
      json[r'text'] = this.text;
    } else {
      json[r'text'] = null;
    }
    return json;
  }

  /// Returns a new [ConnectCustomFieldValue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectCustomFieldValue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'_type'), 'Required key "ConnectCustomFieldValue[_type]" is missing from JSON.');
        assert(json[r'_type'] != null, 'Required key "ConnectCustomFieldValue[_type]" has a null value in JSON.');
        assert(json.containsKey(r'fieldID'), 'Required key "ConnectCustomFieldValue[fieldID]" is missing from JSON.');
        assert(json[r'fieldID'] != null, 'Required key "ConnectCustomFieldValue[fieldID]" has a null value in JSON.');
        assert(json.containsKey(r'issueID'), 'Required key "ConnectCustomFieldValue[issueID]" is missing from JSON.');
        assert(json[r'issueID'] != null, 'Required key "ConnectCustomFieldValue[issueID]" has a null value in JSON.');
        return true;
      }());

      return ConnectCustomFieldValue(
        type: ConnectCustomFieldValueTypeEnum.fromJson(json[r'_type'])!,
        fieldID: mapValueOfType<int>(json, r'fieldID')!,
        issueID: mapValueOfType<int>(json, r'issueID')!,
        number: num.parse('${json[r'number']}'),
        optionID: mapValueOfType<String>(json, r'optionID'),
        richText: mapValueOfType<String>(json, r'richText'),
        string: mapValueOfType<String>(json, r'string'),
        text: mapValueOfType<String>(json, r'text'),
      );
    }
    return null;
  }

  static List<ConnectCustomFieldValue> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConnectCustomFieldValue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectCustomFieldValue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectCustomFieldValue> mapFromJson(dynamic json) {
    final map = <String, ConnectCustomFieldValue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectCustomFieldValue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectCustomFieldValue-objects as value to a dart map
  static Map<String, List<ConnectCustomFieldValue>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConnectCustomFieldValue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectCustomFieldValue.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    '_type',
    'fieldID',
    'issueID',
  };
}

/// The type of custom field.
enum ConnectCustomFieldValueTypeEnum {
  stringIssueField._(r'StringIssueField'),
  numberIssueField._(r'NumberIssueField'),
  richTextIssueField._(r'RichTextIssueField'),
  singleSelectIssueField._(r'SingleSelectIssueField'),
  multiSelectIssueField._(r'MultiSelectIssueField'),
  textIssueField._(r'TextIssueField'),
  ;

  /// Instantiate a new enum with the provided value.
  const ConnectCustomFieldValueTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ConnectCustomFieldValueTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ConnectCustomFieldValueTypeEnum? fromJson(dynamic value) => ConnectCustomFieldValueTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ConnectCustomFieldValueTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ConnectCustomFieldValueTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConnectCustomFieldValueTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectCustomFieldValueTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ConnectCustomFieldValueTypeEnum] to String,
/// and [decode] dynamic data back to [ConnectCustomFieldValueTypeEnum].
class ConnectCustomFieldValueTypeEnumTypeTransformer {
  factory ConnectCustomFieldValueTypeEnumTypeTransformer() => _instance ??= const ConnectCustomFieldValueTypeEnumTypeTransformer._();

  const ConnectCustomFieldValueTypeEnumTypeTransformer._();

  String encode(ConnectCustomFieldValueTypeEnum data) => data._value;

  /// Returns the instance of [ConnectCustomFieldValueTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ConnectCustomFieldValueTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ConnectCustomFieldValueTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'StringIssueField': return ConnectCustomFieldValueTypeEnum.stringIssueField;
        case r'NumberIssueField': return ConnectCustomFieldValueTypeEnum.numberIssueField;
        case r'RichTextIssueField': return ConnectCustomFieldValueTypeEnum.richTextIssueField;
        case r'SingleSelectIssueField': return ConnectCustomFieldValueTypeEnum.singleSelectIssueField;
        case r'MultiSelectIssueField': return ConnectCustomFieldValueTypeEnum.multiSelectIssueField;
        case r'TextIssueField': return ConnectCustomFieldValueTypeEnum.textIssueField;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ConnectCustomFieldValueTypeEnumTypeTransformer? _instance;
}


