//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkChangeOwnerDetails {
  /// Returns a new [BulkChangeOwnerDetails] instance.
  BulkChangeOwnerDetails({
    required this.autofixName,
    required this.newOwner,
  });

  /// Whether the name is fixed automatically if it's duplicated after changing owner.
  bool autofixName;

  /// The account id of the new owner.
  String newOwner;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkChangeOwnerDetails &&
    other.autofixName == autofixName &&
    other.newOwner == newOwner;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (autofixName.hashCode) +
    (newOwner.hashCode);

  @override
  String toString() => 'BulkChangeOwnerDetails[autofixName=$autofixName, newOwner=$newOwner]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'autofixName'] = this.autofixName;
      json[r'newOwner'] = this.newOwner;
    return json;
  }

  /// Returns a new [BulkChangeOwnerDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkChangeOwnerDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'autofixName'), 'Required key "BulkChangeOwnerDetails[autofixName]" is missing from JSON.');
        assert(json[r'autofixName'] != null, 'Required key "BulkChangeOwnerDetails[autofixName]" has a null value in JSON.');
        assert(json.containsKey(r'newOwner'), 'Required key "BulkChangeOwnerDetails[newOwner]" is missing from JSON.');
        assert(json[r'newOwner'] != null, 'Required key "BulkChangeOwnerDetails[newOwner]" has a null value in JSON.');
        return true;
      }());

      return BulkChangeOwnerDetails(
        autofixName: mapValueOfType<bool>(json, r'autofixName')!,
        newOwner: mapValueOfType<String>(json, r'newOwner')!,
      );
    }
    return null;
  }

  static List<BulkChangeOwnerDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkChangeOwnerDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkChangeOwnerDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkChangeOwnerDetails> mapFromJson(dynamic json) {
    final map = <String, BulkChangeOwnerDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkChangeOwnerDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkChangeOwnerDetails-objects as value to a dart map
  static Map<String, List<BulkChangeOwnerDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkChangeOwnerDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkChangeOwnerDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'autofixName',
    'newOwner',
  };
}

