//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssuePickerSuggestionsIssueType {
  /// Returns a new [IssuePickerSuggestionsIssueType] instance.
  IssuePickerSuggestionsIssueType({
    this.id,
    this.issues = const [],
    this.label,
    this.msg,
    this.sub,
  });

  /// The ID of the type of issues suggested for use in auto-completion.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// A list of issues suggested for use in auto-completion.
  List<SuggestedIssue> issues;

  /// The label of the type of issues suggested for use in auto-completion.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? label;

  /// If no issue suggestions are found, returns a message indicating no suggestions were found,
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? msg;

  /// If issue suggestions are found, returns a message indicating the number of issues suggestions found and returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sub;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssuePickerSuggestionsIssueType &&
    other.id == id &&
    _deepEquality.equals(other.issues, issues) &&
    other.label == label &&
    other.msg == msg &&
    other.sub == sub;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (issues.hashCode) +
    (label == null ? 0 : label!.hashCode) +
    (msg == null ? 0 : msg!.hashCode) +
    (sub == null ? 0 : sub!.hashCode);

  @override
  String toString() => 'IssuePickerSuggestionsIssueType[id=$id, issues=$issues, label=$label, msg=$msg, sub=$sub]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'issues'] = this.issues;
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    if (this.msg != null) {
      json[r'msg'] = this.msg;
    } else {
      json[r'msg'] = null;
    }
    if (this.sub != null) {
      json[r'sub'] = this.sub;
    } else {
      json[r'sub'] = null;
    }
    return json;
  }

  /// Returns a new [IssuePickerSuggestionsIssueType] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssuePickerSuggestionsIssueType? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssuePickerSuggestionsIssueType(
        id: mapValueOfType<String>(json, r'id'),
        issues: SuggestedIssue.listFromJson(json[r'issues']),
        label: mapValueOfType<String>(json, r'label'),
        msg: mapValueOfType<String>(json, r'msg'),
        sub: mapValueOfType<String>(json, r'sub'),
      );
    }
    return null;
  }

  static List<IssuePickerSuggestionsIssueType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssuePickerSuggestionsIssueType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssuePickerSuggestionsIssueType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssuePickerSuggestionsIssueType> mapFromJson(dynamic json) {
    final map = <String, IssuePickerSuggestionsIssueType>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssuePickerSuggestionsIssueType.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssuePickerSuggestionsIssueType-objects as value to a dart map
  static Map<String, List<IssuePickerSuggestionsIssueType>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssuePickerSuggestionsIssueType>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssuePickerSuggestionsIssueType.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

