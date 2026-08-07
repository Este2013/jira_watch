//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Votes {
  /// Returns a new [Votes] instance.
  Votes({
    this.hasVoted,
    this.self,
    this.voters = const [],
    this.votes,
  });

  /// Whether the user making this request has voted on the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hasVoted;

  /// The URL of these issue vote details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// List of the users who have voted on this issue. An empty list is returned when the calling user doesn't have the *View voters and watchers* project permission.
  List<User> voters;

  /// The number of votes on the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? votes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Votes &&
    other.hasVoted == hasVoted &&
    other.self == self &&
    _deepEquality.equals(other.voters, voters) &&
    other.votes == votes;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (hasVoted == null ? 0 : hasVoted!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (voters.hashCode) +
    (votes == null ? 0 : votes!.hashCode);

  @override
  String toString() => 'Votes[hasVoted=$hasVoted, self=$self, voters=$voters, votes=$votes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.hasVoted != null) {
      json[r'hasVoted'] = this.hasVoted;
    } else {
      json[r'hasVoted'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
      json[r'voters'] = this.voters;
    if (this.votes != null) {
      json[r'votes'] = this.votes;
    } else {
      json[r'votes'] = null;
    }
    return json;
  }

  /// Returns a new [Votes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Votes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Votes(
        hasVoted: mapValueOfType<bool>(json, r'hasVoted'),
        self: mapValueOfType<String>(json, r'self'),
        voters: User.listFromJson(json[r'voters']),
        votes: mapValueOfType<int>(json, r'votes'),
      );
    }
    return null;
  }

  static List<Votes> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Votes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Votes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Votes> mapFromJson(dynamic json) {
    final map = <String, Votes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Votes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Votes-objects as value to a dart map
  static Map<String, List<Votes>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Votes>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Votes.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

