//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WebhookRegistrationDetails {
  /// Returns a new [WebhookRegistrationDetails] instance.
  WebhookRegistrationDetails({
    required this.url,
    this.webhooks = const [],
  });

  /// The URL that specifies where to send the webhooks. This URL must use the same base URL as the Connect app. Only a single URL per app is allowed to be registered.
  String url;

  /// A list of webhooks.
  List<WebhookDetails> webhooks;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WebhookRegistrationDetails &&
    other.url == url &&
    _deepEquality.equals(other.webhooks, webhooks);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (url.hashCode) +
    (webhooks.hashCode);

  @override
  String toString() => 'WebhookRegistrationDetails[url=$url, webhooks=$webhooks]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'url'] = this.url;
      json[r'webhooks'] = this.webhooks;
    return json;
  }

  /// Returns a new [WebhookRegistrationDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WebhookRegistrationDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'url'), 'Required key "WebhookRegistrationDetails[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "WebhookRegistrationDetails[url]" has a null value in JSON.');
        assert(json.containsKey(r'webhooks'), 'Required key "WebhookRegistrationDetails[webhooks]" is missing from JSON.');
        assert(json[r'webhooks'] != null, 'Required key "WebhookRegistrationDetails[webhooks]" has a null value in JSON.');
        return true;
      }());

      return WebhookRegistrationDetails(
        url: mapValueOfType<String>(json, r'url')!,
        webhooks: WebhookDetails.listFromJson(json[r'webhooks']),
      );
    }
    return null;
  }

  static List<WebhookRegistrationDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WebhookRegistrationDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WebhookRegistrationDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WebhookRegistrationDetails> mapFromJson(dynamic json) {
    final map = <String, WebhookRegistrationDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WebhookRegistrationDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WebhookRegistrationDetails-objects as value to a dart map
  static Map<String, List<WebhookRegistrationDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WebhookRegistrationDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WebhookRegistrationDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'url',
    'webhooks',
  };
}

