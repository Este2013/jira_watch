//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Filter {
  /// Returns a new [Filter] instance.
  Filter({
    this.approximateLastUsed,
    this.description,
    this.editPermissions = const [],
    this.favourite,
    this.favouritedCount,
    this.id,
    this.jql,
    required this.name,
    this.owner,
    this.searchUrl,
    this.self,
    this.sharePermissions = const [],
    this.sharedUsers,
    this.subscriptions,
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

  /// A description of the filter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The groups and projects that can edit the filter.
  List<SharePermission> editPermissions;

  /// Whether the filter is selected as a favorite.
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

  /// The name of the filter. Must be unique.
  String name;

  /// The user who owns the filter. This is defaulted to the creator of the filter, however Jira administrators can change the owner of a shared filter in the admin settings.
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

  /// The groups and projects that the filter is shared with.
  List<SharePermission> sharePermissions;

  /// A paginated list of the users that the filter is shared with. This includes users that are members of the groups or can browse the projects that the filter is shared with.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserList? sharedUsers;

  /// A paginated list of the users that are subscribed to the filter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FilterSubscriptionsList? subscriptions;

  /// A URL to view the filter results in Jira, using the ID of the filter. For example, *https://your-domain.atlassian.net/issues/?filter=10100*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? viewUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Filter &&
    other.approximateLastUsed == approximateLastUsed &&
    other.description == description &&
    _deepEquality.equals(other.editPermissions, editPermissions) &&
    other.favourite == favourite &&
    other.favouritedCount == favouritedCount &&
    other.id == id &&
    other.jql == jql &&
    other.name == name &&
    other.owner == owner &&
    other.searchUrl == searchUrl &&
    other.self == self &&
    _deepEquality.equals(other.sharePermissions, sharePermissions) &&
    other.sharedUsers == sharedUsers &&
    other.subscriptions == subscriptions &&
    other.viewUrl == viewUrl;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (approximateLastUsed == null ? 0 : approximateLastUsed!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (editPermissions.hashCode) +
    (favourite == null ? 0 : favourite!.hashCode) +
    (favouritedCount == null ? 0 : favouritedCount!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (jql == null ? 0 : jql!.hashCode) +
    (name.hashCode) +
    (owner == null ? 0 : owner!.hashCode) +
    (searchUrl == null ? 0 : searchUrl!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (sharePermissions.hashCode) +
    (sharedUsers == null ? 0 : sharedUsers!.hashCode) +
    (subscriptions == null ? 0 : subscriptions!.hashCode) +
    (viewUrl == null ? 0 : viewUrl!.hashCode);

  @override
  String toString() => 'Filter[approximateLastUsed=$approximateLastUsed, description=$description, editPermissions=$editPermissions, favourite=$favourite, favouritedCount=$favouritedCount, id=$id, jql=$jql, name=$name, owner=$owner, searchUrl=$searchUrl, self=$self, sharePermissions=$sharePermissions, sharedUsers=$sharedUsers, subscriptions=$subscriptions, viewUrl=$viewUrl]';

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
    if (this.sharedUsers != null) {
      json[r'sharedUsers'] = this.sharedUsers;
    } else {
      json[r'sharedUsers'] = null;
    }
    if (this.subscriptions != null) {
      json[r'subscriptions'] = this.subscriptions;
    } else {
      json[r'subscriptions'] = null;
    }
    if (this.viewUrl != null) {
      json[r'viewUrl'] = this.viewUrl;
    } else {
      json[r'viewUrl'] = null;
    }
    return json;
  }

  /// Returns a new [Filter] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Filter? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "Filter[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "Filter[name]" has a null value in JSON.');
        return true;
      }());

      return Filter(
        approximateLastUsed: mapDateTime(json, r'approximateLastUsed', r''),
        description: mapValueOfType<String>(json, r'description'),
        editPermissions: SharePermission.listFromJson(json[r'editPermissions']),
        favourite: mapValueOfType<bool>(json, r'favourite'),
        favouritedCount: mapValueOfType<int>(json, r'favouritedCount'),
        id: mapValueOfType<String>(json, r'id'),
        jql: mapValueOfType<String>(json, r'jql'),
        name: mapValueOfType<String>(json, r'name')!,
        owner: User.fromJson(json[r'owner']),
        searchUrl: mapValueOfType<String>(json, r'searchUrl'),
        self: mapValueOfType<String>(json, r'self'),
        sharePermissions: SharePermission.listFromJson(json[r'sharePermissions']),
        sharedUsers: UserList.fromJson(json[r'sharedUsers']),
        subscriptions: FilterSubscriptionsList.fromJson(json[r'subscriptions']),
        viewUrl: mapValueOfType<String>(json, r'viewUrl'),
      );
    }
    return null;
  }

  static List<Filter> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Filter>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Filter.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Filter> mapFromJson(dynamic json) {
    final map = <String, Filter>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Filter.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Filter-objects as value to a dart map
  static Map<String, List<Filter>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Filter>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Filter.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

