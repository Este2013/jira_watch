//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The account status of the user.
enum AccountStatus {
  active._(r'active'),
  inactive._(r'inactive'),
  closed._(r'closed'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const AccountStatus._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AccountStatus] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AccountStatus? fromJson(dynamic value) => AccountStatusTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AccountStatus]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AccountStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AccountStatus] to String,
/// and [decode] dynamic data back to [AccountStatus].
class AccountStatusTypeTransformer {
  factory AccountStatusTypeTransformer() => _instance ??= const AccountStatusTypeTransformer._();

  const AccountStatusTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(AccountStatus data) => data._value;

  /// Returns the instance of [AccountStatus] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AccountStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data is AccountStatus) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'active': return AccountStatus.active;
        case r'inactive': return AccountStatus.inactive;
        case r'closed': return AccountStatus.closed;
        case r'unknown': return AccountStatus.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AccountStatusTypeTransformer? _instance;
}

