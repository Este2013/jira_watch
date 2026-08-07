//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DashboardsApi {
  DashboardsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add gadget to dashboard
  ///
  /// Adds a gadget to a dashboard.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [DashboardGadgetSettings] dashboardGadgetSettings (required):
  Future<Response> addGadgetWithHttpInfo(int dashboardId, DashboardGadgetSettings dashboardGadgetSettings, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{dashboardId}/gadget'
      .replaceAll('{dashboardId}', dashboardId.toString());

    // ignore: prefer_final_locals
    Object? postBody = dashboardGadgetSettings;

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

  /// Add gadget to dashboard
  ///
  /// Adds a gadget to a dashboard.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [int] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [DashboardGadgetSettings] dashboardGadgetSettings (required):
  Future<DashboardGadget?> addGadget(int dashboardId, DashboardGadgetSettings dashboardGadgetSettings, { Future<void>? abortTrigger, }) async {
    final response = await addGadgetWithHttpInfo(dashboardId, dashboardGadgetSettings, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DashboardGadget',) as DashboardGadget;
    
    }
    return null;
  }

  /// Bulk edit dashboards
  ///
  /// Bulk edit dashboards. Maximum number of dashboards to be edited at the same time is 100.  **[Permissions](#permissions) required:** None  The dashboards to be updated must be owned by the user, or the user must be an administrator.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [BulkEditShareableEntityRequest] bulkEditShareableEntityRequest (required):
  ///   The details of dashboards being updated in bulk.
  Future<Response> bulkEditDashboardsWithHttpInfo(BulkEditShareableEntityRequest bulkEditShareableEntityRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/bulk/edit';

    // ignore: prefer_final_locals
    Object? postBody = bulkEditShareableEntityRequest;

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

  /// Bulk edit dashboards
  ///
  /// Bulk edit dashboards. Maximum number of dashboards to be edited at the same time is 100.  **[Permissions](#permissions) required:** None  The dashboards to be updated must be owned by the user, or the user must be an administrator.
  ///
  /// Parameters:
  ///
  /// * [BulkEditShareableEntityRequest] bulkEditShareableEntityRequest (required):
  ///   The details of dashboards being updated in bulk.
  Future<BulkEditShareableEntityResponse?> bulkEditDashboards(BulkEditShareableEntityRequest bulkEditShareableEntityRequest, { Future<void>? abortTrigger, }) async {
    final response = await bulkEditDashboardsWithHttpInfo(bulkEditShareableEntityRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BulkEditShareableEntityResponse',) as BulkEditShareableEntityResponse;
    
    }
    return null;
  }

  /// Copy dashboard
  ///
  /// Copies a dashboard. Any values provided in the `dashboard` parameter replace those in the copied dashboard.  **[Permissions](#permissions) required:** None  The dashboard to be copied must be owned by or shared with the user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [DashboardDetails] dashboardDetails (required):
  ///   Dashboard details.
  ///
  /// * [bool] extendAdminPermissions:
  ///   Whether admin level permissions are used. It should only be true if the user has *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)
  Future<Response> copyDashboardWithHttpInfo(String id, DashboardDetails dashboardDetails, { bool? extendAdminPermissions, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{id}/copy'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = dashboardDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (extendAdminPermissions != null) {
      queryParams.addAll(_queryParams('', 'extendAdminPermissions', extendAdminPermissions));
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

  /// Copy dashboard
  ///
  /// Copies a dashboard. Any values provided in the `dashboard` parameter replace those in the copied dashboard.  **[Permissions](#permissions) required:** None  The dashboard to be copied must be owned by or shared with the user.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [DashboardDetails] dashboardDetails (required):
  ///   Dashboard details.
  ///
  /// * [bool] extendAdminPermissions:
  ///   Whether admin level permissions are used. It should only be true if the user has *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)
  Future<Dashboard?> copyDashboard(String id, DashboardDetails dashboardDetails, { bool? extendAdminPermissions, Future<void>? abortTrigger, }) async {
    final response = await copyDashboardWithHttpInfo(id, dashboardDetails, extendAdminPermissions: extendAdminPermissions, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dashboard',) as Dashboard;
    
    }
    return null;
  }

  /// Create dashboard
  ///
  /// Creates a dashboard.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [DashboardDetails] dashboardDetails (required):
  ///   Dashboard details.
  ///
  /// * [bool] extendAdminPermissions:
  ///   Whether admin level permissions are used. It should only be true if the user has *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)
  Future<Response> createDashboardWithHttpInfo(DashboardDetails dashboardDetails, { bool? extendAdminPermissions, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard';

    // ignore: prefer_final_locals
    Object? postBody = dashboardDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (extendAdminPermissions != null) {
      queryParams.addAll(_queryParams('', 'extendAdminPermissions', extendAdminPermissions));
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

  /// Create dashboard
  ///
  /// Creates a dashboard.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [DashboardDetails] dashboardDetails (required):
  ///   Dashboard details.
  ///
  /// * [bool] extendAdminPermissions:
  ///   Whether admin level permissions are used. It should only be true if the user has *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)
  Future<Dashboard?> createDashboard(DashboardDetails dashboardDetails, { bool? extendAdminPermissions, Future<void>? abortTrigger, }) async {
    final response = await createDashboardWithHttpInfo(dashboardDetails, extendAdminPermissions: extendAdminPermissions, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dashboard',) as Dashboard;
    
    }
    return null;
  }

  /// Delete dashboard
  ///
  /// Deletes a dashboard.  **[Permissions](#permissions) required:** None  The dashboard to be deleted must be owned by the user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the dashboard.
  Future<Response> deleteDashboardWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{id}'
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

  /// Delete dashboard
  ///
  /// Deletes a dashboard.  **[Permissions](#permissions) required:** None  The dashboard to be deleted must be owned by the user.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the dashboard.
  Future<void> deleteDashboard(String id, { Future<void>? abortTrigger, }) async {
    final response = await deleteDashboardWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete dashboard item property
  ///
  /// Deletes a dashboard item property.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The user must have edit permission of the dashboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [String] itemId (required):
  ///   The ID of the dashboard item.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the dashboard item property.
  Future<Response> deleteDashboardItemPropertyWithHttpInfo(String dashboardId, String itemId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}'
      .replaceAll('{dashboardId}', dashboardId)
      .replaceAll('{itemId}', itemId)
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Delete dashboard item property
  ///
  /// Deletes a dashboard item property.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The user must have edit permission of the dashboard.
  ///
  /// Parameters:
  ///
  /// * [String] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [String] itemId (required):
  ///   The ID of the dashboard item.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the dashboard item property.
  Future<Object?> deleteDashboardItemProperty(String dashboardId, String itemId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await deleteDashboardItemPropertyWithHttpInfo(dashboardId, itemId, propertyKey, abortTrigger: abortTrigger,);
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

  /// Get available gadgets
  ///
  /// Gets a list of all available gadgets that can be added to all dashboards.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getAllAvailableDashboardGadgetsWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/gadgets';

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

  /// Get available gadgets
  ///
  /// Gets a list of all available gadgets that can be added to all dashboards.  **[Permissions](#permissions) required:** None.
  Future<AvailableDashboardGadgetsResponse?> getAllAvailableDashboardGadgets({ Future<void>? abortTrigger, }) async {
    final response = await getAllAvailableDashboardGadgetsWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AvailableDashboardGadgetsResponse',) as AvailableDashboardGadgetsResponse;
    
    }
    return null;
  }

  /// Get all dashboards
  ///
  /// Returns a list of dashboards owned by or shared with the user. The list may be filtered to include only favorite or owned dashboards.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] filter:
  ///   The filter applied to the list of dashboards. Valid values are:   *  `favourite` Returns dashboards the user has marked as favorite.  *  `my` Returns dashboards owned by the user.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getAllDashboardsWithHttpInfo({ String? filter, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (filter != null) {
      queryParams.addAll(_queryParams('', 'filter', filter));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Get all dashboards
  ///
  /// Returns a list of dashboards owned by or shared with the user. The list may be filtered to include only favorite or owned dashboards.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [String] filter:
  ///   The filter applied to the list of dashboards. Valid values are:   *  `favourite` Returns dashboards the user has marked as favorite.  *  `my` Returns dashboards owned by the user.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageOfDashboards?> getAllDashboards({ String? filter, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getAllDashboardsWithHttpInfo(filter: filter, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageOfDashboards',) as PageOfDashboards;
    
    }
    return null;
  }

  /// Get gadgets
  ///
  /// Returns a list of dashboard gadgets on a dashboard.  This operation returns:   *  Gadgets from a list of IDs, when `id` is set.  *  Gadgets with a module key, when `moduleKey` is set.  *  Gadgets from a list of URIs, when `uri` is set.  *  All gadgets, when no other parameters are set.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [List<String>] moduleKey:
  ///   The list of gadgets module keys. To include multiple module keys, separate module keys with ampersand: `moduleKey=key:one&moduleKey=key:two`.
  ///
  /// * [List<String>] uri:
  ///   The list of gadgets URIs. To include multiple URIs, separate URIs with ampersand: `uri=/rest/example/uri/1&uri=/rest/example/uri/2`.
  ///
  /// * [List<int>] gadgetId:
  ///   The list of gadgets IDs. To include multiple IDs, separate IDs with ampersand: `gadgetId=10000&gadgetId=10001`.
  Future<Response> getAllGadgetsWithHttpInfo(int dashboardId, { List<String>? moduleKey, List<String>? uri, List<int>? gadgetId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{dashboardId}/gadget'
      .replaceAll('{dashboardId}', dashboardId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (moduleKey != null) {
      queryParams.addAll(_queryParams('multi', 'moduleKey', moduleKey));
    }
    if (uri != null) {
      queryParams.addAll(_queryParams('multi', 'uri', uri));
    }
    if (gadgetId != null) {
      queryParams.addAll(_queryParams('multi', 'gadgetId', gadgetId));
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

  /// Get gadgets
  ///
  /// Returns a list of dashboard gadgets on a dashboard.  This operation returns:   *  Gadgets from a list of IDs, when `id` is set.  *  Gadgets with a module key, when `moduleKey` is set.  *  Gadgets from a list of URIs, when `uri` is set.  *  All gadgets, when no other parameters are set.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [int] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [List<String>] moduleKey:
  ///   The list of gadgets module keys. To include multiple module keys, separate module keys with ampersand: `moduleKey=key:one&moduleKey=key:two`.
  ///
  /// * [List<String>] uri:
  ///   The list of gadgets URIs. To include multiple URIs, separate URIs with ampersand: `uri=/rest/example/uri/1&uri=/rest/example/uri/2`.
  ///
  /// * [List<int>] gadgetId:
  ///   The list of gadgets IDs. To include multiple IDs, separate IDs with ampersand: `gadgetId=10000&gadgetId=10001`.
  Future<DashboardGadgetResponse?> getAllGadgets(int dashboardId, { List<String>? moduleKey, List<String>? uri, List<int>? gadgetId, Future<void>? abortTrigger, }) async {
    final response = await getAllGadgetsWithHttpInfo(dashboardId, moduleKey: moduleKey, uri: uri, gadgetId: gadgetId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DashboardGadgetResponse',) as DashboardGadgetResponse;
    
    }
    return null;
  }

  /// Get dashboard
  ///
  /// Returns a dashboard.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.  However, to get a dashboard, the dashboard must be shared with the user or the user must own it. Note, users with the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) are considered owners of the System dashboard. The System dashboard is considered to be shared with all other users.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the dashboard.
  Future<Response> getDashboardWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{id}'
      .replaceAll('{id}', id);

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

  /// Get dashboard
  ///
  /// Returns a dashboard.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.  However, to get a dashboard, the dashboard must be shared with the user or the user must own it. Note, users with the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) are considered owners of the System dashboard. The System dashboard is considered to be shared with all other users.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the dashboard.
  Future<Dashboard?> getDashboard(String id, { Future<void>? abortTrigger, }) async {
    final response = await getDashboardWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dashboard',) as Dashboard;
    
    }
    return null;
  }

  /// Get dashboard item property
  ///
  /// Returns the key and value of a dashboard item property.  A dashboard item enables an app to add user-specific information to a user dashboard. Dashboard items are exposed to users as gadgets that users can add to their dashboards. For more information on how users do this, see [Adding and customizing gadgets](https://confluence.atlassian.com/x/7AeiLQ).  When an app creates a dashboard item it registers a callback to receive the dashboard item ID. The callback fires whenever the item is rendered or, where the item is configurable, the user edits the item. The app then uses this resource to store the item's content or configuration details. For more information on working with dashboard items, see [ Building a dashboard item for a JIRA Connect add-on](https://developer.atlassian.com/server/jira/platform/guide-building-a-dashboard-item-for-a-jira-connect-add-on-33746254/) and the [Dashboard Item](https://developer.atlassian.com/cloud/jira/platform/modules/dashboard-item/) documentation.  There is no resource to set or get dashboard items.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The user must have read permission of the dashboard or have the dashboard shared with them.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [String] itemId (required):
  ///   The ID of the dashboard item.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the dashboard item property.
  Future<Response> getDashboardItemPropertyWithHttpInfo(String dashboardId, String itemId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}'
      .replaceAll('{dashboardId}', dashboardId)
      .replaceAll('{itemId}', itemId)
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Get dashboard item property
  ///
  /// Returns the key and value of a dashboard item property.  A dashboard item enables an app to add user-specific information to a user dashboard. Dashboard items are exposed to users as gadgets that users can add to their dashboards. For more information on how users do this, see [Adding and customizing gadgets](https://confluence.atlassian.com/x/7AeiLQ).  When an app creates a dashboard item it registers a callback to receive the dashboard item ID. The callback fires whenever the item is rendered or, where the item is configurable, the user edits the item. The app then uses this resource to store the item's content or configuration details. For more information on working with dashboard items, see [ Building a dashboard item for a JIRA Connect add-on](https://developer.atlassian.com/server/jira/platform/guide-building-a-dashboard-item-for-a-jira-connect-add-on-33746254/) and the [Dashboard Item](https://developer.atlassian.com/cloud/jira/platform/modules/dashboard-item/) documentation.  There is no resource to set or get dashboard items.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The user must have read permission of the dashboard or have the dashboard shared with them.
  ///
  /// Parameters:
  ///
  /// * [String] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [String] itemId (required):
  ///   The ID of the dashboard item.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the dashboard item property.
  Future<EntityProperty?> getDashboardItemProperty(String dashboardId, String itemId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await getDashboardItemPropertyWithHttpInfo(dashboardId, itemId, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'EntityProperty',) as EntityProperty;
    
    }
    return null;
  }

  /// Get dashboard item property keys
  ///
  /// Returns the keys of all properties for a dashboard item.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The user must have read permission of the dashboard or have the dashboard shared with them.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [String] itemId (required):
  ///   The ID of the dashboard item.
  Future<Response> getDashboardItemPropertyKeysWithHttpInfo(String dashboardId, String itemId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties'
      .replaceAll('{dashboardId}', dashboardId)
      .replaceAll('{itemId}', itemId);

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

  /// Get dashboard item property keys
  ///
  /// Returns the keys of all properties for a dashboard item.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The user must have read permission of the dashboard or have the dashboard shared with them.
  ///
  /// Parameters:
  ///
  /// * [String] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [String] itemId (required):
  ///   The ID of the dashboard item.
  Future<PropertyKeys?> getDashboardItemPropertyKeys(String dashboardId, String itemId, { Future<void>? abortTrigger, }) async {
    final response = await getDashboardItemPropertyKeysWithHttpInfo(dashboardId, itemId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PropertyKeys',) as PropertyKeys;
    
    }
    return null;
  }

  /// Search for dashboards
  ///
  /// Returns a [paginated](#pagination) list of dashboards. This operation is similar to [Get dashboards](#api-rest-api-3-dashboard-get) except that the results can be refined to include dashboards that have specific attributes. For example, dashboards with a particular name. When multiple attributes are specified only filters matching all attributes are returned.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The following dashboards that match the query parameters are returned:   *  Dashboards owned by the user. Not returned for anonymous users.  *  Dashboards shared with a group that the user is a member of. Not returned for anonymous users.  *  Dashboards shared with a private project that the user can browse. Not returned for anonymous users.  *  Dashboards shared with a public project.  *  Dashboards shared with the public.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] dashboardName:
  ///   String used to perform a case-insensitive partial match with `name`.
  ///
  /// * [String] accountId:
  ///   User account ID used to return dashboards with the matching `owner.accountId`. This parameter cannot be used with the `owner` parameter.
  ///
  /// * [String] owner:
  ///   This parameter is deprecated because of privacy changes. Use `accountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. User name used to return dashboards with the matching `owner.name`. This parameter cannot be used with the `accountId` parameter.
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended. Group name used to return dashboards that are shared with a group that matches `sharePermissions.group.name`. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   Group ID used to return dashboards that are shared with a group that matches `sharePermissions.group.groupId`. This parameter cannot be used with the `groupname` parameter.
  ///
  /// * [int] projectId:
  ///   Project ID used to returns dashboards that are shared with a project that matches `sharePermissions.project.id`.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `description` Sorts by dashboard description. Note that this sort works independently of whether the expand to display the description field is in use.  *  `favourite_count` Sorts by dashboard popularity.  *  `id` Sorts by dashboard ID.  *  `is_favourite` Sorts by whether the dashboard is marked as a favorite.  *  `name` Sorts by dashboard name.  *  `owner` Sorts by dashboard owner name.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] status:
  ///   The status to filter by. It may be active, archived or deleted.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about dashboard in the response. This parameter accepts a comma-separated list. Expand options include:   *  `description` Returns the description of the dashboard.  *  `owner` Returns the owner of the dashboard.  *  `viewUrl` Returns the URL that is used to view the dashboard.  *  `favourite` Returns `isFavourite`, an indicator of whether the user has set the dashboard as a favorite.  *  `favouritedCount` Returns `popularity`, a count of how many users have set this dashboard as a favorite.  *  `sharePermissions` Returns details of the share permissions defined for the dashboard.  *  `editPermissions` Returns details of the edit permissions defined for the dashboard.  *  `isWritable` Returns whether the current user has permission to edit the dashboard.
  Future<Response> getDashboardsPaginatedWithHttpInfo({ String? dashboardName, String? accountId, String? owner, String? groupname, String? groupId, int? projectId, String? orderBy, int? startAt, int? maxResults, String? status, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (dashboardName != null) {
      queryParams.addAll(_queryParams('', 'dashboardName', dashboardName));
    }
    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (owner != null) {
      queryParams.addAll(_queryParams('', 'owner', owner));
    }
    if (groupname != null) {
      queryParams.addAll(_queryParams('', 'groupname', groupname));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('', 'projectId', projectId));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
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

  /// Search for dashboards
  ///
  /// Returns a [paginated](#pagination) list of dashboards. This operation is similar to [Get dashboards](#api-rest-api-3-dashboard-get) except that the results can be refined to include dashboards that have specific attributes. For example, dashboards with a particular name. When multiple attributes are specified only filters matching all attributes are returned.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The following dashboards that match the query parameters are returned:   *  Dashboards owned by the user. Not returned for anonymous users.  *  Dashboards shared with a group that the user is a member of. Not returned for anonymous users.  *  Dashboards shared with a private project that the user can browse. Not returned for anonymous users.  *  Dashboards shared with a public project.  *  Dashboards shared with the public.
  ///
  /// Parameters:
  ///
  /// * [String] dashboardName:
  ///   String used to perform a case-insensitive partial match with `name`.
  ///
  /// * [String] accountId:
  ///   User account ID used to return dashboards with the matching `owner.accountId`. This parameter cannot be used with the `owner` parameter.
  ///
  /// * [String] owner:
  ///   This parameter is deprecated because of privacy changes. Use `accountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. User name used to return dashboards with the matching `owner.name`. This parameter cannot be used with the `accountId` parameter.
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended. Group name used to return dashboards that are shared with a group that matches `sharePermissions.group.name`. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   Group ID used to return dashboards that are shared with a group that matches `sharePermissions.group.groupId`. This parameter cannot be used with the `groupname` parameter.
  ///
  /// * [int] projectId:
  ///   Project ID used to returns dashboards that are shared with a project that matches `sharePermissions.project.id`.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `description` Sorts by dashboard description. Note that this sort works independently of whether the expand to display the description field is in use.  *  `favourite_count` Sorts by dashboard popularity.  *  `id` Sorts by dashboard ID.  *  `is_favourite` Sorts by whether the dashboard is marked as a favorite.  *  `name` Sorts by dashboard name.  *  `owner` Sorts by dashboard owner name.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] status:
  ///   The status to filter by. It may be active, archived or deleted.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about dashboard in the response. This parameter accepts a comma-separated list. Expand options include:   *  `description` Returns the description of the dashboard.  *  `owner` Returns the owner of the dashboard.  *  `viewUrl` Returns the URL that is used to view the dashboard.  *  `favourite` Returns `isFavourite`, an indicator of whether the user has set the dashboard as a favorite.  *  `favouritedCount` Returns `popularity`, a count of how many users have set this dashboard as a favorite.  *  `sharePermissions` Returns details of the share permissions defined for the dashboard.  *  `editPermissions` Returns details of the edit permissions defined for the dashboard.  *  `isWritable` Returns whether the current user has permission to edit the dashboard.
  Future<PageBeanDashboard?> getDashboardsPaginated({ String? dashboardName, String? accountId, String? owner, String? groupname, String? groupId, int? projectId, String? orderBy, int? startAt, int? maxResults, String? status, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getDashboardsPaginatedWithHttpInfo(dashboardName: dashboardName, accountId: accountId, owner: owner, groupname: groupname, groupId: groupId, projectId: projectId, orderBy: orderBy, startAt: startAt, maxResults: maxResults, status: status, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanDashboard',) as PageBeanDashboard;
    
    }
    return null;
  }

  /// Remove gadget from dashboard
  ///
  /// Removes a dashboard gadget from a dashboard.  When a gadget is removed from a dashboard, other gadgets in the same column are moved up to fill the emptied position.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [int] gadgetId (required):
  ///   The ID of the gadget.
  Future<Response> removeGadgetWithHttpInfo(int dashboardId, int gadgetId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}'
      .replaceAll('{dashboardId}', dashboardId.toString())
      .replaceAll('{gadgetId}', gadgetId.toString());

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

  /// Remove gadget from dashboard
  ///
  /// Removes a dashboard gadget from a dashboard.  When a gadget is removed from a dashboard, other gadgets in the same column are moved up to fill the emptied position.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [int] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [int] gadgetId (required):
  ///   The ID of the gadget.
  Future<Object?> removeGadget(int dashboardId, int gadgetId, { Future<void>? abortTrigger, }) async {
    final response = await removeGadgetWithHttpInfo(dashboardId, gadgetId, abortTrigger: abortTrigger,);
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

  /// Set dashboard item property
  ///
  /// Sets the value of a dashboard item property. Use this resource in apps to store custom data against a dashboard item.  A dashboard item enables an app to add user-specific information to a user dashboard. Dashboard items are exposed to users as gadgets that users can add to their dashboards. For more information on how users do this, see [Adding and customizing gadgets](https://confluence.atlassian.com/x/7AeiLQ).  When an app creates a dashboard item it registers a callback to receive the dashboard item ID. The callback fires whenever the item is rendered or, where the item is configurable, the user edits the item. The app then uses this resource to store the item's content or configuration details. For more information on working with dashboard items, see [ Building a dashboard item for a JIRA Connect add-on](https://developer.atlassian.com/server/jira/platform/guide-building-a-dashboard-item-for-a-jira-connect-add-on-33746254/) and the [Dashboard Item](https://developer.atlassian.com/cloud/jira/platform/modules/dashboard-item/) documentation.  There is no resource to set or get dashboard items.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The user must have edit permisson of the dashboard.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [String] itemId (required):
  ///   The ID of the dashboard item.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the dashboard item property. The maximum length is 255 characters. For dashboard items with a spec URI and no complete module key, if the provided propertyKey is equal to \"config\", the request body's JSON must be an object with all keys and values as strings.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Response> setDashboardItemPropertyWithHttpInfo(String dashboardId, String itemId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}'
      .replaceAll('{dashboardId}', dashboardId)
      .replaceAll('{itemId}', itemId)
      .replaceAll('{propertyKey}', propertyKey);

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// Set dashboard item property
  ///
  /// Sets the value of a dashboard item property. Use this resource in apps to store custom data against a dashboard item.  A dashboard item enables an app to add user-specific information to a user dashboard. Dashboard items are exposed to users as gadgets that users can add to their dashboards. For more information on how users do this, see [Adding and customizing gadgets](https://confluence.atlassian.com/x/7AeiLQ).  When an app creates a dashboard item it registers a callback to receive the dashboard item ID. The callback fires whenever the item is rendered or, where the item is configurable, the user edits the item. The app then uses this resource to store the item's content or configuration details. For more information on working with dashboard items, see [ Building a dashboard item for a JIRA Connect add-on](https://developer.atlassian.com/server/jira/platform/guide-building-a-dashboard-item-for-a-jira-connect-add-on-33746254/) and the [Dashboard Item](https://developer.atlassian.com/cloud/jira/platform/modules/dashboard-item/) documentation.  There is no resource to set or get dashboard items.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The user must have edit permisson of the dashboard.
  ///
  /// Parameters:
  ///
  /// * [String] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [String] itemId (required):
  ///   The ID of the dashboard item.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the dashboard item property. The maximum length is 255 characters. For dashboard items with a spec URI and no complete module key, if the provided propertyKey is equal to \"config\", the request body's JSON must be an object with all keys and values as strings.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Object?> setDashboardItemProperty(String dashboardId, String itemId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    final response = await setDashboardItemPropertyWithHttpInfo(dashboardId, itemId, propertyKey, body, abortTrigger: abortTrigger,);
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

  /// Update dashboard
  ///
  /// Updates a dashboard, replacing all the dashboard details with those provided.  **[Permissions](#permissions) required:** None  The dashboard to be updated must be owned by the user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the dashboard to update.
  ///
  /// * [DashboardDetails] dashboardDetails (required):
  ///   Replacement dashboard details.
  ///
  /// * [bool] extendAdminPermissions:
  ///   Whether admin level permissions are used. It should only be true if the user has *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)
  Future<Response> updateDashboardWithHttpInfo(String id, DashboardDetails dashboardDetails, { bool? extendAdminPermissions, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = dashboardDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (extendAdminPermissions != null) {
      queryParams.addAll(_queryParams('', 'extendAdminPermissions', extendAdminPermissions));
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

  /// Update dashboard
  ///
  /// Updates a dashboard, replacing all the dashboard details with those provided.  **[Permissions](#permissions) required:** None  The dashboard to be updated must be owned by the user.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the dashboard to update.
  ///
  /// * [DashboardDetails] dashboardDetails (required):
  ///   Replacement dashboard details.
  ///
  /// * [bool] extendAdminPermissions:
  ///   Whether admin level permissions are used. It should only be true if the user has *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)
  Future<Dashboard?> updateDashboard(String id, DashboardDetails dashboardDetails, { bool? extendAdminPermissions, Future<void>? abortTrigger, }) async {
    final response = await updateDashboardWithHttpInfo(id, dashboardDetails, extendAdminPermissions: extendAdminPermissions, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dashboard',) as Dashboard;
    
    }
    return null;
  }

  /// Update gadget on dashboard
  ///
  /// Changes the title, position, and color of the gadget on a dashboard.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [int] gadgetId (required):
  ///   The ID of the gadget.
  ///
  /// * [DashboardGadgetUpdateRequest] dashboardGadgetUpdateRequest (required):
  Future<Response> updateGadgetWithHttpInfo(int dashboardId, int gadgetId, DashboardGadgetUpdateRequest dashboardGadgetUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}'
      .replaceAll('{dashboardId}', dashboardId.toString())
      .replaceAll('{gadgetId}', gadgetId.toString());

    // ignore: prefer_final_locals
    Object? postBody = dashboardGadgetUpdateRequest;

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

  /// Update gadget on dashboard
  ///
  /// Changes the title, position, and color of the gadget on a dashboard.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [int] dashboardId (required):
  ///   The ID of the dashboard.
  ///
  /// * [int] gadgetId (required):
  ///   The ID of the gadget.
  ///
  /// * [DashboardGadgetUpdateRequest] dashboardGadgetUpdateRequest (required):
  Future<Object?> updateGadget(int dashboardId, int gadgetId, DashboardGadgetUpdateRequest dashboardGadgetUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateGadgetWithHttpInfo(dashboardId, gadgetId, dashboardGadgetUpdateRequest, abortTrigger: abortTrigger,);
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
