//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConvertContentIdsToContentTypesRequest {
  /// Returns a new [ConvertContentIdsToContentTypesRequest] instance.
  ConvertContentIdsToContentTypesRequest({
    this.contentIds = const [],
  });

  /// The content ids to convert. They may be provided as strings or numbers.
  List<Object> contentIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConvertContentIdsToContentTypesRequest &&
    _deepEquality.equals(other.contentIds, contentIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contentIds.hashCode);

  @override
  String toString() => 'ConvertContentIdsToContentTypesRequest[contentIds=$contentIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contentIds'] = this.contentIds;
    return json;
  }

  /// Returns a new [ConvertContentIdsToContentTypesRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConvertContentIdsToContentTypesRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contentIds'), 'Required key "ConvertContentIdsToContentTypesRequest[contentIds]" is missing from JSON.');
        assert(json[r'contentIds'] != null, 'Required key "ConvertContentIdsToContentTypesRequest[contentIds]" has a null value in JSON.');
        return true;
      }());

      return ConvertContentIdsToContentTypesRequest(
        contentIds: json[r'contentIds'] is Iterable
            ? (json[r'contentIds'] as Iterable).cast<Object>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ConvertContentIdsToContentTypesRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConvertContentIdsToContentTypesRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConvertContentIdsToContentTypesRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConvertContentIdsToContentTypesRequest> mapFromJson(dynamic json) {
    final map = <String, ConvertContentIdsToContentTypesRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConvertContentIdsToContentTypesRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConvertContentIdsToContentTypesRequest-objects as value to a dart map
  static Map<String, List<ConvertContentIdsToContentTypesRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConvertContentIdsToContentTypesRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConvertContentIdsToContentTypesRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contentIds',
  };
}

