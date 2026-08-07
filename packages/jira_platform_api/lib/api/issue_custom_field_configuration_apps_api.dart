//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueCustomFieldConfigurationAppsApi {
  IssueCustomFieldConfigurationAppsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get custom field configurations
  ///
  /// Returns a [paginated](#pagination) list of configurations for a custom field of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).  The result can be filtered by one of these criteria:   *  `id`.  *  `fieldContextId`.  *  `issueId`.  *  `projectKeyOrId` and `issueTypeId`.  Otherwise, all configurations are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that provided the custom field type.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldIdOrKey (required):
  ///   The ID or key of the custom field, for example `customfield_10000`.
  ///
  /// * [List<int>] id:
  ///   The list of configuration IDs. To include multiple configurations, separate IDs with an ampersand: `id=10000&id=10001`. Can't be provided with `fieldContextId`, `issueId`, `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [List<int>] fieldContextId:
  ///   The list of field context IDs. To include multiple field contexts, separate IDs with an ampersand: `fieldContextId=10000&fieldContextId=10001`. Can't be provided with `id`, `issueId`, `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [int] issueId:
  ///   The ID of the issue to filter results by. If the issue doesn't exist, an empty list is returned. Can't be provided with `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [String] projectKeyOrId:
  ///   The ID or key of the project to filter results by. Must be provided with `issueTypeId`. Can't be provided with `issueId`.
  ///
  /// * [String] issueTypeId:
  ///   The ID of the issue type to filter results by. Must be provided with `projectKeyOrId`. Can't be provided with `issueId`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getCustomFieldConfigurationWithHttpInfo(String fieldIdOrKey, { List<int>? id, List<int>? fieldContextId, int? issueId, String? projectKeyOrId, String? issueTypeId, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/app/field/{fieldIdOrKey}/context/configuration'
      .replaceAll('{fieldIdOrKey}', fieldIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (fieldContextId != null) {
      queryParams.addAll(_queryParams('multi', 'fieldContextId', fieldContextId));
    }
    if (issueId != null) {
      queryParams.addAll(_queryParams('', 'issueId', issueId));
    }
    if (projectKeyOrId != null) {
      queryParams.addAll(_queryParams('', 'projectKeyOrId', projectKeyOrId));
    }
    if (issueTypeId != null) {
      queryParams.addAll(_queryParams('', 'issueTypeId', issueTypeId));
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

  /// Get custom field configurations
  ///
  /// Returns a [paginated](#pagination) list of configurations for a custom field of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).  The result can be filtered by one of these criteria:   *  `id`.  *  `fieldContextId`.  *  `issueId`.  *  `projectKeyOrId` and `issueTypeId`.  Otherwise, all configurations are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that provided the custom field type.
  ///
  /// Parameters:
  ///
  /// * [String] fieldIdOrKey (required):
  ///   The ID or key of the custom field, for example `customfield_10000`.
  ///
  /// * [List<int>] id:
  ///   The list of configuration IDs. To include multiple configurations, separate IDs with an ampersand: `id=10000&id=10001`. Can't be provided with `fieldContextId`, `issueId`, `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [List<int>] fieldContextId:
  ///   The list of field context IDs. To include multiple field contexts, separate IDs with an ampersand: `fieldContextId=10000&fieldContextId=10001`. Can't be provided with `id`, `issueId`, `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [int] issueId:
  ///   The ID of the issue to filter results by. If the issue doesn't exist, an empty list is returned. Can't be provided with `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [String] projectKeyOrId:
  ///   The ID or key of the project to filter results by. Must be provided with `issueTypeId`. Can't be provided with `issueId`.
  ///
  /// * [String] issueTypeId:
  ///   The ID of the issue type to filter results by. Must be provided with `projectKeyOrId`. Can't be provided with `issueId`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanContextualConfiguration?> getCustomFieldConfiguration(String fieldIdOrKey, { List<int>? id, List<int>? fieldContextId, int? issueId, String? projectKeyOrId, String? issueTypeId, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getCustomFieldConfigurationWithHttpInfo(fieldIdOrKey, id: id, fieldContextId: fieldContextId, issueId: issueId, projectKeyOrId: projectKeyOrId, issueTypeId: issueTypeId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanContextualConfiguration',) as PageBeanContextualConfiguration;
    
    }
    return null;
  }

  /// Bulk get custom field configurations
  ///
  /// Returns a [paginated](#pagination) list of configurations for list of custom fields of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).  The result can be filtered by one of these criteria:   *  `id`.  *  `fieldContextId`.  *  `issueId`.  *  `projectKeyOrId` and `issueTypeId`.  Otherwise, all configurations for the provided list of custom fields are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that provided the custom field type.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConfigurationsListParameters] configurationsListParameters (required):
  ///
  /// * [List<int>] id:
  ///   The list of configuration IDs. To include multiple configurations, separate IDs with an ampersand: `id=10000&id=10001`. Can't be provided with `fieldContextId`, `issueId`, `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [List<int>] fieldContextId:
  ///   The list of field context IDs. To include multiple field contexts, separate IDs with an ampersand: `fieldContextId=10000&fieldContextId=10001`. Can't be provided with `id`, `issueId`, `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [int] issueId:
  ///   The ID of the issue to filter results by. If the issue doesn't exist, an empty list is returned. Can't be provided with `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [String] projectKeyOrId:
  ///   The ID or key of the project to filter results by. Must be provided with `issueTypeId`. Can't be provided with `issueId`.
  ///
  /// * [String] issueTypeId:
  ///   The ID of the issue type to filter results by. Must be provided with `projectKeyOrId`. Can't be provided with `issueId`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getCustomFieldsConfigurationsWithHttpInfo(ConfigurationsListParameters configurationsListParameters, { List<int>? id, List<int>? fieldContextId, int? issueId, String? projectKeyOrId, String? issueTypeId, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/app/field/context/configuration/list';

    // ignore: prefer_final_locals
    Object? postBody = configurationsListParameters;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (fieldContextId != null) {
      queryParams.addAll(_queryParams('multi', 'fieldContextId', fieldContextId));
    }
    if (issueId != null) {
      queryParams.addAll(_queryParams('', 'issueId', issueId));
    }
    if (projectKeyOrId != null) {
      queryParams.addAll(_queryParams('', 'projectKeyOrId', projectKeyOrId));
    }
    if (issueTypeId != null) {
      queryParams.addAll(_queryParams('', 'issueTypeId', issueTypeId));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Bulk get custom field configurations
  ///
  /// Returns a [paginated](#pagination) list of configurations for list of custom fields of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).  The result can be filtered by one of these criteria:   *  `id`.  *  `fieldContextId`.  *  `issueId`.  *  `projectKeyOrId` and `issueTypeId`.  Otherwise, all configurations for the provided list of custom fields are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that provided the custom field type.
  ///
  /// Parameters:
  ///
  /// * [ConfigurationsListParameters] configurationsListParameters (required):
  ///
  /// * [List<int>] id:
  ///   The list of configuration IDs. To include multiple configurations, separate IDs with an ampersand: `id=10000&id=10001`. Can't be provided with `fieldContextId`, `issueId`, `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [List<int>] fieldContextId:
  ///   The list of field context IDs. To include multiple field contexts, separate IDs with an ampersand: `fieldContextId=10000&fieldContextId=10001`. Can't be provided with `id`, `issueId`, `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [int] issueId:
  ///   The ID of the issue to filter results by. If the issue doesn't exist, an empty list is returned. Can't be provided with `projectKeyOrId`, or `issueTypeId`.
  ///
  /// * [String] projectKeyOrId:
  ///   The ID or key of the project to filter results by. Must be provided with `issueTypeId`. Can't be provided with `issueId`.
  ///
  /// * [String] issueTypeId:
  ///   The ID of the issue type to filter results by. Must be provided with `projectKeyOrId`. Can't be provided with `issueId`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanBulkContextualConfiguration?> getCustomFieldsConfigurations(ConfigurationsListParameters configurationsListParameters, { List<int>? id, List<int>? fieldContextId, int? issueId, String? projectKeyOrId, String? issueTypeId, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getCustomFieldsConfigurationsWithHttpInfo(configurationsListParameters, id: id, fieldContextId: fieldContextId, issueId: issueId, projectKeyOrId: projectKeyOrId, issueTypeId: issueTypeId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanBulkContextualConfiguration',) as PageBeanBulkContextualConfiguration;
    
    }
    return null;
  }

  /// Update custom field configurations
  ///
  /// Update the configuration for contexts of a custom field of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that created the custom field type.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldIdOrKey (required):
  ///   The ID or key of the custom field, for example `customfield_10000`.
  ///
  /// * [CustomFieldConfigurations] customFieldConfigurations (required):
  Future<Response> updateCustomFieldConfigurationWithHttpInfo(String fieldIdOrKey, CustomFieldConfigurations customFieldConfigurations, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/app/field/{fieldIdOrKey}/context/configuration'
      .replaceAll('{fieldIdOrKey}', fieldIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = customFieldConfigurations;

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

  /// Update custom field configurations
  ///
  /// Update the configuration for contexts of a custom field of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that created the custom field type.
  ///
  /// Parameters:
  ///
  /// * [String] fieldIdOrKey (required):
  ///   The ID or key of the custom field, for example `customfield_10000`.
  ///
  /// * [CustomFieldConfigurations] customFieldConfigurations (required):
  Future<Object?> updateCustomFieldConfiguration(String fieldIdOrKey, CustomFieldConfigurations customFieldConfigurations, { Future<void>? abortTrigger, }) async {
    final response = await updateCustomFieldConfigurationWithHttpInfo(fieldIdOrKey, customFieldConfigurations, abortTrigger: abortTrigger,);
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
