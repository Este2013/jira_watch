//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SingleRedactionRequest {
  /// Returns a new [SingleRedactionRequest] instance.
  SingleRedactionRequest({
    required this.contentItem,
    required this.externalId,
    required this.reason,
    required this.redactionPosition,
  });

  ContentItem contentItem;

  /// Unique id for the redaction request; ID format should be of UUID
  String externalId;

  /// The reason why the content is being redacted
  String reason;

  RedactionPosition redactionPosition;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SingleRedactionRequest &&
    other.contentItem == contentItem &&
    other.externalId == externalId &&
    other.reason == reason &&
    other.redactionPosition == redactionPosition;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contentItem.hashCode) +
    (externalId.hashCode) +
    (reason.hashCode) +
    (redactionPosition.hashCode);

  @override
  String toString() => 'SingleRedactionRequest[contentItem=$contentItem, externalId=$externalId, reason=$reason, redactionPosition=$redactionPosition]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contentItem'] = this.contentItem;
      json[r'externalId'] = this.externalId;
      json[r'reason'] = this.reason;
      json[r'redactionPosition'] = this.redactionPosition;
    return json;
  }

  /// Returns a new [SingleRedactionRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SingleRedactionRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contentItem'), 'Required key "SingleRedactionRequest[contentItem]" is missing from JSON.');
        assert(json[r'contentItem'] != null, 'Required key "SingleRedactionRequest[contentItem]" has a null value in JSON.');
        assert(json.containsKey(r'externalId'), 'Required key "SingleRedactionRequest[externalId]" is missing from JSON.');
        assert(json[r'externalId'] != null, 'Required key "SingleRedactionRequest[externalId]" has a null value in JSON.');
        assert(json.containsKey(r'reason'), 'Required key "SingleRedactionRequest[reason]" is missing from JSON.');
        assert(json[r'reason'] != null, 'Required key "SingleRedactionRequest[reason]" has a null value in JSON.');
        assert(json.containsKey(r'redactionPosition'), 'Required key "SingleRedactionRequest[redactionPosition]" is missing from JSON.');
        assert(json[r'redactionPosition'] != null, 'Required key "SingleRedactionRequest[redactionPosition]" has a null value in JSON.');
        return true;
      }());

      return SingleRedactionRequest(
        contentItem: ContentItem.fromJson(json[r'contentItem'])!,
        externalId: mapValueOfType<String>(json, r'externalId')!,
        reason: mapValueOfType<String>(json, r'reason')!,
        redactionPosition: RedactionPosition.fromJson(json[r'redactionPosition'])!,
      );
    }
    return null;
  }

  static List<SingleRedactionRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SingleRedactionRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SingleRedactionRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SingleRedactionRequest> mapFromJson(dynamic json) {
    final map = <String, SingleRedactionRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SingleRedactionRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SingleRedactionRequest-objects as value to a dart map
  static Map<String, List<SingleRedactionRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SingleRedactionRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SingleRedactionRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contentItem',
    'externalId',
    'reason',
    'redactionPosition',
  };
}

