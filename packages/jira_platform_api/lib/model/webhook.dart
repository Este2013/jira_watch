//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Webhook {
  /// Returns a new [Webhook] instance.
  Webhook({
    this.events = const [],
    this.expirationDate,
    this.fieldIdsFilter = const [],
    required this.id,
    this.issuePropertyKeysFilter = const [],
    required this.jqlFilter,
    required this.url,
  });

  /// The Jira events that trigger the webhook.
  List<WebhookEventsEnum> events;

  /// The date after which the webhook is no longer sent. Use [Extend webhook life](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-webhooks/#api-rest-api-3-webhook-refresh-put) to extend the date.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? expirationDate;

  /// A list of field IDs. When the issue changelog contains any of the fields, the webhook `jira:issue_updated` is sent. If this parameter is not present, the app is notified about all field updates.
  List<String> fieldIdsFilter;

  /// The ID of the webhook.
  int id;

  /// A list of issue property keys. A change of those issue properties triggers the `issue_property_set` or `issue_property_deleted` webhooks. If this parameter is not present, the app is notified about all issue property updates.
  List<String> issuePropertyKeysFilter;

  /// The JQL filter that specifies which issues the webhook is sent for.
  String jqlFilter;

  /// The URL that specifies where the webhooks are sent.
  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Webhook &&
    _deepEquality.equals(other.events, events) &&
    other.expirationDate == expirationDate &&
    _deepEquality.equals(other.fieldIdsFilter, fieldIdsFilter) &&
    other.id == id &&
    _deepEquality.equals(other.issuePropertyKeysFilter, issuePropertyKeysFilter) &&
    other.jqlFilter == jqlFilter &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (events.hashCode) +
    (expirationDate == null ? 0 : expirationDate!.hashCode) +
    (fieldIdsFilter.hashCode) +
    (id.hashCode) +
    (issuePropertyKeysFilter.hashCode) +
    (jqlFilter.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'Webhook[events=$events, expirationDate=$expirationDate, fieldIdsFilter=$fieldIdsFilter, id=$id, issuePropertyKeysFilter=$issuePropertyKeysFilter, jqlFilter=$jqlFilter, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'events'] = this.events;
    if (this.expirationDate != null) {
      json[r'expirationDate'] = this.expirationDate;
    } else {
      json[r'expirationDate'] = null;
    }
      json[r'fieldIdsFilter'] = this.fieldIdsFilter;
      json[r'id'] = this.id;
      json[r'issuePropertyKeysFilter'] = this.issuePropertyKeysFilter;
      json[r'jqlFilter'] = this.jqlFilter;
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [Webhook] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Webhook? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'events'), 'Required key "Webhook[events]" is missing from JSON.');
        assert(json[r'events'] != null, 'Required key "Webhook[events]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "Webhook[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Webhook[id]" has a null value in JSON.');
        assert(json.containsKey(r'jqlFilter'), 'Required key "Webhook[jqlFilter]" is missing from JSON.');
        assert(json[r'jqlFilter'] != null, 'Required key "Webhook[jqlFilter]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "Webhook[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "Webhook[url]" has a null value in JSON.');
        return true;
      }());

      return Webhook(
        events: WebhookEventsEnum.listFromJson(json[r'events']),
        expirationDate: mapValueOfType<int>(json, r'expirationDate'),
        fieldIdsFilter: json[r'fieldIdsFilter'] is Iterable
            ? (json[r'fieldIdsFilter'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        id: mapValueOfType<int>(json, r'id')!,
        issuePropertyKeysFilter: json[r'issuePropertyKeysFilter'] is Iterable
            ? (json[r'issuePropertyKeysFilter'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        jqlFilter: mapValueOfType<String>(json, r'jqlFilter')!,
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<Webhook> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Webhook>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Webhook.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Webhook> mapFromJson(dynamic json) {
    final map = <String, Webhook>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Webhook.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Webhook-objects as value to a dart map
  static Map<String, List<Webhook>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Webhook>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Webhook.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'events',
    'id',
    'jqlFilter',
    'url',
  };
}


enum WebhookEventsEnum {
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
  const WebhookEventsEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WebhookEventsEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WebhookEventsEnum? fromJson(dynamic value) => WebhookEventsEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WebhookEventsEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WebhookEventsEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WebhookEventsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WebhookEventsEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WebhookEventsEnum] to String,
/// and [decode] dynamic data back to [WebhookEventsEnum].
class WebhookEventsEnumTypeTransformer {
  factory WebhookEventsEnumTypeTransformer() => _instance ??= const WebhookEventsEnumTypeTransformer._();

  const WebhookEventsEnumTypeTransformer._();

  String encode(WebhookEventsEnum data) => data._value;

  /// Returns the instance of [WebhookEventsEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WebhookEventsEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WebhookEventsEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'jira:issue_created': return WebhookEventsEnum.jiraColonIssueCreated;
        case r'jira:issue_updated': return WebhookEventsEnum.jiraColonIssueUpdated;
        case r'jira:issue_deleted': return WebhookEventsEnum.jiraColonIssueDeleted;
        case r'comment_created': return WebhookEventsEnum.commentCreated;
        case r'comment_updated': return WebhookEventsEnum.commentUpdated;
        case r'comment_deleted': return WebhookEventsEnum.commentDeleted;
        case r'issue_property_set': return WebhookEventsEnum.issuePropertySet;
        case r'issue_property_deleted': return WebhookEventsEnum.issuePropertyDeleted;
        case r'sprint_created': return WebhookEventsEnum.sprintCreated;
        case r'sprint_updated': return WebhookEventsEnum.sprintUpdated;
        case r'sprint_closed': return WebhookEventsEnum.sprintClosed;
        case r'sprint_deleted': return WebhookEventsEnum.sprintDeleted;
        case r'sprint_started': return WebhookEventsEnum.sprintStarted;
        case r'jira:version_released': return WebhookEventsEnum.jiraColonVersionReleased;
        case r'jira:version_unreleased': return WebhookEventsEnum.jiraColonVersionUnreleased;
        case r'jira:version_created': return WebhookEventsEnum.jiraColonVersionCreated;
        case r'jira:version_moved': return WebhookEventsEnum.jiraColonVersionMoved;
        case r'jira:version_updated': return WebhookEventsEnum.jiraColonVersionUpdated;
        case r'jira:version_merged': return WebhookEventsEnum.jiraColonVersionMerged;
        case r'jira:version_deleted': return WebhookEventsEnum.jiraColonVersionDeleted;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WebhookEventsEnumTypeTransformer? _instance;
}


