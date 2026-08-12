//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CommentApi {
  CommentApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create footer comment
  ///
  /// Create a footer comment.  The footer comment can be made against several locations:  - at the top level (specifying pageId or blogPostId in the request body) - as a reply (specifying parentCommentId in the request body) - against an attachment (note: this is different than the comments added via the attachment properties page on the UI, which are referred to as version comments) - against a custom content  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create comments in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateFooterCommentModel] createFooterCommentModel (required):
  ///   The footer comment to be created
  Future<Response> createFooterCommentWithHttpInfo(CreateFooterCommentModel createFooterCommentModel, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/footer-comments';

    // ignore: prefer_final_locals
    Object? postBody = createFooterCommentModel;

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

  /// Create footer comment
  ///
  /// Create a footer comment.  The footer comment can be made against several locations:  - at the top level (specifying pageId or blogPostId in the request body) - as a reply (specifying parentCommentId in the request body) - against an attachment (note: this is different than the comments added via the attachment properties page on the UI, which are referred to as version comments) - against a custom content  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create comments in the space.
  ///
  /// Parameters:
  ///
  /// * [CreateFooterCommentModel] createFooterCommentModel (required):
  ///   The footer comment to be created
  Future<CreateFooterComment201Response?> createFooterComment(CreateFooterCommentModel createFooterCommentModel, { Future<void>? abortTrigger, }) async {
    final response = await createFooterCommentWithHttpInfo(createFooterCommentModel, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateFooterComment201Response',) as CreateFooterComment201Response;
    
    }
    return null;
  }

  /// Create inline comment
  ///
  /// Create an inline comment. This can be at the top level (specifying pageId or blogPostId in the request body) or as a reply (specifying parentCommentId in the request body). Note the inlineCommentProperties object in the request body is used to select the text the inline comment should be tied to. This is what determines the text  highlighting when viewing a page in Confluence.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create comments in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateInlineCommentModel] createInlineCommentModel (required):
  ///   The inline comment to be created
  Future<Response> createInlineCommentWithHttpInfo(CreateInlineCommentModel createInlineCommentModel, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/inline-comments';

    // ignore: prefer_final_locals
    Object? postBody = createInlineCommentModel;

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

  /// Create inline comment
  ///
  /// Create an inline comment. This can be at the top level (specifying pageId or blogPostId in the request body) or as a reply (specifying parentCommentId in the request body). Note the inlineCommentProperties object in the request body is used to select the text the inline comment should be tied to. This is what determines the text  highlighting when viewing a page in Confluence.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create comments in the space.
  ///
  /// Parameters:
  ///
  /// * [CreateInlineCommentModel] createInlineCommentModel (required):
  ///   The inline comment to be created
  Future<CreateInlineComment201Response?> createInlineComment(CreateInlineCommentModel createInlineCommentModel, { Future<void>? abortTrigger, }) async {
    final response = await createInlineCommentWithHttpInfo(createInlineCommentModel, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateInlineComment201Response',) as CreateInlineComment201Response;
    
    }
    return null;
  }

  /// Delete footer comment
  ///
  /// Deletes a footer comment. This is a permanent deletion and cannot be reverted.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to delete comments in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  Future<Response> deleteFooterCommentWithHttpInfo(int commentId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/footer-comments/{comment-id}'
      .replaceAll('{comment-id}', commentId.toString());

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

  /// Delete footer comment
  ///
  /// Deletes a footer comment. This is a permanent deletion and cannot be reverted.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to delete comments in the space.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  Future<void> deleteFooterComment(int commentId, { Future<void>? abortTrigger, }) async {
    final response = await deleteFooterCommentWithHttpInfo(commentId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete inline comment
  ///
  /// Deletes an inline comment. This is a permanent deletion and cannot be reverted.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to delete comments in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be deleted.
  Future<Response> deleteInlineCommentWithHttpInfo(int commentId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/inline-comments/{comment-id}'
      .replaceAll('{comment-id}', commentId.toString());

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

  /// Delete inline comment
  ///
  /// Deletes an inline comment. This is a permanent deletion and cannot be reverted.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to delete comments in the space.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be deleted.
  Future<void> deleteInlineComment(int commentId, { Future<void>? abortTrigger, }) async {
    final response = await deleteInlineCommentWithHttpInfo(commentId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get attachment comments
  ///
  /// Returns the comments of the specific attachment. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment and its corresponding containers.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment for which comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [int] version:
  ///   Version number of the attachment to retrieve comments for. If no version provided, retrieves comments for the latest version.
  Future<Response> getAttachmentCommentsWithHttpInfo(String id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, CommentSortOrder? sort, int? version, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{id}/footer-comments'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (version != null) {
      queryParams.addAll(_queryParams('', 'version', version));
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

  /// Get attachment comments
  ///
  /// Returns the comments of the specific attachment. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment and its corresponding containers.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment for which comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [int] version:
  ///   Version number of the attachment to retrieve comments for. If no version provided, retrieves comments for the latest version.
  Future<MultiEntityResultAttachmentCommentModel?> getAttachmentComments(String id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, CommentSortOrder? sort, int? version, Future<void>? abortTrigger, }) async {
    final response = await getAttachmentCommentsWithHttpInfo(id, bodyFormat: bodyFormat, cursor: cursor, limit: limit, sort: sort, version: version, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultAttachmentCommentModel',) as MultiEntityResultAttachmentCommentModel;
    
    }
    return null;
  }

  /// Get footer comments for blog post
  ///
  /// Returns the root footer comments of specific blog post. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which footer comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [List<String>] status:
  ///   Filter the footer comment being retrieved by its status.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getBlogPostFooterCommentsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, List<String>? status, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/footer-comments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get footer comments for blog post
  ///
  /// Returns the root footer comments of specific blog post. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which footer comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [List<String>] status:
  ///   Filter the footer comment being retrieved by its status.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultBlogPostCommentModel?> getBlogPostFooterComments(int id, { PrimaryBodyRepresentation? bodyFormat, List<String>? status, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getBlogPostFooterCommentsWithHttpInfo(id, bodyFormat: bodyFormat, status: status, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultBlogPostCommentModel',) as MultiEntityResultBlogPostCommentModel;
    
    }
    return null;
  }

  /// Get inline comments for blog post
  ///
  /// Returns the root inline comments of specific blog post. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which inline comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [List<String>] status:
  ///   Filter the inline comment being retrieved by its status.
  ///
  /// * [List<String>] resolutionStatus:
  ///   Filter the inline comment being retrieved by its resolution status.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of inline comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getBlogPostInlineCommentsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, List<String>? status, List<String>? resolutionStatus, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/inline-comments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (resolutionStatus != null) {
      queryParams.addAll(_queryParams('multi', 'resolution-status', resolutionStatus));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get inline comments for blog post
  ///
  /// Returns the root inline comments of specific blog post. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which inline comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [List<String>] status:
  ///   Filter the inline comment being retrieved by its status.
  ///
  /// * [List<String>] resolutionStatus:
  ///   Filter the inline comment being retrieved by its resolution status.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of inline comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultBlogPostInlineCommentModel?> getBlogPostInlineComments(int id, { PrimaryBodyRepresentation? bodyFormat, List<String>? status, List<String>? resolutionStatus, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getBlogPostInlineCommentsWithHttpInfo(id, bodyFormat: bodyFormat, status: status, resolutionStatus: resolutionStatus, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultBlogPostInlineCommentModel',) as MultiEntityResultBlogPostInlineCommentModel;
    
    }
    return null;
  }

  /// Get custom content comments
  ///
  /// Returns the comments of the specific custom content. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content and its corresponding containers.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content for which comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<Response> getCustomContentCommentsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, CommentSortOrder? sort, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{id}/footer-comments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
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

  /// Get custom content comments
  ///
  /// Returns the comments of the specific custom content. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content and its corresponding containers.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content for which comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<MultiEntityResultCustomContentCommentModel?> getCustomContentComments(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, CommentSortOrder? sort, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentCommentsWithHttpInfo(id, bodyFormat: bodyFormat, cursor: cursor, limit: limit, sort: sort, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultCustomContentCommentModel',) as MultiEntityResultCustomContentCommentModel;
    
    }
    return null;
  }

  /// Get footer comment by id
  ///
  /// Retrieves a footer comment by id  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the container and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  ///
  /// * [PrimaryBodyRepresentationSingle] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this footer comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this footer comment in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLikes:
  ///   Includes likes associated with this footer comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this footer comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this footer comment in the response. By default this is included and can be omitted by setting the value to `false`.
  Future<Response> getFooterCommentByIdWithHttpInfo(int commentId, { PrimaryBodyRepresentationSingle? bodyFormat, int? version, bool? includeProperties, bool? includeOperations, bool? includeLikes, bool? includeVersions, bool? includeVersion, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/footer-comments/{comment-id}'
      .replaceAll('{comment-id}', commentId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (version != null) {
      queryParams.addAll(_queryParams('', 'version', version));
    }
    if (includeProperties != null) {
      queryParams.addAll(_queryParams('', 'include-properties', includeProperties));
    }
    if (includeOperations != null) {
      queryParams.addAll(_queryParams('', 'include-operations', includeOperations));
    }
    if (includeLikes != null) {
      queryParams.addAll(_queryParams('', 'include-likes', includeLikes));
    }
    if (includeVersions != null) {
      queryParams.addAll(_queryParams('', 'include-versions', includeVersions));
    }
    if (includeVersion != null) {
      queryParams.addAll(_queryParams('', 'include-version', includeVersion));
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

  /// Get footer comment by id
  ///
  /// Retrieves a footer comment by id  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the container and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  ///
  /// * [PrimaryBodyRepresentationSingle] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this footer comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this footer comment in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLikes:
  ///   Includes likes associated with this footer comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this footer comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this footer comment in the response. By default this is included and can be omitted by setting the value to `false`.
  Future<CreateFooterComment201Response?> getFooterCommentById(int commentId, { PrimaryBodyRepresentationSingle? bodyFormat, int? version, bool? includeProperties, bool? includeOperations, bool? includeLikes, bool? includeVersions, bool? includeVersion, Future<void>? abortTrigger, }) async {
    final response = await getFooterCommentByIdWithHttpInfo(commentId, bodyFormat: bodyFormat, version: version, includeProperties: includeProperties, includeOperations: includeOperations, includeLikes: includeLikes, includeVersions: includeVersions, includeVersion: includeVersion, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateFooterComment201Response',) as CreateFooterComment201Response;
    
    }
    return null;
  }

  /// Get children footer comments
  ///
  /// Returns the children footer comments of specific comment. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the parent comment for which footer comment children should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getFooterCommentChildrenWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/footer-comments/{id}/children'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get children footer comments
  ///
  /// Returns the children footer comments of specific comment. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the parent comment for which footer comment children should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultChildrenCommentModel?> getFooterCommentChildren(int id, { PrimaryBodyRepresentation? bodyFormat, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getFooterCommentChildrenWithHttpInfo(id, bodyFormat: bodyFormat, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultChildrenCommentModel',) as MultiEntityResultChildrenCommentModel;
    
    }
    return null;
  }

  /// Get footer comments
  ///
  /// Returns all footer comments. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the container and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getFooterCommentsWithHttpInfo({ PrimaryBodyRepresentation? bodyFormat, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/footer-comments';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get footer comments
  ///
  /// Returns all footer comments. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the container and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultFooterCommentModel?> getFooterComments({ PrimaryBodyRepresentation? bodyFormat, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getFooterCommentsWithHttpInfo(bodyFormat: bodyFormat, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultFooterCommentModel',) as MultiEntityResultFooterCommentModel;
    
    }
    return null;
  }

  /// Get inline comment by id
  ///
  /// Retrieves an inline comment by id  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  ///
  /// * [PrimaryBodyRepresentationSingle] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this inline comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this inline comment in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLikes:
  ///   Includes likes associated with this inline comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this inline comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this inline comment in the response. By default this is included and can be omitted by setting the value to `false`.
  Future<Response> getInlineCommentByIdWithHttpInfo(int commentId, { PrimaryBodyRepresentationSingle? bodyFormat, int? version, bool? includeProperties, bool? includeOperations, bool? includeLikes, bool? includeVersions, bool? includeVersion, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/inline-comments/{comment-id}'
      .replaceAll('{comment-id}', commentId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (version != null) {
      queryParams.addAll(_queryParams('', 'version', version));
    }
    if (includeProperties != null) {
      queryParams.addAll(_queryParams('', 'include-properties', includeProperties));
    }
    if (includeOperations != null) {
      queryParams.addAll(_queryParams('', 'include-operations', includeOperations));
    }
    if (includeLikes != null) {
      queryParams.addAll(_queryParams('', 'include-likes', includeLikes));
    }
    if (includeVersions != null) {
      queryParams.addAll(_queryParams('', 'include-versions', includeVersions));
    }
    if (includeVersion != null) {
      queryParams.addAll(_queryParams('', 'include-version', includeVersion));
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

  /// Get inline comment by id
  ///
  /// Retrieves an inline comment by id  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  ///
  /// * [PrimaryBodyRepresentationSingle] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this inline comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this inline comment in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLikes:
  ///   Includes likes associated with this inline comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this inline comment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this inline comment in the response. By default this is included and can be omitted by setting the value to `false`.
  Future<CreateInlineComment201Response?> getInlineCommentById(int commentId, { PrimaryBodyRepresentationSingle? bodyFormat, int? version, bool? includeProperties, bool? includeOperations, bool? includeLikes, bool? includeVersions, bool? includeVersion, Future<void>? abortTrigger, }) async {
    final response = await getInlineCommentByIdWithHttpInfo(commentId, bodyFormat: bodyFormat, version: version, includeProperties: includeProperties, includeOperations: includeOperations, includeLikes: includeLikes, includeVersions: includeVersions, includeVersion: includeVersion, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateInlineComment201Response',) as CreateInlineComment201Response;
    
    }
    return null;
  }

  /// Get children inline comments
  ///
  /// Returns the children inline comments of specific comment. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the parent comment for which inline comment children should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getInlineCommentChildrenWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/inline-comments/{id}/children'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get children inline comments
  ///
  /// Returns the children inline comments of specific comment. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the parent comment for which inline comment children should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultInlineCommentChildrenModel?> getInlineCommentChildren(int id, { PrimaryBodyRepresentation? bodyFormat, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getInlineCommentChildrenWithHttpInfo(id, bodyFormat: bodyFormat, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultInlineCommentChildrenModel',) as MultiEntityResultInlineCommentChildrenModel;
    
    }
    return null;
  }

  /// Get inline comments
  ///
  /// Returns all inline comments. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getInlineCommentsWithHttpInfo({ PrimaryBodyRepresentation? bodyFormat, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/inline-comments';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get inline comments
  ///
  /// Returns all inline comments. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultInlineCommentModel?> getInlineComments({ PrimaryBodyRepresentation? bodyFormat, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getInlineCommentsWithHttpInfo(bodyFormat: bodyFormat, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultInlineCommentModel',) as MultiEntityResultInlineCommentModel;
    
    }
    return null;
  }

  /// Get footer comments for page
  ///
  /// Returns the root footer comments of specific page. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which footer comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [List<String>] status:
  ///   Filter the footer comment being retrieved by its status.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getPageFooterCommentsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, List<String>? status, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/footer-comments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get footer comments for page
  ///
  /// Returns the root footer comments of specific page. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which footer comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [List<String>] status:
  ///   Filter the footer comment being retrieved by its status.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of footer comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultPageCommentModel?> getPageFooterComments(int id, { PrimaryBodyRepresentation? bodyFormat, List<String>? status, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getPageFooterCommentsWithHttpInfo(id, bodyFormat: bodyFormat, status: status, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultPageCommentModel',) as MultiEntityResultPageCommentModel;
    
    }
    return null;
  }

  /// Get inline comments for page
  ///
  /// Returns the root inline comments of specific page. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which inline comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [List<String>] status:
  ///   Filter the inline comment being retrieved by its status.
  ///
  /// * [List<String>] resolutionStatus:
  ///   Filter the inline comment being retrieved by its resolution status.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of inline comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getPageInlineCommentsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, List<String>? status, List<String>? resolutionStatus, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/inline-comments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (resolutionStatus != null) {
      queryParams.addAll(_queryParams('multi', 'resolution-status', resolutionStatus));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get inline comments for page
  ///
  /// Returns the root inline comments of specific page. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which inline comments should be returned.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format type to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [List<String>] status:
  ///   Filter the inline comment being retrieved by its status.
  ///
  /// * [List<String>] resolutionStatus:
  ///   Filter the inline comment being retrieved by its resolution status.
  ///
  /// * [CommentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of inline comments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultPageInlineCommentModel?> getPageInlineComments(int id, { PrimaryBodyRepresentation? bodyFormat, List<String>? status, List<String>? resolutionStatus, CommentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getPageInlineCommentsWithHttpInfo(id, bodyFormat: bodyFormat, status: status, resolutionStatus: resolutionStatus, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultPageInlineCommentModel',) as MultiEntityResultPageInlineCommentModel;
    
    }
    return null;
  }

  /// Update footer comment
  ///
  /// Update a footer comment. This can be used to update the body text of a comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create comments in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  ///
  /// * [UpdateFooterCommentRequest] updateFooterCommentRequest (required):
  ///   The footer comment to be created
  Future<Response> updateFooterCommentWithHttpInfo(int commentId, UpdateFooterCommentRequest updateFooterCommentRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/footer-comments/{comment-id}'
      .replaceAll('{comment-id}', commentId.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateFooterCommentRequest;

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

  /// Update footer comment
  ///
  /// Update a footer comment. This can be used to update the body text of a comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create comments in the space.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  ///
  /// * [UpdateFooterCommentRequest] updateFooterCommentRequest (required):
  ///   The footer comment to be created
  Future<FooterCommentModel?> updateFooterComment(int commentId, UpdateFooterCommentRequest updateFooterCommentRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateFooterCommentWithHttpInfo(commentId, updateFooterCommentRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FooterCommentModel',) as FooterCommentModel;
    
    }
    return null;
  }

  /// Update inline comment
  ///
  /// Update an inline comment. This can be used to update the body text of a comment and/or to resolve the comment  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create comments in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  ///
  /// * [UpdateInlineCommentModel] updateInlineCommentModel (required):
  ///   The inline comment to be updated
  Future<Response> updateInlineCommentWithHttpInfo(int commentId, UpdateInlineCommentModel updateInlineCommentModel, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/inline-comments/{comment-id}'
      .replaceAll('{comment-id}', commentId.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateInlineCommentModel;

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

  /// Update inline comment
  ///
  /// Update an inline comment. This can be used to update the body text of a comment and/or to resolve the comment  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create comments in the space.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to be retrieved.
  ///
  /// * [UpdateInlineCommentModel] updateInlineCommentModel (required):
  ///   The inline comment to be updated
  Future<CreateInlineComment201Response?> updateInlineComment(int commentId, UpdateInlineCommentModel updateInlineCommentModel, { Future<void>? abortTrigger, }) async {
    final response = await updateInlineCommentWithHttpInfo(commentId, updateInlineCommentModel, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateInlineComment201Response',) as CreateInlineComment201Response;
    
    }
    return null;
  }
}
