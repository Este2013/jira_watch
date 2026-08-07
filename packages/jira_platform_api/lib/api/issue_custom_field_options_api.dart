//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueCustomFieldOptionsApi {
  IssueCustomFieldOptionsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create custom field options (context)
  ///
  /// Creates options and, where the custom select field is of the type Select List (cascading), cascading options for a custom select field. The options are added to a context of the field.  The maximum number of options that can be created per request is 1000 and each field can have a maximum of 10000 options.  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [BulkCustomFieldOptionCreateRequest] bulkCustomFieldOptionCreateRequest (required):
  Future<Response> createCustomFieldOptionWithHttpInfo(String fieldId, int contextId, BulkCustomFieldOptionCreateRequest bulkCustomFieldOptionCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}/context/{contextId}/option'
      .replaceAll('{fieldId}', fieldId)
      .replaceAll('{contextId}', contextId.toString());

    // ignore: prefer_final_locals
    Object? postBody = bulkCustomFieldOptionCreateRequest;

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

  /// Create custom field options (context)
  ///
  /// Creates options and, where the custom select field is of the type Select List (cascading), cascading options for a custom select field. The options are added to a context of the field.  The maximum number of options that can be created per request is 1000 and each field can have a maximum of 10000 options.  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [BulkCustomFieldOptionCreateRequest] bulkCustomFieldOptionCreateRequest (required):
  Future<CustomFieldCreatedContextOptionsList?> createCustomFieldOption(String fieldId, int contextId, BulkCustomFieldOptionCreateRequest bulkCustomFieldOptionCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createCustomFieldOptionWithHttpInfo(fieldId, contextId, bulkCustomFieldOptionCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CustomFieldCreatedContextOptionsList',) as CustomFieldCreatedContextOptionsList;
    
    }
    return null;
  }

  /// Delete custom field options (context)
  ///
  /// Deletes a custom field option.  Options with cascading options cannot be deleted without deleting the cascading options first.  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context from which an option should be deleted.
  ///
  /// * [int] optionId (required):
  ///   The ID of the option to delete.
  Future<Response> deleteCustomFieldOptionWithHttpInfo(String fieldId, int contextId, int optionId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}'
      .replaceAll('{fieldId}', fieldId)
      .replaceAll('{contextId}', contextId.toString())
      .replaceAll('{optionId}', optionId.toString());

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

  /// Delete custom field options (context)
  ///
  /// Deletes a custom field option.  Options with cascading options cannot be deleted without deleting the cascading options first.  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context from which an option should be deleted.
  ///
  /// * [int] optionId (required):
  ///   The ID of the option to delete.
  Future<void> deleteCustomFieldOption(String fieldId, int contextId, int optionId, { Future<void>? abortTrigger, }) async {
    final response = await deleteCustomFieldOptionWithHttpInfo(fieldId, contextId, optionId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get custom field option
  ///
  /// Returns a custom field option. For example, an option in a select list.  Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect apps.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The custom field option is returned as follows:   *  if the user has the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  if the user has the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the custom field is used in, and the field is visible in at least one layout the user has permission to view.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the custom field option.
  Future<Response> getCustomFieldOptionWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/customFieldOption/{id}'
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

  /// Get custom field option
  ///
  /// Returns a custom field option. For example, an option in a select list.  Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect apps.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** The custom field option is returned as follows:   *  if the user has the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  if the user has the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the custom field is used in, and the field is visible in at least one layout the user has permission to view.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the custom field option.
  Future<CustomFieldOption?> getCustomFieldOption(String id, { Future<void>? abortTrigger, }) async {
    final response = await getCustomFieldOptionWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CustomFieldOption',) as CustomFieldOption;
    
    }
    return null;
  }

  /// Get custom field options (context)
  ///
  /// Returns a [paginated](#pagination) list of all custom field option for a context. Options are returned first then cascading options, in the order they display in Jira.  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). *Edit Workflow* [edit workflow permission](https://support.atlassian.com/jira-cloud-administration/docs/permissions-for-company-managed-projects/#Edit-Workflows)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [int] optionId:
  ///   The ID of the option.
  ///
  /// * [bool] onlyOptions:
  ///   Whether only options are returned.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getOptionsForContextWithHttpInfo(String fieldId, int contextId, { int? optionId, bool? onlyOptions, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}/context/{contextId}/option'
      .replaceAll('{fieldId}', fieldId)
      .replaceAll('{contextId}', contextId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (optionId != null) {
      queryParams.addAll(_queryParams('', 'optionId', optionId));
    }
    if (onlyOptions != null) {
      queryParams.addAll(_queryParams('', 'onlyOptions', onlyOptions));
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

  /// Get custom field options (context)
  ///
  /// Returns a [paginated](#pagination) list of all custom field option for a context. Options are returned first then cascading options, in the order they display in Jira.  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). *Edit Workflow* [edit workflow permission](https://support.atlassian.com/jira-cloud-administration/docs/permissions-for-company-managed-projects/#Edit-Workflows)
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [int] optionId:
  ///   The ID of the option.
  ///
  /// * [bool] onlyOptions:
  ///   Whether only options are returned.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanCustomFieldContextOption?> getOptionsForContext(String fieldId, int contextId, { int? optionId, bool? onlyOptions, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getOptionsForContextWithHttpInfo(fieldId, contextId, optionId: optionId, onlyOptions: onlyOptions, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanCustomFieldContextOption',) as PageBeanCustomFieldContextOption;
    
    }
    return null;
  }

  /// Reorder custom field options (context)
  ///
  /// Changes the order of custom field options or cascading options in a context.  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [OrderOfCustomFieldOptions] orderOfCustomFieldOptions (required):
  Future<Response> reorderCustomFieldOptionsWithHttpInfo(String fieldId, int contextId, OrderOfCustomFieldOptions orderOfCustomFieldOptions, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}/context/{contextId}/option/move'
      .replaceAll('{fieldId}', fieldId)
      .replaceAll('{contextId}', contextId.toString());

    // ignore: prefer_final_locals
    Object? postBody = orderOfCustomFieldOptions;

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

  /// Reorder custom field options (context)
  ///
  /// Changes the order of custom field options or cascading options in a context.  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [OrderOfCustomFieldOptions] orderOfCustomFieldOptions (required):
  Future<Object?> reorderCustomFieldOptions(String fieldId, int contextId, OrderOfCustomFieldOptions orderOfCustomFieldOptions, { Future<void>? abortTrigger, }) async {
    final response = await reorderCustomFieldOptionsWithHttpInfo(fieldId, contextId, orderOfCustomFieldOptions, abortTrigger: abortTrigger,);
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

  /// Replace custom field options
  ///
  /// Replaces the options of a custom field.  Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect or Forge apps.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] optionId (required):
  ///   The ID of the option to be deselected.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [int] replaceWith:
  ///   The ID of the option that will replace the currently selected option.
  ///
  /// * [String] jql:
  ///   A JQL query that specifies the issues to be updated. For example, *project=10000*.
  Future<Response> replaceCustomFieldOptionWithHttpInfo(String fieldId, int optionId, int contextId, { int? replaceWith, String? jql, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}/issue'
      .replaceAll('{fieldId}', fieldId)
      .replaceAll('{optionId}', optionId.toString())
      .replaceAll('{contextId}', contextId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (replaceWith != null) {
      queryParams.addAll(_queryParams('', 'replaceWith', replaceWith));
    }
    if (jql != null) {
      queryParams.addAll(_queryParams('', 'jql', jql));
    }

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

  /// Replace custom field options
  ///
  /// Replaces the options of a custom field.  Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect or Forge apps.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] optionId (required):
  ///   The ID of the option to be deselected.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [int] replaceWith:
  ///   The ID of the option that will replace the currently selected option.
  ///
  /// * [String] jql:
  ///   A JQL query that specifies the issues to be updated. For example, *project=10000*.
  Future<void> replaceCustomFieldOption(String fieldId, int optionId, int contextId, { int? replaceWith, String? jql, Future<void>? abortTrigger, }) async {
    final response = await replaceCustomFieldOptionWithHttpInfo(fieldId, optionId, contextId, replaceWith: replaceWith, jql: jql, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update custom field options (context)
  ///
  /// Updates the options of a custom field.  If any of the options are not found, no options are updated. Options where the values in the request match the current values aren't updated and aren't reported in the response.  Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect apps.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [BulkCustomFieldOptionUpdateRequest] bulkCustomFieldOptionUpdateRequest (required):
  Future<Response> updateCustomFieldOptionWithHttpInfo(String fieldId, int contextId, BulkCustomFieldOptionUpdateRequest bulkCustomFieldOptionUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/field/{fieldId}/context/{contextId}/option'
      .replaceAll('{fieldId}', fieldId)
      .replaceAll('{contextId}', contextId.toString());

    // ignore: prefer_final_locals
    Object? postBody = bulkCustomFieldOptionUpdateRequest;

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

  /// Update custom field options (context)
  ///
  /// Updates the options of a custom field.  If any of the options are not found, no options are updated. Options where the values in the request match the current values aren't updated and aren't reported in the response.  Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect apps.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] fieldId (required):
  ///   The ID of the custom field.
  ///
  /// * [int] contextId (required):
  ///   The ID of the context.
  ///
  /// * [BulkCustomFieldOptionUpdateRequest] bulkCustomFieldOptionUpdateRequest (required):
  Future<CustomFieldUpdatedContextOptionsList?> updateCustomFieldOption(String fieldId, int contextId, BulkCustomFieldOptionUpdateRequest bulkCustomFieldOptionUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateCustomFieldOptionWithHttpInfo(fieldId, contextId, bulkCustomFieldOptionUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CustomFieldUpdatedContextOptionsList',) as CustomFieldUpdatedContextOptionsList;
    
    }
    return null;
  }
}
