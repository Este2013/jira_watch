//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitRemoteLinks202Response {
  /// Returns a new [SubmitRemoteLinks202Response] instance.
  SubmitRemoteLinks202Response({
    this.acceptedRemoteLinks = const [],
    this.rejectedRemoteLinks = const {},
    this.unknownAssociations = const [],
  });

  /// The IDs of Remote Links that have been accepted for submission.  A Remote Link may be rejected if it was only associated with unknown issue keys, unknown service IDs, or if the submitted data for that Remote Link does not match the required schema.  Note that a Remote Link that isn't updated due to it's `updateSequenceNumber` being out of order is not considered a failed submission. 
  List<String> acceptedRemoteLinks;

  /// Details of Remote Links that have not been accepted for submission, usually due to a problem with the request data.  A Remote Link may be rejected if it was only associated with unknown issue keys, unknown service IDs, or if the submitted data for the Remote Link does not match the required schema.  The object (if present) will be keyed by Remote Link ID and include any errors associated with that Remote Link that have prevented it being submitted. 
  Map<String, List<SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner>> rejectedRemoteLinks;

  /// Issue keys or services IDs or keys that are not known on this Jira instance (if any). 
  List<RemoteLinkDataAssociationsInner> unknownAssociations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitRemoteLinks202Response &&
    _deepEquality.equals(other.acceptedRemoteLinks, acceptedRemoteLinks) &&
    _deepEquality.equals(other.rejectedRemoteLinks, rejectedRemoteLinks) &&
    _deepEquality.equals(other.unknownAssociations, unknownAssociations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (acceptedRemoteLinks.hashCode) +
    (rejectedRemoteLinks.hashCode) +
    (unknownAssociations.hashCode);

  @override
  String toString() => 'SubmitRemoteLinks202Response[acceptedRemoteLinks=$acceptedRemoteLinks, rejectedRemoteLinks=$rejectedRemoteLinks, unknownAssociations=$unknownAssociations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'acceptedRemoteLinks'] = this.acceptedRemoteLinks;
      json[r'rejectedRemoteLinks'] = this.rejectedRemoteLinks;
      json[r'unknownAssociations'] = this.unknownAssociations;
    return json;
  }

  /// Returns a new [SubmitRemoteLinks202Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitRemoteLinks202Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitRemoteLinks202Response(
        acceptedRemoteLinks: json[r'acceptedRemoteLinks'] is Iterable
            ? (json[r'acceptedRemoteLinks'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        rejectedRemoteLinks: json[r'rejectedRemoteLinks'] == null
          ? const {}
            : SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner.mapListFromJson(json[r'rejectedRemoteLinks']),
        unknownAssociations: RemoteLinkDataAssociationsInner.listFromJson(json[r'unknownAssociations']),
      );
    }
    return null;
  }

  static List<SubmitRemoteLinks202Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitRemoteLinks202Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitRemoteLinks202Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitRemoteLinks202Response> mapFromJson(dynamic json) {
    final map = <String, SubmitRemoteLinks202Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitRemoteLinks202Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitRemoteLinks202Response-objects as value to a dart map
  static Map<String, List<SubmitRemoteLinks202Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitRemoteLinks202Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitRemoteLinks202Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

