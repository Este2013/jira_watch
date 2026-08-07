//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UiModificationContextDetails {
  /// Returns a new [UiModificationContextDetails] instance.
  UiModificationContextDetails({
    this.id,
    this.isAvailable,
    this.issueTypeId,
    this.portalId,
    this.projectId,
    this.requestTypeId,
    this.viewType,
  });

  /// The ID of the UI modification context.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Whether a context is available. For example, when a project is deleted the context becomes unavailable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isAvailable;

  /// The issue type ID of the context. Null is treated as a wildcard, meaning the UI modification will be applied to all issue types. Each UI modification context can have a maximum of one wildcard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueTypeId;

  /// The portal ID of the context. Only required for Jira Service Management request create portal view (`JSMRequestCreate`).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? portalId;

  /// The project ID of the context. Null is treated as a wildcard, meaning the UI modification will be applied to all projects. Each UI modification context can have a maximum of one wildcard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  /// The request type ID of the context. Only required for Jira Service Management request create portal view (`JSMRequestCreate`).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? requestTypeId;

  /// The view type of the context.   Supported values:   *  `GIC` \\- Jira global issue create  *  `IssueView` \\- Jira issue view  *  `IssueTransition` \\- Jira issue transition  *  `JSMRequestCreate` \\- Jira Service Management request create portal view  For Jira view types (`GIC`, `IssueView`, `IssueTransition`), null is treated as a wildcard, meaning the UI modification will be applied to all view types. Each Jira context can have a maximum of one wildcard.      Wildcards are not applicable for JSM contexts.
  UiModificationContextDetailsViewTypeEnum? viewType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UiModificationContextDetails &&
    other.id == id &&
    other.isAvailable == isAvailable &&
    other.issueTypeId == issueTypeId &&
    other.portalId == portalId &&
    other.projectId == projectId &&
    other.requestTypeId == requestTypeId &&
    other.viewType == viewType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (isAvailable == null ? 0 : isAvailable!.hashCode) +
    (issueTypeId == null ? 0 : issueTypeId!.hashCode) +
    (portalId == null ? 0 : portalId!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (requestTypeId == null ? 0 : requestTypeId!.hashCode) +
    (viewType == null ? 0 : viewType!.hashCode);

  @override
  String toString() => 'UiModificationContextDetails[id=$id, isAvailable=$isAvailable, issueTypeId=$issueTypeId, portalId=$portalId, projectId=$projectId, requestTypeId=$requestTypeId, viewType=$viewType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.issueTypeId != null) {
      json[r'issueTypeId'] = this.issueTypeId;
    } else {
      json[r'issueTypeId'] = null;
    }
    if (this.portalId != null) {
      json[r'portalId'] = this.portalId;
    } else {
      json[r'portalId'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.requestTypeId != null) {
      json[r'requestTypeId'] = this.requestTypeId;
    } else {
      json[r'requestTypeId'] = null;
    }
    if (this.viewType != null) {
      json[r'viewType'] = this.viewType;
    } else {
      json[r'viewType'] = null;
    }
    return json;
  }

  /// Returns a new [UiModificationContextDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UiModificationContextDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UiModificationContextDetails(
        id: mapValueOfType<String>(json, r'id'),
        isAvailable: mapValueOfType<bool>(json, r'isAvailable'),
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId'),
        portalId: mapValueOfType<String>(json, r'portalId'),
        projectId: mapValueOfType<String>(json, r'projectId'),
        requestTypeId: mapValueOfType<String>(json, r'requestTypeId'),
        viewType: UiModificationContextDetailsViewTypeEnum.fromJson(json[r'viewType']),
      );
    }
    return null;
  }

  static List<UiModificationContextDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UiModificationContextDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UiModificationContextDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UiModificationContextDetails> mapFromJson(dynamic json) {
    final map = <String, UiModificationContextDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UiModificationContextDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UiModificationContextDetails-objects as value to a dart map
  static Map<String, List<UiModificationContextDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UiModificationContextDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UiModificationContextDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The view type of the context.   Supported values:   *  `GIC` \\- Jira global issue create  *  `IssueView` \\- Jira issue view  *  `IssueTransition` \\- Jira issue transition  *  `JSMRequestCreate` \\- Jira Service Management request create portal view  For Jira view types (`GIC`, `IssueView`, `IssueTransition`), null is treated as a wildcard, meaning the UI modification will be applied to all view types. Each Jira context can have a maximum of one wildcard.      Wildcards are not applicable for JSM contexts.
enum UiModificationContextDetailsViewTypeEnum {
  GIC._(r'GIC'),
  issueView._(r'IssueView'),
  issueTransition._(r'IssueTransition'),
  jSMRequestCreate._(r'JSMRequestCreate'),
  ;

  /// Instantiate a new enum with the provided value.
  const UiModificationContextDetailsViewTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UiModificationContextDetailsViewTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UiModificationContextDetailsViewTypeEnum? fromJson(dynamic value) => UiModificationContextDetailsViewTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UiModificationContextDetailsViewTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UiModificationContextDetailsViewTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UiModificationContextDetailsViewTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UiModificationContextDetailsViewTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UiModificationContextDetailsViewTypeEnum] to String,
/// and [decode] dynamic data back to [UiModificationContextDetailsViewTypeEnum].
class UiModificationContextDetailsViewTypeEnumTypeTransformer {
  factory UiModificationContextDetailsViewTypeEnumTypeTransformer() => _instance ??= const UiModificationContextDetailsViewTypeEnumTypeTransformer._();

  const UiModificationContextDetailsViewTypeEnumTypeTransformer._();

  String encode(UiModificationContextDetailsViewTypeEnum data) => data._value;

  /// Returns the instance of [UiModificationContextDetailsViewTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UiModificationContextDetailsViewTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UiModificationContextDetailsViewTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'GIC': return UiModificationContextDetailsViewTypeEnum.GIC;
        case r'IssueView': return UiModificationContextDetailsViewTypeEnum.issueView;
        case r'IssueTransition': return UiModificationContextDetailsViewTypeEnum.issueTransition;
        case r'JSMRequestCreate': return UiModificationContextDetailsViewTypeEnum.jSMRequestCreate;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UiModificationContextDetailsViewTypeEnumTypeTransformer? _instance;
}


