//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProjectFeaturesApi {
  ProjectFeaturesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get project features
  ///
  /// Returns the list of features for a project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  Future<Response> getFeaturesForProjectWithHttpInfo(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/features'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

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

  /// Get project features
  ///
  /// Returns the list of features for a project.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  Future<ContainerForProjectFeatures?> getFeaturesForProject(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await getFeaturesForProjectWithHttpInfo(projectIdOrKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContainerForProjectFeatures',) as ContainerForProjectFeatures;
    
    }
    return null;
  }

  /// Set project feature state
  ///
  /// Sets the state of a project feature.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  ///
  /// * [String] featureKey (required):
  ///   The key of the feature.
  ///
  /// * [ProjectFeatureState] projectFeatureState (required):
  ///   Details of the feature state change.
  Future<Response> toggleFeatureForProjectWithHttpInfo(String projectIdOrKey, String featureKey, ProjectFeatureState projectFeatureState, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/features/{featureKey}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey)
      .replaceAll('{featureKey}', featureKey);

    // ignore: prefer_final_locals
    Object? postBody = projectFeatureState;

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

  /// Set project feature state
  ///
  /// Sets the state of a project feature.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  ///
  /// * [String] featureKey (required):
  ///   The key of the feature.
  ///
  /// * [ProjectFeatureState] projectFeatureState (required):
  ///   Details of the feature state change.
  Future<ContainerForProjectFeatures?> toggleFeatureForProject(String projectIdOrKey, String featureKey, ProjectFeatureState projectFeatureState, { Future<void>? abortTrigger, }) async {
    final response = await toggleFeatureForProjectWithHttpInfo(projectIdOrKey, featureKey, projectFeatureState, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContainerForProjectFeatures',) as ContainerForProjectFeatures;
    
    }
    return null;
  }
}
