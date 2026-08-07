//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Resource {
  /// Returns a new [Resource] instance.
  Resource({
    this.contentAsByteArray = const [],
    this.description,
    this.file,
    this.filename,
    this.inputStream,
    this.open,
    this.readable,
    this.uri,
    this.url,
  });

  List<String> contentAsByteArray;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  MultipartFile? file;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? filename;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? inputStream;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? open;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uri;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Resource &&
    _deepEquality.equals(other.contentAsByteArray, contentAsByteArray) &&
    other.description == description &&
    other.file == file &&
    other.filename == filename &&
    other.inputStream == inputStream &&
    other.open == open &&
    other.readable == readable &&
    other.uri == uri &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contentAsByteArray.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (file == null ? 0 : file!.hashCode) +
    (filename == null ? 0 : filename!.hashCode) +
    (inputStream == null ? 0 : inputStream!.hashCode) +
    (open == null ? 0 : open!.hashCode) +
    (readable == null ? 0 : readable!.hashCode) +
    (uri == null ? 0 : uri!.hashCode) +
    (url == null ? 0 : url!.hashCode);

  @override
  String toString() => 'Resource[contentAsByteArray=$contentAsByteArray, description=$description, file=$file, filename=$filename, inputStream=$inputStream, open=$open, readable=$readable, uri=$uri, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contentAsByteArray'] = this.contentAsByteArray;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.file != null) {
      json[r'file'] = this.file;
    } else {
      json[r'file'] = null;
    }
    if (this.filename != null) {
      json[r'filename'] = this.filename;
    } else {
      json[r'filename'] = null;
    }
    if (this.inputStream != null) {
      json[r'inputStream'] = this.inputStream;
    } else {
      json[r'inputStream'] = null;
    }
    if (this.open != null) {
      json[r'open'] = this.open;
    } else {
      json[r'open'] = null;
    }
    if (this.readable != null) {
      json[r'readable'] = this.readable;
    } else {
      json[r'readable'] = null;
    }
    if (this.uri != null) {
      json[r'uri'] = this.uri;
    } else {
      json[r'uri'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [Resource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Resource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Resource(
        contentAsByteArray: json[r'contentAsByteArray'] is Iterable
            ? (json[r'contentAsByteArray'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        description: mapValueOfType<String>(json, r'description'),
        file: null, // No support for decoding binary content from JSON
        filename: mapValueOfType<String>(json, r'filename'),
        inputStream: mapValueOfType<Object>(json, r'inputStream'),
        open: mapValueOfType<bool>(json, r'open'),
        readable: mapValueOfType<bool>(json, r'readable'),
        uri: mapValueOfType<String>(json, r'uri'),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<Resource> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Resource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Resource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Resource> mapFromJson(dynamic json) {
    final map = <String, Resource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Resource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Resource-objects as value to a dart map
  static Map<String, List<Resource>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Resource>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Resource.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

