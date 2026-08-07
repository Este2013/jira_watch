//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryOrderByClauseElement {
  /// Returns a new [JqlQueryOrderByClauseElement] instance.
  JqlQueryOrderByClauseElement({
    this.direction,
    required this.field,
  });

  /// The direction in which to order the results.
  JqlQueryOrderByClauseElementDirectionEnum? direction;

  JqlQueryField field;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryOrderByClauseElement &&
    other.direction == direction &&
    other.field == field;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (direction == null ? 0 : direction!.hashCode) +
    (field.hashCode);

  @override
  String toString() => 'JqlQueryOrderByClauseElement[direction=$direction, field=$field]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.direction != null) {
      json[r'direction'] = this.direction;
    } else {
      json[r'direction'] = null;
    }
      json[r'field'] = this.field;
    return json;
  }

  /// Returns a new [JqlQueryOrderByClauseElement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryOrderByClauseElement? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'field'), 'Required key "JqlQueryOrderByClauseElement[field]" is missing from JSON.');
        assert(json[r'field'] != null, 'Required key "JqlQueryOrderByClauseElement[field]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryOrderByClauseElement(
        direction: JqlQueryOrderByClauseElementDirectionEnum.fromJson(json[r'direction']),
        field: JqlQueryField.fromJson(json[r'field'])!,
      );
    }
    return null;
  }

  static List<JqlQueryOrderByClauseElement> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryOrderByClauseElement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryOrderByClauseElement.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryOrderByClauseElement> mapFromJson(dynamic json) {
    final map = <String, JqlQueryOrderByClauseElement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryOrderByClauseElement.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryOrderByClauseElement-objects as value to a dart map
  static Map<String, List<JqlQueryOrderByClauseElement>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryOrderByClauseElement>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryOrderByClauseElement.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'field',
  };
}

/// The direction in which to order the results.
enum JqlQueryOrderByClauseElementDirectionEnum {
  asc._(r'asc'),
  desc._(r'desc'),
  ;

  /// Instantiate a new enum with the provided value.
  const JqlQueryOrderByClauseElementDirectionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JqlQueryOrderByClauseElementDirectionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JqlQueryOrderByClauseElementDirectionEnum? fromJson(dynamic value) => JqlQueryOrderByClauseElementDirectionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JqlQueryOrderByClauseElementDirectionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JqlQueryOrderByClauseElementDirectionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryOrderByClauseElementDirectionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryOrderByClauseElementDirectionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JqlQueryOrderByClauseElementDirectionEnum] to String,
/// and [decode] dynamic data back to [JqlQueryOrderByClauseElementDirectionEnum].
class JqlQueryOrderByClauseElementDirectionEnumTypeTransformer {
  factory JqlQueryOrderByClauseElementDirectionEnumTypeTransformer() => _instance ??= const JqlQueryOrderByClauseElementDirectionEnumTypeTransformer._();

  const JqlQueryOrderByClauseElementDirectionEnumTypeTransformer._();

  String encode(JqlQueryOrderByClauseElementDirectionEnum data) => data._value;

  /// Returns the instance of [JqlQueryOrderByClauseElementDirectionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JqlQueryOrderByClauseElementDirectionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JqlQueryOrderByClauseElementDirectionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'asc': return JqlQueryOrderByClauseElementDirectionEnum.asc;
        case r'desc': return JqlQueryOrderByClauseElementDirectionEnum.desc;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JqlQueryOrderByClauseElementDirectionEnumTypeTransformer? _instance;
}


