//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FailedWebhook {
  /// Returns a new [FailedWebhook] instance.
  FailedWebhook({
    this.body,
    required this.failureTime,
    required this.id,
    required this.url,
  });

  /// The webhook body.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? body;

  /// The time the webhook was added to the list of failed webhooks (that is, the time of the last failed retry).
  int failureTime;

  /// The webhook ID, as sent in the `X-Atlassian-Webhook-Identifier` header with the webhook.
  String id;

  /// The original webhook destination.
  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FailedWebhook &&
    other.body == body &&
    other.failureTime == failureTime &&
    other.id == id &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (body == null ? 0 : body!.hashCode) +
    (failureTime.hashCode) +
    (id.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'FailedWebhook[body=$body, failureTime=$failureTime, id=$id, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
      json[r'failureTime'] = this.failureTime;
      json[r'id'] = this.id;
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [FailedWebhook] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FailedWebhook? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'failureTime'), 'Required key "FailedWebhook[failureTime]" is missing from JSON.');
        assert(json[r'failureTime'] != null, 'Required key "FailedWebhook[failureTime]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "FailedWebhook[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "FailedWebhook[id]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "FailedWebhook[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "FailedWebhook[url]" has a null value in JSON.');
        return true;
      }());

      return FailedWebhook(
        body: mapValueOfType<String>(json, r'body'),
        failureTime: mapValueOfType<int>(json, r'failureTime')!,
        id: mapValueOfType<String>(json, r'id')!,
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<FailedWebhook> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FailedWebhook>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FailedWebhook.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FailedWebhook> mapFromJson(dynamic json) {
    final map = <String, FailedWebhook>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FailedWebhook.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FailedWebhook-objects as value to a dart map
  static Map<String, List<FailedWebhook>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FailedWebhook>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FailedWebhook.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'failureTime',
    'id',
    'url',
  };
}

