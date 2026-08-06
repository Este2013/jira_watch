//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultWorkflowEditorResponse {
  /// Returns a new [DefaultWorkflowEditorResponse] instance.
  DefaultWorkflowEditorResponse({
    this.value,
  });

  DefaultWorkflowEditorResponseValueEnum? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DefaultWorkflowEditorResponse &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'DefaultWorkflowEditorResponse[value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [DefaultWorkflowEditorResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DefaultWorkflowEditorResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return DefaultWorkflowEditorResponse(
        value: DefaultWorkflowEditorResponseValueEnum.fromJson(json[r'value']),
      );
    }
    return null;
  }

  static List<DefaultWorkflowEditorResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DefaultWorkflowEditorResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DefaultWorkflowEditorResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DefaultWorkflowEditorResponse> mapFromJson(dynamic json) {
    final map = <String, DefaultWorkflowEditorResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DefaultWorkflowEditorResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DefaultWorkflowEditorResponse-objects as value to a dart map
  static Map<String, List<DefaultWorkflowEditorResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DefaultWorkflowEditorResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DefaultWorkflowEditorResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum DefaultWorkflowEditorResponseValueEnum {
  NEW._(r'NEW'),
  LEGACY._(r'LEGACY'),
  ;

  /// Instantiate a new enum with the provided value.
  const DefaultWorkflowEditorResponseValueEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [DefaultWorkflowEditorResponseValueEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static DefaultWorkflowEditorResponseValueEnum? fromJson(dynamic value) => DefaultWorkflowEditorResponseValueEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [DefaultWorkflowEditorResponseValueEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<DefaultWorkflowEditorResponseValueEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DefaultWorkflowEditorResponseValueEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DefaultWorkflowEditorResponseValueEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DefaultWorkflowEditorResponseValueEnum] to String,
/// and [decode] dynamic data back to [DefaultWorkflowEditorResponseValueEnum].
class DefaultWorkflowEditorResponseValueEnumTypeTransformer {
  factory DefaultWorkflowEditorResponseValueEnumTypeTransformer() => _instance ??= const DefaultWorkflowEditorResponseValueEnumTypeTransformer._();

  const DefaultWorkflowEditorResponseValueEnumTypeTransformer._();

  String encode(DefaultWorkflowEditorResponseValueEnum data) => data._value;

  /// Returns the instance of [DefaultWorkflowEditorResponseValueEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DefaultWorkflowEditorResponseValueEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is DefaultWorkflowEditorResponseValueEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'NEW': return DefaultWorkflowEditorResponseValueEnum.NEW;
        case r'LEGACY': return DefaultWorkflowEditorResponseValueEnum.LEGACY;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static DefaultWorkflowEditorResponseValueEnumTypeTransformer? _instance;
}


