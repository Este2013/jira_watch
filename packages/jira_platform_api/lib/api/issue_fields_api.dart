//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueFieldsApi {
  IssueFieldsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create custom field
  ///
  /// Creates a custom field.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CustomFieldDefinitionJsonBean] customFieldDefinitionJsonBean (required):
  ///   Definition of the custom field to be created
  Future<Response> createCustomFieldWithHttpInfo(CustomFieldDefinitionJsonBean customFieldDefinitionJsonBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field';

    // ignore: prefer_final_locals
    Object? postBody = customFieldDefinitionJsonBean;

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

  /// Create custom field
  ///
  /// Creates a custom field.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CustomFieldDefinitionJsonBean] customFieldDefinitionJsonBean (required):
  ///   Definition of the custom field to be created
  Future<FieldDetails?> createCustomField(CustomFieldDefinitionJsonBean customFieldDefinitionJsonBean, { Future<void>? abortTrigger, }) async {
    final response = await createCustomFieldWithHttpInfo(customFieldDefinitionJsonBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FieldDetails',) as FieldDetails;
    
    }
    return null;
  }

  /// Delete custom field
  ///
  /// Deletes a custom field. The custom field is deleted whether it is in the trash or not. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of a custom field.
  Future<Response> deleteCustomFieldWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{id}'
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

  /// Delete custom field
  ///
  /// Deletes a custom field. The custom field is deleted whether it is in the trash or not. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of a custom field.
  Future<void> deleteCustomField(String id, { Future<void>? abortTrigger, }) async {
    final response = await deleteCustomFieldWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get contexts for a field
  ///
  /// Returns a [paginated](#pagination) list of the contexts a field is used in. Deprecated, use [ Get custom field contexts](#api-rest-api-3-field-fieldId-context-get).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the field to return contexts for.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getContextsForFieldDeprecatedWithHttpInfo(String fieldId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}/contexts'
      .replaceAll('{fieldId}', fieldId);

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

  /// Get contexts for a field
  ///
  /// Returns a [paginated](#pagination) list of the contexts a field is used in. Deprecated, use [ Get custom field contexts](#api-rest-api-3-field-fieldId-context-get).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the field to return contexts for.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanContext?> getContextsForFieldDeprecated(String fieldId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getContextsForFieldDeprecatedWithHttpInfo(fieldId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanContext',) as PageBeanContext;
    
    }
    return null;
  }

  /// Get field project associations
  ///
  /// Returns a [paginated](#pagination) list of project associations for the given custom field. Each association contains the ID of a project the field is associated with.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the field, for example `customfield_10000`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getFieldProjectAssociationsWithHttpInfo(String fieldId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}/association/project'
      .replaceAll('{fieldId}', fieldId);

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

  /// Get field project associations
  ///
  /// Returns a [paginated](#pagination) list of project associations for the given custom field. Each association contains the ID of a project the field is associated with.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the field, for example `customfield_10000`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanFieldProjectAssociation?> getFieldProjectAssociations(String fieldId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getFieldProjectAssociationsWithHttpInfo(fieldId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanFieldProjectAssociation',) as PageBeanFieldProjectAssociation;
    
    }
    return null;
  }

  /// Get fields
  ///
  /// Returns system and custom issue fields according to the following rules:   *  Fields that cannot be added to the issue navigator are always returned.  *  Fields that cannot be placed on an issue screen are always returned.  *  Fields that depend on global Jira settings are only returned if the setting is enabled. That is, timetracking fields, subtasks, votes, and watches.  *  Fields that are not associated to any used field configurations or screens are not returned.  *  For all other fields, this operation only returns the fields that the user has permission to view (that is, the field is used in at least one project that the user has *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.)  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getFieldsWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field';

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

  /// Get fields
  ///
  /// Returns system and custom issue fields according to the following rules:   *  Fields that cannot be added to the issue navigator are always returned.  *  Fields that cannot be placed on an issue screen are always returned.  *  Fields that depend on global Jira settings are only returned if the setting is enabled. That is, timetracking fields, subtasks, votes, and watches.  *  Fields that are not associated to any used field configurations or screens are not returned.  *  For all other fields, this operation only returns the fields that the user has permission to view (that is, the field is used in at least one project that the user has *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.)  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  Future<List<FieldDetails>?> getFields({ Future<void>? abortTrigger, }) async {
    final response = await getFieldsWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<FieldDetails>') as List)
        .cast<FieldDetails>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get fields paginated
  ///
  /// Returns a [paginated](#pagination) list of fields for Classic Jira projects. The list can include:   *  all fields  *  specific fields, by defining `id`  *  fields that contain a string in the field name or description, by defining `query`  *  specific fields that contain a string in the field name or description, by defining `id` and `query`  Use `type` must be set to `custom` to show custom fields only.  **[Permissions](#permissions) required:** Permission to access Jira.
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
  /// * [List<String>] type:
  ///   The type of fields to search.
  ///
  /// * [List<String>] id:
  ///   The IDs of the custom fields to return or, where `query` is specified, filter.
  ///
  /// * [String] query:
  ///   String used to perform a case-insensitive partial match with field names or descriptions.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by:   *  `contextsCount` sorts by the number of contexts related to a field  *  `lastUsed` sorts by the date when the value of the field last changed  *  `name` sorts by the field name  *  `screensCount` sorts by the number of screens related to a field
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `key` returns the key for each field  *  `stableId` returns the stableId for each field  *  `lastUsed` returns the date when the value of the field last changed  *  `screensCount` returns the number of screens related to a field  *  `contextsCount` returns the number of contexts related to a field  *  `isLocked` returns information about whether the field is locked  *  `searcherKey` returns the searcher key for each custom field
  ///
  /// * [List<int>] projectIds:
  ///   The IDs of the projects to filter the fields by. Fields belonging to project Ids that the user does not have access to will not be returned
  Future<Response> getFieldsPaginatedWithHttpInfo({ int? startAt, int? maxResults, List<String>? type, List<String>? id, String? query, String? orderBy, String? expand, List<int>? projectIds, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/search';

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
    if (type != null) {
      queryParams.addAll(_queryParams('multi', 'type', type));
    }
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (projectIds != null) {
      queryParams.addAll(_queryParams('multi', 'projectIds', projectIds));
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

  /// Get fields paginated
  ///
  /// Returns a [paginated](#pagination) list of fields for Classic Jira projects. The list can include:   *  all fields  *  specific fields, by defining `id`  *  fields that contain a string in the field name or description, by defining `query`  *  specific fields that contain a string in the field name or description, by defining `id` and `query`  Use `type` must be set to `custom` to show custom fields only.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] type:
  ///   The type of fields to search.
  ///
  /// * [List<String>] id:
  ///   The IDs of the custom fields to return or, where `query` is specified, filter.
  ///
  /// * [String] query:
  ///   String used to perform a case-insensitive partial match with field names or descriptions.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by:   *  `contextsCount` sorts by the number of contexts related to a field  *  `lastUsed` sorts by the date when the value of the field last changed  *  `name` sorts by the field name  *  `screensCount` sorts by the number of screens related to a field
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `key` returns the key for each field  *  `stableId` returns the stableId for each field  *  `lastUsed` returns the date when the value of the field last changed  *  `screensCount` returns the number of screens related to a field  *  `contextsCount` returns the number of contexts related to a field  *  `isLocked` returns information about whether the field is locked  *  `searcherKey` returns the searcher key for each custom field
  ///
  /// * [List<int>] projectIds:
  ///   The IDs of the projects to filter the fields by. Fields belonging to project Ids that the user does not have access to will not be returned
  Future<PageBeanField?> getFieldsPaginated({ int? startAt, int? maxResults, List<String>? type, List<String>? id, String? query, String? orderBy, String? expand, List<int>? projectIds, Future<void>? abortTrigger, }) async {
    final response = await getFieldsPaginatedWithHttpInfo(startAt: startAt, maxResults: maxResults, type: type, id: id, query: query, orderBy: orderBy, expand: expand, projectIds: projectIds, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanField',) as PageBeanField;
    
    }
    return null;
  }

  /// Get fields for projects
  ///
  /// Returns a [paginated](#pagination) list of fields for the requested projects and work types.  Only fields that are available for the specified combination of projects and work types are returned. This endpoint allows filtering to specific fields if field IDs are provided.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   The IDs of projects to return fields for.
  ///
  /// * [List<int>] workTypeId (required):
  ///   The IDs of work types (issue types) to return fields for.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] fieldId:
  ///   The IDs of fields to return. If not provided, all fields are returned.
  Future<Response> getProjectFieldsWithHttpInfo(List<int> projectId, List<int> workTypeId, { int? startAt, int? maxResults, List<String>? fieldId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/projects/fields';

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
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
      queryParams.addAll(_queryParams('multi', 'workTypeId', workTypeId));
    if (fieldId != null) {
      queryParams.addAll(_queryParams('multi', 'fieldId', fieldId));
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

  /// Get fields for projects
  ///
  /// Returns a [paginated](#pagination) list of fields for the requested projects and work types.  Only fields that are available for the specified combination of projects and work types are returned. This endpoint allows filtering to specific fields if field IDs are provided.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   The IDs of projects to return fields for.
  ///
  /// * [List<int>] workTypeId (required):
  ///   The IDs of work types (issue types) to return fields for.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] fieldId:
  ///   The IDs of fields to return. If not provided, all fields are returned.
  Future<PageBean2ProjectFieldBean?> getProjectFields(List<int> projectId, List<int> workTypeId, { int? startAt, int? maxResults, List<String>? fieldId, Future<void>? abortTrigger, }) async {
    final response = await getProjectFieldsWithHttpInfo(projectId, workTypeId, startAt: startAt, maxResults: maxResults, fieldId: fieldId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBean2ProjectFieldBean',) as PageBean2ProjectFieldBean;
    
    }
    return null;
  }

  /// Get fields in trash paginated
  ///
  /// Returns a [paginated](#pagination) list of fields in the trash. The list may be restricted to fields whose field name or description partially match a string.  Only custom fields can be queried, `type` must be set to `custom`.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  /// * [List<String>] id:
  ///
  /// * [String] query:
  ///   String used to perform a case-insensitive partial match with field names or descriptions.
  ///
  /// * [String] expand:
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` sorts by the field name  *  `trashDate` sorts by the date the field was moved to the trash  *  `plannedDeletionDate` sorts by the planned deletion date
  Future<Response> getTrashedFieldsPaginatedWithHttpInfo({ int? startAt, int? maxResults, List<String>? id, String? query, String? expand, String? orderBy, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/search/trashed';

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
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Get fields in trash paginated
  ///
  /// Returns a [paginated](#pagination) list of fields in the trash. The list may be restricted to fields whose field name or description partially match a string.  Only custom fields can be queried, `type` must be set to `custom`.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///
  /// * [String] query:
  ///   String used to perform a case-insensitive partial match with field names or descriptions.
  ///
  /// * [String] expand:
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` sorts by the field name  *  `trashDate` sorts by the date the field was moved to the trash  *  `plannedDeletionDate` sorts by the planned deletion date
  Future<PageBeanField?> getTrashedFieldsPaginated({ int? startAt, int? maxResults, List<String>? id, String? query, String? expand, String? orderBy, Future<void>? abortTrigger, }) async {
    final response = await getTrashedFieldsPaginatedWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, query: query, expand: expand, orderBy: orderBy, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanField',) as PageBeanField;
    
    }
    return null;
  }

  /// Restore custom field from trash
  ///
  /// Restores a custom field from trash. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of a custom field.
  Future<Response> restoreCustomFieldWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{id}/restore'
      .replaceAll('{id}', id);

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

  /// Restore custom field from trash
  ///
  /// Restores a custom field from trash. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of a custom field.
  Future<Object?> restoreCustomField(String id, { Future<void>? abortTrigger, }) async {
    final response = await restoreCustomFieldWithHttpInfo(id, abortTrigger: abortTrigger,);
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

  /// Move custom field to trash
  ///
  /// Moves a custom field to trash. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of a custom field.
  Future<Response> trashCustomFieldWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{id}/trash'
      .replaceAll('{id}', id);

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

  /// Move custom field to trash
  ///
  /// Moves a custom field to trash. See [Edit or delete a custom field](https://confluence.atlassian.com/x/Z44fOw) for more information on trashing and deleting custom fields.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of a custom field.
  Future<Object?> trashCustomField(String id, { Future<void>? abortTrigger, }) async {
    final response = await trashCustomFieldWithHttpInfo(id, abortTrigger: abortTrigger,);
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

  /// Update custom field
  ///
  /// Updates a custom field.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [UpdateCustomFieldDetails] updateCustomFieldDetails (required):
  ///   The custom field update details.
  Future<Response> updateCustomFieldWithHttpInfo(String fieldId, UpdateCustomFieldDetails updateCustomFieldDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}'
      .replaceAll('{fieldId}', fieldId);

    // ignore: prefer_final_locals
    Object? postBody = updateCustomFieldDetails;

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

  /// Update custom field
  ///
  /// Updates a custom field.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [UpdateCustomFieldDetails] updateCustomFieldDetails (required):
  ///   The custom field update details.
  Future<Object?> updateCustomField(String fieldId, UpdateCustomFieldDetails updateCustomFieldDetails, { Future<void>? abortTrigger, }) async {
    final response = await updateCustomFieldWithHttpInfo(fieldId, updateCustomFieldDetails, abortTrigger: abortTrigger,);
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
