//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ContentPropertiesApi {
  ContentPropertiesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create content property for attachment
  ///
  /// Creates a new content property for an attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the attachment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createAttachmentPropertyWithHttpInfo(String attachmentId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{attachment-id}/properties'
      .replaceAll('{attachment-id}', attachmentId);

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for attachment
  ///
  /// Creates a new content property for an attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the attachment.
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createAttachmentProperty(String attachmentId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createAttachmentPropertyWithHttpInfo(attachmentId, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Create content property for blog post
  ///
  /// Creates a new property for a blogpost.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the blog post.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createBlogpostPropertyWithHttpInfo(int blogpostId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{blogpost-id}/properties'
      .replaceAll('{blogpost-id}', blogpostId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for blog post
  ///
  /// Creates a new property for a blogpost.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the blog post.
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createBlogpostProperty(int blogpostId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createBlogpostPropertyWithHttpInfo(blogpostId, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Create content property for comment
  ///
  /// Creates a new content property for a comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the comment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createCommentPropertyWithHttpInfo(int commentId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/comments/{comment-id}/properties'
      .replaceAll('{comment-id}', commentId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for comment
  ///
  /// Creates a new content property for a comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the comment.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createCommentProperty(int commentId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createCommentPropertyWithHttpInfo(commentId, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Create content property for custom content
  ///
  /// Creates a new content property for a piece of custom content.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the custom content.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createCustomContentPropertyWithHttpInfo(int customContentId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{custom-content-id}/properties'
      .replaceAll('{custom-content-id}', customContentId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for custom content
  ///
  /// Creates a new content property for a piece of custom content.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the custom content.
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createCustomContentProperty(int customContentId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createCustomContentPropertyWithHttpInfo(customContentId, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Create content property for database
  ///
  /// Creates a new content property for a database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the database.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createDatabasePropertyWithHttpInfo(int id, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{id}/properties'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for database
  ///
  /// Creates a new content property for a database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the database.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createDatabaseProperty(int id, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createDatabasePropertyWithHttpInfo(id, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Create content property for folder
  ///
  /// Creates a new content property for a folder.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the folder.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createFolderPropertyWithHttpInfo(int id, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders/{id}/properties'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for folder
  ///
  /// Creates a new content property for a folder.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the folder.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createFolderProperty(int id, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createFolderPropertyWithHttpInfo(id, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Create content property for page
  ///
  /// Creates a new content property for a page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createPagePropertyWithHttpInfo(int pageId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{page-id}/properties'
      .replaceAll('{page-id}', pageId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for page
  ///
  /// Creates a new content property for a page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the page.
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createPageProperty(int pageId, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createPagePropertyWithHttpInfo(pageId, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Create content property for Smart Link in the content tree
  ///
  /// Creates a new content property for a Smart Link in the content tree.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the Smart Link in the content tree.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the Smart Link in the content tree to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createSmartLinkPropertyWithHttpInfo(int id, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds/{id}/properties'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for Smart Link in the content tree
  ///
  /// Creates a new content property for a Smart Link in the content tree.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the Smart Link in the content tree.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the Smart Link in the content tree to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createSmartLinkProperty(int id, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createSmartLinkPropertyWithHttpInfo(id, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Create content property for whiteboard
  ///
  /// Creates a new content property for a whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the whiteboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<Response> createWhiteboardPropertyWithHttpInfo(int id, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{id}/properties'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyCreateRequest;

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

  /// Create content property for whiteboard
  ///
  /// Creates a new content property for a whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to update the whiteboard.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard to create a property for.
  ///
  /// * [ContentPropertyCreateRequest] contentPropertyCreateRequest (required):
  ///   The content property to be created
  Future<ContentProperty?> createWhiteboardProperty(int id, ContentPropertyCreateRequest contentPropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createWhiteboardPropertyWithHttpInfo(id, contentPropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Delete content property for attachment by id
  ///
  /// Deletes a content property for an attachment by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to attachment the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteAttachmentPropertyByIdWithHttpInfo(String attachmentId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{attachment-id}/properties/{property-id}'
      .replaceAll('{attachment-id}', attachmentId)
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for attachment by id
  ///
  /// Deletes a content property for an attachment by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to attachment the page.
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteAttachmentPropertyById(String attachmentId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteAttachmentPropertyByIdWithHttpInfo(attachmentId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete content property for blogpost by id
  ///
  /// Deletes a content property for a blogpost by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the blog post.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteBlogpostPropertyByIdWithHttpInfo(int blogpostId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{blogpost-id}/properties/{property-id}'
      .replaceAll('{blogpost-id}', blogpostId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for blogpost by id
  ///
  /// Deletes a content property for a blogpost by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the blog post.
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteBlogpostPropertyById(int blogpostId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteBlogpostPropertyByIdWithHttpInfo(blogpostId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete content property for comment by id
  ///
  /// Deletes a content property for a comment by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the comment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteCommentPropertyByIdWithHttpInfo(int commentId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/comments/{comment-id}/properties/{property-id}'
      .replaceAll('{comment-id}', commentId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for comment by id
  ///
  /// Deletes a content property for a comment by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the comment.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteCommentPropertyById(int commentId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteCommentPropertyByIdWithHttpInfo(commentId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete content property for custom content by id
  ///
  /// Deletes a content property for a piece of custom content by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the custom content.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteCustomContentPropertyByIdWithHttpInfo(int customContentId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{custom-content-id}/properties/{property-id}'
      .replaceAll('{custom-content-id}', customContentId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for custom content by id
  ///
  /// Deletes a content property for a piece of custom content by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the custom content.
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteCustomContentPropertyById(int customContentId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteCustomContentPropertyByIdWithHttpInfo(customContentId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete content property for database by id
  ///
  /// Deletes a content property for a database by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the database.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] databaseId (required):
  ///   The ID of the database the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteDatabasePropertyByIdWithHttpInfo(int databaseId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{database-id}/properties/{property-id}'
      .replaceAll('{database-id}', databaseId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for database by id
  ///
  /// Deletes a content property for a database by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the database.
  ///
  /// Parameters:
  ///
  /// * [int] databaseId (required):
  ///   The ID of the database the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteDatabasePropertyById(int databaseId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteDatabasePropertyByIdWithHttpInfo(databaseId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete content property for folder by id
  ///
  /// Deletes a content property for a folder by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the folder.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///   The ID of the folder the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteFolderPropertyByIdWithHttpInfo(int folderId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders/{folder-id}/properties/{property-id}'
      .replaceAll('{folder-id}', folderId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for folder by id
  ///
  /// Deletes a content property for a folder by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the folder.
  ///
  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///   The ID of the folder the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteFolderPropertyById(int folderId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteFolderPropertyByIdWithHttpInfo(folderId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete content property for page by id
  ///
  /// Deletes a content property for a page by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deletePagePropertyByIdWithHttpInfo(int pageId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{page-id}/properties/{property-id}'
      .replaceAll('{page-id}', pageId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for page by id
  ///
  /// Deletes a content property for a page by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the page.
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deletePagePropertyById(int pageId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deletePagePropertyByIdWithHttpInfo(pageId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete content property for Smart Link in the content tree by id
  ///
  /// Deletes a content property for a Smart Link in the content tree by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the Smart Link in the content tree.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] embedId (required):
  ///   The ID of the Smart Link in the content tree the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteSmartLinkPropertyByIdWithHttpInfo(int embedId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds/{embed-id}/properties/{property-id}'
      .replaceAll('{embed-id}', embedId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for Smart Link in the content tree by id
  ///
  /// Deletes a content property for a Smart Link in the content tree by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the Smart Link in the content tree.
  ///
  /// Parameters:
  ///
  /// * [int] embedId (required):
  ///   The ID of the Smart Link in the content tree the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteSmartLinkPropertyById(int embedId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteSmartLinkPropertyByIdWithHttpInfo(embedId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete content property for whiteboard by id
  ///
  /// Deletes a content property for a whiteboard by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the whiteboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] whiteboardId (required):
  ///   The ID of the whiteboard the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteWhiteboardPropertyByIdWithHttpInfo(int whiteboardId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{whiteboard-id}/properties/{property-id}'
      .replaceAll('{whiteboard-id}', whiteboardId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete content property for whiteboard by id
  ///
  /// Deletes a content property for a whiteboard by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the whiteboard.
  ///
  /// Parameters:
  ///
  /// * [int] whiteboardId (required):
  ///   The ID of the whiteboard the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteWhiteboardPropertyById(int whiteboardId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteWhiteboardPropertyByIdWithHttpInfo(whiteboardId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get content properties for attachment
  ///
  /// Retrieves all Content Properties tied to a specified attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getAttachmentContentPropertiesWithHttpInfo(String attachmentId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{attachment-id}/properties'
      .replaceAll('{attachment-id}', attachmentId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for attachment
  ///
  /// Retrieves all Content Properties tied to a specified attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment.
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getAttachmentContentProperties(String attachmentId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getAttachmentContentPropertiesWithHttpInfo(attachmentId, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for attachment by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property to be returned
  Future<Response> getAttachmentContentPropertiesByIdWithHttpInfo(String attachmentId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{attachment-id}/properties/{property-id}'
      .replaceAll('{attachment-id}', attachmentId)
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for attachment by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment.
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property to be returned
  Future<ContentProperty?> getAttachmentContentPropertiesById(String attachmentId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getAttachmentContentPropertiesByIdWithHttpInfo(attachmentId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Get content properties for blog post
  ///
  /// Retrieves all Content Properties tied to a specified blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getBlogpostContentPropertiesWithHttpInfo(int blogpostId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{blogpost-id}/properties'
      .replaceAll('{blogpost-id}', blogpostId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for blog post
  ///
  /// Retrieves all Content Properties tied to a specified blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post.
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getBlogpostContentProperties(int blogpostId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getBlogpostContentPropertiesWithHttpInfo(blogpostId, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for blog post by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property being requested
  Future<Response> getBlogpostContentPropertiesByIdWithHttpInfo(int blogpostId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{blogpost-id}/properties/{property-id}'
      .replaceAll('{blogpost-id}', blogpostId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for blog post by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post.
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property being requested
  Future<ContentProperty?> getBlogpostContentPropertiesById(int blogpostId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getBlogpostContentPropertiesByIdWithHttpInfo(blogpostId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Get content properties for comment
  ///
  /// Retrieves Content Properties attached to a specified comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the comment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getCommentContentPropertiesWithHttpInfo(int commentId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/comments/{comment-id}/properties'
      .replaceAll('{comment-id}', commentId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for comment
  ///
  /// Retrieves Content Properties attached to a specified comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the comment.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getCommentContentProperties(int commentId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getCommentContentPropertiesWithHttpInfo(commentId, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for comment by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the comment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<Response> getCommentContentPropertiesByIdWithHttpInfo(int commentId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/comments/{comment-id}/properties/{property-id}'
      .replaceAll('{comment-id}', commentId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for comment by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the comment.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<ContentProperty?> getCommentContentPropertiesById(int commentId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getCommentContentPropertiesByIdWithHttpInfo(commentId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Get content properties for custom content
  ///
  /// Retrieves Content Properties tied to a specified custom content.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getCustomContentContentPropertiesWithHttpInfo(int customContentId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{custom-content-id}/properties'
      .replaceAll('{custom-content-id}', customContentId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for custom content
  ///
  /// Retrieves Content Properties tied to a specified custom content.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content.
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getCustomContentContentProperties(int customContentId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentContentPropertiesWithHttpInfo(customContentId, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for custom content by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified custom content.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<Response> getCustomContentContentPropertiesByIdWithHttpInfo(int customContentId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{custom-content-id}/properties/{property-id}'
      .replaceAll('{custom-content-id}', customContentId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for custom content by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified custom content.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<ContentProperty?> getCustomContentContentPropertiesById(int customContentId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getCustomContentContentPropertiesByIdWithHttpInfo(customContentId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Get content properties for database
  ///
  /// Retrieves Content Properties tied to a specified database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the database.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getDatabaseContentPropertiesWithHttpInfo(int id, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{id}/properties'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for database
  ///
  /// Retrieves Content Properties tied to a specified database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the database.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getDatabaseContentProperties(int id, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getDatabaseContentPropertiesWithHttpInfo(id, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for database by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the database.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] databaseId (required):
  ///   The ID of the database for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<Response> getDatabaseContentPropertiesByIdWithHttpInfo(int databaseId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{database-id}/properties/{property-id}'
      .replaceAll('{database-id}', databaseId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for database by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the database.
  ///
  /// Parameters:
  ///
  /// * [int] databaseId (required):
  ///   The ID of the database for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<ContentProperty?> getDatabaseContentPropertiesById(int databaseId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getDatabaseContentPropertiesByIdWithHttpInfo(databaseId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Get content properties for folder
  ///
  /// Retrieves Content Properties tied to a specified folder.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the folder.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getFolderContentPropertiesWithHttpInfo(int id, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders/{id}/properties'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for folder
  ///
  /// Retrieves Content Properties tied to a specified folder.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the folder.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getFolderContentProperties(int id, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getFolderContentPropertiesWithHttpInfo(id, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for folder by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified folder.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the folder.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///   The ID of the folder for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<Response> getFolderContentPropertiesByIdWithHttpInfo(int folderId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders/{folder-id}/properties/{property-id}'
      .replaceAll('{folder-id}', folderId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for folder by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified folder.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the folder.
  ///
  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///   The ID of the folder for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<ContentProperty?> getFolderContentPropertiesById(int folderId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getFolderContentPropertiesByIdWithHttpInfo(folderId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Get content properties for page
  ///
  /// Retrieves Content Properties tied to a specified page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getPageContentPropertiesWithHttpInfo(int pageId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{page-id}/properties'
      .replaceAll('{page-id}', pageId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for page
  ///
  /// Retrieves Content Properties tied to a specified page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getPageContentProperties(int pageId, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getPageContentPropertiesWithHttpInfo(pageId, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for page by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<Response> getPageContentPropertiesByIdWithHttpInfo(int pageId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{page-id}/properties/{property-id}'
      .replaceAll('{page-id}', pageId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for page by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<ContentProperty?> getPageContentPropertiesById(int pageId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getPageContentPropertiesByIdWithHttpInfo(pageId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Get content properties for Smart Link in the content tree
  ///
  /// Retrieves Content Properties tied to a specified Smart Link in the content tree.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the Smart Link in the content tree.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the Smart Link in the content tree for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of Smart Links per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getSmartLinkContentPropertiesWithHttpInfo(int id, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds/{id}/properties'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for Smart Link in the content tree
  ///
  /// Retrieves Content Properties tied to a specified Smart Link in the content tree.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the Smart Link in the content tree.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the Smart Link in the content tree for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of Smart Links per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getSmartLinkContentProperties(int id, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getSmartLinkContentPropertiesWithHttpInfo(id, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for Smart Link in the content tree by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified Smart Link in the content tree.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the Smart Link in the content tree.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] embedId (required):
  ///   The ID of the Smart Link in the content tree for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<Response> getSmartLinkContentPropertiesByIdWithHttpInfo(int embedId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds/{embed-id}/properties/{property-id}'
      .replaceAll('{embed-id}', embedId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for Smart Link in the content tree by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified Smart Link in the content tree.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the Smart Link in the content tree.
  ///
  /// Parameters:
  ///
  /// * [int] embedId (required):
  ///   The ID of the Smart Link in the content tree for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<ContentProperty?> getSmartLinkContentPropertiesById(int embedId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getSmartLinkContentPropertiesByIdWithHttpInfo(embedId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Get content properties for whiteboard
  ///
  /// Retrieves Content Properties tied to a specified whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the whiteboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getWhiteboardContentPropertiesWithHttpInfo(int id, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{id}/properties'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get content properties for whiteboard
  ///
  /// Retrieves Content Properties tied to a specified whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the whiteboard.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard for which content properties should be returned.
  ///
  /// * [String] key:
  ///   Filters the response to return a specific content property with matching key (case sensitive).
  ///
  /// * [ContentPropertySortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultContentProperty?> getWhiteboardContentProperties(int id, { String? key, ContentPropertySortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getWhiteboardContentPropertiesWithHttpInfo(id, key: key, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultContentProperty',) as MultiEntityResultContentProperty;
    
    }
    return null;
  }

  /// Get content property for whiteboard by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the whiteboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] whiteboardId (required):
  ///   The ID of the whiteboard for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<Response> getWhiteboardContentPropertiesByIdWithHttpInfo(int whiteboardId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{whiteboard-id}/properties/{property-id}'
      .replaceAll('{whiteboard-id}', whiteboardId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get content property for whiteboard by id
  ///
  /// Retrieves a specific Content Property by ID that is attached to a specified whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the whiteboard.
  ///
  /// Parameters:
  ///
  /// * [int] whiteboardId (required):
  ///   The ID of the whiteboard for which content properties should be returned.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the content property being requested.
  Future<ContentProperty?> getWhiteboardContentPropertiesById(int whiteboardId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getWhiteboardContentPropertiesByIdWithHttpInfo(whiteboardId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for attachment by id
  ///
  /// Update a content property for attachment by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the attachment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updateAttachmentPropertyByIdWithHttpInfo(String attachmentId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{attachment-id}/properties/{property-id}'
      .replaceAll('{attachment-id}', attachmentId)
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for attachment by id
  ///
  /// Update a content property for attachment by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the attachment.
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updateAttachmentPropertyById(String attachmentId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateAttachmentPropertyByIdWithHttpInfo(attachmentId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for blog post by id
  ///
  /// Update a content property for blog post by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the blog post.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updateBlogpostPropertyByIdWithHttpInfo(int blogpostId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{blogpost-id}/properties/{property-id}'
      .replaceAll('{blogpost-id}', blogpostId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for blog post by id
  ///
  /// Update a content property for blog post by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the blog post.
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updateBlogpostPropertyById(int blogpostId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateBlogpostPropertyByIdWithHttpInfo(blogpostId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for comment by id
  ///
  /// Update a content property for a comment by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the comment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updateCommentPropertyByIdWithHttpInfo(int commentId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/comments/{comment-id}/properties/{property-id}'
      .replaceAll('{comment-id}', commentId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for comment by id
  ///
  /// Update a content property for a comment by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the comment.
  ///
  /// Parameters:
  ///
  /// * [int] commentId (required):
  ///   The ID of the comment the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updateCommentPropertyById(int commentId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateCommentPropertyByIdWithHttpInfo(commentId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for custom content by id
  ///
  /// Update a content property for a piece of custom content by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the custom content.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updateCustomContentPropertyByIdWithHttpInfo(int customContentId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{custom-content-id}/properties/{property-id}'
      .replaceAll('{custom-content-id}', customContentId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for custom content by id
  ///
  /// Update a content property for a piece of custom content by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the custom content.
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updateCustomContentPropertyById(int customContentId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateCustomContentPropertyByIdWithHttpInfo(customContentId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for database by id
  ///
  /// Update a content property for a database by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the database.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] databaseId (required):
  ///   The ID of the database the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updateDatabasePropertyByIdWithHttpInfo(int databaseId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{database-id}/properties/{property-id}'
      .replaceAll('{database-id}', databaseId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for database by id
  ///
  /// Update a content property for a database by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the database.
  ///
  /// Parameters:
  ///
  /// * [int] databaseId (required):
  ///   The ID of the database the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updateDatabasePropertyById(int databaseId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateDatabasePropertyByIdWithHttpInfo(databaseId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for folder by id
  ///
  /// Update a content property for a folder by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the folder.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///   The ID of the folder the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updateFolderPropertyByIdWithHttpInfo(int folderId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders/{folder-id}/properties/{property-id}'
      .replaceAll('{folder-id}', folderId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for folder by id
  ///
  /// Update a content property for a folder by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the folder.
  ///
  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///   The ID of the folder the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updateFolderPropertyById(int folderId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateFolderPropertyByIdWithHttpInfo(folderId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for page by id
  ///
  /// Update a content property for a page by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updatePagePropertyByIdWithHttpInfo(int pageId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{page-id}/properties/{property-id}'
      .replaceAll('{page-id}', pageId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for page by id
  ///
  /// Update a content property for a page by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the page.
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updatePagePropertyById(int pageId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updatePagePropertyByIdWithHttpInfo(pageId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for Smart Link in the content tree by id
  ///
  /// Update a content property for a Smart Link in the content tree by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the Smart Link in the content tree.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] embedId (required):
  ///   The ID of the Smart Link in the content tree the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updateSmartLinkPropertyByIdWithHttpInfo(int embedId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds/{embed-id}/properties/{property-id}'
      .replaceAll('{embed-id}', embedId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for Smart Link in the content tree by id
  ///
  /// Update a content property for a Smart Link in the content tree by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the Smart Link in the content tree.
  ///
  /// Parameters:
  ///
  /// * [int] embedId (required):
  ///   The ID of the Smart Link in the content tree the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updateSmartLinkPropertyById(int embedId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateSmartLinkPropertyByIdWithHttpInfo(embedId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }

  /// Update content property for whiteboard by id
  ///
  /// Update a content property for a whiteboard by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the whiteboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] whiteboardId (required):
  ///   The ID of the whiteboard the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<Response> updateWhiteboardPropertyByIdWithHttpInfo(int whiteboardId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{whiteboard-id}/properties/{property-id}'
      .replaceAll('{whiteboard-id}', whiteboardId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = contentPropertyUpdateRequest;

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

  /// Update content property for whiteboard by id
  ///
  /// Update a content property for a whiteboard by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the whiteboard.
  ///
  /// Parameters:
  ///
  /// * [int] whiteboardId (required):
  ///   The ID of the whiteboard the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [ContentPropertyUpdateRequest] contentPropertyUpdateRequest (required):
  ///   The content property to be updated.
  Future<ContentProperty?> updateWhiteboardPropertyById(int whiteboardId, int propertyId, ContentPropertyUpdateRequest contentPropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateWhiteboardPropertyByIdWithHttpInfo(whiteboardId, propertyId, contentPropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentProperty',) as ContentProperty;
    
    }
    return null;
  }
}
