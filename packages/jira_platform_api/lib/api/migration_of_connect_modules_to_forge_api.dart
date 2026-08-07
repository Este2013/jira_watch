//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MigrationOfConnectModulesToForgeApi {
  MigrationOfConnectModulesToForgeApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get Connect issue field migration task
  ///
  /// Returns the details of a Connect issue field's migration to Forge.  When migrating a Connect app to Forge, [Issue Field](https://developer.atlassian.com/cloud/jira/software/modules/issue-field/) modules must be converted to [Custom field](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/). When the Forge version of the app is installed, Forge creates a [background task](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-tasks/#api-group-tasks) to track the migration of field data across. This endpoint returns the status and other details of that background task.  For more details, see [Jira modules > Jira Custom Fields](https://developer.atlassian.com/platform/adopting-forge-from-connect/migrate-jira-custom-fields/).  **[Permissions](#permissions) required:** Only Connect and Forge apps can make this request.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] connectKey (required):
  ///   The key of the Connect app that contains the Jira issue field being migrated.
  ///
  /// * [String] jiraIssueFieldsKey (required):
  ///   The module key of the Connect issue field being migrated.
  Future<Response> connectToForgeMigrationFetchTaskResourceFetchMigrationTaskGetWithHttpInfo(String connectKey, String jiraIssueFieldsKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/migration/{connectKey}/{jiraIssueFieldsKey}/task'
      .replaceAll('{connectKey}', connectKey)
      .replaceAll('{jiraIssueFieldsKey}', jiraIssueFieldsKey);

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

  /// Get Connect issue field migration task
  ///
  /// Returns the details of a Connect issue field's migration to Forge.  When migrating a Connect app to Forge, [Issue Field](https://developer.atlassian.com/cloud/jira/software/modules/issue-field/) modules must be converted to [Custom field](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/). When the Forge version of the app is installed, Forge creates a [background task](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-tasks/#api-group-tasks) to track the migration of field data across. This endpoint returns the status and other details of that background task.  For more details, see [Jira modules > Jira Custom Fields](https://developer.atlassian.com/platform/adopting-forge-from-connect/migrate-jira-custom-fields/).  **[Permissions](#permissions) required:** Only Connect and Forge apps can make this request.
  ///
  /// Parameters:
  ///
  /// * [String] connectKey (required):
  ///   The key of the Connect app that contains the Jira issue field being migrated.
  ///
  /// * [String] jiraIssueFieldsKey (required):
  ///   The module key of the Connect issue field being migrated.
  Future<TaskProgress?> connectToForgeMigrationFetchTaskResourceFetchMigrationTaskGet(String connectKey, String jiraIssueFieldsKey, { Future<void>? abortTrigger, }) async {
    final response = await connectToForgeMigrationFetchTaskResourceFetchMigrationTaskGetWithHttpInfo(connectKey, jiraIssueFieldsKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TaskProgress',) as TaskProgress;
    
    }
    return null;
  }

  /// Submit Connect issue field migration task
  ///
  /// Submits a request to trigger migration of connect issue field to its Forge custom field counterpart.  When migrating a Connect app to Forge, [Issue Field](https://developer.atlassian.com/cloud/jira/software/modules/issue-field/) modules must be converted to [Custom field](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/) modules. This endpoint triggers the background migration of field data. Use the GET endpoint to retrieve the status and progress of the task.  For more details, see [Jira modules > Jira Custom Fields](https://developer.atlassian.com/platform/adopting-forge-from-connect/migrate-jira-custom-fields/).  **[Permissions](#permissions) required:** Only Connect and Forge apps can make this request.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] connectKey (required):
  ///   The key of the Connect app that contains the Jira issue field being migrated.
  ///
  /// * [String] jiraIssueFieldsKey (required):
  ///   The module key of the Connect issue field being migrated.
  ///
  /// * [bool] retriggerCompletedMigration:
  ///   Whether to retrigger the migration if it has already completed.
  Future<Response> connectToForgeMigrationTaskSubmissionResourceSubmitTaskPostWithHttpInfo(String connectKey, String jiraIssueFieldsKey, { bool? retriggerCompletedMigration, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/migration/{connectKey}/{jiraIssueFieldsKey}/task'
      .replaceAll('{connectKey}', connectKey)
      .replaceAll('{jiraIssueFieldsKey}', jiraIssueFieldsKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (retriggerCompletedMigration != null) {
      queryParams.addAll(_queryParams('', 'retriggerCompletedMigration', retriggerCompletedMigration));
    }

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

  /// Submit Connect issue field migration task
  ///
  /// Submits a request to trigger migration of connect issue field to its Forge custom field counterpart.  When migrating a Connect app to Forge, [Issue Field](https://developer.atlassian.com/cloud/jira/software/modules/issue-field/) modules must be converted to [Custom field](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/) modules. This endpoint triggers the background migration of field data. Use the GET endpoint to retrieve the status and progress of the task.  For more details, see [Jira modules > Jira Custom Fields](https://developer.atlassian.com/platform/adopting-forge-from-connect/migrate-jira-custom-fields/).  **[Permissions](#permissions) required:** Only Connect and Forge apps can make this request.
  ///
  /// Parameters:
  ///
  /// * [String] connectKey (required):
  ///   The key of the Connect app that contains the Jira issue field being migrated.
  ///
  /// * [String] jiraIssueFieldsKey (required):
  ///   The module key of the Connect issue field being migrated.
  ///
  /// * [bool] retriggerCompletedMigration:
  ///   Whether to retrigger the migration if it has already completed.
  Future<void> connectToForgeMigrationTaskSubmissionResourceSubmitTaskPost(String connectKey, String jiraIssueFieldsKey, { bool? retriggerCompletedMigration, Future<void>? abortTrigger, }) async {
    final response = await connectToForgeMigrationTaskSubmissionResourceSubmitTaskPostWithHttpInfo(connectKey, jiraIssueFieldsKey, retriggerCompletedMigration: retriggerCompletedMigration, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
