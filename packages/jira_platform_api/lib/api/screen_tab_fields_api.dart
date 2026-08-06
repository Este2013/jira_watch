//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ScreenTabFieldsApi {
  ScreenTabFieldsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add screen tab field
  ///
  /// Adds a field to a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [AddFieldBean] addFieldBean (required):
  ///
  /// * [bool] skipFieldAssociation:
  Future<Response> addScreenTabFieldWithHttpInfo(int screenId, int tabId, AddFieldBean addFieldBean, { bool? skipFieldAssociation, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs/{tabId}/fields'
      .replaceAll('{screenId}', screenId.toString())
      .replaceAll('{tabId}', tabId.toString());

    // ignore: prefer_final_locals
    Object? postBody = addFieldBean;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (skipFieldAssociation != null) {
      queryParams.addAll(_queryParams('', 'skipFieldAssociation', skipFieldAssociation));
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

  /// Add screen tab field
  ///
  /// Adds a field to a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [AddFieldBean] addFieldBean (required):
  ///
  /// * [bool] skipFieldAssociation:
  Future<ScreenableField?> addScreenTabField(int screenId, int tabId, AddFieldBean addFieldBean, { bool? skipFieldAssociation, Future<void>? abortTrigger, }) async {
    final response = await addScreenTabFieldWithHttpInfo(screenId, tabId, addFieldBean, skipFieldAssociation: skipFieldAssociation, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ScreenableField',) as ScreenableField;
    
    }
    return null;
  }

  /// Get all screen tab fields
  ///
  /// Returns all fields for a screen tab.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) when the project key is specified, providing that the screen is associated with the project through a Screen Scheme and Issue Type Screen Scheme.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [String] projectKey:
  ///   The key of the project.
  Future<Response> getAllScreenTabFieldsWithHttpInfo(int screenId, int tabId, { String? projectKey, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs/{tabId}/fields'
      .replaceAll('{screenId}', screenId.toString())
      .replaceAll('{tabId}', tabId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (projectKey != null) {
      queryParams.addAll(_queryParams('', 'projectKey', projectKey));
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

  /// Get all screen tab fields
  ///
  /// Returns all fields for a screen tab.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) when the project key is specified, providing that the screen is associated with the project through a Screen Scheme and Issue Type Screen Scheme.
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [String] projectKey:
  ///   The key of the project.
  Future<List<ScreenableField>?> getAllScreenTabFields(int screenId, int tabId, { String? projectKey, Future<void>? abortTrigger, }) async {
    final response = await getAllScreenTabFieldsWithHttpInfo(screenId, tabId, projectKey: projectKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ScreenableField>') as List)
        .cast<ScreenableField>()
        .toList(growable: false);

    }
    return null;
  }

  /// Move screen tab field
  ///
  /// Moves a screen tab field.  If `after` and `position` are provided in the request, `position` is ignored.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [String] id (required):
  ///   The ID of the field.
  ///
  /// * [MoveFieldBean] moveFieldBean (required):
  Future<Response> moveScreenTabFieldWithHttpInfo(int screenId, int tabId, String id, MoveFieldBean moveFieldBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}/move'
      .replaceAll('{screenId}', screenId.toString())
      .replaceAll('{tabId}', tabId.toString())
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = moveFieldBean;

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

  /// Move screen tab field
  ///
  /// Moves a screen tab field.  If `after` and `position` are provided in the request, `position` is ignored.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [String] id (required):
  ///   The ID of the field.
  ///
  /// * [MoveFieldBean] moveFieldBean (required):
  Future<Object?> moveScreenTabField(int screenId, int tabId, String id, MoveFieldBean moveFieldBean, { Future<void>? abortTrigger, }) async {
    final response = await moveScreenTabFieldWithHttpInfo(screenId, tabId, id, moveFieldBean, abortTrigger: abortTrigger,);
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

  /// Remove screen tab field
  ///
  /// Removes a field from a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [String] id (required):
  ///   The ID of the field.
  Future<Response> removeScreenTabFieldWithHttpInfo(int screenId, int tabId, String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}'
      .replaceAll('{screenId}', screenId.toString())
      .replaceAll('{tabId}', tabId.toString())
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

  /// Remove screen tab field
  ///
  /// Removes a field from a screen tab.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] screenId (required):
  ///   The ID of the screen.
  ///
  /// * [int] tabId (required):
  ///   The ID of the screen tab.
  ///
  /// * [String] id (required):
  ///   The ID of the field.
  Future<void> removeScreenTabField(int screenId, int tabId, String id, { Future<void>? abortTrigger, }) async {
    final response = await removeScreenTabFieldWithHttpInfo(screenId, tabId, id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
