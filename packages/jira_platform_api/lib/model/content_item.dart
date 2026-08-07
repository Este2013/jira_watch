//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContentItem {
  /// Returns a new [ContentItem] instance.
  ContentItem({
    required this.entityId,
    required this.entityType,
    required this.id,
  });

  /// The ID of the content entity.   *  For redacting an issue field, this will be the field ID (e.g., summary, customfield\\_10000).  *  For redacting a comment, this will be the comment ID.  *  For redacting a worklog, this will be the worklog ID.
  String entityId;

  /// The type of the entity to redact; It will be one of the following:   *  **issuefieldvalue** \\- To redact in issue fields  *  **issue-comment** \\- To redact in issue comments.  *  **issue-worklog** \\- To redact in issue worklogs
  ContentItemEntityTypeEnum entityType;

  /// This would be the issue ID
  String id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContentItem &&
    other.entityId == entityId &&
    other.entityType == entityType &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (entityId.hashCode) +
    (entityType.hashCode) +
    (id.hashCode);

  @override
  String toString() => 'ContentItem[entityId=$entityId, entityType=$entityType, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'entityId'] = this.entityId;
      json[r'entityType'] = this.entityType;
      json[r'id'] = this.id;
    return json;
  }

  /// Returns a new [ContentItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContentItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'entityId'), 'Required key "ContentItem[entityId]" is missing from JSON.');
        assert(json[r'entityId'] != null, 'Required key "ContentItem[entityId]" has a null value in JSON.');
        assert(json.containsKey(r'entityType'), 'Required key "ContentItem[entityType]" is missing from JSON.');
        assert(json[r'entityType'] != null, 'Required key "ContentItem[entityType]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "ContentItem[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "ContentItem[id]" has a null value in JSON.');
        return true;
      }());

      return ContentItem(
        entityId: mapValueOfType<String>(json, r'entityId')!,
        entityType: ContentItemEntityTypeEnum.fromJson(json[r'entityType'])!,
        id: mapValueOfType<String>(json, r'id')!,
      );
    }
    return null;
  }

  static List<ContentItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContentItem> mapFromJson(dynamic json) {
    final map = <String, ContentItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContentItem-objects as value to a dart map
  static Map<String, List<ContentItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContentItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContentItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'entityId',
    'entityType',
    'id',
  };
}

/// The type of the entity to redact; It will be one of the following:   *  **issuefieldvalue** \\- To redact in issue fields  *  **issue-comment** \\- To redact in issue comments.  *  **issue-worklog** \\- To redact in issue worklogs
enum ContentItemEntityTypeEnum {
  issuefieldvalue._(r'issuefieldvalue'),
  issueComment._(r'issue-comment'),
  issueWorklog._(r'issue-worklog'),
  ;

  /// Instantiate a new enum with the provided value.
  const ContentItemEntityTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ContentItemEntityTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ContentItemEntityTypeEnum? fromJson(dynamic value) => ContentItemEntityTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ContentItemEntityTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ContentItemEntityTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentItemEntityTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentItemEntityTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ContentItemEntityTypeEnum] to String,
/// and [decode] dynamic data back to [ContentItemEntityTypeEnum].
class ContentItemEntityTypeEnumTypeTransformer {
  factory ContentItemEntityTypeEnumTypeTransformer() => _instance ??= const ContentItemEntityTypeEnumTypeTransformer._();

  const ContentItemEntityTypeEnumTypeTransformer._();

  String encode(ContentItemEntityTypeEnum data) => data._value;

  /// Returns the instance of [ContentItemEntityTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ContentItemEntityTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ContentItemEntityTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'issuefieldvalue': return ContentItemEntityTypeEnum.issuefieldvalue;
        case r'issue-comment': return ContentItemEntityTypeEnum.issueComment;
        case r'issue-worklog': return ContentItemEntityTypeEnum.issueWorklog;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ContentItemEntityTypeEnumTypeTransformer? _instance;
}


