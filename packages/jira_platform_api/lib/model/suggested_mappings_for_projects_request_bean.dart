//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SuggestedMappingsForProjectsRequestBean {
  /// Returns a new [SuggestedMappingsForProjectsRequestBean] instance.
  SuggestedMappingsForProjectsRequestBean({
    this.add = const [],
  });

  /// The ids of projects being added to the scheme.
  List<int> add;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SuggestedMappingsForProjectsRequestBean &&
    _deepEquality.equals(other.add, add);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (add.hashCode);

  @override
  String toString() => 'SuggestedMappingsForProjectsRequestBean[add=$add]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'add'] = this.add;
    return json;
  }

  /// Returns a new [SuggestedMappingsForProjectsRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SuggestedMappingsForProjectsRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SuggestedMappingsForProjectsRequestBean(
        add: json[r'add'] is Iterable
            ? (json[r'add'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SuggestedMappingsForProjectsRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SuggestedMappingsForProjectsRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SuggestedMappingsForProjectsRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SuggestedMappingsForProjectsRequestBean> mapFromJson(dynamic json) {
    final map = <String, SuggestedMappingsForProjectsRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SuggestedMappingsForProjectsRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SuggestedMappingsForProjectsRequestBean-objects as value to a dart map
  static Map<String, List<SuggestedMappingsForProjectsRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SuggestedMappingsForProjectsRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SuggestedMappingsForProjectsRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

