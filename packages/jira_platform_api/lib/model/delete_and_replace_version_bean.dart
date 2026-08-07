//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeleteAndReplaceVersionBean {
  /// Returns a new [DeleteAndReplaceVersionBean] instance.
  DeleteAndReplaceVersionBean({
    this.customFieldReplacementList = const [],
    this.moveAffectedIssuesTo,
    this.moveFixIssuesTo,
  });

  /// An array of custom field IDs (`customFieldId`) and version IDs (`moveTo`) to update when the fields contain the deleted version.
  List<CustomFieldReplacement> customFieldReplacementList;

  /// The ID of the version to update `affectedVersion` to when the field contains the deleted version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? moveAffectedIssuesTo;

  /// The ID of the version to update `fixVersion` to when the field contains the deleted version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? moveFixIssuesTo;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeleteAndReplaceVersionBean &&
    _deepEquality.equals(other.customFieldReplacementList, customFieldReplacementList) &&
    other.moveAffectedIssuesTo == moveAffectedIssuesTo &&
    other.moveFixIssuesTo == moveFixIssuesTo;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (customFieldReplacementList.hashCode) +
    (moveAffectedIssuesTo == null ? 0 : moveAffectedIssuesTo!.hashCode) +
    (moveFixIssuesTo == null ? 0 : moveFixIssuesTo!.hashCode);

  @override
  String toString() => 'DeleteAndReplaceVersionBean[customFieldReplacementList=$customFieldReplacementList, moveAffectedIssuesTo=$moveAffectedIssuesTo, moveFixIssuesTo=$moveFixIssuesTo]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'customFieldReplacementList'] = this.customFieldReplacementList;
    if (this.moveAffectedIssuesTo != null) {
      json[r'moveAffectedIssuesTo'] = this.moveAffectedIssuesTo;
    } else {
      json[r'moveAffectedIssuesTo'] = null;
    }
    if (this.moveFixIssuesTo != null) {
      json[r'moveFixIssuesTo'] = this.moveFixIssuesTo;
    } else {
      json[r'moveFixIssuesTo'] = null;
    }
    return json;
  }

  /// Returns a new [DeleteAndReplaceVersionBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeleteAndReplaceVersionBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return DeleteAndReplaceVersionBean(
        customFieldReplacementList: CustomFieldReplacement.listFromJson(json[r'customFieldReplacementList']),
        moveAffectedIssuesTo: mapValueOfType<int>(json, r'moveAffectedIssuesTo'),
        moveFixIssuesTo: mapValueOfType<int>(json, r'moveFixIssuesTo'),
      );
    }
    return null;
  }

  static List<DeleteAndReplaceVersionBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeleteAndReplaceVersionBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeleteAndReplaceVersionBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeleteAndReplaceVersionBean> mapFromJson(dynamic json) {
    final map = <String, DeleteAndReplaceVersionBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeleteAndReplaceVersionBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeleteAndReplaceVersionBean-objects as value to a dart map
  static Map<String, List<DeleteAndReplaceVersionBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DeleteAndReplaceVersionBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeleteAndReplaceVersionBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

