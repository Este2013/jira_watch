//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentArchive {
  /// Returns a new [AttachmentArchive] instance.
  AttachmentArchive({
    this.entries = const [],
    this.moreAvailable,
    this.totalEntryCount,
    this.totalNumberOfEntriesAvailable,
  });

  List<AttachmentArchiveEntry> entries;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? moreAvailable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalEntryCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalNumberOfEntriesAvailable;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentArchive &&
    _deepEquality.equals(other.entries, entries) &&
    other.moreAvailable == moreAvailable &&
    other.totalEntryCount == totalEntryCount &&
    other.totalNumberOfEntriesAvailable == totalNumberOfEntriesAvailable;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (entries.hashCode) +
    (moreAvailable == null ? 0 : moreAvailable!.hashCode) +
    (totalEntryCount == null ? 0 : totalEntryCount!.hashCode) +
    (totalNumberOfEntriesAvailable == null ? 0 : totalNumberOfEntriesAvailable!.hashCode);

  @override
  String toString() => 'AttachmentArchive[entries=$entries, moreAvailable=$moreAvailable, totalEntryCount=$totalEntryCount, totalNumberOfEntriesAvailable=$totalNumberOfEntriesAvailable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'entries'] = this.entries;
    if (this.moreAvailable != null) {
      json[r'moreAvailable'] = this.moreAvailable;
    } else {
      json[r'moreAvailable'] = null;
    }
    if (this.totalEntryCount != null) {
      json[r'totalEntryCount'] = this.totalEntryCount;
    } else {
      json[r'totalEntryCount'] = null;
    }
    if (this.totalNumberOfEntriesAvailable != null) {
      json[r'totalNumberOfEntriesAvailable'] = this.totalNumberOfEntriesAvailable;
    } else {
      json[r'totalNumberOfEntriesAvailable'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentArchive] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentArchive? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentArchive(
        entries: AttachmentArchiveEntry.listFromJson(json[r'entries']),
        moreAvailable: mapValueOfType<bool>(json, r'moreAvailable'),
        totalEntryCount: mapValueOfType<int>(json, r'totalEntryCount'),
        totalNumberOfEntriesAvailable: mapValueOfType<int>(json, r'totalNumberOfEntriesAvailable'),
      );
    }
    return null;
  }

  static List<AttachmentArchive> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentArchive>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentArchive.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentArchive> mapFromJson(dynamic json) {
    final map = <String, AttachmentArchive>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentArchive.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentArchive-objects as value to a dart map
  static Map<String, List<AttachmentArchive>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentArchive>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentArchive.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

