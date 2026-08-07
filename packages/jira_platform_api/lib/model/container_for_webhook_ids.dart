//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerForWebhookIDs {
  /// Returns a new [ContainerForWebhookIDs] instance.
  ContainerForWebhookIDs({
    this.webhookIds = const [],
  });

  /// A list of webhook IDs.
  List<int> webhookIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerForWebhookIDs &&
    _deepEquality.equals(other.webhookIds, webhookIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (webhookIds.hashCode);

  @override
  String toString() => 'ContainerForWebhookIDs[webhookIds=$webhookIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'webhookIds'] = this.webhookIds;
    return json;
  }

  /// Returns a new [ContainerForWebhookIDs] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerForWebhookIDs? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'webhookIds'), 'Required key "ContainerForWebhookIDs[webhookIds]" is missing from JSON.');
        assert(json[r'webhookIds'] != null, 'Required key "ContainerForWebhookIDs[webhookIds]" has a null value in JSON.');
        return true;
      }());

      return ContainerForWebhookIDs(
        webhookIds: json[r'webhookIds'] is Iterable
            ? (json[r'webhookIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ContainerForWebhookIDs> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerForWebhookIDs>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerForWebhookIDs.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerForWebhookIDs> mapFromJson(dynamic json) {
    final map = <String, ContainerForWebhookIDs>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerForWebhookIDs.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerForWebhookIDs-objects as value to a dart map
  static Map<String, List<ContainerForWebhookIDs>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerForWebhookIDs>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerForWebhookIDs.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'webhookIds',
  };
}

