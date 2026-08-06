//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ScreenTabsApi {
  ScreenTabsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create screen tab
  ///
  /// Creates a tab for a screen.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [ScreenableTab] screenableTab (required):
  Future<Response> addScreenTabWithHttpInfo(int screenId, ScreenableTab screenableTab, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs'
      .replaceAll('{screenId}', screenId.toString());

    // ignore: prefer_final_locals
    Object? postBody = screenableTab;

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

  /// Create screen tab
  ///
  /// Creates a tab for a screen.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [ScreenableTab] screenableTab (required):
  Future<ScreenableTab?> addScreenTab(int screenId, ScreenableTab screenableTab, { Future<void>? abortTrigger, }) async {
    final response = await addScreenTabWithHttpInfo(screenId, screenableTab, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ScreenableTab',) as ScreenableTab;
    
    }
    return null;
  }

  /// Delete screen tab
  ///
  /// Deletes a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  Future<Response> deleteScreenTabWithHttpInfo(int screenId, int tabId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs/{tabId}'
      .replaceAll('{screenId}', screenId.toString())
      .replaceAll('{tabId}', tabId.toString());

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

  /// Delete screen tab
  ///
  /// Deletes a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  Future<void> deleteScreenTab(int screenId, int tabId, { Future<void>? abortTrigger, }) async {
    final response = await deleteScreenTabWithHttpInfo(screenId, tabId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get all screen tabs
  ///
  /// Returns the list of tabs for a screen.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) when the project key is specified, providing that the screen is associated with the project through a Screen Scheme and Issue Type Screen Scheme.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [String] projectKey:
  ///   The key of the project.
  Future<Response> getAllScreenTabsWithHttpInfo(int screenId, { String? projectKey, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs'
      .replaceAll('{screenId}', screenId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (projectKey != null) {
      queryParams.addAll(_queryParams('', 'projectKey', projectKey));
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

  /// Get all screen tabs
  ///
  /// Returns the list of tabs for a screen.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) when the project key is specified, providing that the screen is associated with the project through a Screen Scheme and Issue Type Screen Scheme.
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [String] projectKey:
  ///   The key of the project.
  Future<List<ScreenableTab>?> getAllScreenTabs(int screenId, { String? projectKey, Future<void>? abortTrigger, }) async {
    final response = await getAllScreenTabsWithHttpInfo(screenId, projectKey: projectKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ScreenableTab>') as List)
        .cast<ScreenableTab>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get bulk screen tabs
  ///
  /// Returns the list of tabs for a bulk of screens.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] screenId:
  ///   The list of screen IDs. To include multiple screen IDs, provide an ampersand-separated list. For example, `screenId=10000&screenId=10001`.
  ///
  /// * [List<int>] tabId:
  ///   The list of tab IDs. To include multiple tab IDs, provide an ampersand-separated list. For example, `tabId=10000&tabId=10001`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResult:
  ///   The maximum number of items to return per page. The maximum number is 100,
  Future<Response> getBulkScreenTabsWithHttpInfo({ List<int>? screenId, List<int>? tabId, int? startAt, int? maxResult, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/tabs';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (screenId != null) {
      queryParams.addAll(_queryParams('multi', 'screenId', screenId));
    }
    if (tabId != null) {
      queryParams.addAll(_queryParams('multi', 'tabId', tabId));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResult != null) {
      queryParams.addAll(_queryParams('', 'maxResult', maxResult));
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

  /// Get bulk screen tabs
  ///
  /// Returns the list of tabs for a bulk of screens.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [List<int>] screenId:
  ///   The list of screen IDs. To include multiple screen IDs, provide an ampersand-separated list. For example, `screenId=10000&screenId=10001`.
  ///
  /// * [List<int>] tabId:
  ///   The list of tab IDs. To include multiple tab IDs, provide an ampersand-separated list. For example, `tabId=10000&tabId=10001`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResult:
  ///   The maximum number of items to return per page. The maximum number is 100,
  Future<void> getBulkScreenTabs({ List<int>? screenId, List<int>? tabId, int? startAt, int? maxResult, Future<void>? abortTrigger, }) async {
    final response = await getBulkScreenTabsWithHttpInfo(screenId: screenId, tabId: tabId, startAt: startAt, maxResult: maxResult, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Move screen tab
  ///
  /// Moves a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [int] pos (required):
  ///   The position of tab. The base index is 0.
  Future<Response> moveScreenTabWithHttpInfo(int screenId, int tabId, int pos, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs/{tabId}/move/{pos}'
      .replaceAll('{screenId}', screenId.toString())
      .replaceAll('{tabId}', tabId.toString())
      .replaceAll('{pos}', pos.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


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

  /// Move screen tab
  ///
  /// Moves a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [int] pos (required):
  ///   The position of tab. The base index is 0.
  Future<Object?> moveScreenTab(int screenId, int tabId, int pos, { Future<void>? abortTrigger, }) async {
    final response = await moveScreenTabWithHttpInfo(screenId, tabId, pos, abortTrigger: abortTrigger,);
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

  /// Update screen tab
  ///
  /// Updates the name of a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [ScreenableTab] screenableTab (required):
  Future<Response> renameScreenTabWithHttpInfo(int screenId, int tabId, ScreenableTab screenableTab, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs/{tabId}'
      .replaceAll('{screenId}', screenId.toString())
      .replaceAll('{tabId}', tabId.toString());

    // ignore: prefer_final_locals
    Object? postBody = screenableTab;

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

  /// Update screen tab
  ///
  /// Updates the name of a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [ScreenableTab] screenableTab (required):
  Future<ScreenableTab?> renameScreenTab(int screenId, int tabId, ScreenableTab screenableTab, { Future<void>? abortTrigger, }) async {
    final response = await renameScreenTabWithHttpInfo(screenId, tabId, screenableTab, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ScreenableTab',) as ScreenableTab;
    
    }
    return null;
  }
}
