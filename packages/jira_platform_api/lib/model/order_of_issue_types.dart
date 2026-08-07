//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrderOfIssueTypes {
  /// Returns a new [OrderOfIssueTypes] instance.
  OrderOfIssueTypes({
    this.after,
    this.issueTypeIds = const [],
    this.position,
  });

  /// The ID of the issue type to place the moved issue types after. Required if `position` isn't provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? after;

  /// A list of the issue type IDs to move. The order of the issue type IDs in the list is the order they are given after the move.
  List<String> issueTypeIds;

  /// The position the issue types should be moved to. Required if `after` isn't provided.
  OrderOfIssueTypesPositionEnum? position;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderOfIssueTypes &&
    other.after == after &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds) &&
    other.position == position;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (after == null ? 0 : after!.hashCode) +
    (issueTypeIds.hashCode) +
    (position == null ? 0 : position!.hashCode);

  @override
  String toString() => 'OrderOfIssueTypes[after=$after, issueTypeIds=$issueTypeIds, position=$position]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.after != null) {
      json[r'after'] = this.after;
    } else {
      json[r'after'] = null;
    }
      json[r'issueTypeIds'] = this.issueTypeIds;
    if (this.position != null) {
      json[r'position'] = this.position;
    } else {
      json[r'position'] = null;
    }
    return json;
  }

  /// Returns a new [OrderOfIssueTypes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderOfIssueTypes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeIds'), 'Required key "OrderOfIssueTypes[issueTypeIds]" is missing from JSON.');
        assert(json[r'issueTypeIds'] != null, 'Required key "OrderOfIssueTypes[issueTypeIds]" has a null value in JSON.');
        return true;
      }());

      return OrderOfIssueTypes(
        after: mapValueOfType<String>(json, r'after'),
        issueTypeIds: json[r'issueTypeIds'] is Iterable
            ? (json[r'issueTypeIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        position: OrderOfIssueTypesPositionEnum.fromJson(json[r'position']),
      );
    }
    return null;
  }

  static List<OrderOfIssueTypes> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderOfIssueTypes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderOfIssueTypes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderOfIssueTypes> mapFromJson(dynamic json) {
    final map = <String, OrderOfIssueTypes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderOfIssueTypes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderOfIssueTypes-objects as value to a dart map
  static Map<String, List<OrderOfIssueTypes>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderOfIssueTypes>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrderOfIssueTypes.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeIds',
  };
}

/// The position the issue types should be moved to. Required if `after` isn't provided.
enum OrderOfIssueTypesPositionEnum {
  first._(r'First'),
  last._(r'Last'),
  ;

  /// Instantiate a new enum with the provided value.
  const OrderOfIssueTypesPositionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [OrderOfIssueTypesPositionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static OrderOfIssueTypesPositionEnum? fromJson(dynamic value) => OrderOfIssueTypesPositionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [OrderOfIssueTypesPositionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<OrderOfIssueTypesPositionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderOfIssueTypesPositionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderOfIssueTypesPositionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrderOfIssueTypesPositionEnum] to String,
/// and [decode] dynamic data back to [OrderOfIssueTypesPositionEnum].
class OrderOfIssueTypesPositionEnumTypeTransformer {
  factory OrderOfIssueTypesPositionEnumTypeTransformer() => _instance ??= const OrderOfIssueTypesPositionEnumTypeTransformer._();

  const OrderOfIssueTypesPositionEnumTypeTransformer._();

  String encode(OrderOfIssueTypesPositionEnum data) => data._value;

  /// Returns the instance of [OrderOfIssueTypesPositionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrderOfIssueTypesPositionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is OrderOfIssueTypesPositionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'First': return OrderOfIssueTypesPositionEnum.first;
        case r'Last': return OrderOfIssueTypesPositionEnum.last;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static OrderOfIssueTypesPositionEnumTypeTransformer? _instance;
}


