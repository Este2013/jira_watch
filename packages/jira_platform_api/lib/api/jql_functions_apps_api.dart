//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class JQLFunctionsAppsApi {
  JQLFunctionsAppsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get precomputations (apps)
  ///
  /// Returns the list of a function's precomputations along with information about when they were created, updated, and last used. Each precomputation has a `value` \\- the JQL fragment to replace the custom function clause with.  **[Permissions](#permissions) required:** This API is only accessible to apps and apps can only inspect their own functions.  The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] functionKey:
  ///   The function key in format:   *  Forge: `ari:cloud:ecosystem::extension/[App ID]/[Environment ID]/static/[Function key from manifest]`  *  Connect: `[App key]__[Module key]`
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `functionKey` Sorts by the functionKey.  *  `used` Sorts by the used timestamp.  *  `created` Sorts by the created timestamp.  *  `updated` Sorts by the updated timestamp.
  Future<Response> getPrecomputationsWithHttpInfo({ List<String>? functionKey, int? startAt, int? maxResults, String? orderBy, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/function/computation';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (functionKey != null) {
      queryParams.addAll(_queryParams('multi', 'functionKey', functionKey));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
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

  /// Get precomputations (apps)
  ///
  /// Returns the list of a function's precomputations along with information about when they were created, updated, and last used. Each precomputation has a `value` \\- the JQL fragment to replace the custom function clause with.  **[Permissions](#permissions) required:** This API is only accessible to apps and apps can only inspect their own functions.  The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [List<String>] functionKey:
  ///   The function key in format:   *  Forge: `ari:cloud:ecosystem::extension/[App ID]/[Environment ID]/static/[Function key from manifest]`  *  Connect: `[App key]__[Module key]`
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `functionKey` Sorts by the functionKey.  *  `used` Sorts by the used timestamp.  *  `created` Sorts by the created timestamp.  *  `updated` Sorts by the updated timestamp.
  Future<PageBean2JqlFunctionPrecomputationBean?> getPrecomputations({ List<String>? functionKey, int? startAt, int? maxResults, String? orderBy, Future<void>? abortTrigger, }) async {
    final response = await getPrecomputationsWithHttpInfo(functionKey: functionKey, startAt: startAt, maxResults: maxResults, orderBy: orderBy, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBean2JqlFunctionPrecomputationBean',) as PageBean2JqlFunctionPrecomputationBean;
    
    }
    return null;
  }

  /// Get precomputations by ID (apps)
  ///
  /// Returns function precomputations by IDs, along with information about when they were created, updated, and last used. Each precomputation has a `value` \\- the JQL fragment to replace the custom function clause with.  **[Permissions](#permissions) required:** This API is only accessible to apps and apps can only inspect their own functions.  The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [JqlFunctionPrecomputationGetByIdRequest] jqlFunctionPrecomputationGetByIdRequest (required):
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `functionKey` Sorts by the functionKey.  *  `used` Sorts by the used timestamp.  *  `created` Sorts by the created timestamp.  *  `updated` Sorts by the updated timestamp.
  Future<Response> getPrecomputationsByIDWithHttpInfo(JqlFunctionPrecomputationGetByIdRequest jqlFunctionPrecomputationGetByIdRequest, { String? orderBy, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/function/computation/search';

    // ignore: prefer_final_locals
    Object? postBody = jqlFunctionPrecomputationGetByIdRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
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

  /// Get precomputations by ID (apps)
  ///
  /// Returns function precomputations by IDs, along with information about when they were created, updated, and last used. Each precomputation has a `value` \\- the JQL fragment to replace the custom function clause with.  **[Permissions](#permissions) required:** This API is only accessible to apps and apps can only inspect their own functions.  The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [JqlFunctionPrecomputationGetByIdRequest] jqlFunctionPrecomputationGetByIdRequest (required):
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `functionKey` Sorts by the functionKey.  *  `used` Sorts by the used timestamp.  *  `created` Sorts by the created timestamp.  *  `updated` Sorts by the updated timestamp.
  Future<JqlFunctionPrecomputationGetByIdResponse?> getPrecomputationsByID(JqlFunctionPrecomputationGetByIdRequest jqlFunctionPrecomputationGetByIdRequest, { String? orderBy, Future<void>? abortTrigger, }) async {
    final response = await getPrecomputationsByIDWithHttpInfo(jqlFunctionPrecomputationGetByIdRequest, orderBy: orderBy, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'JqlFunctionPrecomputationGetByIdResponse',) as JqlFunctionPrecomputationGetByIdResponse;
    
    }
    return null;
  }

  /// Update precomputations (apps)
  ///
  /// Update the precomputation value of a function created by a Forge/Connect app.  **[Permissions](#permissions) required:** An API for apps to update their own precomputations.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [JqlFunctionPrecomputationUpdateRequestBean] jqlFunctionPrecomputationUpdateRequestBean (required):
  ///
  /// * [bool] skipNotFoundPrecomputations:
  Future<Response> updatePrecomputationsWithHttpInfo(JqlFunctionPrecomputationUpdateRequestBean jqlFunctionPrecomputationUpdateRequestBean, { bool? skipNotFoundPrecomputations, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/function/computation';

    // ignore: prefer_final_locals
    Object? postBody = jqlFunctionPrecomputationUpdateRequestBean;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (skipNotFoundPrecomputations != null) {
      queryParams.addAll(_queryParams('', 'skipNotFoundPrecomputations', skipNotFoundPrecomputations));
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

  /// Update precomputations (apps)
  ///
  /// Update the precomputation value of a function created by a Forge/Connect app.  **[Permissions](#permissions) required:** An API for apps to update their own precomputations.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [JqlFunctionPrecomputationUpdateRequestBean] jqlFunctionPrecomputationUpdateRequestBean (required):
  ///
  /// * [bool] skipNotFoundPrecomputations:
  Future<JqlFunctionPrecomputationUpdateResponse?> updatePrecomputations(JqlFunctionPrecomputationUpdateRequestBean jqlFunctionPrecomputationUpdateRequestBean, { bool? skipNotFoundPrecomputations, Future<void>? abortTrigger, }) async {
    final response = await updatePrecomputationsWithHttpInfo(jqlFunctionPrecomputationUpdateRequestBean, skipNotFoundPrecomputations: skipNotFoundPrecomputations, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'JqlFunctionPrecomputationUpdateResponse',) as JqlFunctionPrecomputationUpdateResponse;
    
    }
    return null;
  }
}
