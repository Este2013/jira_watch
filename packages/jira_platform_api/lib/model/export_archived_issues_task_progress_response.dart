//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ExportArchivedIssuesTaskProgressResponse {
  /// Returns a new [ExportArchivedIssuesTaskProgressResponse] instance.
  ExportArchivedIssuesTaskProgressResponse({
    this.fileUrl,
    this.payload,
    this.progress,
    this.status,
    this.submittedTime,
    this.taskId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fileUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? payload;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? progress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? submittedTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? taskId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ExportArchivedIssuesTaskProgressResponse &&
    other.fileUrl == fileUrl &&
    other.payload == payload &&
    other.progress == progress &&
    other.status == status &&
    other.submittedTime == submittedTime &&
    other.taskId == taskId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fileUrl == null ? 0 : fileUrl!.hashCode) +
    (payload == null ? 0 : payload!.hashCode) +
    (progress == null ? 0 : progress!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (submittedTime == null ? 0 : submittedTime!.hashCode) +
    (taskId == null ? 0 : taskId!.hashCode);

  @override
  String toString() => 'ExportArchivedIssuesTaskProgressResponse[fileUrl=$fileUrl, payload=$payload, progress=$progress, status=$status, submittedTime=$submittedTime, taskId=$taskId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fileUrl != null) {
      json[r'fileUrl'] = this.fileUrl;
    } else {
      json[r'fileUrl'] = null;
    }
    if (this.payload != null) {
      json[r'payload'] = this.payload;
    } else {
      json[r'payload'] = null;
    }
    if (this.progress != null) {
      json[r'progress'] = this.progress;
    } else {
      json[r'progress'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.submittedTime != null) {
      json[r'submittedTime'] = this.submittedTime!.toUtc().toIso8601String();
    } else {
      json[r'submittedTime'] = null;
    }
    if (this.taskId != null) {
      json[r'taskId'] = this.taskId;
    } else {
      json[r'taskId'] = null;
    }
    return json;
  }

  /// Returns a new [ExportArchivedIssuesTaskProgressResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ExportArchivedIssuesTaskProgressResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ExportArchivedIssuesTaskProgressResponse(
        fileUrl: mapValueOfType<String>(json, r'fileUrl'),
        payload: mapValueOfType<String>(json, r'payload'),
        progress: mapValueOfType<int>(json, r'progress'),
        status: mapValueOfType<String>(json, r'status'),
        submittedTime: mapDateTime(json, r'submittedTime', r''),
        taskId: mapValueOfType<String>(json, r'taskId'),
      );
    }
    return null;
  }

  static List<ExportArchivedIssuesTaskProgressResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ExportArchivedIssuesTaskProgressResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExportArchivedIssuesTaskProgressResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ExportArchivedIssuesTaskProgressResponse> mapFromJson(dynamic json) {
    final map = <String, ExportArchivedIssuesTaskProgressResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ExportArchivedIssuesTaskProgressResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ExportArchivedIssuesTaskProgressResponse-objects as value to a dart map
  static Map<String, List<ExportArchivedIssuesTaskProgressResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ExportArchivedIssuesTaskProgressResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ExportArchivedIssuesTaskProgressResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

