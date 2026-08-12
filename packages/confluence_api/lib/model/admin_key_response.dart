//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AdminKeyResponse {
  /// Returns a new [AdminKeyResponse] instance.
  AdminKeyResponse({
    this.accountId,
    this.expirationTime,
  });

  /// User identifier.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountId;

  /// Timestamp in UTC that represents when the admin key will expire. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? expirationTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AdminKeyResponse &&
    other.accountId == accountId &&
    other.expirationTime == expirationTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId == null ? 0 : accountId!.hashCode) +
    (expirationTime == null ? 0 : expirationTime!.hashCode);

  @override
  String toString() => 'AdminKeyResponse[accountId=$accountId, expirationTime=$expirationTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accountId != null) {
      json[r'accountId'] = this.accountId;
    } else {
      json[r'accountId'] = null;
    }
    if (this.expirationTime != null) {
      json[r'expirationTime'] = this.expirationTime!.toUtc().toIso8601String();
    } else {
      json[r'expirationTime'] = null;
    }
    return json;
  }

  /// Returns a new [AdminKeyResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AdminKeyResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AdminKeyResponse(
        accountId: mapValueOfType<String>(json, r'accountId'),
        expirationTime: mapDateTime(json, r'expirationTime', r''),
      );
    }
    return null;
  }

  static List<AdminKeyResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AdminKeyResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AdminKeyResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AdminKeyResponse> mapFromJson(dynamic json) {
    final map = <String, AdminKeyResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AdminKeyResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AdminKeyResponse-objects as value to a dart map
  static Map<String, List<AdminKeyResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AdminKeyResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AdminKeyResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

