//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UIModificationsAppsApi {
  UIModificationsAppsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create UI modification
  ///
  /// Creates a UI modification. UI modification can only be created by Forge apps.  Each app can define up to 3000 UI modifications. Each UI modification can define up to 1000 contexts. The same context can be assigned to maximum 100 UI modifications.  **Context types:**   *  **Jira contexts:** For Jira view types, use `projectId` and `issueTypeId`. One field can act as a wildcard. Supported Jira views:           *  `GIC` \\- Jira global issue create      *  `IssueView` \\- Jira issue view      *  `IssueTransition` \\- Jira issue transition  *  **Jira Service Management contexts:** For Jira Service Management view types, use `portalId` and `requestTypeId`. Wildcards are not supported. Supported JSM views:           *  `JSMRequestCreate` \\- Jira Service Management request create portal view  **[Permissions](#permissions) required:**   *  *None* if the UI modification is created without contexts.  *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for one or more projects, if the UI modification is created with contexts.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateUiModificationDetails] createUiModificationDetails (required):
  ///   Details of the UI modification.
  Future<Response> createUiModificationWithHttpInfo(CreateUiModificationDetails createUiModificationDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/uiModifications';

    // ignore: prefer_final_locals
    Object? postBody = createUiModificationDetails;

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

  /// Create UI modification
  ///
  /// Creates a UI modification. UI modification can only be created by Forge apps.  Each app can define up to 3000 UI modifications. Each UI modification can define up to 1000 contexts. The same context can be assigned to maximum 100 UI modifications.  **Context types:**   *  **Jira contexts:** For Jira view types, use `projectId` and `issueTypeId`. One field can act as a wildcard. Supported Jira views:           *  `GIC` \\- Jira global issue create      *  `IssueView` \\- Jira issue view      *  `IssueTransition` \\- Jira issue transition  *  **Jira Service Management contexts:** For Jira Service Management view types, use `portalId` and `requestTypeId`. Wildcards are not supported. Supported JSM views:           *  `JSMRequestCreate` \\- Jira Service Management request create portal view  **[Permissions](#permissions) required:**   *  *None* if the UI modification is created without contexts.  *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for one or more projects, if the UI modification is created with contexts.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [CreateUiModificationDetails] createUiModificationDetails (required):
  ///   Details of the UI modification.
  Future<UiModificationIdentifiers?> createUiModification(CreateUiModificationDetails createUiModificationDetails, { Future<void>? abortTrigger, }) async {
    final response = await createUiModificationWithHttpInfo(createUiModificationDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UiModificationIdentifiers',) as UiModificationIdentifiers;
    
    }
    return null;
  }

  /// Delete UI modification
  ///
  /// Deletes a UI modification. All the contexts that belong to the UI modification are deleted too. UI modification can only be deleted by Forge apps.  **[Permissions](#permissions) required:** None.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] uiModificationId (required):
  ///   The ID of the UI modification.
  Future<Response> deleteUiModificationWithHttpInfo(String uiModificationId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/uiModifications/{uiModificationId}'
      .replaceAll('{uiModificationId}', uiModificationId);

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

  /// Delete UI modification
  ///
  /// Deletes a UI modification. All the contexts that belong to the UI modification are deleted too. UI modification can only be deleted by Forge apps.  **[Permissions](#permissions) required:** None.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [String] uiModificationId (required):
  ///   The ID of the UI modification.
  Future<Object?> deleteUiModification(String uiModificationId, { Future<void>? abortTrigger, }) async {
    final response = await deleteUiModificationWithHttpInfo(uiModificationId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Get UI modifications
  ///
  /// Gets UI modifications. UI modifications can only be retrieved by Forge apps.  **[Permissions](#permissions) required:** None.  The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `data` Returns UI modification data.  *  `contexts` Returns UI modification contexts.
  Future<Response> getUiModificationsWithHttpInfo({ int? startAt, int? maxResults, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/uiModifications';

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

  /// Get UI modifications
  ///
  /// Gets UI modifications. UI modifications can only be retrieved by Forge apps.  **[Permissions](#permissions) required:** None.  The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `data` Returns UI modification data.  *  `contexts` Returns UI modification contexts.
  Future<PageBeanUiModificationDetails?> getUiModifications({ int? startAt, int? maxResults, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getUiModificationsWithHttpInfo(startAt: startAt, maxResults: maxResults, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanUiModificationDetails',) as PageBeanUiModificationDetails;
    
    }
    return null;
  }

  /// Update UI modification
  ///
  /// Updates a UI modification. UI modification can only be updated by Forge apps.  Each UI modification can define up to 1000 contexts. The same context can be assigned to maximum 100 UI modifications.  **Context types:**   *  **Jira contexts:** For Jira view types, use `projectId` and `issueTypeId`. One field can act as a wildcard. Supported Jira views:           *  `GIC` \\- Jira global issue create      *  `IssueView` \\- Jira issue view      *  `IssueTransition` \\- Jira issue transition  *  **Jira Service Management contexts:** For Jira Service Management view types, use `portalId` and `requestTypeId`. Wildcards are not supported. Supported JSM views:           *  `JSMRequestCreate` \\- Jira Service Management request create portal view  **[Permissions](#permissions) required:**   *  *None* if the UI modification is created without contexts.  *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for one or more projects, if the UI modification is created with contexts.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] uiModificationId (required):
  ///   The ID of the UI modification.
  ///
  /// * [UpdateUiModificationDetails] updateUiModificationDetails (required):
  ///   Details of the UI modification.
  Future<Response> updateUiModificationWithHttpInfo(String uiModificationId, UpdateUiModificationDetails updateUiModificationDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/uiModifications/{uiModificationId}'
      .replaceAll('{uiModificationId}', uiModificationId);

    // ignore: prefer_final_locals
    Object? postBody = updateUiModificationDetails;

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

  /// Update UI modification
  ///
  /// Updates a UI modification. UI modification can only be updated by Forge apps.  Each UI modification can define up to 1000 contexts. The same context can be assigned to maximum 100 UI modifications.  **Context types:**   *  **Jira contexts:** For Jira view types, use `projectId` and `issueTypeId`. One field can act as a wildcard. Supported Jira views:           *  `GIC` \\- Jira global issue create      *  `IssueView` \\- Jira issue view      *  `IssueTransition` \\- Jira issue transition  *  **Jira Service Management contexts:** For Jira Service Management view types, use `portalId` and `requestTypeId`. Wildcards are not supported. Supported JSM views:           *  `JSMRequestCreate` \\- Jira Service Management request create portal view  **[Permissions](#permissions) required:**   *  *None* if the UI modification is created without contexts.  *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for one or more projects, if the UI modification is created with contexts.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [String] uiModificationId (required):
  ///   The ID of the UI modification.
  ///
  /// * [UpdateUiModificationDetails] updateUiModificationDetails (required):
  ///   Details of the UI modification.
  Future<Object?> updateUiModification(String uiModificationId, UpdateUiModificationDetails updateUiModificationDetails, { Future<void>? abortTrigger, }) async {
    final response = await updateUiModificationWithHttpInfo(uiModificationId, updateUiModificationDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }
}
