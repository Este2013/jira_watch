//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueWorklogsApi {
  IssueWorklogsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add worklog
  ///
  /// Adds a worklog to an issue.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Work on issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key the issue.
  ///
  /// * [Worklog] worklog (required):
  ///
  /// * [bool] notifyUsers:
  ///   Whether users watching the issue are notified by email.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issue's time estimate, the options are:   *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `manual` Reduces the estimate by amount specified in `reduceBy`.  *  `auto` Reduces the estimate by the value of `timeSpent` in the worklog.
  ///
  /// * [String] newEstimate:
  ///   The value to set as the issue's remaining time estimate, as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). For example, *2d*. Required when `adjustEstimate` is `new`.
  ///
  /// * [String] reduceBy:
  ///   The amount to reduce the issue's remaining estimate by, as days (\\#d), hours (\\#h), or minutes (\\#m). For example, *2d*. Required when `adjustEstimate` is `manual`.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts `properties`, which returns worklog properties.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the worklog entry should be added to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Connect and Forge app users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) can use this flag.
  Future<Response> addWorklogWithHttpInfo(String issueIdOrKey, Worklog worklog, { bool? notifyUsers, String? adjustEstimate, String? newEstimate, String? reduceBy, String? expand, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = worklog;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (notifyUsers != null) {
      queryParams.addAll(_queryParams('', 'notifyUsers', notifyUsers));
    }
    if (adjustEstimate != null) {
      queryParams.addAll(_queryParams('', 'adjustEstimate', adjustEstimate));
    }
    if (newEstimate != null) {
      queryParams.addAll(_queryParams('', 'newEstimate', newEstimate));
    }
    if (reduceBy != null) {
      queryParams.addAll(_queryParams('', 'reduceBy', reduceBy));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (overrideEditableFlag != null) {
      queryParams.addAll(_queryParams('', 'overrideEditableFlag', overrideEditableFlag));
    }

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Add worklog
  ///
  /// Adds a worklog to an issue.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Work on issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key the issue.
  ///
  /// * [Worklog] worklog (required):
  ///
  /// * [bool] notifyUsers:
  ///   Whether users watching the issue are notified by email.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issue's time estimate, the options are:   *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `manual` Reduces the estimate by amount specified in `reduceBy`.  *  `auto` Reduces the estimate by the value of `timeSpent` in the worklog.
  ///
  /// * [String] newEstimate:
  ///   The value to set as the issue's remaining time estimate, as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). For example, *2d*. Required when `adjustEstimate` is `new`.
  ///
  /// * [String] reduceBy:
  ///   The amount to reduce the issue's remaining estimate by, as days (\\#d), hours (\\#h), or minutes (\\#m). For example, *2d*. Required when `adjustEstimate` is `manual`.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts `properties`, which returns worklog properties.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the worklog entry should be added to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Connect and Forge app users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) can use this flag.
  Future<Worklog?> addWorklog(String issueIdOrKey, Worklog worklog, { bool? notifyUsers, String? adjustEstimate, String? newEstimate, String? reduceBy, String? expand, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    final response = await addWorklogWithHttpInfo(issueIdOrKey, worklog, notifyUsers: notifyUsers, adjustEstimate: adjustEstimate, newEstimate: newEstimate, reduceBy: reduceBy, expand: expand, overrideEditableFlag: overrideEditableFlag, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Worklog',) as Worklog;
    
    }
    return null;
  }

  /// Bulk delete worklogs
  ///
  /// Deletes a list of worklogs from an issue. This is an experimental API with limitations:   *  You can't delete more than 5000 worklogs at once.  *  No notifications will be sent for deleted worklogs.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Delete all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any worklog.  *  If any worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [WorklogIdsRequestBean] worklogIdsRequestBean (required):
  ///   A JSON object containing a list of worklog IDs.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issue's time estimate, the options are:   *  `leave` Leaves the estimate unchanged.  *  `auto` Reduces the estimate by the aggregate value of `timeSpent` across all worklogs being deleted.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the work log entries should be removed to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Connect and Forge app users with admin permission can use this flag.
  Future<Response> bulkDeleteWorklogsWithHttpInfo(String issueIdOrKey, WorklogIdsRequestBean worklogIdsRequestBean, { String? adjustEstimate, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = worklogIdsRequestBean;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (adjustEstimate != null) {
      queryParams.addAll(_queryParams('', 'adjustEstimate', adjustEstimate));
    }
    if (overrideEditableFlag != null) {
      queryParams.addAll(_queryParams('', 'overrideEditableFlag', overrideEditableFlag));
    }

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Bulk delete worklogs
  ///
  /// Deletes a list of worklogs from an issue. This is an experimental API with limitations:   *  You can't delete more than 5000 worklogs at once.  *  No notifications will be sent for deleted worklogs.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Delete all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any worklog.  *  If any worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [WorklogIdsRequestBean] worklogIdsRequestBean (required):
  ///   A JSON object containing a list of worklog IDs.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issue's time estimate, the options are:   *  `leave` Leaves the estimate unchanged.  *  `auto` Reduces the estimate by the aggregate value of `timeSpent` across all worklogs being deleted.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the work log entries should be removed to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Connect and Forge app users with admin permission can use this flag.
  Future<void> bulkDeleteWorklogs(String issueIdOrKey, WorklogIdsRequestBean worklogIdsRequestBean, { String? adjustEstimate, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    final response = await bulkDeleteWorklogsWithHttpInfo(issueIdOrKey, worklogIdsRequestBean, adjustEstimate: adjustEstimate, overrideEditableFlag: overrideEditableFlag, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Bulk move worklogs
  ///
  /// Moves a list of worklogs from one issue to another. This is an experimental API with several limitations:   *  You can't move more than 5000 worklogs at once.  *  You can't move worklogs containing an attachment.  *  You can't move worklogs restricted by project roles.  *  No notifications will be sent for moved worklogs.  *  No webhooks or events will be sent for moved worklogs.  *  No issue history will be recorded for moved worklogs.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the projects containing the source and destination issues.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Delete all worklogs* [project permission](https://confluence.atlassian.com/x/yodKLg)  *  *Work on issues* [project permission](https://confluence.atlassian.com/x/yodKLg) to log work on an issue, that is to create a worklog entry, if time tracking is enabled. This permission is required as a prerequisite for applying the other time-tracking permissions  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///
  /// * [WorklogsMoveRequestBean] worklogsMoveRequestBean (required):
  ///   A JSON object containing a list of worklog IDs and the ID or key of the destination issue.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issues' time estimate, the options are:   *  `leave` Leaves the estimate unchanged.  *  `auto` Reduces the estimate by the aggregate value of `timeSpent` across all worklogs being moved in the source issue, and increases it in the destination issue.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the work log entry should be moved to and from the issues even if the issues are not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Connect and Forge app users with admin permission can use this flag.
  Future<Response> bulkMoveWorklogsWithHttpInfo(String issueIdOrKey, WorklogsMoveRequestBean worklogsMoveRequestBean, { String? adjustEstimate, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog/move'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = worklogsMoveRequestBean;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (adjustEstimate != null) {
      queryParams.addAll(_queryParams('', 'adjustEstimate', adjustEstimate));
    }
    if (overrideEditableFlag != null) {
      queryParams.addAll(_queryParams('', 'overrideEditableFlag', overrideEditableFlag));
    }

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Bulk move worklogs
  ///
  /// Moves a list of worklogs from one issue to another. This is an experimental API with several limitations:   *  You can't move more than 5000 worklogs at once.  *  You can't move worklogs containing an attachment.  *  You can't move worklogs restricted by project roles.  *  No notifications will be sent for moved worklogs.  *  No webhooks or events will be sent for moved worklogs.  *  No issue history will be recorded for moved worklogs.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the projects containing the source and destination issues.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Delete all worklogs* [project permission](https://confluence.atlassian.com/x/yodKLg)  *  *Work on issues* [project permission](https://confluence.atlassian.com/x/yodKLg) to log work on an issue, that is to create a worklog entry, if time tracking is enabled. This permission is required as a prerequisite for applying the other time-tracking permissions  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///
  /// * [WorklogsMoveRequestBean] worklogsMoveRequestBean (required):
  ///   A JSON object containing a list of worklog IDs and the ID or key of the destination issue.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issues' time estimate, the options are:   *  `leave` Leaves the estimate unchanged.  *  `auto` Reduces the estimate by the aggregate value of `timeSpent` across all worklogs being moved in the source issue, and increases it in the destination issue.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the work log entry should be moved to and from the issues even if the issues are not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Connect and Forge app users with admin permission can use this flag.
  Future<void> bulkMoveWorklogs(String issueIdOrKey, WorklogsMoveRequestBean worklogsMoveRequestBean, { String? adjustEstimate, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    final response = await bulkMoveWorklogsWithHttpInfo(issueIdOrKey, worklogsMoveRequestBean, adjustEstimate: adjustEstimate, overrideEditableFlag: overrideEditableFlag, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete worklog
  ///
  /// Deletes a worklog from an issue.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Delete all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any worklog or *Delete own worklogs* to delete worklogs created by the user,  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the worklog.
  ///
  /// * [bool] notifyUsers:
  ///   Whether users watching the issue are notified by email.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issue's time estimate, the options are:   *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `manual` Increases the estimate by amount specified in `increaseBy`.  *  `auto` Reduces the estimate by the value of `timeSpent` in the worklog.
  ///
  /// * [String] newEstimate:
  ///   The value to set as the issue's remaining time estimate, as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). For example, *2d*. Required when `adjustEstimate` is `new`.
  ///
  /// * [String] increaseBy:
  ///   The amount to increase the issue's remaining estimate by, as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). For example, *2d*. Required when `adjustEstimate` is `manual`.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the work log entry should be added to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Connect and Forge app users with admin permission can use this flag.
  Future<Response> deleteWorklogWithHttpInfo(String issueIdOrKey, String id, { bool? notifyUsers, String? adjustEstimate, String? newEstimate, String? increaseBy, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog/{id}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (notifyUsers != null) {
      queryParams.addAll(_queryParams('', 'notifyUsers', notifyUsers));
    }
    if (adjustEstimate != null) {
      queryParams.addAll(_queryParams('', 'adjustEstimate', adjustEstimate));
    }
    if (newEstimate != null) {
      queryParams.addAll(_queryParams('', 'newEstimate', newEstimate));
    }
    if (increaseBy != null) {
      queryParams.addAll(_queryParams('', 'increaseBy', increaseBy));
    }
    if (overrideEditableFlag != null) {
      queryParams.addAll(_queryParams('', 'overrideEditableFlag', overrideEditableFlag));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Delete worklog
  ///
  /// Deletes a worklog from an issue.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Delete all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any worklog or *Delete own worklogs* to delete worklogs created by the user,  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the worklog.
  ///
  /// * [bool] notifyUsers:
  ///   Whether users watching the issue are notified by email.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issue's time estimate, the options are:   *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `manual` Increases the estimate by amount specified in `increaseBy`.  *  `auto` Reduces the estimate by the value of `timeSpent` in the worklog.
  ///
  /// * [String] newEstimate:
  ///   The value to set as the issue's remaining time estimate, as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). For example, *2d*. Required when `adjustEstimate` is `new`.
  ///
  /// * [String] increaseBy:
  ///   The amount to increase the issue's remaining estimate by, as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). For example, *2d*. Required when `adjustEstimate` is `manual`.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the work log entry should be added to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Connect and Forge app users with admin permission can use this flag.
  Future<void> deleteWorklog(String issueIdOrKey, String id, { bool? notifyUsers, String? adjustEstimate, String? newEstimate, String? increaseBy, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    final response = await deleteWorklogWithHttpInfo(issueIdOrKey, id, notifyUsers: notifyUsers, adjustEstimate: adjustEstimate, newEstimate: newEstimate, increaseBy: increaseBy, overrideEditableFlag: overrideEditableFlag, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get IDs of deleted worklogs
  ///
  /// Returns a list of IDs and delete timestamps for worklogs deleted after a date and time.  This resource is paginated, with a limit of 1000 worklogs per page. Each page lists worklogs from oldest to youngest. If the number of items in the date range exceeds 1000, `until` indicates the timestamp of the youngest item on the page. Also, `nextPage` provides the URL for the next page of worklogs. The `lastPage` parameter is set to true on the last page of worklogs.  This resource does not return worklogs deleted during the minute preceding the request.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] since:
  ///   The date and time, as a UNIX timestamp in milliseconds, after which deleted worklogs are returned.
  Future<Response> getIdsOfWorklogsDeletedSinceWithHttpInfo({ int? since, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/worklog/deleted';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (since != null) {
      queryParams.addAll(_queryParams('', 'since', since));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get IDs of deleted worklogs
  ///
  /// Returns a list of IDs and delete timestamps for worklogs deleted after a date and time.  This resource is paginated, with a limit of 1000 worklogs per page. Each page lists worklogs from oldest to youngest. If the number of items in the date range exceeds 1000, `until` indicates the timestamp of the youngest item on the page. Also, `nextPage` provides the URL for the next page of worklogs. The `lastPage` parameter is set to true on the last page of worklogs.  This resource does not return worklogs deleted during the minute preceding the request.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [int] since:
  ///   The date and time, as a UNIX timestamp in milliseconds, after which deleted worklogs are returned.
  Future<ChangedWorklogs?> getIdsOfWorklogsDeletedSince({ int? since, Future<void>? abortTrigger, }) async {
    final response = await getIdsOfWorklogsDeletedSinceWithHttpInfo(since: since, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ChangedWorklogs',) as ChangedWorklogs;
    
    }
    return null;
  }

  /// Get IDs of updated worklogs
  ///
  /// Returns a list of IDs and update timestamps for worklogs updated after a date and time.  This resource is paginated, with a limit of 1000 worklogs per page. Each page lists worklogs from oldest to youngest. If the number of items in the date range exceeds 1000, `until` indicates the timestamp of the youngest item on the page. Also, `nextPage` provides the URL for the next page of worklogs. The `lastPage` parameter is set to true on the last page of worklogs.  This resource does not return worklogs updated during the minute preceding the request.  **[Permissions](#permissions) required:** Permission to access Jira, however, worklogs are only returned where either of the following is true:   *  the worklog is set as *Viewable by All Users*.  *  the user is a member of a project role or group with permission to view the worklog.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] since:
  ///   The date and time, as a UNIX timestamp in milliseconds, after which updated worklogs are returned.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog.
  Future<Response> getIdsOfWorklogsModifiedSinceWithHttpInfo({ int? since, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/worklog/updated';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (since != null) {
      queryParams.addAll(_queryParams('', 'since', since));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get IDs of updated worklogs
  ///
  /// Returns a list of IDs and update timestamps for worklogs updated after a date and time.  This resource is paginated, with a limit of 1000 worklogs per page. Each page lists worklogs from oldest to youngest. If the number of items in the date range exceeds 1000, `until` indicates the timestamp of the youngest item on the page. Also, `nextPage` provides the URL for the next page of worklogs. The `lastPage` parameter is set to true on the last page of worklogs.  This resource does not return worklogs updated during the minute preceding the request.  **[Permissions](#permissions) required:** Permission to access Jira, however, worklogs are only returned where either of the following is true:   *  the worklog is set as *Viewable by All Users*.  *  the user is a member of a project role or group with permission to view the worklog.
  ///
  /// Parameters:
  ///
  /// * [int] since:
  ///   The date and time, as a UNIX timestamp in milliseconds, after which updated worklogs are returned.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog.
  Future<ChangedWorklogs?> getIdsOfWorklogsModifiedSince({ int? since, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIdsOfWorklogsModifiedSinceWithHttpInfo(since: since, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ChangedWorklogs',) as ChangedWorklogs;
    
    }
    return null;
  }

  /// Get issue worklogs
  ///
  /// Returns worklogs for an issue (ordered by created time), starting from the oldest worklog or from the worklog started on or after a date and time.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Workloads are only returned where the user has:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [int] startedAfter:
  ///   The worklog start date and time, as a UNIX timestamp in milliseconds, after which worklogs are returned.
  ///
  /// * [int] startedBefore:
  ///   The worklog start date and time, as a UNIX timestamp in milliseconds, before which worklogs are returned.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts`properties`, which returns worklog properties.
  Future<Response> getIssueWorklogWithHttpInfo(String issueIdOrKey, { int? startAt, int? maxResults, int? startedAfter, int? startedBefore, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (startedAfter != null) {
      queryParams.addAll(_queryParams('', 'startedAfter', startedAfter));
    }
    if (startedBefore != null) {
      queryParams.addAll(_queryParams('', 'startedBefore', startedBefore));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get issue worklogs
  ///
  /// Returns worklogs for an issue (ordered by created time), starting from the oldest worklog or from the worklog started on or after a date and time.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Workloads are only returned where the user has:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [int] startedAfter:
  ///   The worklog start date and time, as a UNIX timestamp in milliseconds, after which worklogs are returned.
  ///
  /// * [int] startedBefore:
  ///   The worklog start date and time, as a UNIX timestamp in milliseconds, before which worklogs are returned.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts`properties`, which returns worklog properties.
  Future<PageOfWorklogs?> getIssueWorklog(String issueIdOrKey, { int? startAt, int? maxResults, int? startedAfter, int? startedBefore, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssueWorklogWithHttpInfo(issueIdOrKey, startAt: startAt, maxResults: maxResults, startedAfter: startedAfter, startedBefore: startedBefore, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageOfWorklogs',) as PageOfWorklogs;
    
    }
    return null;
  }

  /// Get worklog
  ///
  /// Returns a worklog.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the worklog.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts  `properties`, which returns worklog properties.
  Future<Response> getWorklogWithHttpInfo(String issueIdOrKey, String id, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog/{id}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get worklog
  ///
  /// Returns a worklog.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the worklog.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts  `properties`, which returns worklog properties.
  Future<Worklog?> getWorklog(String issueIdOrKey, String id, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getWorklogWithHttpInfo(issueIdOrKey, id, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Worklog',) as Worklog;
    
    }
    return null;
  }

  /// Get worklogs
  ///
  /// Returns worklog details for a list of worklog IDs.  The returned list of worklogs is limited to 1000 items.  **[Permissions](#permissions) required:** Permission to access Jira, however, worklogs are only returned where either of the following is true:   *  the worklog is set as *Viewable by All Users*.  *  the user is a member of a project role or group with permission to view the worklog.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorklogIdsRequestBean] worklogIdsRequestBean (required):
  ///   A JSON object containing a list of worklog IDs.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog.
  Future<Response> getWorklogsForIdsWithHttpInfo(WorklogIdsRequestBean worklogIdsRequestBean, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/worklog/list';

    // ignore: prefer_final_locals
    Object? postBody = worklogIdsRequestBean;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get worklogs
  ///
  /// Returns worklog details for a list of worklog IDs.  The returned list of worklogs is limited to 1000 items.  **[Permissions](#permissions) required:** Permission to access Jira, however, worklogs are only returned where either of the following is true:   *  the worklog is set as *Viewable by All Users*.  *  the user is a member of a project role or group with permission to view the worklog.
  ///
  /// Parameters:
  ///
  /// * [WorklogIdsRequestBean] worklogIdsRequestBean (required):
  ///   A JSON object containing a list of worklog IDs.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog.
  Future<List<Worklog>?> getWorklogsForIds(WorklogIdsRequestBean worklogIdsRequestBean, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getWorklogsForIdsWithHttpInfo(worklogIdsRequestBean, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Worklog>') as List)
        .cast<Worklog>()
        .toList(growable: false);

    }
    return null;
  }

  /// Update worklog
  ///
  /// Updates a worklog.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Edit all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to update any worklog or *Edit own worklogs* to update worklogs created by the user.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the worklog.
  ///
  /// * [Worklog] worklog (required):
  ///
  /// * [bool] notifyUsers:
  ///   Whether users watching the issue are notified by email.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issue's time estimate, the options are:   *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `auto` Updates the estimate by the difference between the original and updated value of `timeSpent` or `timeSpentSeconds`.
  ///
  /// * [String] newEstimate:
  ///   The value to set as the issue's remaining time estimate, as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). For example, *2d*. Required when `adjustEstimate` is `new`.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties`, which returns worklog properties.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the worklog should be added to the issue even if the issue is not editable. For example, because the issue is closed. Connect and Forge app users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) can use this flag.
  Future<Response> updateWorklogWithHttpInfo(String issueIdOrKey, String id, Worklog worklog, { bool? notifyUsers, String? adjustEstimate, String? newEstimate, String? expand, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog/{id}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = worklog;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (notifyUsers != null) {
      queryParams.addAll(_queryParams('', 'notifyUsers', notifyUsers));
    }
    if (adjustEstimate != null) {
      queryParams.addAll(_queryParams('', 'adjustEstimate', adjustEstimate));
    }
    if (newEstimate != null) {
      queryParams.addAll(_queryParams('', 'newEstimate', newEstimate));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (overrideEditableFlag != null) {
      queryParams.addAll(_queryParams('', 'overrideEditableFlag', overrideEditableFlag));
    }

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Update worklog
  ///
  /// Updates a worklog.  Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time tracking](https://confluence.atlassian.com/x/qoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Edit all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to update any worklog or *Edit own worklogs* to update worklogs created by the user.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the worklog.
  ///
  /// * [Worklog] worklog (required):
  ///
  /// * [bool] notifyUsers:
  ///   Whether users watching the issue are notified by email.
  ///
  /// * [String] adjustEstimate:
  ///   Defines how to update the issue's time estimate, the options are:   *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `auto` Updates the estimate by the difference between the original and updated value of `timeSpent` or `timeSpentSeconds`.
  ///
  /// * [String] newEstimate:
  ///   The value to set as the issue's remaining time estimate, as days (\\#d), hours (\\#h), or minutes (\\#m or \\#). For example, *2d*. Required when `adjustEstimate` is `new`.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties`, which returns worklog properties.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether the worklog should be added to the issue even if the issue is not editable. For example, because the issue is closed. Connect and Forge app users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) can use this flag.
  Future<Worklog?> updateWorklog(String issueIdOrKey, String id, Worklog worklog, { bool? notifyUsers, String? adjustEstimate, String? newEstimate, String? expand, bool? overrideEditableFlag, Future<void>? abortTrigger, }) async {
    final response = await updateWorklogWithHttpInfo(issueIdOrKey, id, worklog, notifyUsers: notifyUsers, adjustEstimate: adjustEstimate, newEstimate: newEstimate, expand: expand, overrideEditableFlag: overrideEditableFlag, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Worklog',) as Worklog;
    
    }
    return null;
  }
}
