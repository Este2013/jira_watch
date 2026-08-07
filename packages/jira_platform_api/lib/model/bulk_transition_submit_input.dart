//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionSubmitInput {
  /// Returns a new [BulkTransitionSubmitInput] instance.
  BulkTransitionSubmitInput({
    this.selectedIssueIdsOrKeys = const [],
    required this.transitionId,
  });

  /// List of all the issue IDs or keys that are to be bulk transitioned.
  List<String> selectedIssueIdsOrKeys;

  /// The ID of the transition that is to be performed on the issues.
  String transitionId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionSubmitInput &&
    _deepEquality.equals(other.selectedIssueIdsOrKeys, selectedIssueIdsOrKeys) &&
    other.transitionId == transitionId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (selectedIssueIdsOrKeys.hashCode) +
    (transitionId.hashCode);

  @override
  String toString() => 'BulkTransitionSubmitInput[selectedIssueIdsOrKeys=$selectedIssueIdsOrKeys, transitionId=$transitionId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'selectedIssueIdsOrKeys'] = this.selectedIssueIdsOrKeys;
      json[r'transitionId'] = this.transitionId;
    return json;
  }

  /// Returns a new [BulkTransitionSubmitInput] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionSubmitInput? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'selectedIssueIdsOrKeys'), 'Required key "BulkTransitionSubmitInput[selectedIssueIdsOrKeys]" is missing from JSON.');
        assert(json[r'selectedIssueIdsOrKeys'] != null, 'Required key "BulkTransitionSubmitInput[selectedIssueIdsOrKeys]" has a null value in JSON.');
        assert(json.containsKey(r'transitionId'), 'Required key "BulkTransitionSubmitInput[transitionId]" is missing from JSON.');
        assert(json[r'transitionId'] != null, 'Required key "BulkTransitionSubmitInput[transitionId]" has a null value in JSON.');
        return true;
      }());

      return BulkTransitionSubmitInput(
        selectedIssueIdsOrKeys: json[r'selectedIssueIdsOrKeys'] is Iterable
            ? (json[r'selectedIssueIdsOrKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        transitionId: mapValueOfType<String>(json, r'transitionId')!,
      );
    }
    return null;
  }

  static List<BulkTransitionSubmitInput> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionSubmitInput>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionSubmitInput.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionSubmitInput> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionSubmitInput>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionSubmitInput.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionSubmitInput-objects as value to a dart map
  static Map<String, List<BulkTransitionSubmitInput>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionSubmitInput>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionSubmitInput.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'selectedIssueIdsOrKeys',
    'transitionId',
  };
}

