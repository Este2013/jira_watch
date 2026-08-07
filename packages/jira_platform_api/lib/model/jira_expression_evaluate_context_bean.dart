//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraExpressionEvaluateContextBean {
  /// Returns a new [JiraExpressionEvaluateContextBean] instance.
  JiraExpressionEvaluateContextBean({
    this.board,
    this.custom = const [],
    this.customerRequest,
    this.issue,
    this.issues,
    this.project,
    this.serviceDesk,
    this.sprint,
  });

  /// The ID of the board that is available under the `board` variable when evaluating the expression.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? board;

  /// Custom context variables and their types. These variable types are available for use in a custom context:   *  `user`: A [user](https://developer.atlassian.com/cloud/jira/platform/jira-expressions-type-reference#user) specified as an Atlassian account ID.  *  `issue`: An [issue](https://developer.atlassian.com/cloud/jira/platform/jira-expressions-type-reference#issue) specified by ID or key. All the fields of the issue object are available in the Jira expression.  *  `json`: A JSON object containing custom content.  *  `list`: A JSON list of `user`, `issue`, or `json` variable types.
  List<CustomContextVariable> custom;

  /// The ID of the customer request that is available under the `customerRequest` variable when evaluating the expression. This is the same as the ID of the underlying Jira issue, but the customer request context variable will have a different type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? customerRequest;

  /// The issue that is available under the `issue` variable when evaluating the expression.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IdOrKeyBean? issue;

  /// The collection of issues that is available under the `issues` variable when evaluating the expression.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JexpEvaluateCtxIssues? issues;

  /// The project that is available under the `project` variable when evaluating the expression.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IdOrKeyBean? project;

  /// The ID of the service desk that is available under the `serviceDesk` variable when evaluating the expression.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? serviceDesk;

  /// The ID of the sprint that is available under the `sprint` variable when evaluating the expression.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? sprint;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraExpressionEvaluateContextBean &&
    other.board == board &&
    _deepEquality.equals(other.custom, custom) &&
    other.customerRequest == customerRequest &&
    other.issue == issue &&
    other.issues == issues &&
    other.project == project &&
    other.serviceDesk == serviceDesk &&
    other.sprint == sprint;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (board == null ? 0 : board!.hashCode) +
    (custom.hashCode) +
    (customerRequest == null ? 0 : customerRequest!.hashCode) +
    (issue == null ? 0 : issue!.hashCode) +
    (issues == null ? 0 : issues!.hashCode) +
    (project == null ? 0 : project!.hashCode) +
    (serviceDesk == null ? 0 : serviceDesk!.hashCode) +
    (sprint == null ? 0 : sprint!.hashCode);

  @override
  String toString() => 'JiraExpressionEvaluateContextBean[board=$board, custom=$custom, customerRequest=$customerRequest, issue=$issue, issues=$issues, project=$project, serviceDesk=$serviceDesk, sprint=$sprint]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.board != null) {
      json[r'board'] = this.board;
    } else {
      json[r'board'] = null;
    }
      json[r'custom'] = this.custom;
    if (this.customerRequest != null) {
      json[r'customerRequest'] = this.customerRequest;
    } else {
      json[r'customerRequest'] = null;
    }
    if (this.issue != null) {
      json[r'issue'] = this.issue;
    } else {
      json[r'issue'] = null;
    }
    if (this.issues != null) {
      json[r'issues'] = this.issues;
    } else {
      json[r'issues'] = null;
    }
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
    if (this.serviceDesk != null) {
      json[r'serviceDesk'] = this.serviceDesk;
    } else {
      json[r'serviceDesk'] = null;
    }
    if (this.sprint != null) {
      json[r'sprint'] = this.sprint;
    } else {
      json[r'sprint'] = null;
    }
    return json;
  }

  /// Returns a new [JiraExpressionEvaluateContextBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraExpressionEvaluateContextBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JiraExpressionEvaluateContextBean(
        board: mapValueOfType<int>(json, r'board'),
        custom: CustomContextVariable.listFromJson(json[r'custom']),
        customerRequest: mapValueOfType<int>(json, r'customerRequest'),
        issue: IdOrKeyBean.fromJson(json[r'issue']),
        issues: JexpEvaluateCtxIssues.fromJson(json[r'issues']),
        project: IdOrKeyBean.fromJson(json[r'project']),
        serviceDesk: mapValueOfType<int>(json, r'serviceDesk'),
        sprint: mapValueOfType<int>(json, r'sprint'),
      );
    }
    return null;
  }

  static List<JiraExpressionEvaluateContextBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionEvaluateContextBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionEvaluateContextBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraExpressionEvaluateContextBean> mapFromJson(dynamic json) {
    final map = <String, JiraExpressionEvaluateContextBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraExpressionEvaluateContextBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraExpressionEvaluateContextBean-objects as value to a dart map
  static Map<String, List<JiraExpressionEvaluateContextBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraExpressionEvaluateContextBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraExpressionEvaluateContextBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

