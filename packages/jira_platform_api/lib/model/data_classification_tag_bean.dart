//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DataClassificationTagBean {
  /// Returns a new [DataClassificationTagBean] instance.
  DataClassificationTagBean({
    this.color,
    this.description,
    this.guideline,
    this.guidelineADF,
    required this.id,
    this.name,
    this.rank,
    required this.status,
  });

  /// The color of the data classification object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? color;

  /// The description of the data classification object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The guideline of the data classification object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? guideline;

  /// The guideline in ADF (Atlassian Document Format) for rich text rendering.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? guidelineADF;

  /// The ID of the data classification object.
  String id;

  /// The name of the data classification object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The rank of the data classification object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rank;

  /// The status of the data classification object.
  String status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DataClassificationTagBean &&
    other.color == color &&
    other.description == description &&
    other.guideline == guideline &&
    other.guidelineADF == guidelineADF &&
    other.id == id &&
    other.name == name &&
    other.rank == rank &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (color == null ? 0 : color!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (guideline == null ? 0 : guideline!.hashCode) +
    (guidelineADF == null ? 0 : guidelineADF!.hashCode) +
    (id.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (rank == null ? 0 : rank!.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'DataClassificationTagBean[color=$color, description=$description, guideline=$guideline, guidelineADF=$guidelineADF, id=$id, name=$name, rank=$rank, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.color != null) {
      json[r'color'] = this.color;
    } else {
      json[r'color'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.guideline != null) {
      json[r'guideline'] = this.guideline;
    } else {
      json[r'guideline'] = null;
    }
    if (this.guidelineADF != null) {
      json[r'guidelineADF'] = this.guidelineADF;
    } else {
      json[r'guidelineADF'] = null;
    }
      json[r'id'] = this.id;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.rank != null) {
      json[r'rank'] = this.rank;
    } else {
      json[r'rank'] = null;
    }
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [DataClassificationTagBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DataClassificationTagBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "DataClassificationTagBean[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "DataClassificationTagBean[id]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "DataClassificationTagBean[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "DataClassificationTagBean[status]" has a null value in JSON.');
        return true;
      }());

      return DataClassificationTagBean(
        color: mapValueOfType<String>(json, r'color'),
        description: mapValueOfType<String>(json, r'description'),
        guideline: mapValueOfType<String>(json, r'guideline'),
        guidelineADF: mapValueOfType<String>(json, r'guidelineADF'),
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name'),
        rank: mapValueOfType<int>(json, r'rank'),
        status: mapValueOfType<String>(json, r'status')!,
      );
    }
    return null;
  }

  static List<DataClassificationTagBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DataClassificationTagBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DataClassificationTagBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DataClassificationTagBean> mapFromJson(dynamic json) {
    final map = <String, DataClassificationTagBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DataClassificationTagBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DataClassificationTagBean-objects as value to a dart map
  static Map<String, List<DataClassificationTagBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DataClassificationTagBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DataClassificationTagBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'status',
  };
}

