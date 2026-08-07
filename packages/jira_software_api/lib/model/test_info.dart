//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TestInfo {
  /// Returns a new [TestInfo] instance.
  TestInfo({
    required this.totalNumber,
    required this.numberPassed,
    required this.numberFailed,
    this.numberSkipped = 0,
  });

  /// The total number of tests considered during a build. 
  int totalNumber;

  /// The number of tests that passed during a build. 
  int numberPassed;

  /// The number of tests that failed during a build. 
  int numberFailed;

  /// The number of tests that were skipped during a build. 
  int numberSkipped;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestInfo &&
    other.totalNumber == totalNumber &&
    other.numberPassed == numberPassed &&
    other.numberFailed == numberFailed &&
    other.numberSkipped == numberSkipped;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (totalNumber.hashCode) +
    (numberPassed.hashCode) +
    (numberFailed.hashCode) +
    (numberSkipped.hashCode);

  @override
  String toString() => 'TestInfo[totalNumber=$totalNumber, numberPassed=$numberPassed, numberFailed=$numberFailed, numberSkipped=$numberSkipped]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'totalNumber'] = this.totalNumber;
      json[r'numberPassed'] = this.numberPassed;
      json[r'numberFailed'] = this.numberFailed;
      json[r'numberSkipped'] = this.numberSkipped;
    return json;
  }

  /// Returns a new [TestInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'totalNumber'), 'Required key "TestInfo[totalNumber]" is missing from JSON.');
        assert(json[r'totalNumber'] != null, 'Required key "TestInfo[totalNumber]" has a null value in JSON.');
        assert(json.containsKey(r'numberPassed'), 'Required key "TestInfo[numberPassed]" is missing from JSON.');
        assert(json[r'numberPassed'] != null, 'Required key "TestInfo[numberPassed]" has a null value in JSON.');
        assert(json.containsKey(r'numberFailed'), 'Required key "TestInfo[numberFailed]" is missing from JSON.');
        assert(json[r'numberFailed'] != null, 'Required key "TestInfo[numberFailed]" has a null value in JSON.');
        return true;
      }());

      return TestInfo(
        totalNumber: mapValueOfType<int>(json, r'totalNumber')!,
        numberPassed: mapValueOfType<int>(json, r'numberPassed')!,
        numberFailed: mapValueOfType<int>(json, r'numberFailed')!,
        numberSkipped: mapValueOfType<int>(json, r'numberSkipped') ?? 0,
      );
    }
    return null;
  }

  static List<TestInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestInfo> mapFromJson(dynamic json) {
    final map = <String, TestInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestInfo-objects as value to a dart map
  static Map<String, List<TestInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'totalNumber',
    'numberPassed',
    'numberFailed',
  };
}

