//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueUpdateDetails {
  /// Returns a new [IssueUpdateDetails] instance.
  IssueUpdateDetails({
    this.fields = const {},
    this.historyMetadata,
    this.properties = const [],
    this.transition,
    this.update = const {},
  });

  /// List of issue screen fields to update, specifying the sub-field to update and its value for each field. This field provides a straightforward option when setting a sub-field. When multiple sub-fields or other operations are required, use `update`. Fields included in here cannot be included in `update`.
  Map<String, Object> fields;

  /// Additional issue history details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  HistoryMetadata? historyMetadata;

  /// Details of issue properties to be add or update.
  List<EntityProperty> properties;

  /// Details of a transition. Required when performing a transition, optional when creating or editing an issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueTransition? transition;

  /// A Map containing the field field name and a list of operations to perform on the issue screen field. Note that fields included in here cannot be included in `fields`.
  Map<String, List<FieldUpdateOperation>> update;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueUpdateDetails &&
    _deepEquality.equals(other.fields, fields) &&
    other.historyMetadata == historyMetadata &&
    _deepEquality.equals(other.properties, properties) &&
    other.transition == transition &&
    _deepEquality.equals(other.update, update);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fields.hashCode) +
    (historyMetadata == null ? 0 : historyMetadata!.hashCode) +
    (properties.hashCode) +
    (transition == null ? 0 : transition!.hashCode) +
    (update.hashCode);

  @override
  String toString() => 'IssueUpdateDetails[fields=$fields, historyMetadata=$historyMetadata, properties=$properties, transition=$transition, update=$update]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fields'] = this.fields;
    if (this.historyMetadata != null) {
      json[r'historyMetadata'] = this.historyMetadata;
    } else {
      json[r'historyMetadata'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.transition != null) {
      json[r'transition'] = this.transition;
    } else {
      json[r'transition'] = null;
    }
      json[r'update'] = this.update;
    return json;
  }

  /// Returns a new [IssueUpdateDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueUpdateDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueUpdateDetails(
        fields: mapCastOfType<String, Object>(json, r'fields') ?? const {},
        historyMetadata: HistoryMetadata.fromJson(json[r'historyMetadata']),
        properties: EntityProperty.listFromJson(json[r'properties']),
        transition: IssueTransition.fromJson(json[r'transition']),
        update: json[r'update'] == null
          ? const {}
            : FieldUpdateOperation.mapListFromJson(json[r'update']),
      );
    }
    return null;
  }

  static List<IssueUpdateDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueUpdateDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueUpdateDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueUpdateDetails> mapFromJson(dynamic json) {
    final map = <String, IssueUpdateDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueUpdateDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueUpdateDetails-objects as value to a dart map
  static Map<String, List<IssueUpdateDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueUpdateDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueUpdateDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

