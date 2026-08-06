//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTransition {
  /// Returns a new [IssueTransition] instance.
  IssueTransition({
    this.expand,
    this.fields = const {},
    this.hasScreen,
    this.id,
    this.isAvailable,
    this.isConditional,
    this.isGlobal,
    this.isInitial,
    this.looped,
    this.name,
    this.to,
  });

  /// Expand options that include additional transition details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// Details of the fields associated with the issue transition screen. Use this information to populate `fields` and `update` in a transition request.
  Map<String, FieldMetadata> fields;

  /// Whether there is a screen associated with the issue transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hasScreen;

  /// The ID of the issue transition. Required when specifying a transition to undertake.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Whether the transition is available to be performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isAvailable;

  /// Whether the issue has to meet criteria before the issue transition is applied.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isConditional;

  /// Whether the issue transition is global, that is, the transition is applied to issues regardless of their status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isGlobal;

  /// Whether this is the initial issue transition for the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isInitial;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? looped;

  /// The name of the issue transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Details of the issue status after the transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusDetails? to;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTransition &&
    other.expand == expand &&
    _deepEquality.equals(other.fields, fields) &&
    other.hasScreen == hasScreen &&
    other.id == id &&
    other.isAvailable == isAvailable &&
    other.isConditional == isConditional &&
    other.isGlobal == isGlobal &&
    other.isInitial == isInitial &&
    other.looped == looped &&
    other.name == name &&
    other.to == to;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expand == null ? 0 : expand!.hashCode) +
    (fields.hashCode) +
    (hasScreen == null ? 0 : hasScreen!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isAvailable == null ? 0 : isAvailable!.hashCode) +
    (isConditional == null ? 0 : isConditional!.hashCode) +
    (isGlobal == null ? 0 : isGlobal!.hashCode) +
    (isInitial == null ? 0 : isInitial!.hashCode) +
    (looped == null ? 0 : looped!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (to == null ? 0 : to!.hashCode);

  @override
  String toString() => 'IssueTransition[expand=$expand, fields=$fields, hasScreen=$hasScreen, id=$id, isAvailable=$isAvailable, isConditional=$isConditional, isGlobal=$isGlobal, isInitial=$isInitial, looped=$looped, name=$name, to=$to]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
      json[r'fields'] = this.fields;
    if (this.hasScreen != null) {
      json[r'hasScreen'] = this.hasScreen;
    } else {
      json[r'hasScreen'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.isAvailable != null) {
      json[r'isAvailable'] = this.isAvailable;
    } else {
      json[r'isAvailable'] = null;
    }
    if (this.isConditional != null) {
      json[r'isConditional'] = this.isConditional;
    } else {
      json[r'isConditional'] = null;
    }
    if (this.isGlobal != null) {
      json[r'isGlobal'] = this.isGlobal;
    } else {
      json[r'isGlobal'] = null;
    }
    if (this.isInitial != null) {
      json[r'isInitial'] = this.isInitial;
    } else {
      json[r'isInitial'] = null;
    }
    if (this.looped != null) {
      json[r'looped'] = this.looped;
    } else {
      json[r'looped'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTransition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTransition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTransition(
        expand: mapValueOfType<String>(json, r'expand'),
        fields: FieldMetadata.mapFromJson(json[r'fields']),
        hasScreen: mapValueOfType<bool>(json, r'hasScreen'),
        id: mapValueOfType<String>(json, r'id'),
        isAvailable: mapValueOfType<bool>(json, r'isAvailable'),
        isConditional: mapValueOfType<bool>(json, r'isConditional'),
        isGlobal: mapValueOfType<bool>(json, r'isGlobal'),
        isInitial: mapValueOfType<bool>(json, r'isInitial'),
        looped: mapValueOfType<bool>(json, r'looped'),
        name: mapValueOfType<String>(json, r'name'),
        to: StatusDetails.fromJson(json[r'to']),
      );
    }
    return null;
  }

  static List<IssueTransition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTransition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTransition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTransition> mapFromJson(dynamic json) {
    final map = <String, IssueTransition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTransition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTransition-objects as value to a dart map
  static Map<String, List<IssueTransition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTransition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTransition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

