//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BoardConfigBean {
  /// Returns a new [BoardConfigBean] instance.
  BoardConfigBean({
    this.columnConfig,
    this.estimation,
    this.filter,
    this.id,
    this.location,
    this.name,
    this.ranking,
    this.self,
    this.subQuery,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetConfiguration200ResponseColumnConfig? columnConfig;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetConfiguration200ResponseEstimation? estimation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetConfiguration200ResponseColumnConfigColumnsInnerStatusesInner? filter;

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
  CreateBoardRequestLocation? location;

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
  GetConfiguration200ResponseRanking? ranking;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetConfiguration200ResponseSubQuery? subQuery;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BoardConfigBean &&
    other.columnConfig == columnConfig &&
    other.estimation == estimation &&
    other.filter == filter &&
    other.id == id &&
    other.location == location &&
    other.name == name &&
    other.ranking == ranking &&
    other.self == self &&
    other.subQuery == subQuery &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (columnConfig == null ? 0 : columnConfig!.hashCode) +
    (estimation == null ? 0 : estimation!.hashCode) +
    (filter == null ? 0 : filter!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (location == null ? 0 : location!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (ranking == null ? 0 : ranking!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (subQuery == null ? 0 : subQuery!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'BoardConfigBean[columnConfig=$columnConfig, estimation=$estimation, filter=$filter, id=$id, location=$location, name=$name, ranking=$ranking, self=$self, subQuery=$subQuery, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.columnConfig != null) {
      json[r'columnConfig'] = this.columnConfig;
    } else {
      json[r'columnConfig'] = null;
    }
    if (this.estimation != null) {
      json[r'estimation'] = this.estimation;
    } else {
      json[r'estimation'] = null;
    }
    if (this.filter != null) {
      json[r'filter'] = this.filter;
    } else {
      json[r'filter'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.location != null) {
      json[r'location'] = this.location;
    } else {
      json[r'location'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.ranking != null) {
      json[r'ranking'] = this.ranking;
    } else {
      json[r'ranking'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.subQuery != null) {
      json[r'subQuery'] = this.subQuery;
    } else {
      json[r'subQuery'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [BoardConfigBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BoardConfigBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BoardConfigBean(
        columnConfig: GetConfiguration200ResponseColumnConfig.fromJson(json[r'columnConfig']),
        estimation: GetConfiguration200ResponseEstimation.fromJson(json[r'estimation']),
        filter: GetConfiguration200ResponseColumnConfigColumnsInnerStatusesInner.fromJson(json[r'filter']),
        id: mapValueOfType<int>(json, r'id'),
        location: CreateBoardRequestLocation.fromJson(json[r'location']),
        name: mapValueOfType<String>(json, r'name'),
        ranking: GetConfiguration200ResponseRanking.fromJson(json[r'ranking']),
        self: mapValueOfType<String>(json, r'self'),
        subQuery: GetConfiguration200ResponseSubQuery.fromJson(json[r'subQuery']),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<BoardConfigBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardConfigBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardConfigBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BoardConfigBean> mapFromJson(dynamic json) {
    final map = <String, BoardConfigBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BoardConfigBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BoardConfigBean-objects as value to a dart map
  static Map<String, List<BoardConfigBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BoardConfigBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BoardConfigBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

