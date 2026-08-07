//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitDeploymentsResponse1DetailsInner {
  /// Returns a new [SubmitDeploymentsResponse1DetailsInner] instance.
  SubmitDeploymentsResponse1DetailsInner({
    required this.type,
    required this.issueKey,
    required this.issueLink,
  });

  /// The type of the gating status details. 
  SubmitDeploymentsResponse1DetailsInnerTypeEnum type;

  /// An issue key that references an issue in Jira. 
  String issueKey;

  /// A full HTTPS link to the Jira issue for the change request gating this Deployment. This field is provided if the details type is issue. 
  String issueLink;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitDeploymentsResponse1DetailsInner &&
    other.type == type &&
    other.issueKey == issueKey &&
    other.issueLink == issueLink;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (issueKey.hashCode) +
    (issueLink.hashCode);

  @override
  String toString() => 'SubmitDeploymentsResponse1DetailsInner[type=$type, issueKey=$issueKey, issueLink=$issueLink]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'type'] = this.type;
      json[r'issueKey'] = this.issueKey;
      json[r'issueLink'] = this.issueLink;
    return json;
  }

  /// Returns a new [SubmitDeploymentsResponse1DetailsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitDeploymentsResponse1DetailsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "SubmitDeploymentsResponse1DetailsInner[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "SubmitDeploymentsResponse1DetailsInner[type]" has a null value in JSON.');
        assert(json.containsKey(r'issueKey'), 'Required key "SubmitDeploymentsResponse1DetailsInner[issueKey]" is missing from JSON.');
        assert(json[r'issueKey'] != null, 'Required key "SubmitDeploymentsResponse1DetailsInner[issueKey]" has a null value in JSON.');
        assert(json.containsKey(r'issueLink'), 'Required key "SubmitDeploymentsResponse1DetailsInner[issueLink]" is missing from JSON.');
        assert(json[r'issueLink'] != null, 'Required key "SubmitDeploymentsResponse1DetailsInner[issueLink]" has a null value in JSON.');
        return true;
      }());

      return SubmitDeploymentsResponse1DetailsInner(
        type: SubmitDeploymentsResponse1DetailsInnerTypeEnum.fromJson(json[r'type'])!,
        issueKey: mapValueOfType<String>(json, r'issueKey')!,
        issueLink: mapValueOfType<String>(json, r'issueLink')!,
      );
    }
    return null;
  }

  static List<SubmitDeploymentsResponse1DetailsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitDeploymentsResponse1DetailsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitDeploymentsResponse1DetailsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitDeploymentsResponse1DetailsInner> mapFromJson(dynamic json) {
    final map = <String, SubmitDeploymentsResponse1DetailsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitDeploymentsResponse1DetailsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitDeploymentsResponse1DetailsInner-objects as value to a dart map
  static Map<String, List<SubmitDeploymentsResponse1DetailsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitDeploymentsResponse1DetailsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitDeploymentsResponse1DetailsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'issueKey',
    'issueLink',
  };
}

/// The type of the gating status details. 
enum SubmitDeploymentsResponse1DetailsInnerTypeEnum {
  issue._(r'issue'),
  ;

  /// Instantiate a new enum with the provided value.
  const SubmitDeploymentsResponse1DetailsInnerTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SubmitDeploymentsResponse1DetailsInnerTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SubmitDeploymentsResponse1DetailsInnerTypeEnum? fromJson(dynamic value) => SubmitDeploymentsResponse1DetailsInnerTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SubmitDeploymentsResponse1DetailsInnerTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SubmitDeploymentsResponse1DetailsInnerTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitDeploymentsResponse1DetailsInnerTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitDeploymentsResponse1DetailsInnerTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SubmitDeploymentsResponse1DetailsInnerTypeEnum] to String,
/// and [decode] dynamic data back to [SubmitDeploymentsResponse1DetailsInnerTypeEnum].
class SubmitDeploymentsResponse1DetailsInnerTypeEnumTypeTransformer {
  factory SubmitDeploymentsResponse1DetailsInnerTypeEnumTypeTransformer() => _instance ??= const SubmitDeploymentsResponse1DetailsInnerTypeEnumTypeTransformer._();

  const SubmitDeploymentsResponse1DetailsInnerTypeEnumTypeTransformer._();

  String encode(SubmitDeploymentsResponse1DetailsInnerTypeEnum data) => data._value;

  /// Returns the instance of [SubmitDeploymentsResponse1DetailsInnerTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SubmitDeploymentsResponse1DetailsInnerTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SubmitDeploymentsResponse1DetailsInnerTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'issue': return SubmitDeploymentsResponse1DetailsInnerTypeEnum.issue;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SubmitDeploymentsResponse1DetailsInnerTypeEnumTypeTransformer? _instance;
}


