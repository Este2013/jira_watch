//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueLink {
  /// Returns a new [IssueLink] instance.
  IssueLink({
    this.id,
    required this.inwardIssue,
    required this.outwardIssue,
    this.self,
    required this.type,
  });

  /// The ID of the issue link.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Provides details about the linked issue. If presenting this link in a user interface, use the `inward` field of the issue link type to label the link.
  LinkedIssue inwardIssue;

  /// Provides details about the linked issue. If presenting this link in a user interface, use the `outward` field of the issue link type to label the link.
  LinkedIssue outwardIssue;

  /// The URL of the issue link.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The type of link between the issues.
  IssueLinkType type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueLink &&
    other.id == id &&
    other.inwardIssue == inwardIssue &&
    other.outwardIssue == outwardIssue &&
    other.self == self &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (inwardIssue.hashCode) +
    (outwardIssue.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'IssueLink[id=$id, inwardIssue=$inwardIssue, outwardIssue=$outwardIssue, self=$self, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'inwardIssue'] = this.inwardIssue;
      json[r'outwardIssue'] = this.outwardIssue;
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IssueLink] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueLink? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'inwardIssue'), 'Required key "IssueLink[inwardIssue]" is missing from JSON.');
        assert(json[r'inwardIssue'] != null, 'Required key "IssueLink[inwardIssue]" has a null value in JSON.');
        assert(json.containsKey(r'outwardIssue'), 'Required key "IssueLink[outwardIssue]" is missing from JSON.');
        assert(json[r'outwardIssue'] != null, 'Required key "IssueLink[outwardIssue]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "IssueLink[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "IssueLink[type]" has a null value in JSON.');
        return true;
      }());

      return IssueLink(
        id: mapValueOfType<String>(json, r'id'),
        inwardIssue: LinkedIssue.fromJson(json[r'inwardIssue'])!,
        outwardIssue: LinkedIssue.fromJson(json[r'outwardIssue'])!,
        self: mapValueOfType<String>(json, r'self'),
        type: IssueLinkType.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<IssueLink> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueLink>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueLink.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueLink> mapFromJson(dynamic json) {
    final map = <String, IssueLink>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueLink.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueLink-objects as value to a dart map
  static Map<String, List<IssueLink>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueLink>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueLink.listFromJson(entry.value, growable: growable,);
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

