//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrderOfCustomFieldOptions {
  /// Returns a new [OrderOfCustomFieldOptions] instance.
  OrderOfCustomFieldOptions({
    this.after,
    this.customFieldOptionIds = const [],
    this.position,
  });

  /// The ID of the custom field option or cascading option to place the moved options after. Required if `position` isn't provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? after;

  /// A list of IDs of custom field options to move. The order of the custom field option IDs in the list is the order they are given after the move. The list must contain custom field options or cascading options, but not both.
  List<String> customFieldOptionIds;

  /// The position the custom field options should be moved to. Required if `after` isn't provided.
  OrderOfCustomFieldOptionsPositionEnum? position;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderOfCustomFieldOptions &&
    other.after == after &&
    _deepEquality.equals(other.customFieldOptionIds, customFieldOptionIds) &&
    other.position == position;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (after == null ? 0 : after!.hashCode) +
    (customFieldOptionIds.hashCode) +
    (position == null ? 0 : position!.hashCode);

  @override
  String toString() => 'OrderOfCustomFieldOptions[after=$after, customFieldOptionIds=$customFieldOptionIds, position=$position]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.after != null) {
      json[r'after'] = this.after;
    } else {
      json[r'after'] = null;
    }
      json[r'customFieldOptionIds'] = this.customFieldOptionIds;
    if (this.position != null) {
      json[r'position'] = this.position;
    } else {
      json[r'position'] = null;
    }
    return json;
  }

  /// Returns a new [OrderOfCustomFieldOptions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderOfCustomFieldOptions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'customFieldOptionIds'), 'Required key "OrderOfCustomFieldOptions[customFieldOptionIds]" is missing from JSON.');
        assert(json[r'customFieldOptionIds'] != null, 'Required key "OrderOfCustomFieldOptions[customFieldOptionIds]" has a null value in JSON.');
        return true;
      }());

      return OrderOfCustomFieldOptions(
        after: mapValueOfType<String>(json, r'after'),
        customFieldOptionIds: json[r'customFieldOptionIds'] is Iterable
            ? (json[r'customFieldOptionIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        position: OrderOfCustomFieldOptionsPositionEnum.fromJson(json[r'position']),
      );
    }
    return null;
  }

  static List<OrderOfCustomFieldOptions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderOfCustomFieldOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderOfCustomFieldOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderOfCustomFieldOptions> mapFromJson(dynamic json) {
    final map = <String, OrderOfCustomFieldOptions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderOfCustomFieldOptions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderOfCustomFieldOptions-objects as value to a dart map
  static Map<String, List<OrderOfCustomFieldOptions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderOfCustomFieldOptions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrderOfCustomFieldOptions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'customFieldOptionIds',
  };
}

/// The position the custom field options should be moved to. Required if `after` isn't provided.
enum OrderOfCustomFieldOptionsPositionEnum {
  first._(r'First'),
  last._(r'Last'),
  ;

  /// Instantiate a new enum with the provided value.
  const OrderOfCustomFieldOptionsPositionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [OrderOfCustomFieldOptionsPositionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static OrderOfCustomFieldOptionsPositionEnum? fromJson(dynamic value) => OrderOfCustomFieldOptionsPositionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [OrderOfCustomFieldOptionsPositionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<OrderOfCustomFieldOptionsPositionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderOfCustomFieldOptionsPositionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderOfCustomFieldOptionsPositionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrderOfCustomFieldOptionsPositionEnum] to String,
/// and [decode] dynamic data back to [OrderOfCustomFieldOptionsPositionEnum].
class OrderOfCustomFieldOptionsPositionEnumTypeTransformer {
  factory OrderOfCustomFieldOptionsPositionEnumTypeTransformer() => _instance ??= const OrderOfCustomFieldOptionsPositionEnumTypeTransformer._();

  const OrderOfCustomFieldOptionsPositionEnumTypeTransformer._();

  String encode(OrderOfCustomFieldOptionsPositionEnum data) => data._value;

  /// Returns the instance of [OrderOfCustomFieldOptionsPositionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrderOfCustomFieldOptionsPositionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is OrderOfCustomFieldOptionsPositionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'First': return OrderOfCustomFieldOptionsPositionEnum.first;
        case r'Last': return OrderOfCustomFieldOptionsPositionEnum.last;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static OrderOfCustomFieldOptionsPositionEnumTypeTransformer? _instance;
}


