//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateDateFieldRequest {
  /// Returns a new [CreateDateFieldRequest] instance.
  CreateDateFieldRequest({
    this.dateCustomFieldId,
    required this.type,
  });

  /// A date custom field ID. This is required if the type is \"DateCustomField\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? dateCustomFieldId;

  /// The date field type. This must be \"DueDate\", \"TargetStartDate\", \"TargetEndDate\" or \"DateCustomField\".
  CreateDateFieldRequestTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateDateFieldRequest &&
    other.dateCustomFieldId == dateCustomFieldId &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dateCustomFieldId == null ? 0 : dateCustomFieldId!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CreateDateFieldRequest[dateCustomFieldId=$dateCustomFieldId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.dateCustomFieldId != null) {
      json[r'dateCustomFieldId'] = this.dateCustomFieldId;
    } else {
      json[r'dateCustomFieldId'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CreateDateFieldRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateDateFieldRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "CreateDateFieldRequest[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CreateDateFieldRequest[type]" has a null value in JSON.');
        return true;
      }());

      return CreateDateFieldRequest(
        dateCustomFieldId: mapValueOfType<int>(json, r'dateCustomFieldId'),
        type: CreateDateFieldRequestTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<CreateDateFieldRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateDateFieldRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateDateFieldRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateDateFieldRequest> mapFromJson(dynamic json) {
    final map = <String, CreateDateFieldRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateDateFieldRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateDateFieldRequest-objects as value to a dart map
  static Map<String, List<CreateDateFieldRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateDateFieldRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateDateFieldRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

/// The date field type. This must be \"DueDate\", \"TargetStartDate\", \"TargetEndDate\" or \"DateCustomField\".
enum CreateDateFieldRequestTypeEnum {
  dueDate._(r'DueDate'),
  targetStartDate._(r'TargetStartDate'),
  targetEndDate._(r'TargetEndDate'),
  dateCustomField._(r'DateCustomField'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateDateFieldRequestTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateDateFieldRequestTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateDateFieldRequestTypeEnum? fromJson(dynamic value) => CreateDateFieldRequestTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateDateFieldRequestTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateDateFieldRequestTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateDateFieldRequestTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateDateFieldRequestTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateDateFieldRequestTypeEnum] to String,
/// and [decode] dynamic data back to [CreateDateFieldRequestTypeEnum].
class CreateDateFieldRequestTypeEnumTypeTransformer {
  factory CreateDateFieldRequestTypeEnumTypeTransformer() => _instance ??= const CreateDateFieldRequestTypeEnumTypeTransformer._();

  const CreateDateFieldRequestTypeEnumTypeTransformer._();

  String encode(CreateDateFieldRequestTypeEnum data) => data._value;

  /// Returns the instance of [CreateDateFieldRequestTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateDateFieldRequestTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateDateFieldRequestTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'DueDate': return CreateDateFieldRequestTypeEnum.dueDate;
        case r'TargetStartDate': return CreateDateFieldRequestTypeEnum.targetStartDate;
        case r'TargetEndDate': return CreateDateFieldRequestTypeEnum.targetEndDate;
        case r'DateCustomField': return CreateDateFieldRequestTypeEnum.dateCustomField;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateDateFieldRequestTypeEnumTypeTransformer? _instance;
}


