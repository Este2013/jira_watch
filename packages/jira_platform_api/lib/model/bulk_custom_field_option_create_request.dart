//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkCustomFieldOptionCreateRequest {
  /// Returns a new [BulkCustomFieldOptionCreateRequest] instance.
  BulkCustomFieldOptionCreateRequest({
    this.options = const [],
  });

  /// Details of options to create.
  List<CustomFieldOptionCreate> options;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkCustomFieldOptionCreateRequest &&
    _deepEquality.equals(other.options, options);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (options.hashCode);

  @override
  String toString() => 'BulkCustomFieldOptionCreateRequest[options=$options]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'options'] = this.options;
    return json;
  }

  /// Returns a new [BulkCustomFieldOptionCreateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkCustomFieldOptionCreateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkCustomFieldOptionCreateRequest(
        options: CustomFieldOptionCreate.listFromJson(json[r'options']),
      );
    }
    return null;
  }

  static List<BulkCustomFieldOptionCreateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkCustomFieldOptionCreateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkCustomFieldOptionCreateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkCustomFieldOptionCreateRequest> mapFromJson(dynamic json) {
    final map = <String, BulkCustomFieldOptionCreateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkCustomFieldOptionCreateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkCustomFieldOptionCreateRequest-objects as value to a dart map
  static Map<String, List<BulkCustomFieldOptionCreateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkCustomFieldOptionCreateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkCustomFieldOptionCreateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

