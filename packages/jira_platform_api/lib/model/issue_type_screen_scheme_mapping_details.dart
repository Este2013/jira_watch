//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeScreenSchemeMappingDetails {
  /// Returns a new [IssueTypeScreenSchemeMappingDetails] instance.
  IssueTypeScreenSchemeMappingDetails({
    this.issueTypeMappings = const [],
  });

  /// The list of issue type to screen scheme mappings. A *default* entry cannot be specified because a default entry is added when an issue type screen scheme is created.
  List<IssueTypeScreenSchemeMapping> issueTypeMappings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeScreenSchemeMappingDetails &&
    _deepEquality.equals(other.issueTypeMappings, issueTypeMappings);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeMappings.hashCode);

  @override
  String toString() => 'IssueTypeScreenSchemeMappingDetails[issueTypeMappings=$issueTypeMappings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeMappings'] = this.issueTypeMappings;
    return json;
  }

  /// Returns a new [IssueTypeScreenSchemeMappingDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeScreenSchemeMappingDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeMappings'), 'Required key "IssueTypeScreenSchemeMappingDetails[issueTypeMappings]" is missing from JSON.');
        assert(json[r'issueTypeMappings'] != null, 'Required key "IssueTypeScreenSchemeMappingDetails[issueTypeMappings]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeScreenSchemeMappingDetails(
        issueTypeMappings: IssueTypeScreenSchemeMapping.listFromJson(json[r'issueTypeMappings']),
      );
    }
    return null;
  }

  static List<IssueTypeScreenSchemeMappingDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeScreenSchemeMappingDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeScreenSchemeMappingDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeScreenSchemeMappingDetails> mapFromJson(dynamic json) {
    final map = <String, IssueTypeScreenSchemeMappingDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeScreenSchemeMappingDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeScreenSchemeMappingDetails-objects as value to a dart map
  static Map<String, List<IssueTypeScreenSchemeMappingDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeScreenSchemeMappingDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeScreenSchemeMappingDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeMappings',
  };
}

