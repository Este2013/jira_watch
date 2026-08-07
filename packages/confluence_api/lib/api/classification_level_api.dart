//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ClassificationLevelApi {
  ClassificationLevelApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete space default classification level
  ///
  /// Returns the [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/)  for a specific space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which default classification level should be deleted.
  Future<Response> deleteSpaceDefaultClassificationLevelWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}/classification-level/default'
      .replaceAll('{id}', id.toString());

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

  /// Delete space default classification level
  ///
  /// Returns the [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/)  for a specific space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which default classification level should be deleted.
  Future<void> deleteSpaceDefaultClassificationLevel(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteSpaceDefaultClassificationLevelWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get blog post classification level
  ///
  /// Returns the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the blog post. 'Permission to edit the blog post is required if trying to view classification level for a draft.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which classification level should be returned.
  ///
  /// * [String] status:
  ///   Status of blog post from which classification level will fetched.
  Future<Response> getBlogPostClassificationLevelWithHttpInfo(int id, { String? status, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/classification-level'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
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

  /// Get blog post classification level
  ///
  /// Returns the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the blog post. 'Permission to edit the blog post is required if trying to view classification level for a draft.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which classification level should be returned.
  ///
  /// * [String] status:
  ///   Status of blog post from which classification level will fetched.
  Future<ClassificationLevel?> getBlogPostClassificationLevel(int id, { String? status, Future<void>? abortTrigger, }) async {
    final response = await getBlogPostClassificationLevelWithHttpInfo(id, status: status, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClassificationLevel',) as ClassificationLevel;
    
    }
    return null;
  }

  /// Get list of classification levels
  ///
  /// Returns a list of [classification levels](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level)  available.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission).
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getClassificationLevelsWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/classification-levels';

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

  /// Get list of classification levels
  ///
  /// Returns a list of [classification levels](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level)  available.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission).
  Future<List<ClassificationLevel>?> getClassificationLevels({ Future<void>? abortTrigger, }) async {
    final response = await getClassificationLevelsWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ClassificationLevel>') as List)
        .cast<ClassificationLevel>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get database classification level
  ///
  /// Returns the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the database.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database for which classification level should be returned.
  Future<Response> getDatabaseClassificationLevelWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{id}/classification-level'
      .replaceAll('{id}', id.toString());

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

  /// Get database classification level
  ///
  /// Returns the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the database.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database for which classification level should be returned.
  Future<ClassificationLevel?> getDatabaseClassificationLevel(int id, { Future<void>? abortTrigger, }) async {
    final response = await getDatabaseClassificationLevelWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClassificationLevel',) as ClassificationLevel;
    
    }
    return null;
  }

  /// Get page classification level
  ///
  /// Returns the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the page. 'Permission to edit the page is required if trying to view classification level for a draft.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which classification level should be returned.
  ///
  /// * [String] status:
  ///   Status of page from which classification level will fetched.
  Future<Response> getPageClassificationLevelWithHttpInfo(int id, { String? status, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/classification-level'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
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

  /// Get page classification level
  ///
  /// Returns the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the page. 'Permission to edit the page is required if trying to view classification level for a draft.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which classification level should be returned.
  ///
  /// * [String] status:
  ///   Status of page from which classification level will fetched.
  Future<ClassificationLevel?> getPageClassificationLevel(int id, { String? status, Future<void>? abortTrigger, }) async {
    final response = await getPageClassificationLevelWithHttpInfo(id, status: status, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClassificationLevel',) as ClassificationLevel;
    
    }
    return null;
  }

  /// Get space default classification level
  ///
  /// Returns the [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/)  for a specific space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which default classification level should be returned.
  Future<Response> getSpaceDefaultClassificationLevelWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}/classification-level/default'
      .replaceAll('{id}', id.toString());

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

  /// Get space default classification level
  ///
  /// Returns the [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/)  for a specific space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which default classification level should be returned.
  Future<ClassificationLevel?> getSpaceDefaultClassificationLevel(int id, { Future<void>? abortTrigger, }) async {
    final response = await getSpaceDefaultClassificationLevelWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClassificationLevel',) as ClassificationLevel;
    
    }
    return null;
  }

  /// Get whiteboard classification level
  ///
  /// Returns the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the whiteboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard for which classification level should be returned.
  Future<Response> getWhiteboardClassificationLevelWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{id}/classification-level'
      .replaceAll('{id}', id.toString());

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

  /// Get whiteboard classification level
  ///
  /// Returns the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the whiteboard.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard for which classification level should be returned.
  Future<ClassificationLevel?> getWhiteboardClassificationLevel(int id, { Future<void>? abortTrigger, }) async {
    final response = await getWhiteboardClassificationLevelWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ClassificationLevel',) as ClassificationLevel;
    
    }
    return null;
  }

  /// Reset blog post classification level
  ///
  /// Resets the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific blog post for the space   [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the blog post.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which classification level should be updated.
  ///
  /// * [PostPageClassificationLevelRequest] postPageClassificationLevelRequest (required):
  Future<Response> postBlogPostClassificationLevelWithHttpInfo(int id, PostPageClassificationLevelRequest postPageClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/classification-level/reset'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = postPageClassificationLevelRequest;

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

  /// Reset blog post classification level
  ///
  /// Resets the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific blog post for the space   [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the blog post.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which classification level should be updated.
  ///
  /// * [PostPageClassificationLevelRequest] postPageClassificationLevelRequest (required):
  Future<void> postBlogPostClassificationLevel(int id, PostPageClassificationLevelRequest postPageClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await postBlogPostClassificationLevelWithHttpInfo(id, postPageClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Reset database classification level
  ///
  /// Resets the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific database for the space  [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the database.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database for which classification level should be updated.
  ///
  /// * [PostWhiteboardClassificationLevelRequest] postWhiteboardClassificationLevelRequest (required):
  Future<Response> postDatabaseClassificationLevelWithHttpInfo(int id, PostWhiteboardClassificationLevelRequest postWhiteboardClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{id}/classification-level/reset'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = postWhiteboardClassificationLevelRequest;

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

  /// Reset database classification level
  ///
  /// Resets the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific database for the space  [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the database.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database for which classification level should be updated.
  ///
  /// * [PostWhiteboardClassificationLevelRequest] postWhiteboardClassificationLevelRequest (required):
  Future<void> postDatabaseClassificationLevel(int id, PostWhiteboardClassificationLevelRequest postWhiteboardClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await postDatabaseClassificationLevelWithHttpInfo(id, postWhiteboardClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Reset page classification level
  ///
  /// Resets the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific page for the space  [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which classification level should be updated.
  ///
  /// * [PostPageClassificationLevelRequest] postPageClassificationLevelRequest (required):
  Future<Response> postPageClassificationLevelWithHttpInfo(int id, PostPageClassificationLevelRequest postPageClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/classification-level/reset'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = postPageClassificationLevelRequest;

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

  /// Reset page classification level
  ///
  /// Resets the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific page for the space  [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the page.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which classification level should be updated.
  ///
  /// * [PostPageClassificationLevelRequest] postPageClassificationLevelRequest (required):
  Future<void> postPageClassificationLevel(int id, PostPageClassificationLevelRequest postPageClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await postPageClassificationLevelWithHttpInfo(id, postPageClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Reset whiteboard classification level
  ///
  /// Resets the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific whiteboard for the space  [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the whiteboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard for which classification level should be updated.
  ///
  /// * [PostWhiteboardClassificationLevelRequest] postWhiteboardClassificationLevelRequest (required):
  Future<Response> postWhiteboardClassificationLevelWithHttpInfo(int id, PostWhiteboardClassificationLevelRequest postWhiteboardClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{id}/classification-level/reset'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = postWhiteboardClassificationLevelRequest;

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

  /// Reset whiteboard classification level
  ///
  /// Resets the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific whiteboard for the space  [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to view the whiteboard.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard for which classification level should be updated.
  ///
  /// * [PostWhiteboardClassificationLevelRequest] postWhiteboardClassificationLevelRequest (required):
  Future<void> postWhiteboardClassificationLevel(int id, PostWhiteboardClassificationLevelRequest postWhiteboardClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await postWhiteboardClassificationLevelWithHttpInfo(id, postWhiteboardClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update blog post classification level
  ///
  /// Updates the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to edit the blog post.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which classification level should be updated.
  ///
  /// * [PutPageClassificationLevelRequest] putPageClassificationLevelRequest (required):
  Future<Response> putBlogPostClassificationLevelWithHttpInfo(int id, PutPageClassificationLevelRequest putPageClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/classification-level'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = putPageClassificationLevelRequest;

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

  /// Update blog post classification level
  ///
  /// Updates the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to edit the blog post.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which classification level should be updated.
  ///
  /// * [PutPageClassificationLevelRequest] putPageClassificationLevelRequest (required):
  Future<void> putBlogPostClassificationLevel(int id, PutPageClassificationLevelRequest putPageClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await putBlogPostClassificationLevelWithHttpInfo(id, putPageClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update database classification level
  ///
  /// Updates the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to edit the database.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database for which classification level should be updated.
  ///
  /// * [PutWhiteboardClassificationLevelRequest] putWhiteboardClassificationLevelRequest (required):
  Future<Response> putDatabaseClassificationLevelWithHttpInfo(int id, PutWhiteboardClassificationLevelRequest putWhiteboardClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{id}/classification-level'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = putWhiteboardClassificationLevelRequest;

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

  /// Update database classification level
  ///
  /// Updates the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to edit the database.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database for which classification level should be updated.
  ///
  /// * [PutWhiteboardClassificationLevelRequest] putWhiteboardClassificationLevelRequest (required):
  Future<void> putDatabaseClassificationLevel(int id, PutWhiteboardClassificationLevelRequest putWhiteboardClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await putDatabaseClassificationLevelWithHttpInfo(id, putWhiteboardClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update page classification level
  ///
  /// Updates the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to edit the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which classification level should be updated.
  ///
  /// * [PutPageClassificationLevelRequest] putPageClassificationLevelRequest (required):
  Future<Response> putPageClassificationLevelWithHttpInfo(int id, PutPageClassificationLevelRequest putPageClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/classification-level'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = putPageClassificationLevelRequest;

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

  /// Update page classification level
  ///
  /// Updates the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to edit the page.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which classification level should be updated.
  ///
  /// * [PutPageClassificationLevelRequest] putPageClassificationLevelRequest (required):
  Future<void> putPageClassificationLevel(int id, PutPageClassificationLevelRequest putPageClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await putPageClassificationLevelWithHttpInfo(id, putPageClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update space default classification level
  ///
  /// Update the [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/)  for a specific space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which default classification level should be updated.
  ///
  /// * [PutSpaceDefaultClassificationLevelRequest] putSpaceDefaultClassificationLevelRequest (required):
  Future<Response> putSpaceDefaultClassificationLevelWithHttpInfo(int id, PutSpaceDefaultClassificationLevelRequest putSpaceDefaultClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}/classification-level/default'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = putSpaceDefaultClassificationLevelRequest;

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

  /// Update space default classification level
  ///
  /// Update the [default classification level](https://support.atlassian.com/security-and-access-policies/docs/what-is-a-default-classification-level/)  for a specific space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which default classification level should be updated.
  ///
  /// * [PutSpaceDefaultClassificationLevelRequest] putSpaceDefaultClassificationLevelRequest (required):
  Future<void> putSpaceDefaultClassificationLevel(int id, PutSpaceDefaultClassificationLevelRequest putSpaceDefaultClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await putSpaceDefaultClassificationLevelWithHttpInfo(id, putSpaceDefaultClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update whiteboard classification level
  ///
  /// Updates the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to edit the whiteboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard for which classification level should be updated.
  ///
  /// * [PutWhiteboardClassificationLevelRequest] putWhiteboardClassificationLevelRequest (required):
  Future<Response> putWhiteboardClassificationLevelWithHttpInfo(int id, PutWhiteboardClassificationLevelRequest putWhiteboardClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{id}/classification-level'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = putWhiteboardClassificationLevelRequest;

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

  /// Update whiteboard classification level
  ///
  /// Updates the [classification level](https://developer.atlassian.com/cloud/admin/dlp/rest/intro/#Classification%20level) for a specific whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: 'Permission to access the Confluence site ('Can use' global permission) and permission to edit the whiteboard.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard for which classification level should be updated.
  ///
  /// * [PutWhiteboardClassificationLevelRequest] putWhiteboardClassificationLevelRequest (required):
  Future<void> putWhiteboardClassificationLevel(int id, PutWhiteboardClassificationLevelRequest putWhiteboardClassificationLevelRequest, { Future<void>? abortTrigger, }) async {
    final response = await putWhiteboardClassificationLevelWithHttpInfo(id, putWhiteboardClassificationLevelRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
