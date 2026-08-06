//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlFunctionPrecomputationBean {
  /// Returns a new [JqlFunctionPrecomputationBean] instance.
  JqlFunctionPrecomputationBean({
    this.arguments = const [],
    this.created,
    this.error,
    this.field,
    this.functionKey,
    this.functionName,
    this.id,
    this.operator_,
    this.updated,
    this.used,
    this.value,
  });

  /// The list of arguments function was invoked with.
  List<String> arguments;

  /// The timestamp of the precomputation creation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  /// The error message to be displayed to the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  /// The field the function was executed against.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? field;

  /// The function key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? functionKey;

  /// The name of the function.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? functionName;

  /// The id of the precomputation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The operator in context of which function was executed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? operator_;

  /// The timestamp of the precomputation last update.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updated;

  /// The timestamp of the precomputation last usage.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? used;

  /// The JQL fragment stored as the precomputation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlFunctionPrecomputationBean &&
    _deepEquality.equals(other.arguments, arguments) &&
    other.created == created &&
    other.error == error &&
    other.field == field &&
    other.functionKey == functionKey &&
    other.functionName == functionName &&
    other.id == id &&
    other.operator_ == operator_ &&
    other.updated == updated &&
    other.used == used &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (arguments.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (error == null ? 0 : error!.hashCode) +
    (field == null ? 0 : field!.hashCode) +
    (functionKey == null ? 0 : functionKey!.hashCode) +
    (functionName == null ? 0 : functionName!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (operator_ == null ? 0 : operator_!.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (used == null ? 0 : used!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'JqlFunctionPrecomputationBean[arguments=$arguments, created=$created, error=$error, field=$field, functionKey=$functionKey, functionName=$functionName, id=$id, operator_=$operator_, updated=$updated, used=$used, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'arguments'] = this.arguments;
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.field != null) {
      json[r'field'] = this.field;
    } else {
      json[r'field'] = null;
    }
    if (this.functionKey != null) {
      json[r'functionKey'] = this.functionKey;
    } else {
      json[r'functionKey'] = null;
    }
    if (this.functionName != null) {
      json[r'functionName'] = this.functionName;
    } else {
      json[r'functionName'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.operator_ != null) {
      json[r'operator'] = this.operator_;
    } else {
      json[r'operator'] = null;
    }
    if (this.updated != null) {
      json[r'updated'] = this.updated!.toUtc().toIso8601String();
    } else {
      json[r'updated'] = null;
    }
    if (this.used != null) {
      json[r'used'] = this.used!.toUtc().toIso8601String();
    } else {
      json[r'used'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [JqlFunctionPrecomputationBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlFunctionPrecomputationBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JqlFunctionPrecomputationBean(
        arguments: json[r'arguments'] is Iterable
            ? (json[r'arguments'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        created: mapDateTime(json, r'created', r''),
        error: mapValueOfType<String>(json, r'error'),
        field: mapValueOfType<String>(json, r'field'),
        functionKey: mapValueOfType<String>(json, r'functionKey'),
        functionName: mapValueOfType<String>(json, r'functionName'),
        id: mapValueOfType<String>(json, r'id'),
        operator_: mapValueOfType<String>(json, r'operator'),
        updated: mapDateTime(json, r'updated', r''),
        used: mapDateTime(json, r'used', r''),
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<JqlFunctionPrecomputationBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlFunctionPrecomputationBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlFunctionPrecomputationBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlFunctionPrecomputationBean> mapFromJson(dynamic json) {
    final map = <String, JqlFunctionPrecomputationBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlFunctionPrecomputationBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlFunctionPrecomputationBean-objects as value to a dart map
  static Map<String, List<JqlFunctionPrecomputationBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlFunctionPrecomputationBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlFunctionPrecomputationBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

