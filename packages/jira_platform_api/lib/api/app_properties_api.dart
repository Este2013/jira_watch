//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AppPropertiesApi {
  AppPropertiesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete app property
  ///
  /// Deletes an app's property.  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request. Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] addonKey (required):
  ///   The key of the app, as defined in its descriptor.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<Response> addonPropertiesResourceDeleteAddonPropertyDeleteWithHttpInfo(String addonKey, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}'
      .replaceAll('{addonKey}', addonKey)
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Delete app property
  ///
  /// Deletes an app's property.  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request. Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).
  ///
  /// Parameters:
  ///
  /// * [String] addonKey (required):
  ///   The key of the app, as defined in its descriptor.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<void> addonPropertiesResourceDeleteAddonPropertyDelete(String addonKey, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await addonPropertiesResourceDeleteAddonPropertyDeleteWithHttpInfo(addonKey, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get app properties
  ///
  /// Gets all the properties of an app. The reserved key `connect_client_key_019cdff3-8bfb-71fe-9628-875b700aebb8` is not returned.  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request. Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] addonKey (required):
  ///   The key of the app, as defined in its descriptor.
  Future<Response> addonPropertiesResourceGetAddonPropertiesGetWithHttpInfo(String addonKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/addons/{addonKey}/properties'
      .replaceAll('{addonKey}', addonKey);

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

  /// Get app properties
  ///
  /// Gets all the properties of an app. The reserved key `connect_client_key_019cdff3-8bfb-71fe-9628-875b700aebb8` is not returned.  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request. Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).
  ///
  /// Parameters:
  ///
  /// * [String] addonKey (required):
  ///   The key of the app, as defined in its descriptor.
  Future<PropertyKeys?> addonPropertiesResourceGetAddonPropertiesGet(String addonKey, { Future<void>? abortTrigger, }) async {
    final response = await addonPropertiesResourceGetAddonPropertiesGetWithHttpInfo(addonKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PropertyKeys',) as PropertyKeys;
    
    }
    return null;
  }

  /// Get app property
  ///
  /// Returns the key and value of an app's property. The property key `connect_client_key_019cdff3-8bfb-71fe-9628-875b700aebb8` is reserved. It returns a synthetic, read-only property containing the Connect `clientKey` for the requested tenant. This is intended for Forge apps with `app.connect.key` to retrieve the Connect client key during migration.  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request. Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] addonKey (required):
  ///   The key of the app, as defined in its descriptor.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<Response> addonPropertiesResourceGetAddonPropertyGetWithHttpInfo(String addonKey, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}'
      .replaceAll('{addonKey}', addonKey)
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Get app property
  ///
  /// Returns the key and value of an app's property. The property key `connect_client_key_019cdff3-8bfb-71fe-9628-875b700aebb8` is reserved. It returns a synthetic, read-only property containing the Connect `clientKey` for the requested tenant. This is intended for Forge apps with `app.connect.key` to retrieve the Connect client key during migration.  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request. Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).
  ///
  /// Parameters:
  ///
  /// * [String] addonKey (required):
  ///   The key of the app, as defined in its descriptor.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<EntityProperty?> addonPropertiesResourceGetAddonPropertyGet(String addonKey, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await addonPropertiesResourceGetAddonPropertyGetWithHttpInfo(addonKey, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'EntityProperty',) as EntityProperty;
    
    }
    return null;
  }

  /// Set app property
  ///
  /// Sets the value of an app's property. Use this resource to store custom data for your app.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request. Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] addonKey (required):
  ///   The key of the app, as defined in its descriptor.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  ///
  /// * [Object] body (required):
  Future<Response> addonPropertiesResourcePutAddonPropertyPutWithHttpInfo(String addonKey, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}'
      .replaceAll('{addonKey}', addonKey)
      .replaceAll('{propertyKey}', propertyKey);

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// Set app property
  ///
  /// Sets the value of an app's property. Use this resource to store custom data for your app.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  **[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make this request. Additionally, Forge apps can access Connect app properties (stored against the same `app.connect.key`).
  ///
  /// Parameters:
  ///
  /// * [String] addonKey (required):
  ///   The key of the app, as defined in its descriptor.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  ///
  /// * [Object] body (required):
  Future<OperationMessage?> addonPropertiesResourcePutAddonPropertyPut(String addonKey, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    final response = await addonPropertiesResourcePutAddonPropertyPutWithHttpInfo(addonKey, propertyKey, body, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OperationMessage',) as OperationMessage;
    
    }
    return null;
  }

  /// Delete app property (Forge)
  ///
  /// Deletes a Forge app's property.  **[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<Response> deleteForgeAppPropertyWithHttpInfo(String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/forge/1/app/properties/{propertyKey}'
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Delete app property (Forge)
  ///
  /// Deletes a Forge app's property.  **[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<void> deleteForgeAppProperty(String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await deleteForgeAppPropertyWithHttpInfo(propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get app property (Forge)
  ///
  /// Returns the value of a Forge app's property.  **[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<Response> getForgeAppPropertyWithHttpInfo(String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/forge/1/app/properties/{propertyKey}'
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Get app property (Forge)
  ///
  /// Returns the value of a Forge app's property.  **[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.
  ///
  /// Parameters:
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<GetForgeAppProperty200Response?> getForgeAppProperty(String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await getForgeAppPropertyWithHttpInfo(propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetForgeAppProperty200Response',) as GetForgeAppProperty200Response;
    
    }
    return null;
  }

  /// Get app property keys (Forge)
  ///
  /// Returns all property keys for the Forge app.  **[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getForgeAppPropertyKeysWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/forge/1/app/properties';

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

  /// Get app property keys (Forge)
  ///
  /// Returns all property keys for the Forge app.  **[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.
  Future<GetForgeAppPropertyKeys200Response?> getForgeAppPropertyKeys({ Future<void>? abortTrigger, }) async {
    final response = await getForgeAppPropertyKeysWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetForgeAppPropertyKeys200Response',) as GetForgeAppPropertyKeys200Response;
    
    }
    return null;
  }

  /// Set app property (Forge)
  ///
  /// Sets the value of a Forge app's property. These values can be retrieved in [Jira expressions](/cloud/jira/platform/jira-expressions/) through the `app` [context variable](/cloud/jira/platform/jira-expressions/#context-variables). They are also available in [entity property display conditions](/platform/forge/manifest-reference/display-conditions/entity-property-conditions/).  For other use cases, use the [Storage API](/platform/forge/runtime-reference/storage-api/).  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  **[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  ///
  /// * [Object] body (required):
  Future<Response> putForgeAppPropertyWithHttpInfo(String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/forge/1/app/properties/{propertyKey}'
      .replaceAll('{propertyKey}', propertyKey);

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// Set app property (Forge)
  ///
  /// Sets the value of a Forge app's property. These values can be retrieved in [Jira expressions](/cloud/jira/platform/jira-expressions/) through the `app` [context variable](/cloud/jira/platform/jira-expressions/#context-variables). They are also available in [entity property display conditions](/platform/forge/manifest-reference/display-conditions/entity-property-conditions/).  For other use cases, use the [Storage API](/platform/forge/runtime-reference/storage-api/).  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  **[Permissions](#permissions) required:** Only Forge apps can make this request. This API can only be accessed using **[asApp()](https://developer.atlassian.com/platform/forge/apis-reference/fetch-api-product.requestjira/#method-signature)** requests from Forge.  The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
  ///
  /// Parameters:
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  ///
  /// * [Object] body (required):
  Future<OperationMessage?> putForgeAppProperty(String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    final response = await putForgeAppPropertyWithHttpInfo(propertyKey, body, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OperationMessage',) as OperationMessage;
    
    }
    return null;
  }
}
