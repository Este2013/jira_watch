//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeSchemePayload {
  /// Returns a new [IssueTypeSchemePayload] instance.
  IssueTypeSchemePayload({
    this.defaultIssueTypeId,
    this.description,
    this.issueTypeIds = const [],
    this.name,
    this.pcri,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? defaultIssueTypeId;

  /// The description of the issue type scheme
  String? description;

  /// The issue type IDs for the issue type scheme
  List<ProjectCreateResourceIdentifier> issueTypeIds;

  /// The name of the issue type scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeSchemePayload &&
    other.defaultIssueTypeId == defaultIssueTypeId &&
    other.description == description &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds) &&
    other.name == name &&
    other.pcri == pcri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultIssueTypeId == null ? 0 : defaultIssueTypeId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (issueTypeIds.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode);

  @override
  String toString() => 'IssueTypeSchemePayload[defaultIssueTypeId=$defaultIssueTypeId, description=$description, issueTypeIds=$issueTypeIds, name=$name, pcri=$pcri]';

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
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTypeSchemePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeSchemePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypeSchemePayload(
        defaultIssueTypeId: ProjectCreateResourceIdentifier.fromJson(json[r'defaultIssueTypeId']),
        description: mapValueOfType<String>(json, r'description'),
        issueTypeIds: ProjectCreateResourceIdentifier.listFromJson(json[r'issueTypeIds']),
        name: mapValueOfType<String>(json, r'name'),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
      );
    }
    return null;
  }

  static List<IssueTypeSchemePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeSchemePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeSchemePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeSchemePayload> mapFromJson(dynamic json) {
    final map = <String, IssueTypeSchemePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeSchemePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeSchemePayload-objects as value to a dart map
  static Map<String, List<IssueTypeSchemePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeSchemePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeSchemePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

