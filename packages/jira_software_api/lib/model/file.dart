//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class File {
  /// Returns a new [File] instance.
  File({
    required this.path,
    required this.url,
    required this.changeType,
    required this.linesAdded,
    required this.linesRemoved,
  });

  /// The path of the file. Max length is 1024 characters.
  String path;

  /// The URL of this file. Max length is 2000 characters.
  String url;

  /// The operation performed on this file
  FileChangeTypeEnum changeType;

  /// Number of lines added to the file
  ///
  /// Minimum value: 0
  int linesAdded;

  /// Number of lines removed from the file
  ///
  /// Minimum value: 0
  int linesRemoved;

  @override
  bool operator ==(Object other) => identical(this, other) || other is File &&
    other.path == path &&
    other.url == url &&
    other.changeType == changeType &&
    other.linesAdded == linesAdded &&
    other.linesRemoved == linesRemoved;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (path.hashCode) +
    (url.hashCode) +
    (changeType.hashCode) +
    (linesAdded.hashCode) +
    (linesRemoved.hashCode);

  @override
  String toString() => 'File[path=$path, url=$url, changeType=$changeType, linesAdded=$linesAdded, linesRemoved=$linesRemoved]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'path'] = this.path;
      json[r'url'] = this.url;
      json[r'changeType'] = this.changeType;
      json[r'linesAdded'] = this.linesAdded;
      json[r'linesRemoved'] = this.linesRemoved;
    return json;
  }

  /// Returns a new [File] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static File? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'path'), 'Required key "File[path]" is missing from JSON.');
        assert(json[r'path'] != null, 'Required key "File[path]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "File[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "File[url]" has a null value in JSON.');
        assert(json.containsKey(r'changeType'), 'Required key "File[changeType]" is missing from JSON.');
        assert(json[r'changeType'] != null, 'Required key "File[changeType]" has a null value in JSON.');
        assert(json.containsKey(r'linesAdded'), 'Required key "File[linesAdded]" is missing from JSON.');
        assert(json[r'linesAdded'] != null, 'Required key "File[linesAdded]" has a null value in JSON.');
        assert(json.containsKey(r'linesRemoved'), 'Required key "File[linesRemoved]" is missing from JSON.');
        assert(json[r'linesRemoved'] != null, 'Required key "File[linesRemoved]" has a null value in JSON.');
        return true;
      }());

      return File(
        path: mapValueOfType<String>(json, r'path')!,
        url: mapValueOfType<String>(json, r'url')!,
        changeType: FileChangeTypeEnum.fromJson(json[r'changeType'])!,
        linesAdded: mapValueOfType<int>(json, r'linesAdded')!,
        linesRemoved: mapValueOfType<int>(json, r'linesRemoved')!,
      );
    }
    return null;
  }

  static List<File> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <File>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = File.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, File> mapFromJson(dynamic json) {
    final map = <String, File>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = File.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of File-objects as value to a dart map
  static Map<String, List<File>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<File>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = File.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'path',
    'url',
    'changeType',
    'linesAdded',
    'linesRemoved',
  };
}

/// The operation performed on this file
enum FileChangeTypeEnum {
  ADDED._(r'ADDED'),
  COPIED._(r'COPIED'),
  DELETED._(r'DELETED'),
  MODIFIED._(r'MODIFIED'),
  MOVED._(r'MOVED'),
  UNKNOWN._(r'UNKNOWN'),
  ;

  /// Instantiate a new enum with the provided value.
  const FileChangeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FileChangeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FileChangeTypeEnum? fromJson(dynamic value) => FileChangeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FileChangeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FileChangeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FileChangeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FileChangeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FileChangeTypeEnum] to String,
/// and [decode] dynamic data back to [FileChangeTypeEnum].
class FileChangeTypeEnumTypeTransformer {
  factory FileChangeTypeEnumTypeTransformer() => _instance ??= const FileChangeTypeEnumTypeTransformer._();

  const FileChangeTypeEnumTypeTransformer._();

  String encode(FileChangeTypeEnum data) => data._value;

  /// Returns the instance of [FileChangeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FileChangeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FileChangeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ADDED': return FileChangeTypeEnum.ADDED;
        case r'COPIED': return FileChangeTypeEnum.COPIED;
        case r'DELETED': return FileChangeTypeEnum.DELETED;
        case r'MODIFIED': return FileChangeTypeEnum.MODIFIED;
        case r'MOVED': return FileChangeTypeEnum.MOVED;
        case r'UNKNOWN': return FileChangeTypeEnum.UNKNOWN;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FileChangeTypeEnumTypeTransformer? _instance;
}


