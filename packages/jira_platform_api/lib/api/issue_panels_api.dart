//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssuePanelsApi {
  IssuePanelsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Bulk pin or unpin issue panel to projects
  ///
  /// Bulk pin or unpin an issue panel (added by a Forge app) to or from multiple projects.  The operation runs asynchronously. The response includes a task ID - use the [Get task](#api-rest-api-3-task-taskId-get) endpoint to check progress.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ForgePanelProjectPinRequest] forgePanelProjectPinRequest (required):
  ///   Forge module ID and the list of projects with pin or unpin action.
  Future<Response> bulkPinUnpinProjectsAsyncWithHttpInfo(ForgePanelProjectPinRequest forgePanelProjectPinRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/forge/panel/action/bulk/async';

    // ignore: prefer_final_locals
    Object? postBody = forgePanelProjectPinRequest;

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

  /// Bulk pin or unpin issue panel to projects
  ///
  /// Bulk pin or unpin an issue panel (added by a Forge app) to or from multiple projects.  The operation runs asynchronously. The response includes a task ID - use the [Get task](#api-rest-api-3-task-taskId-get) endpoint to check progress.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [ForgePanelProjectPinRequest] forgePanelProjectPinRequest (required):
  ///   Forge module ID and the list of projects with pin or unpin action.
  Future<ForgePanelProjectPinAsyncResponse?> bulkPinUnpinProjectsAsync(ForgePanelProjectPinRequest forgePanelProjectPinRequest, { Future<void>? abortTrigger, }) async {
    final response = await bulkPinUnpinProjectsAsyncWithHttpInfo(forgePanelProjectPinRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ForgePanelProjectPinAsyncResponse',) as ForgePanelProjectPinAsyncResponse;
    
    }
    return null;
  }
}
