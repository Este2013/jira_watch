//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AppMigrationApi {
  AppMigrationApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Bulk update custom field value
  ///
  /// Updates the value of a custom field added by Connect apps on one or more issues. The values of up to 200 custom fields can be updated.  **[Permissions](#permissions) required:** Only Connect apps can make this request
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] atlassianTransferId (required):
  ///   The ID of the transfer.
  ///
  /// * [ConnectCustomFieldValues] connectCustomFieldValues (required):
  Future<Response> appIssueFieldValueUpdateResourceUpdateIssueFieldsPutWithHttpInfo(String atlassianTransferId, ConnectCustomFieldValues connectCustomFieldValues, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/migration/field';

    // ignore: prefer_final_locals
    Object? postBody = connectCustomFieldValues;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Atlassian-Transfer-Id'] = parameterToString(atlassianTransferId);

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

  /// Bulk update custom field value
  ///
  /// Updates the value of a custom field added by Connect apps on one or more issues. The values of up to 200 custom fields can be updated.  **[Permissions](#permissions) required:** Only Connect apps can make this request
  ///
  /// Parameters:
  ///
  /// * [String] atlassianTransferId (required):
  ///   The ID of the transfer.
  ///
  /// * [ConnectCustomFieldValues] connectCustomFieldValues (required):
  Future<Object?> appIssueFieldValueUpdateResourceUpdateIssueFieldsPut(String atlassianTransferId, ConnectCustomFieldValues connectCustomFieldValues, { Future<void>? abortTrigger, }) async {
    final response = await appIssueFieldValueUpdateResourceUpdateIssueFieldsPutWithHttpInfo(atlassianTransferId, connectCustomFieldValues, abortTrigger: abortTrigger,);
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

  /// Bulk update entity properties
  ///
  /// Updates the values of multiple entity properties for an object, up to 50 updates per request. This operation is for use by Connect apps during app migration.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] atlassianTransferId (required):
  ///   The app migration transfer ID.
  ///
  /// * [String] entityType (required):
  ///   The type indicating the object that contains the entity properties.
  ///
  /// * [List<EntityPropertyDetails>] entityPropertyDetails (required):
  Future<Response> migrationResourceUpdateEntityPropertiesValuePutWithHttpInfo(String atlassianTransferId, String entityType, List<EntityPropertyDetails> entityPropertyDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/migration/properties/{entityType}'
      .replaceAll('{entityType}', entityType);

    // ignore: prefer_final_locals
    Object? postBody = entityPropertyDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Atlassian-Transfer-Id'] = parameterToString(atlassianTransferId);

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

  /// Bulk update entity properties
  ///
  /// Updates the values of multiple entity properties for an object, up to 50 updates per request. This operation is for use by Connect apps during app migration.
  ///
  /// Parameters:
  ///
  /// * [String] atlassianTransferId (required):
  ///   The app migration transfer ID.
  ///
  /// * [String] entityType (required):
  ///   The type indicating the object that contains the entity properties.
  ///
  /// * [List<EntityPropertyDetails>] entityPropertyDetails (required):
  Future<void> migrationResourceUpdateEntityPropertiesValuePut(String atlassianTransferId, String entityType, List<EntityPropertyDetails> entityPropertyDetails, { Future<void>? abortTrigger, }) async {
    final response = await migrationResourceUpdateEntityPropertiesValuePutWithHttpInfo(atlassianTransferId, entityType, entityPropertyDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get workflow transition rule configurations
  ///
  /// Returns configurations for workflow transition rules migrated from server to cloud and owned by the calling Connect app.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] atlassianTransferId (required):
  ///   The app migration transfer ID.
  ///
  /// * [WorkflowRulesSearch] workflowRulesSearch (required):
  Future<Response> migrationResourceWorkflowRuleSearchPostWithHttpInfo(String atlassianTransferId, WorkflowRulesSearch workflowRulesSearch, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/migration/workflow/rule/search';

    // ignore: prefer_final_locals
    Object? postBody = workflowRulesSearch;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Atlassian-Transfer-Id'] = parameterToString(atlassianTransferId);

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

  /// Get workflow transition rule configurations
  ///
  /// Returns configurations for workflow transition rules migrated from server to cloud and owned by the calling Connect app.
  ///
  /// Parameters:
  ///
  /// * [String] atlassianTransferId (required):
  ///   The app migration transfer ID.
  ///
  /// * [WorkflowRulesSearch] workflowRulesSearch (required):
  Future<WorkflowRulesSearchDetails?> migrationResourceWorkflowRuleSearchPost(String atlassianTransferId, WorkflowRulesSearch workflowRulesSearch, { Future<void>? abortTrigger, }) async {
    final response = await migrationResourceWorkflowRuleSearchPostWithHttpInfo(atlassianTransferId, workflowRulesSearch, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowRulesSearchDetails',) as WorkflowRulesSearchDetails;
    
    }
    return null;
  }
}
