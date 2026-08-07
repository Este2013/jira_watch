//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Reviewer {
  /// Returns a new [Reviewer] instance.
  Reviewer({
    this.name,
    this.approvalStatus,
    this.url,
    this.avatar,
    this.email,
    this.accountId,
  });

  /// Deprecated. The name of this reviewer. Max length is 255 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The approval status of this reviewer, default is UNAPPROVED.
  ReviewerApprovalStatusEnum? approvalStatus;

  /// Deprecated. The URL of the profile for this reviewer. Max length is 2000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  /// Deprecated. The URL of the avatar for this reviewer. Max length is 2000 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatar;

  /// The email address of this reviewer. Max length is 254 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  /// The Atlassian Account ID (AAID) of this reviewer. Max length is 128 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Reviewer &&
    other.name == name &&
    other.approvalStatus == approvalStatus &&
    other.url == url &&
    other.avatar == avatar &&
    other.email == email &&
    other.accountId == accountId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (approvalStatus == null ? 0 : approvalStatus!.hashCode) +
    (url == null ? 0 : url!.hashCode) +
    (avatar == null ? 0 : avatar!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (accountId == null ? 0 : accountId!.hashCode);

  @override
  String toString() => 'Reviewer[name=$name, approvalStatus=$approvalStatus, url=$url, avatar=$avatar, email=$email, accountId=$accountId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.approvalStatus != null) {
      json[r'approvalStatus'] = this.approvalStatus;
    } else {
      json[r'approvalStatus'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.avatar != null) {
      json[r'avatar'] = this.avatar;
    } else {
      json[r'avatar'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.accountId != null) {
      json[r'accountId'] = this.accountId;
    } else {
      json[r'accountId'] = null;
    }
    return json;
  }

  /// Returns a new [Reviewer] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Reviewer? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Reviewer(
        name: mapValueOfType<String>(json, r'name'),
        approvalStatus: ReviewerApprovalStatusEnum.fromJson(json[r'approvalStatus']),
        url: mapValueOfType<String>(json, r'url'),
        avatar: mapValueOfType<String>(json, r'avatar'),
        email: mapValueOfType<String>(json, r'email'),
        accountId: mapValueOfType<String>(json, r'accountId'),
      );
    }
    return null;
  }

  static List<Reviewer> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Reviewer>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Reviewer.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Reviewer> mapFromJson(dynamic json) {
    final map = <String, Reviewer>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Reviewer.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Reviewer-objects as value to a dart map
  static Map<String, List<Reviewer>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Reviewer>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Reviewer.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The approval status of this reviewer, default is UNAPPROVED.
enum ReviewerApprovalStatusEnum {
  APPROVED._(r'APPROVED'),
  UNAPPROVED._(r'UNAPPROVED'),
  ;

  /// Instantiate a new enum with the provided value.
  const ReviewerApprovalStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ReviewerApprovalStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ReviewerApprovalStatusEnum? fromJson(dynamic value) => ReviewerApprovalStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ReviewerApprovalStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ReviewerApprovalStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ReviewerApprovalStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReviewerApprovalStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ReviewerApprovalStatusEnum] to String,
/// and [decode] dynamic data back to [ReviewerApprovalStatusEnum].
class ReviewerApprovalStatusEnumTypeTransformer {
  factory ReviewerApprovalStatusEnumTypeTransformer() => _instance ??= const ReviewerApprovalStatusEnumTypeTransformer._();

  const ReviewerApprovalStatusEnumTypeTransformer._();

  String encode(ReviewerApprovalStatusEnum data) => data._value;

  /// Returns the instance of [ReviewerApprovalStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ReviewerApprovalStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ReviewerApprovalStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'APPROVED': return ReviewerApprovalStatusEnum.APPROVED;
        case r'UNAPPROVED': return ReviewerApprovalStatusEnum.UNAPPROVED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ReviewerApprovalStatusEnumTypeTransformer? _instance;
}


