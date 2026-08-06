//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProviderMetadata1 {
  /// Returns a new [ProviderMetadata1] instance.
  ProviderMetadata1({
    this.product,
  });

  /// An optional name of the source of the incidents.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? product;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProviderMetadata1 &&
    other.product == product;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (product == null ? 0 : product!.hashCode);

  @override
  String toString() => 'ProviderMetadata1[product=$product]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.product != null) {
      json[r'product'] = this.product;
    } else {
      json[r'product'] = null;
    }
    return json;
  }

  /// Returns a new [ProviderMetadata1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProviderMetadata1? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProviderMetadata1(
        product: mapValueOfType<String>(json, r'product'),
      );
    }
    return null;
  }

  static List<ProviderMetadata1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProviderMetadata1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProviderMetadata1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProviderMetadata1> mapFromJson(dynamic json) {
    final map = <String, ProviderMetadata1>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProviderMetadata1.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProviderMetadata1-objects as value to a dart map
  static Map<String, List<ProviderMetadata1>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProviderMetadata1>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProviderMetadata1.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

