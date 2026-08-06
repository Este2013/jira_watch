//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentArchiveImpl {
  /// Returns a new [AttachmentArchiveImpl] instance.
  AttachmentArchiveImpl({
    this.entries = const [],
    this.totalEntryCount,
  });

  /// The list of the items included in the archive.
  List<AttachmentArchiveEntry> entries;

  /// The number of items in the archive.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalEntryCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentArchiveImpl &&
    _deepEquality.equals(other.entries, entries) &&
    other.totalEntryCount == totalEntryCount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (entries.hashCode) +
    (totalEntryCount == null ? 0 : totalEntryCount!.hashCode);

  @override
  String toString() => 'AttachmentArchiveImpl[entries=$entries, totalEntryCount=$totalEntryCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'entries'] = this.entries;
    if (this.totalEntryCount != null) {
      json[r'totalEntryCount'] = this.totalEntryCount;
    } else {
      json[r'totalEntryCount'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentArchiveImpl] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentArchiveImpl? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentArchiveImpl(
        entries: AttachmentArchiveEntry.listFromJson(json[r'entries']),
        totalEntryCount: mapValueOfType<int>(json, r'totalEntryCount'),
      );
    }
    return null;
  }

  static List<AttachmentArchiveImpl> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentArchiveImpl>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentArchiveImpl.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentArchiveImpl> mapFromJson(dynamic json) {
    final map = <String, AttachmentArchiveImpl>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentArchiveImpl.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentArchiveImpl-objects as value to a dart map
  static Map<String, List<AttachmentArchiveImpl>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentArchiveImpl>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentArchiveImpl.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

