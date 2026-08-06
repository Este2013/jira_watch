//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProjectTemplatesApi {
  ProjectTemplatesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create custom project
  ///
  /// Creates a project based on a custom template provided in the request.  The request body should contain the project details and the capabilities that comprise the project:   *  `details` \\- represents the project details settings  *  `template` \\- represents a list of capabilities responsible for creating specific parts of a project  A capability is defined as a unit of configuration for the project you want to create.  This operation is:   *  [asynchronous](#async). Follow the `Location` link in the response header to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  ***Note: This API is only supported for Jira Enterprise edition.***  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ProjectCustomTemplateCreateRequestDTO] projectCustomTemplateCreateRequestDTO (required):
  ///   The JSON payload containing the project details and capabilities
  Future<Response> createProjectWithCustomTemplateWithHttpInfo(ProjectCustomTemplateCreateRequestDTO projectCustomTemplateCreateRequestDTO, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project-template';

    // ignore: prefer_final_locals
    Object? postBody = projectCustomTemplateCreateRequestDTO;

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

  /// Create custom project
  ///
  /// Creates a project based on a custom template provided in the request.  The request body should contain the project details and the capabilities that comprise the project:   *  `details` \\- represents the project details settings  *  `template` \\- represents a list of capabilities responsible for creating specific parts of a project  A capability is defined as a unit of configuration for the project you want to create.  This operation is:   *  [asynchronous](#async). Follow the `Location` link in the response header to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  ***Note: This API is only supported for Jira Enterprise edition.***  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [ProjectCustomTemplateCreateRequestDTO] projectCustomTemplateCreateRequestDTO (required):
  ///   The JSON payload containing the project details and capabilities
  Future<void> createProjectWithCustomTemplate(ProjectCustomTemplateCreateRequestDTO projectCustomTemplateCreateRequestDTO, { Future<void>? abortTrigger, }) async {
    final response = await createProjectWithCustomTemplateWithHttpInfo(projectCustomTemplateCreateRequestDTO, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Edit a custom project template
  ///
  /// Edit custom template  This API endpoint allows you to edit an existing customised template.  ***Note: Custom Templates are only supported for Jira Enterprise edition.***
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EditTemplateRequest] editTemplateRequest (required):
  ///   The object containing the updated template details: name, description
  Future<Response> editTemplateWithHttpInfo(EditTemplateRequest editTemplateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project-template/edit-template';

    // ignore: prefer_final_locals
    Object? postBody = editTemplateRequest;

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

  /// Edit a custom project template
  ///
  /// Edit custom template  This API endpoint allows you to edit an existing customised template.  ***Note: Custom Templates are only supported for Jira Enterprise edition.***
  ///
  /// Parameters:
  ///
  /// * [EditTemplateRequest] editTemplateRequest (required):
  ///   The object containing the updated template details: name, description
  Future<Object?> editTemplate(EditTemplateRequest editTemplateRequest, { Future<void>? abortTrigger, }) async {
    final response = await editTemplateWithHttpInfo(editTemplateRequest, abortTrigger: abortTrigger,);
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

  /// Gets a custom project template
  ///
  /// Get custom template  This API endpoint allows you to get a live custom project template details by either templateKey or projectId  ***Note: Custom Templates are only supported for Jira Enterprise edition.***
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectId:
  ///   optional - The \\{@link String\\} containing the project key linked to the custom template to retrieve
  ///
  /// * [String] templateKey:
  ///   optional - The \\{@link String\\} containing the key of the custom template to retrieve
  Future<Response> liveTemplateWithHttpInfo({ String? projectId, String? templateKey, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project-template/live-template';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (projectId != null) {
      queryParams.addAll(_queryParams('', 'projectId', projectId));
    }
    if (templateKey != null) {
      queryParams.addAll(_queryParams('', 'templateKey', templateKey));
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

  /// Gets a custom project template
  ///
  /// Get custom template  This API endpoint allows you to get a live custom project template details by either templateKey or projectId  ***Note: Custom Templates are only supported for Jira Enterprise edition.***
  ///
  /// Parameters:
  ///
  /// * [String] projectId:
  ///   optional - The \\{@link String\\} containing the project key linked to the custom template to retrieve
  ///
  /// * [String] templateKey:
  ///   optional - The \\{@link String\\} containing the key of the custom template to retrieve
  Future<ProjectTemplateModel?> liveTemplate({ String? projectId, String? templateKey, Future<void>? abortTrigger, }) async {
    final response = await liveTemplateWithHttpInfo(projectId: projectId, templateKey: templateKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectTemplateModel',) as ProjectTemplateModel;
    
    }
    return null;
  }

  /// Deletes a custom project template
  ///
  /// Remove custom template  This API endpoint allows you to remove a specified customised template  ***Note: Custom Templates are only supported for Jira Enterprise edition.***
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] templateKey (required):
  ///   The \\{@link String\\} containing the key of the custom template to remove
  Future<Response> removeTemplateWithHttpInfo(String templateKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project-template/remove-template';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'templateKey', templateKey));

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

  /// Deletes a custom project template
  ///
  /// Remove custom template  This API endpoint allows you to remove a specified customised template  ***Note: Custom Templates are only supported for Jira Enterprise edition.***
  ///
  /// Parameters:
  ///
  /// * [String] templateKey (required):
  ///   The \\{@link String\\} containing the key of the custom template to remove
  Future<Object?> removeTemplate(String templateKey, { Future<void>? abortTrigger, }) async {
    final response = await removeTemplateWithHttpInfo(templateKey, abortTrigger: abortTrigger,);
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

  /// Save a custom project template
  ///
  /// Save custom template  This API endpoint allows you to save a customised template  ***Note: Custom Templates are only supported for Jira Enterprise edition.***
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SaveTemplateRequest] saveTemplateRequest (required):
  ///   The object containing the template basic details: name, description
  Future<Response> saveTemplateWithHttpInfo(SaveTemplateRequest saveTemplateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project-template/save-template';

    // ignore: prefer_final_locals
    Object? postBody = saveTemplateRequest;

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

  /// Save a custom project template
  ///
  /// Save custom template  This API endpoint allows you to save a customised template  ***Note: Custom Templates are only supported for Jira Enterprise edition.***
  ///
  /// Parameters:
  ///
  /// * [SaveTemplateRequest] saveTemplateRequest (required):
  ///   The object containing the template basic details: name, description
  Future<SaveTemplateResponse?> saveTemplate(SaveTemplateRequest saveTemplateRequest, { Future<void>? abortTrigger, }) async {
    final response = await saveTemplateWithHttpInfo(saveTemplateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SaveTemplateResponse',) as SaveTemplateResponse;
    
    }
    return null;
  }
}
