//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TaskApi {
  TaskApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get task by id
  ///
  /// Returns a specific task.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the containing page or blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the task to be returned. If you don't know the task ID, use Get tasks and filter the results.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  Future<Response> getTaskByIdWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/tasks/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Get task by id
  ///
  /// Returns a specific task.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the containing page or blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the task to be returned. If you don't know the task ID, use Get tasks and filter the results.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  Future<Task?> getTaskById(int id, { PrimaryBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    final response = await getTaskByIdWithHttpInfo(id, bodyFormat: bodyFormat, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Task',) as Task;
    
    }
    return null;
  }

  /// Get tasks
  ///
  /// Returns all tasks. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Only tasks that the user has permission to view will be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [bool] includeBlankTasks:
  ///   Specifies whether to include blank tasks in the response. Defaults to `true`.
  ///
  /// * [String] status:
  ///   Filters on the status of the task.
  ///
  /// * [List<int>] taskId:
  ///   Filters on task ID. Multiple IDs can be specified.
  ///
  /// * [List<int>] spaceId:
  ///   Filters on the space ID of the task. Multiple IDs can be specified.
  ///
  /// * [List<int>] pageId:
  ///   Filters on the page ID of the task. Multiple IDs can be specified. Note - page and blog post filters can be used in conjunction.
  ///
  /// * [List<int>] blogpostId:
  ///   Filters on the blog post ID of the task. Multiple IDs can be specified. Note - page and blog post filters can be used in conjunction.
  ///
  /// * [List<String>] createdBy:
  ///   Filters on the Account ID of the user who created this task. Multiple IDs can be specified.
  ///
  /// * [List<String>] assignedTo:
  ///   Filters on the Account ID of the user to whom this task is assigned. Multiple IDs can be specified.
  ///
  /// * [List<String>] completedBy:
  ///   Filters on the Account ID of the user who completed this task. Multiple IDs can be specified.
  ///
  /// * [int] createdAtFrom:
  ///   Filters on start of date-time range of task based on creation date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] createdAtTo:
  ///   Filters on end of date-time range of task based on creation date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] dueAtFrom:
  ///   Filters on start of date-time range of task based on due date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] dueAtTo:
  ///   Filters on end of date-time range of task based on due date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] completedAtFrom:
  ///   Filters on start of date-time range of task based on completion date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] completedAtTo:
  ///   Filters on end of date-time range of task based on completion date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of tasks per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getTasksWithHttpInfo({ PrimaryBodyRepresentation? bodyFormat, bool? includeBlankTasks, String? status, List<int>? taskId, List<int>? spaceId, List<int>? pageId, List<int>? blogpostId, List<String>? createdBy, List<String>? assignedTo, List<String>? completedBy, int? createdAtFrom, int? createdAtTo, int? dueAtFrom, int? dueAtTo, int? completedAtFrom, int? completedAtTo, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/tasks';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (includeBlankTasks != null) {
      queryParams.addAll(_queryParams('', 'include-blank-tasks', includeBlankTasks));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (taskId != null) {
      queryParams.addAll(_queryParams('multi', 'task-id', taskId));
    }
    if (spaceId != null) {
      queryParams.addAll(_queryParams('multi', 'space-id', spaceId));
    }
    if (pageId != null) {
      queryParams.addAll(_queryParams('multi', 'page-id', pageId));
    }
    if (blogpostId != null) {
      queryParams.addAll(_queryParams('multi', 'blogpost-id', blogpostId));
    }
    if (createdBy != null) {
      queryParams.addAll(_queryParams('multi', 'created-by', createdBy));
    }
    if (assignedTo != null) {
      queryParams.addAll(_queryParams('multi', 'assigned-to', assignedTo));
    }
    if (completedBy != null) {
      queryParams.addAll(_queryParams('multi', 'completed-by', completedBy));
    }
    if (createdAtFrom != null) {
      queryParams.addAll(_queryParams('', 'created-at-from', createdAtFrom));
    }
    if (createdAtTo != null) {
      queryParams.addAll(_queryParams('', 'created-at-to', createdAtTo));
    }
    if (dueAtFrom != null) {
      queryParams.addAll(_queryParams('', 'due-at-from', dueAtFrom));
    }
    if (dueAtTo != null) {
      queryParams.addAll(_queryParams('', 'due-at-to', dueAtTo));
    }
    if (completedAtFrom != null) {
      queryParams.addAll(_queryParams('', 'completed-at-from', completedAtFrom));
    }
    if (completedAtTo != null) {
      queryParams.addAll(_queryParams('', 'completed-at-to', completedAtTo));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get tasks
  ///
  /// Returns all tasks. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Only tasks that the user has permission to view will be returned.
  ///
  /// Parameters:
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [bool] includeBlankTasks:
  ///   Specifies whether to include blank tasks in the response. Defaults to `true`.
  ///
  /// * [String] status:
  ///   Filters on the status of the task.
  ///
  /// * [List<int>] taskId:
  ///   Filters on task ID. Multiple IDs can be specified.
  ///
  /// * [List<int>] spaceId:
  ///   Filters on the space ID of the task. Multiple IDs can be specified.
  ///
  /// * [List<int>] pageId:
  ///   Filters on the page ID of the task. Multiple IDs can be specified. Note - page and blog post filters can be used in conjunction.
  ///
  /// * [List<int>] blogpostId:
  ///   Filters on the blog post ID of the task. Multiple IDs can be specified. Note - page and blog post filters can be used in conjunction.
  ///
  /// * [List<String>] createdBy:
  ///   Filters on the Account ID of the user who created this task. Multiple IDs can be specified.
  ///
  /// * [List<String>] assignedTo:
  ///   Filters on the Account ID of the user to whom this task is assigned. Multiple IDs can be specified.
  ///
  /// * [List<String>] completedBy:
  ///   Filters on the Account ID of the user who completed this task. Multiple IDs can be specified.
  ///
  /// * [int] createdAtFrom:
  ///   Filters on start of date-time range of task based on creation date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] createdAtTo:
  ///   Filters on end of date-time range of task based on creation date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] dueAtFrom:
  ///   Filters on start of date-time range of task based on due date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] dueAtTo:
  ///   Filters on end of date-time range of task based on due date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] completedAtFrom:
  ///   Filters on start of date-time range of task based on completion date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [int] completedAtTo:
  ///   Filters on end of date-time range of task based on completion date (inclusive). Input is epoch time in milliseconds.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of tasks per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultTask?> getTasks({ PrimaryBodyRepresentation? bodyFormat, bool? includeBlankTasks, String? status, List<int>? taskId, List<int>? spaceId, List<int>? pageId, List<int>? blogpostId, List<String>? createdBy, List<String>? assignedTo, List<String>? completedBy, int? createdAtFrom, int? createdAtTo, int? dueAtFrom, int? dueAtTo, int? completedAtFrom, int? completedAtTo, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getTasksWithHttpInfo(bodyFormat: bodyFormat, includeBlankTasks: includeBlankTasks, status: status, taskId: taskId, spaceId: spaceId, pageId: pageId, blogpostId: blogpostId, createdBy: createdBy, assignedTo: assignedTo, completedBy: completedBy, createdAtFrom: createdAtFrom, createdAtTo: createdAtTo, dueAtFrom: dueAtFrom, dueAtTo: dueAtTo, completedAtFrom: completedAtFrom, completedAtTo: completedAtTo, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultTask',) as MultiEntityResultTask;
    
    }
    return null;
  }

  /// Update task
  ///
  /// Update a task by id. This endpoint currently only supports updating task status.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the containing page or blog post and view its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the task to be updated. If you don't know the task ID, use Get tasks and filter the results.
  ///
  /// * [UpdateTaskRequest] updateTaskRequest (required):
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  Future<Response> updateTaskWithHttpInfo(int id, UpdateTaskRequest updateTaskRequest, { PrimaryBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/tasks/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateTaskRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Update task
  ///
  /// Update a task by id. This endpoint currently only supports updating task status.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to edit the containing page or blog post and view its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the task to be updated. If you don't know the task ID, use Get tasks and filter the results.
  ///
  /// * [UpdateTaskRequest] updateTaskRequest (required):
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  Future<Task?> updateTask(int id, UpdateTaskRequest updateTaskRequest, { PrimaryBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    final response = await updateTaskWithHttpInfo(id, updateTaskRequest, bodyFormat: bodyFormat, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Task',) as Task;
    
    }
    return null;
  }
}
