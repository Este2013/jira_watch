//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class BacklogApi {
  BacklogApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Move issues to backlog
  ///
  /// Move issues to the backlog.   This operation is equivalent to remove future and active sprints from a given set of issues. At most 50 issues may be moved at once.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MoveIssuesToBacklogRequest] moveIssuesToBacklogRequest (required):
  Future<Response> moveIssuesToBacklogWithHttpInfo(MoveIssuesToBacklogRequest moveIssuesToBacklogRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/backlog/issue';

    // ignore: prefer_final_locals
    Object? postBody = moveIssuesToBacklogRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Move issues to backlog
  ///
  /// Move issues to the backlog.   This operation is equivalent to remove future and active sprints from a given set of issues. At most 50 issues may be moved at once.
  ///
  /// Parameters:
  ///
  /// * [MoveIssuesToBacklogRequest] moveIssuesToBacklogRequest (required):
  Future<void> moveIssuesToBacklog(MoveIssuesToBacklogRequest moveIssuesToBacklogRequest, { Future<void>? abortTrigger, }) async {
    final response = await moveIssuesToBacklogWithHttpInfo(moveIssuesToBacklogRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Move issues to backlog for board
  ///
  /// Move issues to the backlog of a particular board (if they are already on that board).   This operation is equivalent to remove future and active sprints from a given set of issues if the board has sprints If the board does not have sprints this will put the issues back into the backlog from the board. At most 50 issues may be moved at once.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///
  /// * [MoveIssuesToBacklogForBoardRequest] moveIssuesToBacklogForBoardRequest (required):
  Future<Response> moveIssuesToBacklogForBoardWithHttpInfo(int boardId, MoveIssuesToBacklogForBoardRequest moveIssuesToBacklogForBoardRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/backlog/{boardId}/issue'
      .replaceAll('{boardId}', boardId.toString());

    // ignore: prefer_final_locals
    Object? postBody = moveIssuesToBacklogForBoardRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Move issues to backlog for board
  ///
  /// Move issues to the backlog of a particular board (if they are already on that board).   This operation is equivalent to remove future and active sprints from a given set of issues if the board has sprints If the board does not have sprints this will put the issues back into the backlog from the board. At most 50 issues may be moved at once.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///
  /// * [MoveIssuesToBacklogForBoardRequest] moveIssuesToBacklogForBoardRequest (required):
  Future<void> moveIssuesToBacklogForBoard(int boardId, MoveIssuesToBacklogForBoardRequest moveIssuesToBacklogForBoardRequest, { Future<void>? abortTrigger, }) async {
    final response = await moveIssuesToBacklogForBoardWithHttpInfo(boardId, moveIssuesToBacklogForBoardRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
