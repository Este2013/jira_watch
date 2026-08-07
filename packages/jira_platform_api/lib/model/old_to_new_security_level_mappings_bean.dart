//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OldToNewSecurityLevelMappingsBean {
  /// Returns a new [OldToNewSecurityLevelMappingsBean] instance.
  OldToNewSecurityLevelMappingsBean({
    required this.newLevelId,
    required this.oldLevelId,
  });

  /// The new issue security level ID. Providing null will clear the assigned old level from issues.
  String newLevelId;

  /// The old issue security level ID. Providing null will remap all issues without any assigned levels.
  String oldLevelId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OldToNewSecurityLevelMappingsBean &&
    other.newLevelId == newLevelId &&
    other.oldLevelId == oldLevelId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (newLevelId.hashCode) +
    (oldLevelId.hashCode);

  @override
  String toString() => 'OldToNewSecurityLevelMappingsBean[newLevelId=$newLevelId, oldLevelId=$oldLevelId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'newLevelId'] = this.newLevelId;
      json[r'oldLevelId'] = this.oldLevelId;
    return json;
  }

  /// Returns a new [OldToNewSecurityLevelMappingsBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OldToNewSecurityLevelMappingsBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'newLevelId'), 'Required key "OldToNewSecurityLevelMappingsBean[newLevelId]" is missing from JSON.');
        assert(json[r'newLevelId'] != null, 'Required key "OldToNewSecurityLevelMappingsBean[newLevelId]" has a null value in JSON.');
        assert(json.containsKey(r'oldLevelId'), 'Required key "OldToNewSecurityLevelMappingsBean[oldLevelId]" is missing from JSON.');
        assert(json[r'oldLevelId'] != null, 'Required key "OldToNewSecurityLevelMappingsBean[oldLevelId]" has a null value in JSON.');
        return true;
      }());

      return OldToNewSecurityLevelMappingsBean(
        newLevelId: mapValueOfType<String>(json, r'newLevelId')!,
        oldLevelId: mapValueOfType<String>(json, r'oldLevelId')!,
      );
    }
    return null;
  }

  static List<OldToNewSecurityLevelMappingsBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OldToNewSecurityLevelMappingsBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OldToNewSecurityLevelMappingsBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OldToNewSecurityLevelMappingsBean> mapFromJson(dynamic json) {
    final map = <String, OldToNewSecurityLevelMappingsBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OldToNewSecurityLevelMappingsBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OldToNewSecurityLevelMappingsBean-objects as value to a dart map
  static Map<String, List<OldToNewSecurityLevelMappingsBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OldToNewSecurityLevelMappingsBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OldToNewSecurityLevelMappingsBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'newLevelId',
    'oldLevelId',
  };
}

