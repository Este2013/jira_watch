//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ContentApi {
  ContentApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Convert content ids to content types
  ///
  /// Converts a list of content ids into their associated content types. This is useful for users migrating from v1 to v2 who may have stored just content ids without their associated type. This will return types as they should be used in v2. Notably, this will return `inline-comment` for inline comments and `footer-comment` for footer comments, which is distinct from them both being represented by `comment` in v1.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the requested content. Any content that the user does not have permission to view or does not exist will map to `null` in the response.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConvertContentIdsToContentTypesRequest] convertContentIdsToContentTypesRequest (required):
  Future<Response> convertContentIdsToContentTypesWithHttpInfo(ConvertContentIdsToContentTypesRequest convertContentIdsToContentTypesRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/content/convert-ids-to-types';

    // ignore: prefer_final_locals
    Object? postBody = convertContentIdsToContentTypesRequest;

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

  /// Convert content ids to content types
  ///
  /// Converts a list of content ids into their associated content types. This is useful for users migrating from v1 to v2 who may have stored just content ids without their associated type. This will return types as they should be used in v2. Notably, this will return `inline-comment` for inline comments and `footer-comment` for footer comments, which is distinct from them both being represented by `comment` in v1.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the requested content. Any content that the user does not have permission to view or does not exist will map to `null` in the response.
  ///
  /// Parameters:
  ///
  /// * [ConvertContentIdsToContentTypesRequest] convertContentIdsToContentTypesRequest (required):
  Future<ContentIdToContentTypeResponse?> convertContentIdsToContentTypes(ConvertContentIdsToContentTypesRequest convertContentIdsToContentTypesRequest, { Future<void>? abortTrigger, }) async {
    final response = await convertContentIdsToContentTypesWithHttpInfo(convertContentIdsToContentTypesRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContentIdToContentTypeResponse',) as ContentIdToContentTypeResponse;
    
    }
    return null;
  }
}
