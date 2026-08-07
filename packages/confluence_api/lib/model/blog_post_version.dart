//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BlogPostVersion {
  /// Returns a new [BlogPostVersion] instance.
  BlogPostVersion({
    this.createdAt,
    this.message,
    this.number,
    this.minorEdit,
    this.authorId,
    this.blogpost,
  });

  /// Date and time when the version was created. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  /// Message associated with the current version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// The version number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? number;

  /// Describes if this version is a minor version. Email notifications and activity stream updates are not created for minor versions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? minorEdit;

  /// The account ID of the user who created this version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? authorId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  VersionedEntity? blogpost;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BlogPostVersion &&
    other.createdAt == createdAt &&
    other.message == message &&
    other.number == number &&
    other.minorEdit == minorEdit &&
    other.authorId == authorId &&
    other.blogpost == blogpost;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (number == null ? 0 : number!.hashCode) +
    (minorEdit == null ? 0 : minorEdit!.hashCode) +
    (authorId == null ? 0 : authorId!.hashCode) +
    (blogpost == null ? 0 : blogpost!.hashCode);

  @override
  String toString() => 'BlogPostVersion[createdAt=$createdAt, message=$message, number=$number, minorEdit=$minorEdit, authorId=$authorId, blogpost=$blogpost]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.number != null) {
      json[r'number'] = this.number;
    } else {
      json[r'number'] = null;
    }
    if (this.minorEdit != null) {
      json[r'minorEdit'] = this.minorEdit;
    } else {
      json[r'minorEdit'] = null;
    }
    if (this.authorId != null) {
      json[r'authorId'] = this.authorId;
    } else {
      json[r'authorId'] = null;
    }
    if (this.blogpost != null) {
      json[r'blogpost'] = this.blogpost;
    } else {
      json[r'blogpost'] = null;
    }
    return json;
  }

  /// Returns a new [BlogPostVersion] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BlogPostVersion? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BlogPostVersion(
        createdAt: mapDateTime(json, r'createdAt', r''),
        message: mapValueOfType<String>(json, r'message'),
        number: mapValueOfType<int>(json, r'number'),
        minorEdit: mapValueOfType<bool>(json, r'minorEdit'),
        authorId: mapValueOfType<String>(json, r'authorId'),
        blogpost: VersionedEntity.fromJson(json[r'blogpost']),
      );
    }
    return null;
  }

  static List<BlogPostVersion> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BlogPostVersion>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlogPostVersion.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BlogPostVersion> mapFromJson(dynamic json) {
    final map = <String, BlogPostVersion>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BlogPostVersion.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BlogPostVersion-objects as value to a dart map
  static Map<String, List<BlogPostVersion>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BlogPostVersion>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BlogPostVersion.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

