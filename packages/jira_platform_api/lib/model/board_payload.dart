//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BoardPayload {
  /// Returns a new [BoardPayload] instance.
  BoardPayload({
    this.boardFilterJQL,
    this.cardColorStrategy,
    this.cardLayout,
    this.cardLayouts = const [],
    this.columns = const [],
    this.enableCardCover,
    this.features = const [],
    this.name,
    this.pcri,
    this.quickFilters = const [],
    this.supportsSprint = true,
    this.swimlanes,
    this.workingDaysConfig,
  });

  /// Takes in a JQL string to create a new filter. If no value is provided, it'll default to a JQL filter for the project creating
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? boardFilterJQL;

  /// Card color settings of the board
  BoardPayloadCardColorStrategyEnum? cardColorStrategy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CardLayout? cardLayout;

  /// Card layout settings of the board
  List<CardLayoutField> cardLayouts;

  /// The columns of the board
  List<BoardColumnPayload> columns;

  /// Whether to enable the card cover option on this board
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enableCardCover;

  /// Feature settings for the board. Deprecated: use boardFeatures capability instead.
  List<BoardFeaturePayload> features;

  /// The name of the board
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  /// The quick filters for the board.
  List<QuickFilterPayload> quickFilters;

  /// Whether sprints are supported on the board
  bool supportsSprint;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SwimlanesPayload? swimlanes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkingDaysConfig? workingDaysConfig;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BoardPayload &&
    other.boardFilterJQL == boardFilterJQL &&
    other.cardColorStrategy == cardColorStrategy &&
    other.cardLayout == cardLayout &&
    _deepEquality.equals(other.cardLayouts, cardLayouts) &&
    _deepEquality.equals(other.columns, columns) &&
    other.enableCardCover == enableCardCover &&
    _deepEquality.equals(other.features, features) &&
    other.name == name &&
    other.pcri == pcri &&
    _deepEquality.equals(other.quickFilters, quickFilters) &&
    other.supportsSprint == supportsSprint &&
    other.swimlanes == swimlanes &&
    other.workingDaysConfig == workingDaysConfig;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (boardFilterJQL == null ? 0 : boardFilterJQL!.hashCode) +
    (cardColorStrategy == null ? 0 : cardColorStrategy!.hashCode) +
    (cardLayout == null ? 0 : cardLayout!.hashCode) +
    (cardLayouts.hashCode) +
    (columns.hashCode) +
    (enableCardCover == null ? 0 : enableCardCover!.hashCode) +
    (features.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (quickFilters.hashCode) +
    (supportsSprint.hashCode) +
    (swimlanes == null ? 0 : swimlanes!.hashCode) +
    (workingDaysConfig == null ? 0 : workingDaysConfig!.hashCode);

  @override
  String toString() => 'BoardPayload[boardFilterJQL=$boardFilterJQL, cardColorStrategy=$cardColorStrategy, cardLayout=$cardLayout, cardLayouts=$cardLayouts, columns=$columns, enableCardCover=$enableCardCover, features=$features, name=$name, pcri=$pcri, quickFilters=$quickFilters, supportsSprint=$supportsSprint, swimlanes=$swimlanes, workingDaysConfig=$workingDaysConfig]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.boardFilterJQL != null) {
      json[r'boardFilterJQL'] = this.boardFilterJQL;
    } else {
      json[r'boardFilterJQL'] = null;
    }
    if (this.cardColorStrategy != null) {
      json[r'cardColorStrategy'] = this.cardColorStrategy;
    } else {
      json[r'cardColorStrategy'] = null;
    }
    if (this.cardLayout != null) {
      json[r'cardLayout'] = this.cardLayout;
    } else {
      json[r'cardLayout'] = null;
    }
      json[r'cardLayouts'] = this.cardLayouts;
      json[r'columns'] = this.columns;
    if (this.enableCardCover != null) {
      json[r'enableCardCover'] = this.enableCardCover;
    } else {
      json[r'enableCardCover'] = null;
    }
      json[r'features'] = this.features;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
      json[r'quickFilters'] = this.quickFilters;
      json[r'supportsSprint'] = this.supportsSprint;
    if (this.swimlanes != null) {
      json[r'swimlanes'] = this.swimlanes;
    } else {
      json[r'swimlanes'] = null;
    }
    if (this.workingDaysConfig != null) {
      json[r'workingDaysConfig'] = this.workingDaysConfig;
    } else {
      json[r'workingDaysConfig'] = null;
    }
    return json;
  }

  /// Returns a new [BoardPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BoardPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BoardPayload(
        boardFilterJQL: mapValueOfType<String>(json, r'boardFilterJQL'),
        cardColorStrategy: BoardPayloadCardColorStrategyEnum.fromJson(json[r'cardColorStrategy']),
        cardLayout: CardLayout.fromJson(json[r'cardLayout']),
        cardLayouts: CardLayoutField.listFromJson(json[r'cardLayouts']),
        columns: BoardColumnPayload.listFromJson(json[r'columns']),
        enableCardCover: mapValueOfType<bool>(json, r'enableCardCover'),
        features: BoardFeaturePayload.listFromJson(json[r'features']),
        name: mapValueOfType<String>(json, r'name'),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        quickFilters: QuickFilterPayload.listFromJson(json[r'quickFilters']),
        supportsSprint: mapValueOfType<bool>(json, r'supportsSprint') ?? true,
        swimlanes: SwimlanesPayload.fromJson(json[r'swimlanes']),
        workingDaysConfig: WorkingDaysConfig.fromJson(json[r'workingDaysConfig']),
      );
    }
    return null;
  }

  static List<BoardPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BoardPayload> mapFromJson(dynamic json) {
    final map = <String, BoardPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BoardPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BoardPayload-objects as value to a dart map
  static Map<String, List<BoardPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BoardPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BoardPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Card color settings of the board
enum BoardPayloadCardColorStrategyEnum {
  ISSUE_TYPE._(r'ISSUE_TYPE'),
  REQUEST_TYPE._(r'REQUEST_TYPE'),
  ASSIGNEE._(r'ASSIGNEE'),
  PRIORITY._(r'PRIORITY'),
  NONE._(r'NONE'),
  CUSTOM._(r'CUSTOM'),
  ;

  /// Instantiate a new enum with the provided value.
  const BoardPayloadCardColorStrategyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BoardPayloadCardColorStrategyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BoardPayloadCardColorStrategyEnum? fromJson(dynamic value) => BoardPayloadCardColorStrategyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BoardPayloadCardColorStrategyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BoardPayloadCardColorStrategyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardPayloadCardColorStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardPayloadCardColorStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BoardPayloadCardColorStrategyEnum] to String,
/// and [decode] dynamic data back to [BoardPayloadCardColorStrategyEnum].
class BoardPayloadCardColorStrategyEnumTypeTransformer {
  factory BoardPayloadCardColorStrategyEnumTypeTransformer() => _instance ??= const BoardPayloadCardColorStrategyEnumTypeTransformer._();

  const BoardPayloadCardColorStrategyEnumTypeTransformer._();

  String encode(BoardPayloadCardColorStrategyEnum data) => data._value;

  /// Returns the instance of [BoardPayloadCardColorStrategyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BoardPayloadCardColorStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BoardPayloadCardColorStrategyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ISSUE_TYPE': return BoardPayloadCardColorStrategyEnum.ISSUE_TYPE;
        case r'REQUEST_TYPE': return BoardPayloadCardColorStrategyEnum.REQUEST_TYPE;
        case r'ASSIGNEE': return BoardPayloadCardColorStrategyEnum.ASSIGNEE;
        case r'PRIORITY': return BoardPayloadCardColorStrategyEnum.PRIORITY;
        case r'NONE': return BoardPayloadCardColorStrategyEnum.NONE;
        case r'CUSTOM': return BoardPayloadCardColorStrategyEnum.CUSTOM;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BoardPayloadCardColorStrategyEnumTypeTransformer? _instance;
}


