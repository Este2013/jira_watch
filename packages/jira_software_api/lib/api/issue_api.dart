//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueApi {
  IssueApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Estimate issue for board
  ///
  /// Updates the estimation of the issue. boardId param is required. This param determines which field will be updated on a issue.  Note that this resource changes the estimation field of the issue regardless of appearance the field on the screen.  Original time tracking estimation field accepts estimation in formats like \"1w\", \"2d\", \"3h\", \"20m\" or number which represent number of minutes. However, internally the field stores and returns the estimation as a number of seconds.  The field used for estimation on the given board can be obtained from [board configuration resource](#agile/1.0/board-getConfiguration). More information about the field are returned by [edit meta resource](#api-rest-api-3-issue-issueIdOrKey-editmeta-get) or [field resource](#api-rest-api-3-field-get).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the requested issue.
  ///
  /// * [EstimateIssueForBoardRequest] estimateIssueForBoardRequest (required):
  ///   bean that contains value of a new estimation.
  ///
  /// * [int] boardId:
  ///   The ID of the board required to determine which field is used for estimation.
  Future<Response> estimateIssueForBoardWithHttpInfo(String issueIdOrKey, EstimateIssueForBoardRequest estimateIssueForBoardRequest, { int? boardId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/issue/{issueIdOrKey}/estimation'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = estimateIssueForBoardRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (boardId != null) {
      queryParams.addAll(_queryParams('', 'boardId', boardId));
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

  /// Estimate issue for board
  ///
  /// Updates the estimation of the issue. boardId param is required. This param determines which field will be updated on a issue.  Note that this resource changes the estimation field of the issue regardless of appearance the field on the screen.  Original time tracking estimation field accepts estimation in formats like \"1w\", \"2d\", \"3h\", \"20m\" or number which represent number of minutes. However, internally the field stores and returns the estimation as a number of seconds.  The field used for estimation on the given board can be obtained from [board configuration resource](#agile/1.0/board-getConfiguration). More information about the field are returned by [edit meta resource](#api-rest-api-3-issue-issueIdOrKey-editmeta-get) or [field resource](#api-rest-api-3-field-get).
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the requested issue.
  ///
  /// * [EstimateIssueForBoardRequest] estimateIssueForBoardRequest (required):
  ///   bean that contains value of a new estimation.
  ///
  /// * [int] boardId:
  ///   The ID of the board required to determine which field is used for estimation.
  Future<void> estimateIssueForBoard(String issueIdOrKey, EstimateIssueForBoardRequest estimateIssueForBoardRequest, { int? boardId, Future<void>? abortTrigger, }) async {
    final response = await estimateIssueForBoardWithHttpInfo(issueIdOrKey, estimateIssueForBoardRequest, boardId: boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issue
  ///
  /// Returns a single issue, for a given issue ID or issue key. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the requested issue.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Agile fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  ///
  /// * [bool] updateHistory:
  ///   A boolean indicating whether the issue retrieved by this method should be added to the current user's issue history
  Future<Response> getIssueWithHttpInfo(String issueIdOrKey, { List<Object>? fields, String? expand, bool? updateHistory, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/issue/{issueIdOrKey}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (fields != null) {
      queryParams.addAll(_queryParams('multi', 'fields', fields));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (updateHistory != null) {
      queryParams.addAll(_queryParams('', 'updateHistory', updateHistory));
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

  /// Get issue
  ///
  /// Returns a single issue, for a given issue ID or issue key. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the requested issue.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Agile fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  ///
  /// * [bool] updateHistory:
  ///   A boolean indicating whether the issue retrieved by this method should be added to the current user's issue history
  Future<void> getIssue(String issueIdOrKey, { List<Object>? fields, String? expand, bool? updateHistory, Future<void>? abortTrigger, }) async {
    final response = await getIssueWithHttpInfo(issueIdOrKey, fields: fields, expand: expand, updateHistory: updateHistory, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issue estimation for board
  ///
  /// Returns the estimation of the issue and a fieldId of the field that is used for it. `boardId` param is required. This param determines which field will be updated on a issue.  Original time internally stores and returns the estimation as a number of seconds.  The field used for estimation on the given board can be obtained from [board configuration resource](#agile/1.0/board-getConfiguration). More information about the field are returned by [edit meta resource](#api-rest-api-3-issue-getEditIssueMeta) or [field resource](#api-rest-api-3-field-get).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the requested issue.
  ///
  /// * [int] boardId:
  ///   The ID of the board required to determine which field is used for estimation.
  Future<Response> getIssueEstimationForBoardWithHttpInfo(String issueIdOrKey, { int? boardId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/issue/{issueIdOrKey}/estimation'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (boardId != null) {
      queryParams.addAll(_queryParams('', 'boardId', boardId));
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

  /// Get issue estimation for board
  ///
  /// Returns the estimation of the issue and a fieldId of the field that is used for it. `boardId` param is required. This param determines which field will be updated on a issue.  Original time internally stores and returns the estimation as a number of seconds.  The field used for estimation on the given board can be obtained from [board configuration resource](#agile/1.0/board-getConfiguration). More information about the field are returned by [edit meta resource](#api-rest-api-3-issue-getEditIssueMeta) or [field resource](#api-rest-api-3-field-get).
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the requested issue.
  ///
  /// * [int] boardId:
  ///   The ID of the board required to determine which field is used for estimation.
  Future<void> getIssueEstimationForBoard(String issueIdOrKey, { int? boardId, Future<void>? abortTrigger, }) async {
    final response = await getIssueEstimationForBoardWithHttpInfo(issueIdOrKey, boardId: boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Rank issues
  ///
  /// Moves (ranks) issues before or after a given issue. At most 50 issues may be ranked at once.  This operation may fail for some issues, although this will be rare. In that case the 207 status code is returned for the whole response and detailed information regarding each issue is available in the response body.  If rankCustomFieldId is not defined, the default rank field will be used.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MoveIssuesToBacklogForBoardRequest] moveIssuesToBacklogForBoardRequest (required):
  ///   bean which contains list of issues to rank and information where it should be ranked.
  Future<Response> rankIssuesWithHttpInfo(MoveIssuesToBacklogForBoardRequest moveIssuesToBacklogForBoardRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/issue/rank';

    // ignore: prefer_final_locals
    Object? postBody = moveIssuesToBacklogForBoardRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Rank issues
  ///
  /// Moves (ranks) issues before or after a given issue. At most 50 issues may be ranked at once.  This operation may fail for some issues, although this will be rare. In that case the 207 status code is returned for the whole response and detailed information regarding each issue is available in the response body.  If rankCustomFieldId is not defined, the default rank field will be used.
  ///
  /// Parameters:
  ///
  /// * [MoveIssuesToBacklogForBoardRequest] moveIssuesToBacklogForBoardRequest (required):
  ///   bean which contains list of issues to rank and information where it should be ranked.
  Future<void> rankIssues(MoveIssuesToBacklogForBoardRequest moveIssuesToBacklogForBoardRequest, { Future<void>? abortTrigger, }) async {
    final response = await rankIssuesWithHttpInfo(moveIssuesToBacklogForBoardRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
