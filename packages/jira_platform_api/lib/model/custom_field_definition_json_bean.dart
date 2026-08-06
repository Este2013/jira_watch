//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldDefinitionJsonBean {
  /// Returns a new [CustomFieldDefinitionJsonBean] instance.
  CustomFieldDefinitionJsonBean({
    this.description,
    required this.name,
    this.searcherKey,
    required this.type,
  });

  /// The description of the custom field, which is displayed in Jira.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the custom field, which is displayed in Jira. This is not the unique identifier.
  String name;

  /// The searcher defines the way the field is searched in Jira. For example, *com.atlassian.jira.plugin.system.customfieldtypes:grouppickersearcher*.   The search UI (basic search and JQL search) will display different operations and values for the field, based on the field searcher. You must specify a searcher that is valid for the field type, as listed below (abbreviated values shown):   *  `cascadingselect`: `cascadingselectsearcher`  *  `datepicker`: `daterange`  *  `datetime`: `datetimerange`  *  `float`: `exactnumber` or `numberrange`  *  `grouppicker`: `grouppickersearcher`  *  `importid`: `exactnumber` or `numberrange`  *  `labels`: `labelsearcher`  *  `multicheckboxes`: `multiselectsearcher`  *  `multigrouppicker`: `multiselectsearcher`  *  `multiselect`: `multiselectsearcher`  *  `multiuserpicker`: `userpickergroupsearcher`  *  `multiversion`: `versionsearcher`  *  `project`: `projectsearcher`  *  `radiobuttons`: `multiselectsearcher`  *  `readonlyfield`: `textsearcher`  *  `select`: `multiselectsearcher`  *  `textarea`: `textsearcher`  *  `textfield`: `textsearcher`  *  `url`: `exacttextsearcher`  *  `userpicker`: `userpickergroupsearcher`  *  `version`: `versionsearcher`  If no searcher is provided, the field isn't searchable. However, [Forge custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/#jira-custom-field-type--beta-) have a searcher set automatically, so are always searchable.
  CustomFieldDefinitionJsonBeanSearcherKeyEnum? searcherKey;

  /// The type of the custom field. These built-in custom field types are available:   *  `cascadingselect`: Enables values to be selected from two levels of select lists (value: `com.atlassian.jira.plugin.system.customfieldtypes:cascadingselect`)  *  `datepicker`: Stores a date using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:datepicker`)  *  `datetime`: Stores a date with a time component (value: `com.atlassian.jira.plugin.system.customfieldtypes:datetime`)  *  `float`: Stores and validates a numeric (floating point) input (value: `com.atlassian.jira.plugin.system.customfieldtypes:float`)  *  `grouppicker`: Stores a user group using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:grouppicker`)  *  `importid`: A read-only field that stores the ID the issue had in the system it was imported from (value: `com.atlassian.jira.plugin.system.customfieldtypes:importid`)  *  `labels`: Stores labels (value: `com.atlassian.jira.plugin.system.customfieldtypes:labels`)  *  `multicheckboxes`: Stores multiple values using checkboxes (value: ``)  *  `multigrouppicker`: Stores multiple user groups using a picker control (value: ``)  *  `multiselect`: Stores multiple values using a select list (value: `com.atlassian.jira.plugin.system.customfieldtypes:multicheckboxes`)  *  `multiuserpicker`: Stores multiple users using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:multigrouppicker`)  *  `multiversion`: Stores multiple versions from the versions available in a project using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:multiversion`)  *  `project`: Stores a project from a list of projects that the user is permitted to view (value: `com.atlassian.jira.plugin.system.customfieldtypes:project`)  *  `radiobuttons`: Stores a value using radio buttons (value: `com.atlassian.jira.plugin.system.customfieldtypes:radiobuttons`)  *  `readonlyfield`: Stores a read-only text value, which can only be populated via the API (value: `com.atlassian.jira.plugin.system.customfieldtypes:readonlyfield`)  *  `select`: Stores a value from a configurable list of options (value: `com.atlassian.jira.plugin.system.customfieldtypes:select`)  *  `textarea`: Stores a long text string using a multiline text area (value: `com.atlassian.jira.plugin.system.customfieldtypes:textarea`)  *  `textfield`: Stores a text string using a single-line text box (value: `com.atlassian.jira.plugin.system.customfieldtypes:textfield`)  *  `url`: Stores a URL (value: `com.atlassian.jira.plugin.system.customfieldtypes:url`)  *  `userpicker`: Stores a user using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:userpicker`)  *  `version`: Stores a version using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:version`)  To create a field based on a [Forge custom field type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/#jira-custom-field-type--beta-), use the ID of the Forge custom field type as the value. For example, `ari:cloud:ecosystem::extension/e62f20a2-4b61-4dbe-bfb9-9a88b5e3ac84/548c5df1-24aa-4f7c-bbbb-3038d947cb05/static/my-cf-type-key`.
  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldDefinitionJsonBean &&
    other.description == description &&
    other.name == name &&
    other.searcherKey == searcherKey &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (name.hashCode) +
    (searcherKey == null ? 0 : searcherKey!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldDefinitionJsonBean[description=$description, name=$name, searcherKey=$searcherKey, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'name'] = this.name;
    if (this.searcherKey != null) {
      json[r'searcherKey'] = this.searcherKey;
    } else {
      json[r'searcherKey'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldDefinitionJsonBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldDefinitionJsonBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "CustomFieldDefinitionJsonBean[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CustomFieldDefinitionJsonBean[name]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldDefinitionJsonBean[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldDefinitionJsonBean[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldDefinitionJsonBean(
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name')!,
        searcherKey: CustomFieldDefinitionJsonBeanSearcherKeyEnum.fromJson(json[r'searcherKey']),
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldDefinitionJsonBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldDefinitionJsonBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldDefinitionJsonBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldDefinitionJsonBean> mapFromJson(dynamic json) {
    final map = <String, CustomFieldDefinitionJsonBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldDefinitionJsonBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldDefinitionJsonBean-objects as value to a dart map
  static Map<String, List<CustomFieldDefinitionJsonBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldDefinitionJsonBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldDefinitionJsonBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'type',
  };
}

/// The searcher defines the way the field is searched in Jira. For example, *com.atlassian.jira.plugin.system.customfieldtypes:grouppickersearcher*.   The search UI (basic search and JQL search) will display different operations and values for the field, based on the field searcher. You must specify a searcher that is valid for the field type, as listed below (abbreviated values shown):   *  `cascadingselect`: `cascadingselectsearcher`  *  `datepicker`: `daterange`  *  `datetime`: `datetimerange`  *  `float`: `exactnumber` or `numberrange`  *  `grouppicker`: `grouppickersearcher`  *  `importid`: `exactnumber` or `numberrange`  *  `labels`: `labelsearcher`  *  `multicheckboxes`: `multiselectsearcher`  *  `multigrouppicker`: `multiselectsearcher`  *  `multiselect`: `multiselectsearcher`  *  `multiuserpicker`: `userpickergroupsearcher`  *  `multiversion`: `versionsearcher`  *  `project`: `projectsearcher`  *  `radiobuttons`: `multiselectsearcher`  *  `readonlyfield`: `textsearcher`  *  `select`: `multiselectsearcher`  *  `textarea`: `textsearcher`  *  `textfield`: `textsearcher`  *  `url`: `exacttextsearcher`  *  `userpicker`: `userpickergroupsearcher`  *  `version`: `versionsearcher`  If no searcher is provided, the field isn't searchable. However, [Forge custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/#jira-custom-field-type--beta-) have a searcher set automatically, so are always searchable.
enum CustomFieldDefinitionJsonBeanSearcherKeyEnum {
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
  const CustomFieldDefinitionJsonBeanSearcherKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CustomFieldDefinitionJsonBeanSearcherKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CustomFieldDefinitionJsonBeanSearcherKeyEnum? fromJson(dynamic value) => CustomFieldDefinitionJsonBeanSearcherKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CustomFieldDefinitionJsonBeanSearcherKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CustomFieldDefinitionJsonBeanSearcherKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldDefinitionJsonBeanSearcherKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldDefinitionJsonBeanSearcherKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomFieldDefinitionJsonBeanSearcherKeyEnum] to String,
/// and [decode] dynamic data back to [CustomFieldDefinitionJsonBeanSearcherKeyEnum].
class CustomFieldDefinitionJsonBeanSearcherKeyEnumTypeTransformer {
  factory CustomFieldDefinitionJsonBeanSearcherKeyEnumTypeTransformer() => _instance ??= const CustomFieldDefinitionJsonBeanSearcherKeyEnumTypeTransformer._();

  const CustomFieldDefinitionJsonBeanSearcherKeyEnumTypeTransformer._();

  String encode(CustomFieldDefinitionJsonBeanSearcherKeyEnum data) => data._value;

  /// Returns the instance of [CustomFieldDefinitionJsonBeanSearcherKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomFieldDefinitionJsonBeanSearcherKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CustomFieldDefinitionJsonBeanSearcherKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'com.atlassian.jira.plugin.system.customfieldtypes:cascadingselectsearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonCascadingselectsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:daterange': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonDaterange;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:datetimerange': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonDatetimerange;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:exactnumber': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonExactnumber;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:exacttextsearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonExacttextsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:grouppickersearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonGrouppickersearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:labelsearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonLabelsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:multiselectsearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonMultiselectsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:numberrange': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonNumberrange;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:projectsearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonProjectsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:textsearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonTextsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:userpickergroupsearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonUserpickergroupsearcher;
        case r'com.atlassian.jira.plugin.system.customfieldtypes:versionsearcher': return CustomFieldDefinitionJsonBeanSearcherKeyEnum.comPeriodAtlassianPeriodJiraPeriodPluginPeriodSystemPeriodCustomfieldtypesColonVersionsearcher;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CustomFieldDefinitionJsonBeanSearcherKeyEnumTypeTransformer? _instance;
}


