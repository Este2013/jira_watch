//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectEmailAddress {
  /// Returns a new [ProjectEmailAddress] instance.
  ProjectEmailAddress({
    this.emailAddress,
    this.emailAddressStatus = const [],
  });

  /// The email address.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailAddress;

  /// When using a custom domain, the status of the email address.
  List<String> emailAddressStatus;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectEmailAddress &&
    other.emailAddress == emailAddress &&
    _deepEquality.equals(other.emailAddressStatus, emailAddressStatus);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (emailAddress == null ? 0 : emailAddress!.hashCode) +
    (emailAddressStatus.hashCode);

  @override
  String toString() => 'ProjectEmailAddress[emailAddress=$emailAddress, emailAddressStatus=$emailAddressStatus]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.emailAddress != null) {
      json[r'emailAddress'] = this.emailAddress;
    } else {
      json[r'emailAddress'] = null;
    }
      json[r'emailAddressStatus'] = this.emailAddressStatus;
    return json;
  }

  /// Returns a new [ProjectEmailAddress] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectEmailAddress? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectEmailAddress(
        emailAddress: mapValueOfType<String>(json, r'emailAddress'),
        emailAddressStatus: json[r'emailAddressStatus'] is Iterable
            ? (json[r'emailAddressStatus'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ProjectEmailAddress> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectEmailAddress>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectEmailAddress.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectEmailAddress> mapFromJson(dynamic json) {
    final map = <String, ProjectEmailAddress>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectEmailAddress.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectEmailAddress-objects as value to a dart map
  static Map<String, List<ProjectEmailAddress>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectEmailAddress>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectEmailAddress.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

