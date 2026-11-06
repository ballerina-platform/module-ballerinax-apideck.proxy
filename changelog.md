# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `proxyOptions`, which forwards a downstream `OPTIONS` request.
- Callers can send every Apideck proxy header, including `x-apideck-unified-api`,
  `x-apideck-timeout` and `x-apideck-follow-redirects`, which 1.5.2 had no parameter for.
- The `ProxyRequestBody` type for request payloads. It is a JSON object (`ProxyRequestObject`),
  a plain string (`ProxyRequestString`) or an array of JSON objects (`ProxyRequestObjectArray`).

### Changed

- **Breaking:** the remote methods are renamed:

    | 1.5.2 | 2.0.0 |
    |---|---|
    | `getProxy` | `proxyGet` |
    | `postProxy` | `proxyPost` |
    | `putProxy` | `proxyPut` |
    | `patchProxy` | `proxyPatch` |
    | `deleteProxy` | `proxyDelete` |

- **Breaking:** the proxy headers are no longer positional parameters. Each method takes a
  `map<string|string[]> headers` argument, and the headers are passed by their wire names, such as
  `x-apideck-consumer-id`, `x-apideck-service-id` and `x-apideck-downstream-url`.
- **Breaking:** the application ID moves into the client configuration. `ApiKeysConfig` gains a
  required `xApideckAppId` field, and the client sends it as the `x-apideck-app-id` header on every
  request.
- **Breaking:** every method returns `http:Response|error` (was `json|error`), so callers can read
  the downstream status code, headers and body. Downstream responses that are not JSON objects,
  such as XML, plain text, CSV, binary content or an empty body, no longer fail data binding.
- **Breaking:** `proxyPost`, `proxyPut` and `proxyPatch` take a `ProxyRequestBody` payload (was
  `json`).
- Taken together, a 1.5.2 `getProxy` call migrates as follows:

    ```ballerina
    // 1.5.2
    proxy:Client apideck = check new ({authorization: apiKey});
    json companies = check apideck->getProxy(consumerId, appId, serviceId, downstreamUrl);
    ```

    ```ballerina
    // 2.0.0
    proxy:Client apideck = check new ({authorization: apiKey, xApideckAppId: appId});
    http:Response response = check apideck->proxyGet({
        "x-apideck-consumer-id": consumerId,
        "x-apideck-service-id": serviceId,
        "x-apideck-downstream-url": downstreamUrl
    });
    json companies = check response.getJsonPayload();
    ```

### Removed

- **Breaking:** the `InlineResponse401` record. No method returned it. A failed call returns an
  `http:ClientRequestError` or `http:RemoteServerError` whose detail carries the error body.
- **Breaking:** the connector's own `ClientHttp1Settings` and `ProxyConfig` records.
  `ConnectionConfig` uses `http:ClientHttp1Settings` and `http:ProxyConfig` instead.
