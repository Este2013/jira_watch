//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilterDetails {
  /// Returns a new [FilterDetails] instance.
  FilterDetails({
    this.approximateLastUsed,
    this.description,
    this.editPermissions = const [],
    this.expand,
    this.favourite,
    this.favouritedCount,
    this.id,
    this.jql,
    required this.name,
    this.owner,
    this.searchUrl,
    this.self,
    this.sharePermissions = const [],
    this.subscriptions = const [],
    this.viewUrl,
  });

  /// \\[Experimental\\] Approximate last used time. Returns the date and time when the filter was last used. Returns `null` if the filter hasn't been used after tracking was enabled. For performance reasons, timestamps aren't updated in real time and therefore may not be exactly accurate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? approximateLastUsed;

  /// The description of the filter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The groups and projects that can edit the filter. This can be specified when updating a filter, but not when creating a filter.
  List<SharePermission> editPermissions;

  /// Expand options that include additional filter details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// Whether the filter is selected as a favorite by any users, not including the filter owner.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? favourite;

  /// The count of how many users have selected this filter as a favorite, including the filter owner.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? favouritedCount;

  /// The unique identifier for the filter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The JQL query for the filter. For example, *project = SSP AND issuetype = Bug*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? jql;

  /// The name of the filter.
  String name;

  /// The user who owns the filter. Defaults to the creator of the filter, however, Jira administrators can change the owner of a shared filter in the admin settings.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? owner;

  /// A URL to view the filter results in Jira, using the [Search for issues using JQL](#api-rest-api-3-filter-search-get) operation with the filter's JQL string to return the filter results. For example, *https://your-domain.atlassian.net/rest/api/3/search?jql=project+%3D+SSP+AND+issuetype+%3D+Bug*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? searchUrl;

  /// The URL of the filter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The groups and projects that the filter is shared with. This can be specified when updating a filter, but not when creating a filter.
  List<SharePermission> sharePermissions;

  /// The users that are subscribed to the filter.
  List<FilterSubscription> subscriptions;

  /// A URL to view the filter results in Jira, using the ID of the filter. For example, *https://your-domain.atlassian.net/issues/?filter=10100*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? viewUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FilterDetails &&
    other.approximateLastUsed == approximateLastUsed &&
    other.description == description &&
    _deepEquality.equals(other.editPermissions, editPermissions) &&
    other.expand == expand &&
    other.favourite == favourite &&
    other.favouritedCount == favouritedCount &&
    other.id == id &&
    other.jql == jql &&
    other.name == name &&
    other.owner == owner &&
    other.searchUrl == searchUrl &&
    other.self == self &&
    _deepEquality.equals(other.sharePermissions, sharePermissions) &&
    _deepEquality.equals(other.subscriptions, subscriptions) &&
    other.viewUrl == viewUrl;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (approximateLastUsed == null ? 0 : approximateLastUsed!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (editPermissions.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (favourite == null ? 0 : favourite!.hashCode) +
    (favouritedCount == null ? 0 : favouritedCount!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (jql == null ? 0 : jql!.hashCode) +
    (name.hashCode) +
    (owner == null ? 0 : owner!.hashCode) +
    (searchUrl == null ? 0 : searchUrl!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (sharePermissions.hashCode) +
    (subscriptions.hashCode) +
    (viewUrl == null ? 0 : viewUrl!.hashCode);

  @override
  String toString() => 'FilterDetails[approximateLastUsed=$approximateLastUsed, description=$description, editPermissions=$editPermissions, expand=$expand, favourite=$favourite, favouritedCount=$favouritedCount, id=$id, jql=$jql, name=$name, owner=$owner, searchUrl=$searchUrl, self=$self, sharePermissions=$sharePermissions, subscriptions=$subscriptions, viewUrl=$viewUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.approximateLastUsed != null) {
      json[r'approximateLastUsed'] = this.approximateLastUsed!.toUtc().toIso8601String();
    } else {
      json[r'approximateLastUsed'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'editPermissions'] = this.editPermissions;
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
    if (this.favourite != null) {
      json[r'favourite'] = this.favourite;
    } else {
      json[r'favourite'] = null;
    }
    if (this.favouritedCount != null) {
      json[r'favouritedCount'] = this.favouritedCount;
    } else {
      json[r'favouritedCount'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.jql != null) {
      json[r'jql'] = this.jql;
    } else {
      json[r'jql'] = null;
    }
      json[r'name'] = this.name;
    if (this.owner != null) {
      json[r'owner'] = this.owner;
    } else {
      json[r'owner'] = null;
    }
    if (this.searchUrl != null) {
      json[r'searchUrl'] = this.searchUrl;
    } else {
      json[r'searchUrl'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
      json[r'sharePermissions'] = this.sharePermissions;
      json[r'subscriptions'] = this.subscriptions;
    if (this.viewUrl != null) {
      json[r'viewUrl'] = this.viewUrl;
    } else {
      json[r'viewUrl'] = null;
    }
    return json;
  }

  /// Returns a new [FilterDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FilterDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "FilterDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "FilterDetails[name]" has a null value in JSON.');
        return true;
      }());

      return FilterDetails(
        approximateLastUsed: mapDateTime(json, r'approximateLastUsed', r''),
        description: mapValueOfType<String>(json, r'description'),
        editPermissions: SharePermission.listFromJson(json[r'editPermissions']),
        expand: mapValueOfType<String>(json, r'expand'),
        favourite: mapValueOfType<bool>(json, r'favourite'),
        favouritedCount: mapValueOfType<int>(json, r'favouritedCount'),
        id: mapValueOfType<String>(json, r'id'),
        jql: mapValueOfType<String>(json, r'jql'),
        name: mapValueOfType<String>(json, r'name')!,
        owner: User.fromJson(json[r'owner']),
        searchUrl: mapValueOfType<String>(json, r'searchUrl'),
        self: mapValueOfType<String>(json, r'self'),
        sharePermissions: SharePermission.listFromJson(json[r'sharePermissions']),
        subscriptions: FilterSubscription.listFromJson(json[r'subscriptions']),
        viewUrl: mapValueOfType<String>(json, r'viewUrl'),
      );
    }
    return null;
  }

  static List<FilterDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FilterDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilterDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FilterDetails> mapFromJson(dynamic json) {
    final map = <String, FilterDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FilterDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FilterDetails-objects as value to a dart map
  static Map<String, List<FilterDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FilterDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FilterDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

