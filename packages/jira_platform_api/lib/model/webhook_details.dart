//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WebhookDetails {
  /// Returns a new [WebhookDetails] instance.
  WebhookDetails({
    this.events = const [],
    this.fieldIdsFilter = const [],
    this.issuePropertyKeysFilter = const [],
    required this.jqlFilter,
  });

  /// The Jira events that trigger the webhook.
  List<WebhookDetailsEventsEnum> events;

  /// A list of field IDs. When the issue changelog contains any of the fields, the webhook `jira:issue_updated` is sent. If this parameter is not present, the app is notified about all field updates.
  List<String> fieldIdsFilter;

  /// A list of issue property keys. A change of those issue properties triggers the `issue_property_set` or `issue_property_deleted` webhooks. If this parameter is not present, the app is notified about all issue property updates.
  List<String> issuePropertyKeysFilter;

  /// The JQL filter that specifies which issues the webhook is sent for. Only a subset of JQL can be used. The supported elements are:   *  Fields: `issueKey`, `project`, `issuetype`, `status`, `assignee`, `reporter`, `issue.property`, and `cf[id]`. For custom fields (`cf[id]`), only the epic label custom field is supported.\".  *  Operators: `=`, `!=`, `IN`, and `NOT IN`.
  String jqlFilter;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WebhookDetails &&
    _deepEquality.equals(other.events, events) &&
    _deepEquality.equals(other.fieldIdsFilter, fieldIdsFilter) &&
    _deepEquality.equals(other.issuePropertyKeysFilter, issuePropertyKeysFilter) &&
    other.jqlFilter == jqlFilter;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (events.hashCode) +
    (fieldIdsFilter.hashCode) +
    (issuePropertyKeysFilter.hashCode) +
    (jqlFilter.hashCode);

  @override
  String toString() => 'WebhookDetails[events=$events, fieldIdsFilter=$fieldIdsFilter, issuePropertyKeysFilter=$issuePropertyKeysFilter, jqlFilter=$jqlFilter]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'events'] = this.events;
      json[r'fieldIdsFilter'] = this.fieldIdsFilter;
      json[r'issuePropertyKeysFilter'] = this.issuePropertyKeysFilter;
      json[r'jqlFilter'] = this.jqlFilter;
    return json;
  }

  /// Returns a new [WebhookDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WebhookDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'events'), 'Required key "WebhookDetails[events]" is missing from JSON.');
        assert(json[r'events'] != null, 'Required key "WebhookDetails[events]" has a null value in JSON.');
        assert(json.containsKey(r'jqlFilter'), 'Required key "WebhookDetails[jqlFilter]" is missing from JSON.');
        assert(json[r'jqlFilter'] != null, 'Required key "WebhookDetails[jqlFilter]" has a null value in JSON.');
        return true;
      }());

      return WebhookDetails(
        events: WebhookDetailsEventsEnum.listFromJson(json[r'events']),
        fieldIdsFilter: json[r'fieldIdsFilter'] is Iterable
            ? (json[r'fieldIdsFilter'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        issuePropertyKeysFilter: json[r'issuePropertyKeysFilter'] is Iterable
            ? (json[r'issuePropertyKeysFilter'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        jqlFilter: mapValueOfType<String>(json, r'jqlFilter')!,
      );
    }
    return null;
  }

  static List<WebhookDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WebhookDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WebhookDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WebhookDetails> mapFromJson(dynamic json) {
    final map = <String, WebhookDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WebhookDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WebhookDetails-objects as value to a dart map
  static Map<String, List<WebhookDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WebhookDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WebhookDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'events',
    'jqlFilter',
  };
}


enum WebhookDetailsEventsEnum {
  jiraColonIssueCreated._(r'jira:issue_created'),
  jiraColonIssueUpdated._(r'jira:issue_updated'),
  jiraColonIssueDeleted._(r'jira:issue_deleted'),
  commentCreated._(r'comment_created'),
  commentUpdated._(r'comment_updated'),
  commentDeleted._(r'comment_deleted'),
  issuePropertySet._(r'issue_property_set'),
  issuePropertyDeleted._(r'issue_property_deleted'),
  sprintCreated._(r'sprint_created'),
  sprintUpdated._(r'sprint_updated'),
  sprintClosed._(r'sprint_closed'),
  sprintDeleted._(r'sprint_deleted'),
  sprintStarted._(r'sprint_started'),
  jiraColonVersionReleased._(r'jira:version_released'),
  jiraColonVersionUnreleased._(r'jira:version_unreleased'),
  jiraColonVersionCreated._(r'jira:version_created'),
  jiraColonVersionMoved._(r'jira:version_moved'),
  jiraColonVersionUpdated._(r'jira:version_updated'),
  jiraColonVersionMerged._(r'jira:version_merged'),
  jiraColonVersionDeleted._(r'jira:version_deleted'),
  ;

  /// Instantiate a new enum with the provided value.
  const WebhookDetailsEventsEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WebhookDetailsEventsEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WebhookDetailsEventsEnum? fromJson(dynamic value) => WebhookDetailsEventsEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WebhookDetailsEventsEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WebhookDetailsEventsEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WebhookDetailsEventsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WebhookDetailsEventsEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WebhookDetailsEventsEnum] to String,
/// and [decode] dynamic data back to [WebhookDetailsEventsEnum].
class WebhookDetailsEventsEnumTypeTransformer {
  factory WebhookDetailsEventsEnumTypeTransformer() => _instance ??= const WebhookDetailsEventsEnumTypeTransformer._();

  const WebhookDetailsEventsEnumTypeTransformer._();

  String encode(WebhookDetailsEventsEnum data) => data._value;

  /// Returns the instance of [WebhookDetailsEventsEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WebhookDetailsEventsEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WebhookDetailsEventsEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'jira:issue_created': return WebhookDetailsEventsEnum.jiraColonIssueCreated;
        case r'jira:issue_updated': return WebhookDetailsEventsEnum.jiraColonIssueUpdated;
        case r'jira:issue_deleted': return WebhookDetailsEventsEnum.jiraColonIssueDeleted;
        case r'comment_created': return WebhookDetailsEventsEnum.commentCreated;
        case r'comment_updated': return WebhookDetailsEventsEnum.commentUpdated;
        case r'comment_deleted': return WebhookDetailsEventsEnum.commentDeleted;
        case r'issue_property_set': return WebhookDetailsEventsEnum.issuePropertySet;
        case r'issue_property_deleted': return WebhookDetailsEventsEnum.issuePropertyDeleted;
        case r'sprint_created': return WebhookDetailsEventsEnum.sprintCreated;
        case r'sprint_updated': return WebhookDetailsEventsEnum.sprintUpdated;
        case r'sprint_closed': return WebhookDetailsEventsEnum.sprintClosed;
        case r'sprint_deleted': return WebhookDetailsEventsEnum.sprintDeleted;
        case r'sprint_started': return WebhookDetailsEventsEnum.sprintStarted;
        case r'jira:version_released': return WebhookDetailsEventsEnum.jiraColonVersionReleased;
        case r'jira:version_unreleased': return WebhookDetailsEventsEnum.jiraColonVersionUnreleased;
        case r'jira:version_created': return WebhookDetailsEventsEnum.jiraColonVersionCreated;
        case r'jira:version_moved': return WebhookDetailsEventsEnum.jiraColonVersionMoved;
        case r'jira:version_updated': return WebhookDetailsEventsEnum.jiraColonVersionUpdated;
        case r'jira:version_merged': return WebhookDetailsEventsEnum.jiraColonVersionMerged;
        case r'jira:version_deleted': return WebhookDetailsEventsEnum.jiraColonVersionDeleted;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WebhookDetailsEventsEnumTypeTransformer? _instance;
}


