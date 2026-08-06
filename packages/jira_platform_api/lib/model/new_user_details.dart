//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewUserDetails {
  /// Returns a new [NewUserDetails] instance.
  NewUserDetails({
    this.applicationKeys = const [],
    this.displayName,
    required this.emailAddress,
    this.key,
    this.name,
    this.password,
    this.products = const [],
    this.self,
  });

  /// Deprecated, do not use.
  List<String> applicationKeys;

  /// This property is no longer available. If the user has an Atlassian account, their display name is not changed. If the user does not have an Atlassian account, they are sent an email asking them set up an account.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// The email address for the user.
  String emailAddress;

  /// This property is no longer available. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// This property is no longer available. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// This property is no longer available. If the user has an Atlassian account, their password is not changed. If the user does not have an Atlassian account, they are sent an email asking them set up an account.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? password;

  /// Products the new user has access to. Valid products are: jira-core, jira-servicedesk, jira-product-discovery, jira-software. To create a user without product access, set this field to be an empty array.
  List<String> products;

  /// The URL of the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NewUserDetails &&
    _deepEquality.equals(other.applicationKeys, applicationKeys) &&
    other.displayName == displayName &&
    other.emailAddress == emailAddress &&
    other.key == key &&
    other.name == name &&
    other.password == password &&
    _deepEquality.equals(other.products, products) &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (applicationKeys.hashCode) +
    (displayName == null ? 0 : displayName!.hashCode) +
    (emailAddress.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (password == null ? 0 : password!.hashCode) +
    (products.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'NewUserDetails[applicationKeys=$applicationKeys, displayName=$displayName, emailAddress=$emailAddress, key=$key, name=$name, password=$password, products=$products, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'applicationKeys'] = this.applicationKeys;
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
    }
      json[r'emailAddress'] = this.emailAddress;
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
      json[r'products'] = this.products;
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [NewUserDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewUserDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'emailAddress'), 'Required key "NewUserDetails[emailAddress]" is missing from JSON.');
        assert(json[r'emailAddress'] != null, 'Required key "NewUserDetails[emailAddress]" has a null value in JSON.');
        assert(json.containsKey(r'products'), 'Required key "NewUserDetails[products]" is missing from JSON.');
        assert(json[r'products'] != null, 'Required key "NewUserDetails[products]" has a null value in JSON.');
        return true;
      }());

      return NewUserDetails(
        applicationKeys: json[r'applicationKeys'] is Iterable
            ? (json[r'applicationKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        displayName: mapValueOfType<String>(json, r'displayName'),
        emailAddress: mapValueOfType<String>(json, r'emailAddress')!,
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
        password: mapValueOfType<String>(json, r'password'),
        products: json[r'products'] is Iterable
            ? (json[r'products'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<NewUserDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NewUserDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewUserDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewUserDetails> mapFromJson(dynamic json) {
    final map = <String, NewUserDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewUserDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewUserDetails-objects as value to a dart map
  static Map<String, List<NewUserDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NewUserDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NewUserDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'emailAddress',
    'products',
  };
}

