//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuditRecordBean {
  /// Returns a new [AuditRecordBean] instance.
  AuditRecordBean({
    this.associatedItems = const [],
    this.authorKey,
    this.category,
    this.changedValues = const [],
    this.created,
    this.description,
    this.eventSource,
    this.id,
    this.objectItem,
    this.remoteAddress,
    this.summary,
  });

  /// The list of items associated with the changed record.
  List<AssociatedItemBean> associatedItems;

  /// Deprecated, use `authorAccountId` instead. The key of the user who created the audit record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? authorKey;

  /// The category of the audit record. For a list of these categories, see the help article [Auditing in Jira applications](https://confluence.atlassian.com/x/noXKM).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? category;

  /// The list of values changed in the record event.
  List<ChangedValueBean> changedValues;

  /// The date and time on which the audit record was created.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  /// The description of the audit record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The event the audit record originated from.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? eventSource;

  /// The ID of the audit record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AssociatedItemBean? objectItem;

  /// The URL of the computer where the creation of the audit record was initiated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? remoteAddress;

  /// The summary of the audit record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? summary;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuditRecordBean &&
    _deepEquality.equals(other.associatedItems, associatedItems) &&
    other.authorKey == authorKey &&
    other.category == category &&
    _deepEquality.equals(other.changedValues, changedValues) &&
    other.created == created &&
    other.description == description &&
    other.eventSource == eventSource &&
    other.id == id &&
    other.objectItem == objectItem &&
    other.remoteAddress == remoteAddress &&
    other.summary == summary;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (associatedItems.hashCode) +
    (authorKey == null ? 0 : authorKey!.hashCode) +
    (category == null ? 0 : category!.hashCode) +
    (changedValues.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (eventSource == null ? 0 : eventSource!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (objectItem == null ? 0 : objectItem!.hashCode) +
    (remoteAddress == null ? 0 : remoteAddress!.hashCode) +
    (summary == null ? 0 : summary!.hashCode);

  @override
  String toString() => 'AuditRecordBean[associatedItems=$associatedItems, authorKey=$authorKey, category=$category, changedValues=$changedValues, created=$created, description=$description, eventSource=$eventSource, id=$id, objectItem=$objectItem, remoteAddress=$remoteAddress, summary=$summary]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'associatedItems'] = this.associatedItems;
    if (this.authorKey != null) {
      json[r'authorKey'] = this.authorKey;
    } else {
      json[r'authorKey'] = null;
    }
    if (this.category != null) {
      json[r'category'] = this.category;
    } else {
      json[r'category'] = null;
    }
      json[r'changedValues'] = this.changedValues;
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.eventSource != null) {
      json[r'eventSource'] = this.eventSource;
    } else {
      json[r'eventSource'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.objectItem != null) {
      json[r'objectItem'] = this.objectItem;
    } else {
      json[r'objectItem'] = null;
    }
    if (this.remoteAddress != null) {
      json[r'remoteAddress'] = this.remoteAddress;
    } else {
      json[r'remoteAddress'] = null;
    }
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
    return json;
  }

  /// Returns a new [AuditRecordBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuditRecordBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AuditRecordBean(
        associatedItems: AssociatedItemBean.listFromJson(json[r'associatedItems']),
        authorKey: mapValueOfType<String>(json, r'authorKey'),
        category: mapValueOfType<String>(json, r'category'),
        changedValues: ChangedValueBean.listFromJson(json[r'changedValues']),
        created: mapDateTime(json, r'created', r''),
        description: mapValueOfType<String>(json, r'description'),
        eventSource: mapValueOfType<String>(json, r'eventSource'),
        id: mapValueOfType<int>(json, r'id'),
        objectItem: AssociatedItemBean.fromJson(json[r'objectItem']),
        remoteAddress: mapValueOfType<String>(json, r'remoteAddress'),
        summary: mapValueOfType<String>(json, r'summary'),
      );
    }
    return null;
  }

  static List<AuditRecordBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuditRecordBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuditRecordBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuditRecordBean> mapFromJson(dynamic json) {
    final map = <String, AuditRecordBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuditRecordBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuditRecordBean-objects as value to a dart map
  static Map<String, List<AuditRecordBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuditRecordBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuditRecordBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

