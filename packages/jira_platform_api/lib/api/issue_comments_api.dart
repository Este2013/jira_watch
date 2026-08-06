//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueCommentsApi {
  IssueCommentsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add comment
  ///
  /// Adds a comment to an issue.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Add comments* [ project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [Comment] comment (required):
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
  Future<Response> addCommentWithHttpInfo(String issueIdOrKey, Comment comment, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/comment'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = comment;

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

  /// Add comment
  ///
  /// Adds a comment to an issue.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Add comments* [ project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [Comment] comment (required):
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
  Future<Comment?> addComment(String issueIdOrKey, Comment comment, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await addCommentWithHttpInfo(issueIdOrKey, comment, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Comment',) as Comment;
    
    }
    return null;
  }

  /// Delete comment
  ///
  /// Deletes a comment.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Delete all comments*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any comment or *Delete own comments* to delete comment created by the user,  *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the comment.
  Future<Response> deleteCommentWithHttpInfo(String issueIdOrKey, String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/comment/{id}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Delete comment
  ///
  /// Deletes a comment.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Delete all comments*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any comment or *Delete own comments* to delete comment created by the user,  *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the comment.
  Future<void> deleteComment(String issueIdOrKey, String id, { Future<void>? abortTrigger, }) async {
    final response = await deleteCommentWithHttpInfo(issueIdOrKey, id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get comment
  ///
  /// Returns a comment.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the comment.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
  Future<Response> getCommentWithHttpInfo(String issueIdOrKey, String id, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/comment/{id}'
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

  /// Get comment
  ///
  /// Returns a comment.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the comment.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
  Future<Comment?> getComment(String issueIdOrKey, String id, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getCommentWithHttpInfo(issueIdOrKey, id, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Comment',) as Comment;
    
    }
    return null;
  }

  /// Get comments
  ///
  /// Returns all comments for an issue.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Comments are included in the response where the user has:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the comment has visibility restrictions, belongs to the group or has the role visibility is role visibility is restricted to.
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
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field. Accepts *created* to sort comments by their created date.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
  Future<Response> getCommentsWithHttpInfo(String issueIdOrKey, { int? startAt, int? maxResults, String? orderBy, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/comment'
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
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
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

  /// Get comments
  ///
  /// Returns all comments for an issue.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Comments are included in the response where the user has:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the comment has visibility restrictions, belongs to the group or has the role visibility is role visibility is restricted to.
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
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field. Accepts *created* to sort comments by their created date.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
  Future<PageOfComments?> getComments(String issueIdOrKey, { int? startAt, int? maxResults, String? orderBy, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getCommentsWithHttpInfo(issueIdOrKey, startAt: startAt, maxResults: maxResults, orderBy: orderBy, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageOfComments',) as PageOfComments;
    
    }
    return null;
  }

  /// Get comments by IDs
  ///
  /// Returns a [paginated](#pagination) list of comments specified by a list of comment IDs.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Comments are returned where the user:   *  has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the comment has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IssueCommentListRequestBean] issueCommentListRequestBean (required):
  ///   The list of comment IDs.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts a comma-separated list. Expand options include:   *  `renderedBody` Returns the comment body rendered in HTML.  *  `properties` Returns the comment's properties.
  Future<Response> getCommentsByIdsWithHttpInfo(IssueCommentListRequestBean issueCommentListRequestBean, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/comment/list';

    // ignore: prefer_final_locals
    Object? postBody = issueCommentListRequestBean;

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

  /// Get comments by IDs
  ///
  /// Returns a [paginated](#pagination) list of comments specified by a list of comment IDs.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Comments are returned where the user:   *  has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the comment has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [IssueCommentListRequestBean] issueCommentListRequestBean (required):
  ///   The list of comment IDs.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts a comma-separated list. Expand options include:   *  `renderedBody` Returns the comment body rendered in HTML.  *  `properties` Returns the comment's properties.
  Future<PageBeanComment?> getCommentsByIds(IssueCommentListRequestBean issueCommentListRequestBean, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getCommentsByIdsWithHttpInfo(issueCommentListRequestBean, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanComment',) as PageBeanComment;
    
    }
    return null;
  }

  /// Update comment
  ///
  /// Updates a comment.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Edit all comments*[ project permission](https://confluence.atlassian.com/x/yodKLg) to update any comment or *Edit own comments* to update comment created by the user.  *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.  **WARNING:** Child comments inherit visibility from their parent comment. Attempting to update a child comment's visibility will result in a 400 (Bad Request) error.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the comment.
  ///
  /// * [Comment] comment (required):
  ///
  /// * [bool] notifyUsers:
  ///   Whether users are notified when a comment is updated.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether screen security is overridden to enable uneditable fields to be edited. Available to Connect app users with the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) and Forge apps acting on behalf of users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
  Future<Response> updateCommentWithHttpInfo(String issueIdOrKey, String id, Comment comment, { bool? notifyUsers, bool? overrideEditableFlag, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/comment/{id}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = comment;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (notifyUsers != null) {
      queryParams.addAll(_queryParams('', 'notifyUsers', notifyUsers));
    }
    if (overrideEditableFlag != null) {
      queryParams.addAll(_queryParams('', 'overrideEditableFlag', overrideEditableFlag));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Update comment
  ///
  /// Updates a comment.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Edit all comments*[ project permission](https://confluence.atlassian.com/x/yodKLg) to update any comment or *Edit own comments* to update comment created by the user.  *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.  **WARNING:** Child comments inherit visibility from their parent comment. Attempting to update a child comment's visibility will result in a 400 (Bad Request) error.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] id (required):
  ///   The ID of the comment.
  ///
  /// * [Comment] comment (required):
  ///
  /// * [bool] notifyUsers:
  ///   Whether users are notified when a comment is updated.
  ///
  /// * [bool] overrideEditableFlag:
  ///   Whether screen security is overridden to enable uneditable fields to be edited. Available to Connect app users with the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) and Forge apps acting on behalf of users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
  Future<Comment?> updateComment(String issueIdOrKey, String id, Comment comment, { bool? notifyUsers, bool? overrideEditableFlag, String? expand, Future<void>? abortTrigger, }) async {
    final response = await updateCommentWithHttpInfo(issueIdOrKey, id, comment, notifyUsers: notifyUsers, overrideEditableFlag: overrideEditableFlag, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Comment',) as Comment;
    
    }
    return null;
  }
}
