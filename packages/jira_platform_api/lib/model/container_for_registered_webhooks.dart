//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerForRegisteredWebhooks {
  /// Returns a new [ContainerForRegisteredWebhooks] instance.
  ContainerForRegisteredWebhooks({
    this.webhookRegistrationResult = const [],
  });

  /// A list of registered webhooks.
  List<RegisteredWebhook> webhookRegistrationResult;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerForRegisteredWebhooks &&
    _deepEquality.equals(other.webhookRegistrationResult, webhookRegistrationResult);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (webhookRegistrationResult.hashCode);

  @override
  String toString() => 'ContainerForRegisteredWebhooks[webhookRegistrationResult=$webhookRegistrationResult]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'webhookRegistrationResult'] = this.webhookRegistrationResult;
    return json;
  }

  /// Returns a new [ContainerForRegisteredWebhooks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerForRegisteredWebhooks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ContainerForRegisteredWebhooks(
        webhookRegistrationResult: RegisteredWebhook.listFromJson(json[r'webhookRegistrationResult']),
      );
    }
    return null;
  }

  static List<ContainerForRegisteredWebhooks> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerForRegisteredWebhooks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerForRegisteredWebhooks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerForRegisteredWebhooks> mapFromJson(dynamic json) {
    final map = <String, ContainerForRegisteredWebhooks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerForRegisteredWebhooks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerForRegisteredWebhooks-objects as value to a dart map
  static Map<String, List<ContainerForRegisteredWebhooks>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerForRegisteredWebhooks>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerForRegisteredWebhooks.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

