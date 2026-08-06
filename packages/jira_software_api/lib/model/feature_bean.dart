//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureBean {
  /// Returns a new [FeatureBean] instance.
  FeatureBean({
    this.boardFeature,
    this.boardId,
    this.featureId,
    this.featureType,
    this.imageUri,
    this.learnMoreArticleId,
    this.learnMoreLink,
    this.localisedDescription,
    this.localisedGroup,
    this.localisedName,
    this.permissibleEstimationTypes = const [],
    this.state,
    this.toggleLocked,
  });

  FeatureBeanBoardFeatureEnum? boardFeature;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? boardId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? featureId;

  FeatureBeanFeatureTypeEnum? featureType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imageUri;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? learnMoreArticleId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? learnMoreLink;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localisedDescription;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localisedGroup;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localisedName;

  List<GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner> permissibleEstimationTypes;

  FeatureBeanStateEnum? state;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? toggleLocked;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureBean &&
    other.boardFeature == boardFeature &&
    other.boardId == boardId &&
    other.featureId == featureId &&
    other.featureType == featureType &&
    other.imageUri == imageUri &&
    other.learnMoreArticleId == learnMoreArticleId &&
    other.learnMoreLink == learnMoreLink &&
    other.localisedDescription == localisedDescription &&
    other.localisedGroup == localisedGroup &&
    other.localisedName == localisedName &&
    _deepEquality.equals(other.permissibleEstimationTypes, permissibleEstimationTypes) &&
    other.state == state &&
    other.toggleLocked == toggleLocked;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (boardFeature == null ? 0 : boardFeature!.hashCode) +
    (boardId == null ? 0 : boardId!.hashCode) +
    (featureId == null ? 0 : featureId!.hashCode) +
    (featureType == null ? 0 : featureType!.hashCode) +
    (imageUri == null ? 0 : imageUri!.hashCode) +
    (learnMoreArticleId == null ? 0 : learnMoreArticleId!.hashCode) +
    (learnMoreLink == null ? 0 : learnMoreLink!.hashCode) +
    (localisedDescription == null ? 0 : localisedDescription!.hashCode) +
    (localisedGroup == null ? 0 : localisedGroup!.hashCode) +
    (localisedName == null ? 0 : localisedName!.hashCode) +
    (permissibleEstimationTypes.hashCode) +
    (state == null ? 0 : state!.hashCode) +
    (toggleLocked == null ? 0 : toggleLocked!.hashCode);

  @override
  String toString() => 'FeatureBean[boardFeature=$boardFeature, boardId=$boardId, featureId=$featureId, featureType=$featureType, imageUri=$imageUri, learnMoreArticleId=$learnMoreArticleId, learnMoreLink=$learnMoreLink, localisedDescription=$localisedDescription, localisedGroup=$localisedGroup, localisedName=$localisedName, permissibleEstimationTypes=$permissibleEstimationTypes, state=$state, toggleLocked=$toggleLocked]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.boardFeature != null) {
      json[r'boardFeature'] = this.boardFeature;
    } else {
      json[r'boardFeature'] = null;
    }
    if (this.boardId != null) {
      json[r'boardId'] = this.boardId;
    } else {
      json[r'boardId'] = null;
    }
    if (this.featureId != null) {
      json[r'featureId'] = this.featureId;
    } else {
      json[r'featureId'] = null;
    }
    if (this.featureType != null) {
      json[r'featureType'] = this.featureType;
    } else {
      json[r'featureType'] = null;
    }
    if (this.imageUri != null) {
      json[r'imageUri'] = this.imageUri;
    } else {
      json[r'imageUri'] = null;
    }
    if (this.learnMoreArticleId != null) {
      json[r'learnMoreArticleId'] = this.learnMoreArticleId;
    } else {
      json[r'learnMoreArticleId'] = null;
    }
    if (this.learnMoreLink != null) {
      json[r'learnMoreLink'] = this.learnMoreLink;
    } else {
      json[r'learnMoreLink'] = null;
    }
    if (this.localisedDescription != null) {
      json[r'localisedDescription'] = this.localisedDescription;
    } else {
      json[r'localisedDescription'] = null;
    }
    if (this.localisedGroup != null) {
      json[r'localisedGroup'] = this.localisedGroup;
    } else {
      json[r'localisedGroup'] = null;
    }
    if (this.localisedName != null) {
      json[r'localisedName'] = this.localisedName;
    } else {
      json[r'localisedName'] = null;
    }
      json[r'permissibleEstimationTypes'] = this.permissibleEstimationTypes;
    if (this.state != null) {
      json[r'state'] = this.state;
    } else {
      json[r'state'] = null;
    }
    if (this.toggleLocked != null) {
      json[r'toggleLocked'] = this.toggleLocked;
    } else {
      json[r'toggleLocked'] = null;
    }
    return json;
  }

  /// Returns a new [FeatureBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeatureBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FeatureBean(
        boardFeature: FeatureBeanBoardFeatureEnum.fromJson(json[r'boardFeature']),
        boardId: mapValueOfType<int>(json, r'boardId'),
        featureId: mapValueOfType<String>(json, r'featureId'),
        featureType: FeatureBeanFeatureTypeEnum.fromJson(json[r'featureType']),
        imageUri: mapValueOfType<String>(json, r'imageUri'),
        learnMoreArticleId: mapValueOfType<String>(json, r'learnMoreArticleId'),
        learnMoreLink: mapValueOfType<String>(json, r'learnMoreLink'),
        localisedDescription: mapValueOfType<String>(json, r'localisedDescription'),
        localisedGroup: mapValueOfType<String>(json, r'localisedGroup'),
        localisedName: mapValueOfType<String>(json, r'localisedName'),
        permissibleEstimationTypes: GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner.listFromJson(json[r'permissibleEstimationTypes']),
        state: FeatureBeanStateEnum.fromJson(json[r'state']),
        toggleLocked: mapValueOfType<bool>(json, r'toggleLocked'),
      );
    }
    return null;
  }

  static List<FeatureBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeatureBean> mapFromJson(dynamic json) {
    final map = <String, FeatureBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeatureBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeatureBean-objects as value to a dart map
  static Map<String, List<FeatureBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeatureBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeatureBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum FeatureBeanBoardFeatureEnum {
  SIMPLE_ROADMAP._(r'SIMPLE_ROADMAP'),
  BACKLOG._(r'BACKLOG'),
  SPRINTS._(r'SPRINTS'),
  CALENDAR._(r'CALENDAR'),
  DEVTOOLS._(r'DEVTOOLS'),
  REPORTS._(r'REPORTS'),
  ESTIMATION._(r'ESTIMATION'),
  PAGES._(r'PAGES'),
  CODE._(r'CODE'),
  SECURITY._(r'SECURITY'),
  REQUESTS._(r'REQUESTS'),
  INCIDENTS._(r'INCIDENTS'),
  RELEASES._(r'RELEASES'),
  DEPLOYMENTS._(r'DEPLOYMENTS'),
  ISSUE_NAVIGATOR._(r'ISSUE_NAVIGATOR'),
  ON_CALL_SCHEDULE._(r'ON_CALL_SCHEDULE'),
  BOARD._(r'BOARD'),
  GOALS._(r'GOALS'),
  LIST_VIEW._(r'LIST_VIEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const FeatureBeanBoardFeatureEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FeatureBeanBoardFeatureEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FeatureBeanBoardFeatureEnum? fromJson(dynamic value) => FeatureBeanBoardFeatureEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FeatureBeanBoardFeatureEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FeatureBeanBoardFeatureEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureBeanBoardFeatureEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureBeanBoardFeatureEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FeatureBeanBoardFeatureEnum] to String,
/// and [decode] dynamic data back to [FeatureBeanBoardFeatureEnum].
class FeatureBeanBoardFeatureEnumTypeTransformer {
  factory FeatureBeanBoardFeatureEnumTypeTransformer() => _instance ??= const FeatureBeanBoardFeatureEnumTypeTransformer._();

  const FeatureBeanBoardFeatureEnumTypeTransformer._();

  String encode(FeatureBeanBoardFeatureEnum data) => data._value;

  /// Returns the instance of [FeatureBeanBoardFeatureEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FeatureBeanBoardFeatureEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FeatureBeanBoardFeatureEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'SIMPLE_ROADMAP': return FeatureBeanBoardFeatureEnum.SIMPLE_ROADMAP;
        case r'BACKLOG': return FeatureBeanBoardFeatureEnum.BACKLOG;
        case r'SPRINTS': return FeatureBeanBoardFeatureEnum.SPRINTS;
        case r'CALENDAR': return FeatureBeanBoardFeatureEnum.CALENDAR;
        case r'DEVTOOLS': return FeatureBeanBoardFeatureEnum.DEVTOOLS;
        case r'REPORTS': return FeatureBeanBoardFeatureEnum.REPORTS;
        case r'ESTIMATION': return FeatureBeanBoardFeatureEnum.ESTIMATION;
        case r'PAGES': return FeatureBeanBoardFeatureEnum.PAGES;
        case r'CODE': return FeatureBeanBoardFeatureEnum.CODE;
        case r'SECURITY': return FeatureBeanBoardFeatureEnum.SECURITY;
        case r'REQUESTS': return FeatureBeanBoardFeatureEnum.REQUESTS;
        case r'INCIDENTS': return FeatureBeanBoardFeatureEnum.INCIDENTS;
        case r'RELEASES': return FeatureBeanBoardFeatureEnum.RELEASES;
        case r'DEPLOYMENTS': return FeatureBeanBoardFeatureEnum.DEPLOYMENTS;
        case r'ISSUE_NAVIGATOR': return FeatureBeanBoardFeatureEnum.ISSUE_NAVIGATOR;
        case r'ON_CALL_SCHEDULE': return FeatureBeanBoardFeatureEnum.ON_CALL_SCHEDULE;
        case r'BOARD': return FeatureBeanBoardFeatureEnum.BOARD;
        case r'GOALS': return FeatureBeanBoardFeatureEnum.GOALS;
        case r'LIST_VIEW': return FeatureBeanBoardFeatureEnum.LIST_VIEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FeatureBeanBoardFeatureEnumTypeTransformer? _instance;
}



enum FeatureBeanFeatureTypeEnum {
  BASIC._(r'BASIC'),
  ESTIMATION._(r'ESTIMATION'),
  ;

  /// Instantiate a new enum with the provided value.
  const FeatureBeanFeatureTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FeatureBeanFeatureTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FeatureBeanFeatureTypeEnum? fromJson(dynamic value) => FeatureBeanFeatureTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FeatureBeanFeatureTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FeatureBeanFeatureTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureBeanFeatureTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureBeanFeatureTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FeatureBeanFeatureTypeEnum] to String,
/// and [decode] dynamic data back to [FeatureBeanFeatureTypeEnum].
class FeatureBeanFeatureTypeEnumTypeTransformer {
  factory FeatureBeanFeatureTypeEnumTypeTransformer() => _instance ??= const FeatureBeanFeatureTypeEnumTypeTransformer._();

  const FeatureBeanFeatureTypeEnumTypeTransformer._();

  String encode(FeatureBeanFeatureTypeEnum data) => data._value;

  /// Returns the instance of [FeatureBeanFeatureTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FeatureBeanFeatureTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FeatureBeanFeatureTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'BASIC': return FeatureBeanFeatureTypeEnum.BASIC;
        case r'ESTIMATION': return FeatureBeanFeatureTypeEnum.ESTIMATION;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FeatureBeanFeatureTypeEnumTypeTransformer? _instance;
}



enum FeatureBeanStateEnum {
  ENABLED._(r'ENABLED'),
  DISABLED._(r'DISABLED'),
  COMING_SOON._(r'COMING_SOON'),
  ;

  /// Instantiate a new enum with the provided value.
  const FeatureBeanStateEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FeatureBeanStateEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FeatureBeanStateEnum? fromJson(dynamic value) => FeatureBeanStateEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FeatureBeanStateEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FeatureBeanStateEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureBeanStateEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureBeanStateEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FeatureBeanStateEnum] to String,
/// and [decode] dynamic data back to [FeatureBeanStateEnum].
class FeatureBeanStateEnumTypeTransformer {
  factory FeatureBeanStateEnumTypeTransformer() => _instance ??= const FeatureBeanStateEnumTypeTransformer._();

  const FeatureBeanStateEnumTypeTransformer._();

  String encode(FeatureBeanStateEnum data) => data._value;

  /// Returns the instance of [FeatureBeanStateEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FeatureBeanStateEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FeatureBeanStateEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ENABLED': return FeatureBeanStateEnum.ENABLED;
        case r'DISABLED': return FeatureBeanStateEnum.DISABLED;
        case r'COMING_SOON': return FeatureBeanStateEnum.COMING_SOON;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FeatureBeanStateEnumTypeTransformer? _instance;
}


