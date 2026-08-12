//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommentNestedBodyWrite {
  /// Returns a new [CommentNestedBodyWrite] instance.
  CommentNestedBodyWrite({
    this.storage,
    this.atlasDocFormat,
    this.wiki,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommentBodyWrite? storage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommentBodyWrite? atlasDocFormat;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommentBodyWrite? wiki;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CommentNestedBodyWrite &&
    other.storage == storage &&
    other.atlasDocFormat == atlasDocFormat &&
    other.wiki == wiki;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (storage == null ? 0 : storage!.hashCode) +
    (atlasDocFormat == null ? 0 : atlasDocFormat!.hashCode) +
    (wiki == null ? 0 : wiki!.hashCode);

  @override
  String toString() => 'CommentNestedBodyWrite[storage=$storage, atlasDocFormat=$atlasDocFormat, wiki=$wiki]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.storage != null) {
      json[r'storage'] = this.storage;
    } else {
      json[r'storage'] = null;
    }
    if (this.atlasDocFormat != null) {
      json[r'atlas_doc_format'] = this.atlasDocFormat;
    } else {
      json[r'atlas_doc_format'] = null;
    }
    if (this.wiki != null) {
      json[r'wiki'] = this.wiki;
    } else {
      json[r'wiki'] = null;
    }
    return json;
  }

  /// Returns a new [CommentNestedBodyWrite] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommentNestedBodyWrite? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CommentNestedBodyWrite(
        storage: CommentBodyWrite.fromJson(json[r'storage']),
        atlasDocFormat: CommentBodyWrite.fromJson(json[r'atlas_doc_format']),
        wiki: CommentBodyWrite.fromJson(json[r'wiki']),
      );
    }
    return null;
  }

  static List<CommentNestedBodyWrite> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CommentNestedBodyWrite>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommentNestedBodyWrite.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommentNestedBodyWrite> mapFromJson(dynamic json) {
    final map = <String, CommentNestedBodyWrite>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommentNestedBodyWrite.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommentNestedBodyWrite-objects as value to a dart map
  static Map<String, List<CommentNestedBodyWrite>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CommentNestedBodyWrite>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommentNestedBodyWrite.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

