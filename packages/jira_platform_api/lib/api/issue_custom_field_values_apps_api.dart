//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueCustomFieldValuesAppsApi {
  IssueCustomFieldValuesAppsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Update custom field value
  ///
  /// Updates the value of a custom field on one or more issues.  Apps can only perform this operation on [custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/) and [custom field types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) declared in their own manifests.  **[Permissions](#permissions) required:** Only the app that owns the custom field or custom field type can update its values with this operation.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldIdOrKey (required):
  ///   The ID or key of the custom field. For example, `customfield_10010`.
  ///
  /// * [CustomFieldValueUpdateDetails] customFieldValueUpdateDetails (required):
  ///
  /// * [bool] generateChangelog:
  ///   Whether to generate a changelog for this update.
  ///
  /// * [bool] generateAppEvents:
  ///   Whether to generate app events for this update. Suppresses Forge, Connect, OAuth 2.0, and admin-configured webhooks (registered via the Jira admin UI). Note: Suppressing events means that \"issue updated\" events will not be emitted for your app or any other apps installed in Jira. This may cause other apps to retain stale data for the updated field, resulting in potentially confusing behaviour. We do not recommend using this flag in a Marketplace app as it may result in incompatibilities with other apps that depend on up-to-date issue data.
  Future<Response> updateCustomFieldValueWithHttpInfo(String fieldIdOrKey, CustomFieldValueUpdateDetails customFieldValueUpdateDetails, { bool? generateChangelog, bool? generateAppEvents, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/app/field/{fieldIdOrKey}/value'
      .replaceAll('{fieldIdOrKey}', fieldIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = customFieldValueUpdateDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (generateChangelog != null) {
      queryParams.addAll(_queryParams('', 'generateChangelog', generateChangelog));
    }
    if (generateAppEvents != null) {
      queryParams.addAll(_queryParams('', 'generateAppEvents', generateAppEvents));
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

  /// Update custom field value
  ///
  /// Updates the value of a custom field on one or more issues.  Apps can only perform this operation on [custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/) and [custom field types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) declared in their own manifests.  **[Permissions](#permissions) required:** Only the app that owns the custom field or custom field type can update its values with this operation.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [String] fieldIdOrKey (required):
  ///   The ID or key of the custom field. For example, `customfield_10010`.
  ///
  /// * [CustomFieldValueUpdateDetails] customFieldValueUpdateDetails (required):
  ///
  /// * [bool] generateChangelog:
  ///   Whether to generate a changelog for this update.
  ///
  /// * [bool] generateAppEvents:
  ///   Whether to generate app events for this update. Suppresses Forge, Connect, OAuth 2.0, and admin-configured webhooks (registered via the Jira admin UI). Note: Suppressing events means that \"issue updated\" events will not be emitted for your app or any other apps installed in Jira. This may cause other apps to retain stale data for the updated field, resulting in potentially confusing behaviour. We do not recommend using this flag in a Marketplace app as it may result in incompatibilities with other apps that depend on up-to-date issue data.
  Future<Object?> updateCustomFieldValue(String fieldIdOrKey, CustomFieldValueUpdateDetails customFieldValueUpdateDetails, { bool? generateChangelog, bool? generateAppEvents, Future<void>? abortTrigger, }) async {
    final response = await updateCustomFieldValueWithHttpInfo(fieldIdOrKey, customFieldValueUpdateDetails, generateChangelog: generateChangelog, generateAppEvents: generateAppEvents, abortTrigger: abortTrigger,);
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

  /// Update custom fields
  ///
  /// Updates the value of one or more custom fields on one or more issues. Combinations of custom field and issue should be unique within the request.  Apps can only perform this operation on [custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/) and [custom field types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) declared in their own manifests.  **[Permissions](#permissions) required:** Only the app that owns the custom field or custom field type can update its values with this operation.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MultipleCustomFieldValuesUpdateDetails] multipleCustomFieldValuesUpdateDetails (required):
  ///
  /// * [bool] generateChangelog:
  ///   Whether to generate a changelog for this update.
  ///
  /// * [bool] generateAppEvents:
  ///   Whether to generate app events for this update. Suppresses Forge, Connect, OAuth 2.0, and admin-configured webhooks (registered via the Jira admin UI). Note: Suppressing events means that \"issue updated\" events will not be emitted for your app or any other apps installed in Jira. This may cause other apps to retain stale data for the updated field, resulting in potentially confusing behaviour. We do not recommend using this flag in a Marketplace app as it may result in incompatibilities with other apps that depend on up-to-date issue data.
  Future<Response> updateMultipleCustomFieldValuesWithHttpInfo(MultipleCustomFieldValuesUpdateDetails multipleCustomFieldValuesUpdateDetails, { bool? generateChangelog, bool? generateAppEvents, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/app/field/value';

    // ignore: prefer_final_locals
    Object? postBody = multipleCustomFieldValuesUpdateDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (generateChangelog != null) {
      queryParams.addAll(_queryParams('', 'generateChangelog', generateChangelog));
    }
    if (generateAppEvents != null) {
      queryParams.addAll(_queryParams('', 'generateAppEvents', generateAppEvents));
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

  /// Update custom fields
  ///
  /// Updates the value of one or more custom fields on one or more issues. Combinations of custom field and issue should be unique within the request.  Apps can only perform this operation on [custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/) and [custom field types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) declared in their own manifests.  **[Permissions](#permissions) required:** Only the app that owns the custom field or custom field type can update its values with this operation.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [MultipleCustomFieldValuesUpdateDetails] multipleCustomFieldValuesUpdateDetails (required):
  ///
  /// * [bool] generateChangelog:
  ///   Whether to generate a changelog for this update.
  ///
  /// * [bool] generateAppEvents:
  ///   Whether to generate app events for this update. Suppresses Forge, Connect, OAuth 2.0, and admin-configured webhooks (registered via the Jira admin UI). Note: Suppressing events means that \"issue updated\" events will not be emitted for your app or any other apps installed in Jira. This may cause other apps to retain stale data for the updated field, resulting in potentially confusing behaviour. We do not recommend using this flag in a Marketplace app as it may result in incompatibilities with other apps that depend on up-to-date issue data.
  Future<Object?> updateMultipleCustomFieldValues(MultipleCustomFieldValuesUpdateDetails multipleCustomFieldValuesUpdateDetails, { bool? generateChangelog, bool? generateAppEvents, Future<void>? abortTrigger, }) async {
    final response = await updateMultipleCustomFieldValuesWithHttpInfo(multipleCustomFieldValuesUpdateDetails, generateChangelog: generateChangelog, generateAppEvents: generateAppEvents, abortTrigger: abortTrigger,);
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
}
