//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class RedactionsApi {
  RedactionsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Redact Content in a Confluence Blog Post
  ///
  /// Redacts sensitive content in a Confluence blog post by replacing specified text ranges with redaction markers.  Each redaction in the response includes a unique UUID for restoration (except code block redactions).  The response metadata items maintain the same order as the input redaction pointers, and completely  overlapping redactions are merged into a single redaction with one UUID.  **Note**: This endpoint requires **Atlassian Guard Premium**. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to redact content from.
  ///
  /// * [PostRedactPageRequest] postRedactPageRequest:
  Future<Response> postRedactBlogWithHttpInfo(int id, { PostRedactPageRequest? postRedactPageRequest, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/redact'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = postRedactPageRequest;

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

  /// Redact Content in a Confluence Blog Post
  ///
  /// Redacts sensitive content in a Confluence blog post by replacing specified text ranges with redaction markers.  Each redaction in the response includes a unique UUID for restoration (except code block redactions).  The response metadata items maintain the same order as the input redaction pointers, and completely  overlapping redactions are merged into a single redaction with one UUID.  **Note**: This endpoint requires **Atlassian Guard Premium**. 
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to redact content from.
  ///
  /// * [PostRedactPageRequest] postRedactPageRequest:
  Future<RedactionResponse?> postRedactBlog(int id, { PostRedactPageRequest? postRedactPageRequest, Future<void>? abortTrigger, }) async {
    final response = await postRedactBlogWithHttpInfo(id, postRedactPageRequest: postRedactPageRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RedactionResponse',) as RedactionResponse;
    
    }
    return null;
  }

  /// Redact Content in a Confluence Page
  ///
  /// Redacts sensitive content in a Confluence page by replacing specified text ranges with redaction markers.  Each redaction in the response includes a unique UUID for restoration (except code block redactions).  The response metadata items maintain the same order as the input redaction pointers, and completely  overlapping redactions are merged into a single redaction with one UUID.  **Note**: This endpoint requires **Atlassian Guard Premium**. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to redact content from.
  ///
  /// * [PostRedactPageRequest] postRedactPageRequest:
  Future<Response> postRedactPageWithHttpInfo(int id, { PostRedactPageRequest? postRedactPageRequest, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/redact'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = postRedactPageRequest;

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

  /// Redact Content in a Confluence Page
  ///
  /// Redacts sensitive content in a Confluence page by replacing specified text ranges with redaction markers.  Each redaction in the response includes a unique UUID for restoration (except code block redactions).  The response metadata items maintain the same order as the input redaction pointers, and completely  overlapping redactions are merged into a single redaction with one UUID.  **Note**: This endpoint requires **Atlassian Guard Premium**. 
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to redact content from.
  ///
  /// * [PostRedactPageRequest] postRedactPageRequest:
  Future<RedactionResponse?> postRedactPage(int id, { PostRedactPageRequest? postRedactPageRequest, Future<void>? abortTrigger, }) async {
    final response = await postRedactPageWithHttpInfo(id, postRedactPageRequest: postRedactPageRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RedactionResponse',) as RedactionResponse;
    
    }
    return null;
  }
}
