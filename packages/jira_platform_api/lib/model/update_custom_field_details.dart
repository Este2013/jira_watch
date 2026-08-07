//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateCustomFieldDetails {
  /// Returns a new [UpdateCustomFieldDetails] instance.
  UpdateCustomFieldDetails({
    this.description,
    this.name,
    this.searcherKey,
  });

  /// The description of the custom field. The maximum length is 40000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the custom field. It doesn't have to be unique. The maximum length is 255 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The searcher that defines the way the field is searched in Jira. It can be set to `null`, otherwise you must specify the valid searcher for the field type, as listed below (abbreviated values shown):   *  `cascadingselect`: `cascadingselectsearcher`  *  `datepicker`: `daterange`  *  `datetime`: `datetimerange`  *  `float`: `exactnumber` or `numberrange`  *  `grouppicker`: `grouppickersearcher`  *  `importid`: `exactnumber` or `numberrange`  *  `labels`: `labelsearcher`  *  `multicheckboxes`: `multiselectsearcher`  *  `multigrouppicker`: `multiselectsearcher`  *  `multiselect`: `multiselectsearcher`  *  `multiuserpicker`: `userpickergroupsearcher`  *  `multiversion`: `versionsearcher`  *  `project`: `projectsearcher`  *  `radiobuttons`: `multiselectsearcher`  *  `readonlyfield`: `textsearcher`  *  `select`: `multiselectsearcher`  *  `textarea`: `textsearcher`  *  `textfield`: `textsearcher`  *  `url`: `exacttextsearcher`  *  `userpicker`: `userpickergroupsearcher`  *  `version`: `versionsearcher`
  UpdateCustomFieldDetailsSearcherKeyEnum? searcherKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateCustomFieldDetails &&
    other.description == description &&
    other.name == name &&
    other.searcherKey == searcherKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (searcherKey == null ? 0 : searcherKey!.hashCode);

  @override
  String toString() => 'UpdateCustomFieldDetails[description=$description, name=$name, searcherKey=$searcherKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.searcherKey != null) {
      json[r'searcherKey'] = this.searcherKey;
    } else {
      json[r'searcherKey'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateCustomFieldDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateCustomFieldDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdateCustomFieldDetails(
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name'),
        searcherKey: UpdateCustomFieldDetailsSearcherKeyEnum.fromJson(json[r'searcherKey']),
      );
    }
    return null;
  }

  static List<UpdateCustomFieldDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateCustomFieldDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateCustomFieldDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateCustomFieldDetails> mapFromJson(dynamic json) {
    final map = <String, UpdateCustomFieldDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateCustomFieldDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateCustomFieldDetails-objects as value to a dart map
  static Map<String, List<UpdateCustomFieldDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateCustomFieldDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateCustomFieldDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The searcher that defines the way the field is searched in Jira. It can be set to `null`, otherwise you must specify the valid searcher for the field type, as listed below (abbreviated values shown):   *  `cascadingselect`: `cascadingselectsearcher`  *  `datepicker`: `daterange`  *  `datetime`: `datetimerange`  *  `float`: `exactnumber` or `numberrange`  *  `grouppicker`: `grouppickersearcher`  *  `importid`: `exactnumber` or `numberrange`  *  `labels`: `labelsearcher`  *  `multicheckboxes`: `multiselectsearcher`  *  `multigrouppicker`: `multiselectsearcher`  *  `multiselect`: `multiselectsearcher`  *  `multiuserpicker`: `userpickergroupsearcher`  *  `multiversion`: `versionsearcher`  *  `project`: `projectsearcher`  *  `radiobuttons`: `multiselectsearcher`  *  `readonlyfield`: `textsearcher`  *  `select`: `multiselectsearcher`  *  `textarea`: `textsearcher`  *  `textfield`: `textsearcher`  *  `url`: `exacttextsearcher`  *  `userpicker`: `userpickergroupsearcher`  *  `version`: `versionsearcher`
enum UpdateCustomFieldDetailsSearcherKeyEnum {
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonCascadingselectsearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:cascadingselectsearcher'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonDaterange._(r'com.atlassian.jira.plugin.system.customfieldtypes:daterange'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonDatetimerange._(r'com.atlassian.jira.plugin.system.customfieldtypes:datetimerange'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonExactnumber._(r'com.atlassian.jira.plugin.system.customfieldtypes:exactnumber'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonExacttextsearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:exacttextsearcher'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonGrouppickersearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:grouppickersearcher'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonLabelsearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:labelsearcher'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonMultiselectsearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:multiselectsearcher'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonNumberrange._(r'com.atlassian.jira.plugin.system.customfieldtypes:numberrange'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonProjectsearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:projectsearcher'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonTextsearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:textsearcher'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonUserpickergroupsearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:userpickergroupsearcher'),
  comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonVersionsearcher._(r'com.atlassian.jira.plugin.system.customfieldtypes:versionsearcher'),
  ;

  /// Instantiate a new enum with the provided value.
  const UpdateCustomFieldDetailsSearcherKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UpdateCustomFieldDetailsSearcherKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UpdateCustomFieldDetailsSearcherKeyEnum? fromJson(dynamic value) => UpdateCustomFieldDetailsSearcherKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UpdateCustomFieldDetailsSearcherKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UpdateCustomFieldDetailsSearcherKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateCustomFieldDetailsSearcherKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateCustomFieldDetailsSearcherKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateCustomFieldDetailsSearcherKeyEnum] to String,
/// and [decode] dynamic data back to [UpdateCustomFieldDetailsSearcherKeyEnum].
class UpdateCustomFieldDetailsSearcherKeyEnumTypeTransformer {
  factory UpdateCustomFieldDetailsSearcherKeyEnumTypeTransformer() => _instance ??= const UpdateCustomFieldDetailsSearcherKeyEnumTypeTransformer._();

  const UpdateCustomFieldDetailsSearcherKeyEnumTypeTransformer._();

  String encode(UpdateCustomFieldDetailsSearcherKeyEnum data) => data._value;

  /// Returns the instance of [UpdateCustomFieldDetailsSearcherKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateCustomFieldDetailsSearcherKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UpdateCustomFieldDetailsSearcherKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'com.atlassian.jira.plugin.system.customfieldtypes:cascadingselectsearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonCascadingselectsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:daterange': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonDaterange;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:datetimerange': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonDatetimerange;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:exactnumber': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonExactnumber;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:exacttextsearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonExacttextsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:grouppickersearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonGrouppickersearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:labelsearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonLabelsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:multiselectsearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonMultiselectsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:numberrange': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonNumberrange;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:projectsearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonProjectsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:textsearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonTextsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:userpickergroupsearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonUserpickergroupsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:versionsearcher': return UpdateCustomFieldDetailsSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonVersionsearcher;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UpdateCustomFieldDetailsSearcherKeyEnumTypeTransformer? _instance;
}


