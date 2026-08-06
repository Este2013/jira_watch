//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueLayoutPayload {
  /// Returns a new [IssueLayoutPayload] instance.
  IssueLayoutPayload({
    this.containerId,
    this.issueLayoutType,
    this.items = const [],
    this.pcri,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? containerId;

  /// The issue layout type
  IssueLayoutPayloadIssueLayoutTypeEnum? issueLayoutType;

  /// The configuration of items in the issue layout
  List<IssueLayoutItemPayload> items;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueLayoutPayload &&
    other.containerId == containerId &&
    other.issueLayoutType == issueLayoutType &&
    _deepEquality.equals(other.items, items) &&
    other.pcri == pcri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (containerId == null ? 0 : containerId!.hashCode) +
    (issueLayoutType == null ? 0 : issueLayoutType!.hashCode) +
    (items.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode);

  @override
  String toString() => 'IssueLayoutPayload[containerId=$containerId, issueLayoutType=$issueLayoutType, items=$items, pcri=$pcri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.containerId != null) {
      json[r'containerId'] = this.containerId;
    } else {
      json[r'containerId'] = null;
    }
    if (this.issueLayoutType != null) {
      json[r'issueLayoutType'] = this.issueLayoutType;
    } else {
      json[r'issueLayoutType'] = null;
    }
      json[r'items'] = this.items;
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
    return json;
  }

  /// Returns a new [IssueLayoutPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueLayoutPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueLayoutPayload(
        containerId: ProjectCreateResourceIdentifier.fromJson(json[r'containerId']),
        issueLayoutType: IssueLayoutPayloadIssueLayoutTypeEnum.fromJson(json[r'issueLayoutType']),
        items: IssueLayoutItemPayload.listFromJson(json[r'items']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
      );
    }
    return null;
  }

  static List<IssueLayoutPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueLayoutPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueLayoutPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueLayoutPayload> mapFromJson(dynamic json) {
    final map = <String, IssueLayoutPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueLayoutPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueLayoutPayload-objects as value to a dart map
  static Map<String, List<IssueLayoutPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueLayoutPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueLayoutPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The issue layout type
enum IssueLayoutPayloadIssueLayoutTypeEnum {
  ISSUE_VIEW._(r'ISSUE_VIEW'),
  ISSUE_CREATE._(r'ISSUE_CREATE'),
  REQUEST_FORM._(r'REQUEST_FORM'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueLayoutPayloadIssueLayoutTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueLayoutPayloadIssueLayoutTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueLayoutPayloadIssueLayoutTypeEnum? fromJson(dynamic value) => IssueLayoutPayloadIssueLayoutTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueLayoutPayloadIssueLayoutTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueLayoutPayloadIssueLayoutTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueLayoutPayloadIssueLayoutTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueLayoutPayloadIssueLayoutTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueLayoutPayloadIssueLayoutTypeEnum] to String,
/// and [decode] dynamic data back to [IssueLayoutPayloadIssueLayoutTypeEnum].
class IssueLayoutPayloadIssueLayoutTypeEnumTypeTransformer {
  factory IssueLayoutPayloadIssueLayoutTypeEnumTypeTransformer() => _instance ??= const IssueLayoutPayloadIssueLayoutTypeEnumTypeTransformer._();

  const IssueLayoutPayloadIssueLayoutTypeEnumTypeTransformer._();

  String encode(IssueLayoutPayloadIssueLayoutTypeEnum data) => data._value;

  /// Returns the instance of [IssueLayoutPayloadIssueLayoutTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueLayoutPayloadIssueLayoutTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueLayoutPayloadIssueLayoutTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ISSUE_VIEW': return IssueLayoutPayloadIssueLayoutTypeEnum.ISSUE_VIEW;
        case r'ISSUE_CREATE': return IssueLayoutPayloadIssueLayoutTypeEnum.ISSUE_CREATE;
        case r'REQUEST_FORM': return IssueLayoutPayloadIssueLayoutTypeEnum.REQUEST_FORM;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueLayoutPayloadIssueLayoutTypeEnumTypeTransformer? _instance;
}


