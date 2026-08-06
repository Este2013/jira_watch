//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TargetClassification {
  /// Returns a new [TargetClassification] instance.
  TargetClassification({
    this.classifications = const {},
    this.issueType,
    this.projectKeyOrId,
  });

  /// An object with the key as the ID of the target classification and value with the list of the IDs of the current source classifications.
  Map<String, List<String>> classifications;

  /// ID of the source issueType to which issues present in `issueIdOrKeys` belongs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueType;

  /// ID or key of the source project to which issues present in `issueIdOrKeys` belongs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectKeyOrId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TargetClassification &&
    _deepEquality.equals(other.classifications, classifications) &&
    other.issueType == issueType &&
    other.projectKeyOrId == projectKeyOrId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (classifications.hashCode) +
    (issueType == null ? 0 : issueType!.hashCode) +
    (projectKeyOrId == null ? 0 : projectKeyOrId!.hashCode);

  @override
  String toString() => 'TargetClassification[classifications=$classifications, issueType=$issueType, projectKeyOrId=$projectKeyOrId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'classifications'] = this.classifications;
    if (this.issueType != null) {
      json[r'issueType'] = this.issueType;
    } else {
      json[r'issueType'] = null;
    }
    if (this.projectKeyOrId != null) {
      json[r'projectKeyOrId'] = this.projectKeyOrId;
    } else {
      json[r'projectKeyOrId'] = null;
    }
    return json;
  }

  /// Returns a new [TargetClassification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TargetClassification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'classifications'), 'Required key "TargetClassification[classifications]" is missing from JSON.');
        assert(json[r'classifications'] != null, 'Required key "TargetClassification[classifications]" has a null value in JSON.');
        return true;
      }());

      return TargetClassification(
        classifications: json[r'classifications'] == null
          ? const {}
            : (json[r'classifications'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v == null ? const <String>[] : (v as List).map((value) => value as String).toList(growable: false))),
        issueType: mapValueOfType<String>(json, r'issueType'),
        projectKeyOrId: mapValueOfType<String>(json, r'projectKeyOrId'),
      );
    }
    return null;
  }

  static List<TargetClassification> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TargetClassification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TargetClassification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TargetClassification> mapFromJson(dynamic json) {
    final map = <String, TargetClassification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TargetClassification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TargetClassification-objects as value to a dart map
  static Map<String, List<TargetClassification>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TargetClassification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TargetClassification.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'classifications',
  };
}

