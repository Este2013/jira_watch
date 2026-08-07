//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LinkIssueRequestJsonBean {
  /// Returns a new [LinkIssueRequestJsonBean] instance.
  LinkIssueRequestJsonBean({
    this.comment,
    required this.inwardIssue,
    required this.outwardIssue,
    required this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Comment? comment;

  LinkedIssue inwardIssue;

  LinkedIssue outwardIssue;

  IssueLinkType type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LinkIssueRequestJsonBean &&
    other.comment == comment &&
    other.inwardIssue == inwardIssue &&
    other.outwardIssue == outwardIssue &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (comment == null ? 0 : comment!.hashCode) +
    (inwardIssue.hashCode) +
    (outwardIssue.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'LinkIssueRequestJsonBean[comment=$comment, inwardIssue=$inwardIssue, outwardIssue=$outwardIssue, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
      json[r'inwardIssue'] = this.inwardIssue;
      json[r'outwardIssue'] = this.outwardIssue;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [LinkIssueRequestJsonBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LinkIssueRequestJsonBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'inwardIssue'), 'Required key "LinkIssueRequestJsonBean[inwardIssue]" is missing from JSON.');
        assert(json[r'inwardIssue'] != null, 'Required key "LinkIssueRequestJsonBean[inwardIssue]" has a null value in JSON.');
        assert(json.containsKey(r'outwardIssue'), 'Required key "LinkIssueRequestJsonBean[outwardIssue]" is missing from JSON.');
        assert(json[r'outwardIssue'] != null, 'Required key "LinkIssueRequestJsonBean[outwardIssue]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "LinkIssueRequestJsonBean[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "LinkIssueRequestJsonBean[type]" has a null value in JSON.');
        return true;
      }());

      return LinkIssueRequestJsonBean(
        comment: Comment.fromJson(json[r'comment']),
        inwardIssue: LinkedIssue.fromJson(json[r'inwardIssue'])!,
        outwardIssue: LinkedIssue.fromJson(json[r'outwardIssue'])!,
        type: IssueLinkType.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<LinkIssueRequestJsonBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LinkIssueRequestJsonBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LinkIssueRequestJsonBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LinkIssueRequestJsonBean> mapFromJson(dynamic json) {
    final map = <String, LinkIssueRequestJsonBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LinkIssueRequestJsonBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LinkIssueRequestJsonBean-objects as value to a dart map
  static Map<String, List<LinkIssueRequestJsonBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LinkIssueRequestJsonBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LinkIssueRequestJsonBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'inwardIssue',
    'outwardIssue',
    'type',
  };
}

