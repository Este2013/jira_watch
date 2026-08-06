//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkIssuePropertyUpdateRequest {
  /// Returns a new [BulkIssuePropertyUpdateRequest] instance.
  BulkIssuePropertyUpdateRequest({
    this.expression,
    this.filter,
    this.value,
  });

  /// EXPERIMENTAL. The Jira expression to calculate the value of the property. The value of the expression must be an object that can be converted to JSON, such as a number, boolean, string, list, or map. The context variables available to the expression are `issue` and `user`. Issues for which the expression returns a value whose JSON representation is longer than 32768 characters are ignored.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expression;

  /// The bulk operation filter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueFilterForBulkPropertySet? filter;

  /// The value of the property. The value must be a [valid](https://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.
  Object? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkIssuePropertyUpdateRequest &&
    other.expression == expression &&
    other.filter == filter &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expression == null ? 0 : expression!.hashCode) +
    (filter == null ? 0 : filter!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'BulkIssuePropertyUpdateRequest[expression=$expression, filter=$filter, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.expression != null) {
      json[r'expression'] = this.expression;
    } else {
      json[r'expression'] = null;
    }
    if (this.filter != null) {
      json[r'filter'] = this.filter;
    } else {
      json[r'filter'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [BulkIssuePropertyUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkIssuePropertyUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkIssuePropertyUpdateRequest(
        expression: mapValueOfType<String>(json, r'expression'),
        filter: IssueFilterForBulkPropertySet.fromJson(json[r'filter']),
        value: mapValueOfType<Object>(json, r'value'),
      );
    }
    return null;
  }

  static List<BulkIssuePropertyUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkIssuePropertyUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkIssuePropertyUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkIssuePropertyUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, BulkIssuePropertyUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkIssuePropertyUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkIssuePropertyUpdateRequest-objects as value to a dart map
  static Map<String, List<BulkIssuePropertyUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkIssuePropertyUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkIssuePropertyUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

