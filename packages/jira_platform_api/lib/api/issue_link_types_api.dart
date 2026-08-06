//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueLinkTypesApi {
  IssueLinkTypesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create issue link type
  ///
  /// Creates an issue link type. Use this operation to create descriptions of the reasons why issues are linked. The issue link type consists of a name and descriptions for a link's inward and outward relationships.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IssueLinkType] issueLinkType (required):
  Future<Response> createIssueLinkTypeWithHttpInfo(IssueLinkType issueLinkType, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issueLinkType';

    // ignore: prefer_final_locals
    Object? postBody = issueLinkType;

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

  /// Create issue link type
  ///
  /// Creates an issue link type. Use this operation to create descriptions of the reasons why issues are linked. The issue link type consists of a name and descriptions for a link's inward and outward relationships.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [IssueLinkType] issueLinkType (required):
  Future<IssueLinkType?> createIssueLinkType(IssueLinkType issueLinkType, { Future<void>? abortTrigger, }) async {
    final response = await createIssueLinkTypeWithHttpInfo(issueLinkType, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueLinkType',) as IssueLinkType;
    
    }
    return null;
  }

  /// Delete issue link type
  ///
  /// Deletes an issue link type.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueLinkTypeId (required):
  ///   The ID of the issue link type.
  Future<Response> deleteIssueLinkTypeWithHttpInfo(String issueLinkTypeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issueLinkType/{issueLinkTypeId}'
      .replaceAll('{issueLinkTypeId}', issueLinkTypeId);

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

  /// Delete issue link type
  ///
  /// Deletes an issue link type.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueLinkTypeId (required):
  ///   The ID of the issue link type.
  Future<void> deleteIssueLinkType(String issueLinkTypeId, { Future<void>? abortTrigger, }) async {
    final response = await deleteIssueLinkTypeWithHttpInfo(issueLinkTypeId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issue link type
  ///
  /// Returns an issue link type.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project in the site.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueLinkTypeId (required):
  ///   The ID of the issue link type.
  Future<Response> getIssueLinkTypeWithHttpInfo(String issueLinkTypeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issueLinkType/{issueLinkTypeId}'
      .replaceAll('{issueLinkTypeId}', issueLinkTypeId);

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

  /// Get issue link type
  ///
  /// Returns an issue link type.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project in the site.
  ///
  /// Parameters:
  ///
  /// * [String] issueLinkTypeId (required):
  ///   The ID of the issue link type.
  Future<IssueLinkType?> getIssueLinkType(String issueLinkTypeId, { Future<void>? abortTrigger, }) async {
    final response = await getIssueLinkTypeWithHttpInfo(issueLinkTypeId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueLinkType',) as IssueLinkType;
    
    }
    return null;
  }

  /// Get issue link types
  ///
  /// Returns a list of all issue link types.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project in the site.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getIssueLinkTypesWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issueLinkType';

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

  /// Get issue link types
  ///
  /// Returns a list of all issue link types.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project in the site.
  Future<IssueLinkTypes?> getIssueLinkTypes({ Future<void>? abortTrigger, }) async {
    final response = await getIssueLinkTypesWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueLinkTypes',) as IssueLinkTypes;
    
    }
    return null;
  }

  /// Update issue link type
  ///
  /// Updates an issue link type.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueLinkTypeId (required):
  ///   The ID of the issue link type.
  ///
  /// * [IssueLinkType] issueLinkType (required):
  Future<Response> updateIssueLinkTypeWithHttpInfo(String issueLinkTypeId, IssueLinkType issueLinkType, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issueLinkType/{issueLinkTypeId}'
      .replaceAll('{issueLinkTypeId}', issueLinkTypeId);

    // ignore: prefer_final_locals
    Object? postBody = issueLinkType;

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

  /// Update issue link type
  ///
  /// Updates an issue link type.  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueLinkTypeId (required):
  ///   The ID of the issue link type.
  ///
  /// * [IssueLinkType] issueLinkType (required):
  Future<IssueLinkType?> updateIssueLinkType(String issueLinkTypeId, IssueLinkType issueLinkType, { Future<void>? abortTrigger, }) async {
    final response = await updateIssueLinkTypeWithHttpInfo(issueLinkTypeId, issueLinkType, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueLinkType',) as IssueLinkType;
    
    }
    return null;
  }
}
