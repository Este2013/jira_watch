//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueNotificationSchemesApi {
  IssueNotificationSchemesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add notifications to notification scheme
  ///
  /// Adds notifications to a notification scheme. You can add up to 1000 notifications per request.  *Deprecated: The notification type `EmailAddress` is no longer supported in Cloud. Refer to the [changelog](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-1031) for more details.*  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the notification scheme.
  ///
  /// * [AddNotificationsDetails] addNotificationsDetails (required):
  Future<Response> addNotificationsWithHttpInfo(String id, AddNotificationsDetails addNotificationsDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/notificationscheme/{id}/notification'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = addNotificationsDetails;

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

  /// Add notifications to notification scheme
  ///
  /// Adds notifications to a notification scheme. You can add up to 1000 notifications per request.  *Deprecated: The notification type `EmailAddress` is no longer supported in Cloud. Refer to the [changelog](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-1031) for more details.*  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the notification scheme.
  ///
  /// * [AddNotificationsDetails] addNotificationsDetails (required):
  Future<Object?> addNotifications(String id, AddNotificationsDetails addNotificationsDetails, { Future<void>? abortTrigger, }) async {
    final response = await addNotificationsWithHttpInfo(id, addNotificationsDetails, abortTrigger: abortTrigger,);
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

  /// Create notification scheme
  ///
  /// Creates a notification scheme with notifications. You can create up to 1000 notifications per request.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateNotificationSchemeDetails] createNotificationSchemeDetails (required):
  Future<Response> createNotificationSchemeWithHttpInfo(CreateNotificationSchemeDetails createNotificationSchemeDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/notificationscheme';

    // ignore: prefer_final_locals
    Object? postBody = createNotificationSchemeDetails;

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

  /// Create notification scheme
  ///
  /// Creates a notification scheme with notifications. You can create up to 1000 notifications per request.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CreateNotificationSchemeDetails] createNotificationSchemeDetails (required):
  Future<NotificationSchemeId?> createNotificationScheme(CreateNotificationSchemeDetails createNotificationSchemeDetails, { Future<void>? abortTrigger, }) async {
    final response = await createNotificationSchemeWithHttpInfo(createNotificationSchemeDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationSchemeId',) as NotificationSchemeId;
    
    }
    return null;
  }

  /// Delete notification scheme
  ///
  /// Deletes a notification scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] notificationSchemeId (required):
  ///   The ID of the notification scheme.
  Future<Response> deleteNotificationSchemeWithHttpInfo(String notificationSchemeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/notificationscheme/{notificationSchemeId}'
      .replaceAll('{notificationSchemeId}', notificationSchemeId);

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

  /// Delete notification scheme
  ///
  /// Deletes a notification scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] notificationSchemeId (required):
  ///   The ID of the notification scheme.
  Future<Object?> deleteNotificationScheme(String notificationSchemeId, { Future<void>? abortTrigger, }) async {
    final response = await deleteNotificationSchemeWithHttpInfo(notificationSchemeId, abortTrigger: abortTrigger,);
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

  /// Get notification scheme
  ///
  /// Returns a [notification scheme](https://confluence.atlassian.com/x/8YdKLg), including the list of events and the recipients who will receive notifications for those events.  **[Permissions](#permissions) required:** Permission to access Jira, however, the user must have permission to administer at least one project associated with the notification scheme.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the notification scheme. Use [Get notification schemes paginated](#api-rest-api-3-notificationscheme-get) to get a list of notification scheme IDs.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `all` Returns all expandable information  *  `field` Returns information about any custom fields assigned to receive an event  *  `group` Returns information about any groups assigned to receive an event  *  `notificationSchemeEvents` Returns a list of event associations. This list is returned for all expandable information  *  `projectRole` Returns information about any project roles assigned to receive an event  *  `user` Returns information about any users assigned to receive an event
  Future<Response> getNotificationSchemeWithHttpInfo(int id, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/notificationscheme/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Get notification scheme
  ///
  /// Returns a [notification scheme](https://confluence.atlassian.com/x/8YdKLg), including the list of events and the recipients who will receive notifications for those events.  **[Permissions](#permissions) required:** Permission to access Jira, however, the user must have permission to administer at least one project associated with the notification scheme.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the notification scheme. Use [Get notification schemes paginated](#api-rest-api-3-notificationscheme-get) to get a list of notification scheme IDs.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `all` Returns all expandable information  *  `field` Returns information about any custom fields assigned to receive an event  *  `group` Returns information about any groups assigned to receive an event  *  `notificationSchemeEvents` Returns a list of event associations. This list is returned for all expandable information  *  `projectRole` Returns information about any project roles assigned to receive an event  *  `user` Returns information about any users assigned to receive an event
  Future<NotificationScheme?> getNotificationScheme(int id, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getNotificationSchemeWithHttpInfo(id, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationScheme',) as NotificationScheme;
    
    }
    return null;
  }

  /// Get projects using notification schemes paginated
  ///
  /// Returns a [paginated](#pagination) mapping of project that have notification scheme assigned. You can provide either one or multiple notification scheme IDs or project IDs to filter by. If you don't provide any, this will return a list of all mappings. Note that only company-managed (classic) projects are supported. This is because team-managed projects don't have a concept of a default notification scheme. The mappings are ordered by projectId.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] notificationSchemeId:
  ///   The list of notifications scheme IDs to be filtered out
  ///
  /// * [List<String>] projectId:
  ///   The list of project IDs to be filtered out
  Future<Response> getNotificationSchemeToProjectMappingsWithHttpInfo({ String? startAt, String? maxResults, List<String>? notificationSchemeId, List<String>? projectId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/notificationscheme/project';

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
    if (notificationSchemeId != null) {
      queryParams.addAll(_queryParams('multi', 'notificationSchemeId', notificationSchemeId));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
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

  /// Get projects using notification schemes paginated
  ///
  /// Returns a [paginated](#pagination) mapping of project that have notification scheme assigned. You can provide either one or multiple notification scheme IDs or project IDs to filter by. If you don't provide any, this will return a list of all mappings. Note that only company-managed (classic) projects are supported. This is because team-managed projects don't have a concept of a default notification scheme. The mappings are ordered by projectId.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] notificationSchemeId:
  ///   The list of notifications scheme IDs to be filtered out
  ///
  /// * [List<String>] projectId:
  ///   The list of project IDs to be filtered out
  Future<PageBeanNotificationSchemeAndProjectMappingJsonBean?> getNotificationSchemeToProjectMappings({ String? startAt, String? maxResults, List<String>? notificationSchemeId, List<String>? projectId, Future<void>? abortTrigger, }) async {
    final response = await getNotificationSchemeToProjectMappingsWithHttpInfo(startAt: startAt, maxResults: maxResults, notificationSchemeId: notificationSchemeId, projectId: projectId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanNotificationSchemeAndProjectMappingJsonBean',) as PageBeanNotificationSchemeAndProjectMappingJsonBean;
    
    }
    return null;
  }

  /// Get notification schemes paginated
  ///
  /// Returns a [paginated](#pagination) list of [notification schemes](https://confluence.atlassian.com/x/8YdKLg) ordered by the display name.  *Note that you should allow for events without recipients to appear in responses.*  **[Permissions](#permissions) required:** Permission to access Jira, however, the user must have permission to administer at least one project associated with a notification scheme for it to be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of notification schemes IDs to be filtered by
  ///
  /// * [List<String>] projectId:
  ///   The list of projects IDs to be filtered by
  ///
  /// * [bool] onlyDefault:
  ///   When set to true, returns only the default notification scheme. If you provide project IDs not associated with the default, returns an empty page. The default value is false.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `all` Returns all expandable information  *  `field` Returns information about any custom fields assigned to receive an event  *  `group` Returns information about any groups assigned to receive an event  *  `notificationSchemeEvents` Returns a list of event associations. This list is returned for all expandable information  *  `projectRole` Returns information about any project roles assigned to receive an event  *  `user` Returns information about any users assigned to receive an event
  Future<Response> getNotificationSchemesWithHttpInfo({ String? startAt, String? maxResults, List<String>? id, List<String>? projectId, bool? onlyDefault, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/notificationscheme';

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
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
    }
    if (onlyDefault != null) {
      queryParams.addAll(_queryParams('', 'onlyDefault', onlyDefault));
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

  /// Get notification schemes paginated
  ///
  /// Returns a [paginated](#pagination) list of [notification schemes](https://confluence.atlassian.com/x/8YdKLg) ordered by the display name.  *Note that you should allow for events without recipients to appear in responses.*  **[Permissions](#permissions) required:** Permission to access Jira, however, the user must have permission to administer at least one project associated with a notification scheme for it to be returned.
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of notification schemes IDs to be filtered by
  ///
  /// * [List<String>] projectId:
  ///   The list of projects IDs to be filtered by
  ///
  /// * [bool] onlyDefault:
  ///   When set to true, returns only the default notification scheme. If you provide project IDs not associated with the default, returns an empty page. The default value is false.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `all` Returns all expandable information  *  `field` Returns information about any custom fields assigned to receive an event  *  `group` Returns information about any groups assigned to receive an event  *  `notificationSchemeEvents` Returns a list of event associations. This list is returned for all expandable information  *  `projectRole` Returns information about any project roles assigned to receive an event  *  `user` Returns information about any users assigned to receive an event
  Future<PageBeanNotificationScheme?> getNotificationSchemes({ String? startAt, String? maxResults, List<String>? id, List<String>? projectId, bool? onlyDefault, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getNotificationSchemesWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, projectId: projectId, onlyDefault: onlyDefault, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanNotificationScheme',) as PageBeanNotificationScheme;
    
    }
    return null;
  }

  /// Remove notification from notification scheme
  ///
  /// Removes a notification from a notification scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] notificationSchemeId (required):
  ///   The ID of the notification scheme.
  ///
  /// * [String] notificationId (required):
  ///   The ID of the notification.
  Future<Response> removeNotificationFromNotificationSchemeWithHttpInfo(String notificationSchemeId, String notificationId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/notificationscheme/{notificationSchemeId}/notification/{notificationId}'
      .replaceAll('{notificationSchemeId}', notificationSchemeId)
      .replaceAll('{notificationId}', notificationId);

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

  /// Remove notification from notification scheme
  ///
  /// Removes a notification from a notification scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] notificationSchemeId (required):
  ///   The ID of the notification scheme.
  ///
  /// * [String] notificationId (required):
  ///   The ID of the notification.
  Future<Object?> removeNotificationFromNotificationScheme(String notificationSchemeId, String notificationId, { Future<void>? abortTrigger, }) async {
    final response = await removeNotificationFromNotificationSchemeWithHttpInfo(notificationSchemeId, notificationId, abortTrigger: abortTrigger,);
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

  /// Update notification scheme
  ///
  /// Updates a notification scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the notification scheme.
  ///
  /// * [UpdateNotificationSchemeDetails] updateNotificationSchemeDetails (required):
  Future<Response> updateNotificationSchemeWithHttpInfo(String id, UpdateNotificationSchemeDetails updateNotificationSchemeDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/notificationscheme/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = updateNotificationSchemeDetails;

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

  /// Update notification scheme
  ///
  /// Updates a notification scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the notification scheme.
  ///
  /// * [UpdateNotificationSchemeDetails] updateNotificationSchemeDetails (required):
  Future<Object?> updateNotificationScheme(String id, UpdateNotificationSchemeDetails updateNotificationSchemeDetails, { Future<void>? abortTrigger, }) async {
    final response = await updateNotificationSchemeWithHttpInfo(id, updateNotificationSchemeDetails, abortTrigger: abortTrigger,);
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
