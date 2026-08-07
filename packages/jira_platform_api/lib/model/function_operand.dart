//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FunctionOperand {
  /// Returns a new [FunctionOperand] instance.
  FunctionOperand({
    this.arguments = const [],
    this.encodedOperand,
    required this.function_,
  });

  /// The list of function arguments.
  List<String> arguments;

  /// Encoded operand, which can be used directly in a JQL query.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? encodedOperand;

  /// The name of the function.
  String function_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FunctionOperand &&
    _deepEquality.equals(other.arguments, arguments) &&
    other.encodedOperand == encodedOperand &&
    other.function_ == function_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (arguments.hashCode) +
    (encodedOperand == null ? 0 : encodedOperand!.hashCode) +
    (function_.hashCode);

  @override
  String toString() => 'FunctionOperand[arguments=$arguments, encodedOperand=$encodedOperand, function_=$function_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'arguments'] = this.arguments;
    if (this.encodedOperand != null) {
      json[r'encodedOperand'] = this.encodedOperand;
    } else {
      json[r'encodedOperand'] = null;
    }
      json[r'function'] = this.function_;
    return json;
  }

  /// Returns a new [FunctionOperand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FunctionOperand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'arguments'), 'Required key "FunctionOperand[arguments]" is missing from JSON.');
        assert(json[r'arguments'] != null, 'Required key "FunctionOperand[arguments]" has a null value in JSON.');
        assert(json.containsKey(r'function'), 'Required key "FunctionOperand[function]" is missing from JSON.');
        assert(json[r'function'] != null, 'Required key "FunctionOperand[function]" has a null value in JSON.');
        return true;
      }());

      return FunctionOperand(
        arguments: json[r'arguments'] is Iterable
            ? (json[r'arguments'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        encodedOperand: mapValueOfType<String>(json, r'encodedOperand'),
        function_: mapValueOfType<String>(json, r'function')!,
      );
    }
    return null;
  }

  static List<FunctionOperand> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FunctionOperand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FunctionOperand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FunctionOperand> mapFromJson(dynamic json) {
    final map = <String, FunctionOperand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FunctionOperand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FunctionOperand-objects as value to a dart map
  static Map<String, List<FunctionOperand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FunctionOperand>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FunctionOperand.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'arguments',
    'function',
  };
}

