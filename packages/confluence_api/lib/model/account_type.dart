//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The account type of the user.
enum AccountType {
  atlassian._(r'atlassian'),
  app._(r'app'),
  customer._(r'customer'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const AccountType._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AccountType] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AccountType? fromJson(dynamic value) => AccountTypeTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AccountType]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AccountType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AccountType] to String,
/// and [decode] dynamic data back to [AccountType].
class AccountTypeTypeTransformer {
  factory AccountTypeTypeTransformer() => _instance ??= const AccountTypeTypeTransformer._();

  const AccountTypeTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(AccountType data) => data._value;

  /// Returns the instance of [AccountType] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AccountType? decode(dynamic data, {bool allowNull = true}) {
    if (data is AccountType) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'atlassian': return AccountType.atlassian;
        case r'app': return AccountType.app;
        case r'customer': return AccountType.customer;
        case r'unknown': return AccountType.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AccountTypeTypeTransformer? _instance;
}

