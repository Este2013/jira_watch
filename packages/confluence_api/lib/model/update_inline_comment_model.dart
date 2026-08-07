//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateInlineCommentModel {
  /// Returns a new [UpdateInlineCommentModel] instance.
  UpdateInlineCommentModel({
    this.version,
    this.body,
    this.resolved,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UpdateFooterCommentModelVersion? version;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateFooterCommentModelBody? body;

  /// Resolved state of the comment. Set to true to resolve the comment, set to false to reopen it. If matching the existing state (i.e. true -> resolved or false -> open/reopened) , no change will occur. A dangling comment cannot be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? resolved;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateInlineCommentModel &&
    other.version == version &&
    other.body == body &&
    other.resolved == resolved;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (version == null ? 0 : version!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (resolved == null ? 0 : resolved!.hashCode);

  @override
  String toString() => 'UpdateInlineCommentModel[version=$version, body=$body, resolved=$resolved]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.resolved != null) {
      json[r'resolved'] = this.resolved;
    } else {
      json[r'resolved'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateInlineCommentModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateInlineCommentModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdateInlineCommentModel(
        version: UpdateFooterCommentModelVersion.fromJson(json[r'version']),
        body: CreateFooterCommentModelBody.fromJson(json[r'body']),
        resolved: mapValueOfType<bool>(json, r'resolved'),
      );
    }
    return null;
  }

  static List<UpdateInlineCommentModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateInlineCommentModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateInlineCommentModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateInlineCommentModel> mapFromJson(dynamic json) {
    final map = <String, UpdateInlineCommentModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateInlineCommentModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateInlineCommentModel-objects as value to a dart map
  static Map<String, List<UpdateInlineCommentModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateInlineCommentModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateInlineCommentModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

