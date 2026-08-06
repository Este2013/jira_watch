//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Dashboard {
  /// Returns a new [Dashboard] instance.
  Dashboard({
    this.automaticRefreshMs,
    this.description,
    this.editPermissions = const [],
    this.id,
    this.isFavourite,
    this.isWritable,
    this.name,
    this.owner,
    this.popularity,
    this.rank,
    this.self,
    this.sharePermissions = const [],
    this.systemDashboard,
    this.view,
  });

  /// The automatic refresh interval for the dashboard in milliseconds.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? automaticRefreshMs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The details of any edit share permissions for the dashboard.
  List<SharePermission> editPermissions;

  /// The ID of the dashboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Whether the dashboard is selected as a favorite by the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isFavourite;

  /// Whether the current user has permission to edit the dashboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isWritable;

  /// The name of the dashboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The owner of the dashboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserBean? owner;

  /// The number of users who have this dashboard as a favorite.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? popularity;

  /// The rank of this dashboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rank;

  /// The URL of these dashboard details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The details of any view share permissions for the dashboard.
  List<SharePermission> sharePermissions;

  /// Whether the current dashboard is system dashboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? systemDashboard;

  /// The URL of the dashboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? view;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Dashboard &&
    other.automaticRefreshMs == automaticRefreshMs &&
    other.description == description &&
    _deepEquality.equals(other.editPermissions, editPermissions) &&
    other.id == id &&
    other.isFavourite == isFavourite &&
    other.isWritable == isWritable &&
    other.name == name &&
    other.owner == owner &&
    other.popularity == popularity &&
    other.rank == rank &&
    other.self == self &&
    _deepEquality.equals(other.sharePermissions, sharePermissions) &&
    other.systemDashboard == systemDashboard &&
    other.view == view;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (automaticRefreshMs == null ? 0 : automaticRefreshMs!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (editPermissions.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isFavourite == null ? 0 : isFavourite!.hashCode) +
    (isWritable == null ? 0 : isWritable!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (owner == null ? 0 : owner!.hashCode) +
    (popularity == null ? 0 : popularity!.hashCode) +
    (rank == null ? 0 : rank!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (sharePermissions.hashCode) +
    (systemDashboard == null ? 0 : systemDashboard!.hashCode) +
    (view == null ? 0 : view!.hashCode);

  @override
  String toString() => 'Dashboard[automaticRefreshMs=$automaticRefreshMs, description=$description, editPermissions=$editPermissions, id=$id, isFavourite=$isFavourite, isWritable=$isWritable, name=$name, owner=$owner, popularity=$popularity, rank=$rank, self=$self, sharePermissions=$sharePermissions, systemDashboard=$systemDashboard, view=$view]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.automaticRefreshMs != null) {
      json[r'automaticRefreshMs'] = this.automaticRefreshMs;
    } else {
      json[r'automaticRefreshMs'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'editPermissions'] = this.editPermissions;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.isFavourite != null) {
      json[r'isFavourite'] = this.isFavourite;
    } else {
      json[r'isFavourite'] = null;
    }
    if (this.isWritable != null) {
      json[r'isWritable'] = this.isWritable;
    } else {
      json[r'isWritable'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.owner != null) {
      json[r'owner'] = this.owner;
    } else {
      json[r'owner'] = null;
    }
    if (this.popularity != null) {
      json[r'popularity'] = this.popularity;
    } else {
      json[r'popularity'] = null;
    }
    if (this.rank != null) {
      json[r'rank'] = this.rank;
    } else {
      json[r'rank'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
      json[r'sharePermissions'] = this.sharePermissions;
    if (this.systemDashboard != null) {
      json[r'systemDashboard'] = this.systemDashboard;
    } else {
      json[r'systemDashboard'] = null;
    }
    if (this.view != null) {
      json[r'view'] = this.view;
    } else {
      json[r'view'] = null;
    }
    return json;
  }

  /// Returns a new [Dashboard] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Dashboard? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Dashboard(
        automaticRefreshMs: mapValueOfType<int>(json, r'automaticRefreshMs'),
        description: mapValueOfType<String>(json, r'description'),
        editPermissions: SharePermission.listFromJson(json[r'editPermissions']),
        id: mapValueOfType<String>(json, r'id'),
        isFavourite: mapValueOfType<bool>(json, r'isFavourite'),
        isWritable: mapValueOfType<bool>(json, r'isWritable'),
        name: mapValueOfType<String>(json, r'name'),
        owner: UserBean.fromJson(json[r'owner']),
        popularity: mapValueOfType<int>(json, r'popularity'),
        rank: mapValueOfType<int>(json, r'rank'),
        self: mapValueOfType<String>(json, r'self'),
        sharePermissions: SharePermission.listFromJson(json[r'sharePermissions']),
        systemDashboard: mapValueOfType<bool>(json, r'systemDashboard'),
        view: mapValueOfType<String>(json, r'view'),
      );
    }
    return null;
  }

  static List<Dashboard> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Dashboard>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Dashboard.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Dashboard> mapFromJson(dynamic json) {
    final map = <String, Dashboard>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Dashboard.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Dashboard-objects as value to a dart map
  static Map<String, List<Dashboard>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Dashboard>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Dashboard.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

