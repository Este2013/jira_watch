//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeSchemeDetails {
  /// Returns a new [IssueTypeSchemeDetails] instance.
  IssueTypeSchemeDetails({
    this.defaultIssueTypeId,
    this.description,
    this.issueTypeIds = const [],
    required this.name,
  });

  /// The ID of the default issue type of the issue type scheme. This ID must be included in `issueTypeIds`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultIssueTypeId;

  /// The description of the issue type scheme. The maximum length is 4000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The list of issue types IDs of the issue type scheme. At least one standard issue type ID is required.
  List<String> issueTypeIds;

  /// The name of the issue type scheme. The name must be unique. The maximum length is 255 characters.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeSchemeDetails &&
    other.defaultIssueTypeId == defaultIssueTypeId &&
    other.description == description &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds) &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultIssueTypeId == null ? 0 : defaultIssueTypeId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (issueTypeIds.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'IssueTypeSchemeDetails[defaultIssueTypeId=$defaultIssueTypeId, description=$description, issueTypeIds=$issueTypeIds, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultIssueTypeId != null) {
      json[r'defaultIssueTypeId'] = this.defaultIssueTypeId;
    } else {
      json[r'defaultIssueTypeId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'issueTypeIds'] = this.issueTypeIds;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [IssueTypeSchemeDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeSchemeDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeIds'), 'Required key "IssueTypeSchemeDetails[issueTypeIds]" is missing from JSON.');
        assert(json[r'issueTypeIds'] != null, 'Required key "IssueTypeSchemeDetails[issueTypeIds]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "IssueTypeSchemeDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "IssueTypeSchemeDetails[name]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeSchemeDetails(
        defaultIssueTypeId: mapValueOfType<String>(json, r'defaultIssueTypeId'),
        description: mapValueOfType<String>(json, r'description'),
        issueTypeIds: json[r'issueTypeIds'] is Iterable
            ? (json[r'issueTypeIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<IssueTypeSchemeDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeSchemeDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeSchemeDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeSchemeDetails> mapFromJson(dynamic json) {
    final map = <String, IssueTypeSchemeDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeSchemeDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeSchemeDetails-objects as value to a dart map
  static Map<String, List<IssueTypeSchemeDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeSchemeDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeSchemeDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeIds',
    'name',
  };
}

