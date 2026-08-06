//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DashboardDetails {
  /// Returns a new [DashboardDetails] instance.
  DashboardDetails({
    this.description,
    this.editPermissions = const [],
    required this.name,
    this.sharePermissions = const [],
  });

  /// The description of the dashboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The edit permissions for the dashboard.
  List<SharePermission> editPermissions;

  /// The name of the dashboard.
  String name;

  /// The share permissions for the dashboard.
  List<SharePermission> sharePermissions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DashboardDetails &&
    other.description == description &&
    _deepEquality.equals(other.editPermissions, editPermissions) &&
    other.name == name &&
    _deepEquality.equals(other.sharePermissions, sharePermissions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (editPermissions.hashCode) +
    (name.hashCode) +
    (sharePermissions.hashCode);

  @override
  String toString() => 'DashboardDetails[description=$description, editPermissions=$editPermissions, name=$name, sharePermissions=$sharePermissions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'editPermissions'] = this.editPermissions;
      json[r'name'] = this.name;
      json[r'sharePermissions'] = this.sharePermissions;
    return json;
  }

  /// Returns a new [DashboardDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DashboardDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'editPermissions'), 'Required key "DashboardDetails[editPermissions]" is missing from JSON.');
        assert(json[r'editPermissions'] != null, 'Required key "DashboardDetails[editPermissions]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "DashboardDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "DashboardDetails[name]" has a null value in JSON.');
        assert(json.containsKey(r'sharePermissions'), 'Required key "DashboardDetails[sharePermissions]" is missing from JSON.');
        assert(json[r'sharePermissions'] != null, 'Required key "DashboardDetails[sharePermissions]" has a null value in JSON.');
        return true;
      }());

      return DashboardDetails(
        description: mapValueOfType<String>(json, r'description'),
        editPermissions: SharePermission.listFromJson(json[r'editPermissions']),
        name: mapValueOfType<String>(json, r'name')!,
        sharePermissions: SharePermission.listFromJson(json[r'sharePermissions']),
      );
    }
    return null;
  }

  static List<DashboardDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DashboardDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DashboardDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DashboardDetails> mapFromJson(dynamic json) {
    final map = <String, DashboardDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DashboardDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DashboardDetails-objects as value to a dart map
  static Map<String, List<DashboardDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DashboardDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DashboardDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'editPermissions',
    'name',
    'sharePermissions',
  };
}

