//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateIssueSourceRequest {
  /// Returns a new [CreateIssueSourceRequest] instance.
  CreateIssueSourceRequest({
    required this.type,
    required this.value,
  });

  /// The issue source type. This must be \"Board\", \"Project\" or \"Filter\".
  CreateIssueSourceRequestTypeEnum type;

  /// The issue source value. This must be a board ID if the type is \"Board\", a project ID if the type is \"Project\" or a filter ID if the type is \"Filter\".
  int value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateIssueSourceRequest &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'CreateIssueSourceRequest[type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'type'] = this.type;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [CreateIssueSourceRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateIssueSourceRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "CreateIssueSourceRequest[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CreateIssueSourceRequest[type]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "CreateIssueSourceRequest[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "CreateIssueSourceRequest[value]" has a null value in JSON.');
        return true;
      }());

      return CreateIssueSourceRequest(
        type: CreateIssueSourceRequestTypeEnum.fromJson(json[r'type'])!,
        value: mapValueOfType<int>(json, r'value')!,
      );
    }
    return null;
  }

  static List<CreateIssueSourceRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateIssueSourceRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateIssueSourceRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateIssueSourceRequest> mapFromJson(dynamic json) {
    final map = <String, CreateIssueSourceRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateIssueSourceRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateIssueSourceRequest-objects as value to a dart map
  static Map<String, List<CreateIssueSourceRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateIssueSourceRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateIssueSourceRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'value',
  };
}

/// The issue source type. This must be \"Board\", \"Project\" or \"Filter\".
enum CreateIssueSourceRequestTypeEnum {
  board._(r'Board'),
  project._(r'Project'),
  filter._(r'Filter'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateIssueSourceRequestTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateIssueSourceRequestTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateIssueSourceRequestTypeEnum? fromJson(dynamic value) => CreateIssueSourceRequestTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateIssueSourceRequestTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateIssueSourceRequestTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateIssueSourceRequestTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateIssueSourceRequestTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateIssueSourceRequestTypeEnum] to String,
/// and [decode] dynamic data back to [CreateIssueSourceRequestTypeEnum].
class CreateIssueSourceRequestTypeEnumTypeTransformer {
  factory CreateIssueSourceRequestTypeEnumTypeTransformer() => _instance ??= const CreateIssueSourceRequestTypeEnumTypeTransformer._();

  const CreateIssueSourceRequestTypeEnumTypeTransformer._();

  String encode(CreateIssueSourceRequestTypeEnum data) => data._value;

  /// Returns the instance of [CreateIssueSourceRequestTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateIssueSourceRequestTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateIssueSourceRequestTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Board': return CreateIssueSourceRequestTypeEnum.board;
        case r'Project': return CreateIssueSourceRequestTypeEnum.project;
        case r'Filter': return CreateIssueSourceRequestTypeEnum.filter;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateIssueSourceRequestTypeEnumTypeTransformer? _instance;
}


