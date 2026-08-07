//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DynamicModulesApi {
  DynamicModulesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get modules
  ///
  /// Returns all modules registered dynamically by the calling app.  **[Permissions](#permissions) required:** Only Connect apps can make this request.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> dynamicModulesResourceGetModulesGetWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/app/module/dynamic';

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

  /// Get modules
  ///
  /// Returns all modules registered dynamically by the calling app.  **[Permissions](#permissions) required:** Only Connect apps can make this request.
  Future<ConnectModules?> dynamicModulesResourceGetModulesGet({ Future<void>? abortTrigger, }) async {
    final response = await dynamicModulesResourceGetModulesGetWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ConnectModules',) as ConnectModules;
    
    }
    return null;
  }

  /// Register modules
  ///
  /// Registers a list of modules.  **[Permissions](#permissions) required:** Only Connect apps can make this request.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectModules] connectModules (required):
  Future<Response> dynamicModulesResourceRegisterModulesPostWithHttpInfo(ConnectModules connectModules, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/app/module/dynamic';

    // ignore: prefer_final_locals
    Object? postBody = connectModules;

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

  /// Register modules
  ///
  /// Registers a list of modules.  **[Permissions](#permissions) required:** Only Connect apps can make this request.
  ///
  /// Parameters:
  ///
  /// * [ConnectModules] connectModules (required):
  Future<void> dynamicModulesResourceRegisterModulesPost(ConnectModules connectModules, { Future<void>? abortTrigger, }) async {
    final response = await dynamicModulesResourceRegisterModulesPostWithHttpInfo(connectModules, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Remove modules
  ///
  /// Remove all or a list of modules registered by the calling app.  **[Permissions](#permissions) required:** Only Connect apps can make this request.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] moduleKey:
  ///   The key of the module to remove. To include multiple module keys, provide multiple copies of this parameter. For example, `moduleKey=dynamic-attachment-entity-property&moduleKey=dynamic-select-field`. Nonexistent keys are ignored.
  Future<Response> dynamicModulesResourceRemoveModulesDeleteWithHttpInfo({ List<String>? moduleKey, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/app/module/dynamic';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (moduleKey != null) {
      queryParams.addAll(_queryParams('multi', 'moduleKey', moduleKey));
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

  /// Remove modules
  ///
  /// Remove all or a list of modules registered by the calling app.  **[Permissions](#permissions) required:** Only Connect apps can make this request.
  ///
  /// Parameters:
  ///
  /// * [List<String>] moduleKey:
  ///   The key of the module to remove. To include multiple module keys, provide multiple copies of this parameter. For example, `moduleKey=dynamic-attachment-entity-property&moduleKey=dynamic-select-field`. Nonexistent keys are ignored.
  Future<void> dynamicModulesResourceRemoveModulesDelete({ List<String>? moduleKey, Future<void>? abortTrigger, }) async {
    final response = await dynamicModulesResourceRemoveModulesDeleteWithHttpInfo(moduleKey: moduleKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
