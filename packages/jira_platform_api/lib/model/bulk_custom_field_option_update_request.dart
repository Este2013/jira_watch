//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkCustomFieldOptionUpdateRequest {
  /// Returns a new [BulkCustomFieldOptionUpdateRequest] instance.
  BulkCustomFieldOptionUpdateRequest({
    this.options = const [],
  });

  /// Details of the options to update.
  List<CustomFieldOptionUpdate> options;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkCustomFieldOptionUpdateRequest &&
    _deepEquality.equals(other.options, options);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (options.hashCode);

  @override
  String toString() => 'BulkCustomFieldOptionUpdateRequest[options=$options]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'options'] = this.options;
    return json;
  }

  /// Returns a new [BulkCustomFieldOptionUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkCustomFieldOptionUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkCustomFieldOptionUpdateRequest(
        options: CustomFieldOptionUpdate.listFromJson(json[r'options']),
      );
    }
    return null;
  }

  static List<BulkCustomFieldOptionUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkCustomFieldOptionUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkCustomFieldOptionUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkCustomFieldOptionUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, BulkCustomFieldOptionUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkCustomFieldOptionUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkCustomFieldOptionUpdateRequest-objects as value to a dart map
  static Map<String, List<BulkCustomFieldOptionUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkCustomFieldOptionUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkCustomFieldOptionUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

