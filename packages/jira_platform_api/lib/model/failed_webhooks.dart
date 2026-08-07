//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FailedWebhooks {
  /// Returns a new [FailedWebhooks] instance.
  FailedWebhooks({
    required this.maxResults,
    this.next,
    this.values = const [],
  });

  /// The maximum number of items on the page. If the list of values is shorter than this number, then there are no more pages.
  int maxResults;

  /// The URL to the next page of results. Present only if the request returned at least one result.The next page may be empty at the time of receiving the response, but new failed webhooks may appear in time. You can save the URL to the next page and query for new results periodically (for example, every hour).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? next;

  /// The list of webhooks.
  List<FailedWebhook> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FailedWebhooks &&
    other.maxResults == maxResults &&
    other.next == next &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (maxResults.hashCode) +
    (next == null ? 0 : next!.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'FailedWebhooks[maxResults=$maxResults, next=$next, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'maxResults'] = this.maxResults;
    if (this.next != null) {
      json[r'next'] = this.next;
    } else {
      json[r'next'] = null;
    }
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [FailedWebhooks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FailedWebhooks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'maxResults'), 'Required key "FailedWebhooks[maxResults]" is missing from JSON.');
        assert(json[r'maxResults'] != null, 'Required key "FailedWebhooks[maxResults]" has a null value in JSON.');
        assert(json.containsKey(r'values'), 'Required key "FailedWebhooks[values]" is missing from JSON.');
        assert(json[r'values'] != null, 'Required key "FailedWebhooks[values]" has a null value in JSON.');
        return true;
      }());

      return FailedWebhooks(
        maxResults: mapValueOfType<int>(json, r'maxResults')!,
        next: mapValueOfType<String>(json, r'next'),
        values: FailedWebhook.listFromJson(json[r'values']),
      );
    }
    return null;
  }

  static List<FailedWebhooks> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FailedWebhooks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FailedWebhooks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FailedWebhooks> mapFromJson(dynamic json) {
    final map = <String, FailedWebhooks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FailedWebhooks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FailedWebhooks-objects as value to a dart map
  static Map<String, List<FailedWebhooks>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FailedWebhooks>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FailedWebhooks.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'maxResults',
    'values',
  };
}

