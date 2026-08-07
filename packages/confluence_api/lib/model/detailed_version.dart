//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DetailedVersion {
  /// Returns a new [DetailedVersion] instance.
  DetailedVersion({
    this.number,
    this.authorId,
    this.message,
    this.createdAt,
    this.minorEdit,
    this.contentTypeModified,
    this.collaborators = const [],
    this.prevVersion,
    this.nextVersion,
  });

  /// The current version number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? number;

  /// The account ID of the user who created this version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? authorId;

  /// Message associated with the current version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// Date and time when the version was created. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  /// Describes if this version is a minor version. Email notifications and activity stream updates are not created for minor versions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? minorEdit;

  /// Describes if the content type is modified in this version (e.g. page to blog)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? contentTypeModified;

  /// The account IDs of users that collaborated on this version.
  List<String> collaborators;

  /// The version number of the version prior to this current content update.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? prevVersion;

  /// The version number of the version after this current content update.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? nextVersion;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DetailedVersion &&
    other.number == number &&
    other.authorId == authorId &&
    other.message == message &&
    other.createdAt == createdAt &&
    other.minorEdit == minorEdit &&
    other.contentTypeModified == contentTypeModified &&
    _deepEquality.equals(other.collaborators, collaborators) &&
    other.prevVersion == prevVersion &&
    other.nextVersion == nextVersion;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (number == null ? 0 : number!.hashCode) +
    (authorId == null ? 0 : authorId!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (minorEdit == null ? 0 : minorEdit!.hashCode) +
    (contentTypeModified == null ? 0 : contentTypeModified!.hashCode) +
    (collaborators.hashCode) +
    (prevVersion == null ? 0 : prevVersion!.hashCode) +
    (nextVersion == null ? 0 : nextVersion!.hashCode);

  @override
  String toString() => 'DetailedVersion[number=$number, authorId=$authorId, message=$message, createdAt=$createdAt, minorEdit=$minorEdit, contentTypeModified=$contentTypeModified, collaborators=$collaborators, prevVersion=$prevVersion, nextVersion=$nextVersion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.number != null) {
      json[r'number'] = this.number;
    } else {
      json[r'number'] = null;
    }
    if (this.authorId != null) {
      json[r'authorId'] = this.authorId;
    } else {
      json[r'authorId'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.minorEdit != null) {
      json[r'minorEdit'] = this.minorEdit;
    } else {
      json[r'minorEdit'] = null;
    }
    if (this.contentTypeModified != null) {
      json[r'contentTypeModified'] = this.contentTypeModified;
    } else {
      json[r'contentTypeModified'] = null;
    }
      json[r'collaborators'] = this.collaborators;
    if (this.prevVersion != null) {
      json[r'prevVersion'] = this.prevVersion;
    } else {
      json[r'prevVersion'] = null;
    }
    if (this.nextVersion != null) {
      json[r'nextVersion'] = this.nextVersion;
    } else {
      json[r'nextVersion'] = null;
    }
    return json;
  }

  /// Returns a new [DetailedVersion] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DetailedVersion? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return DetailedVersion(
        number: mapValueOfType<int>(json, r'number'),
        authorId: mapValueOfType<String>(json, r'authorId'),
        message: mapValueOfType<String>(json, r'message'),
        createdAt: mapDateTime(json, r'createdAt', r''),
        minorEdit: mapValueOfType<bool>(json, r'minorEdit'),
        contentTypeModified: mapValueOfType<bool>(json, r'contentTypeModified'),
        collaborators: json[r'collaborators'] is Iterable
            ? (json[r'collaborators'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        prevVersion: mapValueOfType<int>(json, r'prevVersion'),
        nextVersion: mapValueOfType<int>(json, r'nextVersion'),
      );
    }
    return null;
  }

  static List<DetailedVersion> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DetailedVersion>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DetailedVersion.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DetailedVersion> mapFromJson(dynamic json) {
    final map = <String, DetailedVersion>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DetailedVersion.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DetailedVersion-objects as value to a dart map
  static Map<String, List<DetailedVersion>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DetailedVersion>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DetailedVersion.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

