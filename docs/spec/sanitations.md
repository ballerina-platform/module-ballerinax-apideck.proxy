_Author_:  @DimuthuMadushan \
_Created_: 2026/10/16 \
_Updated_: 2026/10/16 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Apideck Proxy.
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/apideck/proxy/10.62.0/openapi.yaml).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

## Sanitization Details

1. **Shared request body schema**: The `POST`, `PUT` and `PATCH` operations on `/proxy` each declared the same inline `anyOf` request body (JSON object, string, array of JSON objects). Each copy carried an `example` that was a `$ref` back into another operation's inline schema (`#/paths/~1proxy/post/requestBody/content/*~1*/schema/anyOf/0/example`). The three bodies are replaced by one `components/schemas/ProxyRequestBody` schema, and the dangling example references are dropped.
   - **Reason**: Flattening the inline bodies produced three duplicate unions with names such as `ProxyproxyproxyAnyOf1123`.

2. **Request body media type**: The request bodies of `POST`, `PUT` and `PATCH` on `/proxy` are changed from `*/*` to `application/json`.
   - **Reason**: With `*/*` the generator emits an untyped `http:Request` parameter; with `application/json` the client takes the typed `ProxyRequestBody` payload.

3. **Operation summaries**: The summaries `GET`, `POST`, `PUT`, `PATCH`, `DELETE` and `OPTIONS` are replaced with `Proxy a downstream <METHOD> request`.
   - **Reason**: One-word summaries are not descriptive and are the only text the generated method documentation starts with.

4. **Operation IDs**: `getProxy`, `postProxy`, `putProxy`, `patchProxy`, `deleteProxy` and `optionsProxy` are renamed to `proxyGet`, `proxyPost`, `proxyPut`, `proxyPatch`, `proxyDelete` and `proxyOptions`.
   - **Reason**: Method names must not start with an HTTP verb.

5. **Header parameters removed from the operations**: The eight `x-apideck-*` header parameters (`x-apideck-consumer-id`, `x-apideck-app-id`, `x-apideck-service-id`, `x-apideck-unified-api`, `x-apideck-downstream-url`, `x-apideck-downstream-authorization`, `x-apideck-timeout`, `x-apideck-follow-redirects`) are removed from the `parameters` of every operation on `/proxy`, and each operation's `security` now lists both `apiKey` and `applicationId`. Each operation description gains a sentence telling callers to pass the remaining headers through the `headers` map. The shared definitions under `components/parameters` are left in place.
   - **Reason**: With declared header parameters the generated client builds its headers with `http:getHeaderMap({...headers})`, which spreads the typed headers record into a plain map and loses the `@http:Header` names. The client then sends `xApideckConsumerId` instead of `x-apideck-consumer-id`, and every request is rejected. Without declared header parameters the client takes a `map<string|string[]> headers` and sends the names as given. `x-apideck-app-id` is sent from the client's API key configuration, because `applicationId` is now part of each operation's security.
   - **Re-apply** these edits to the original spec if the upstream spec is adopted again; the aligned spec needs no separate edit.

6. **Schema names**: The flattened schema names `ProxyRequestBodyAnyOf1`, `ProxyRequestBodyProxyRequestBodyAnyOf12` and `ProxyRequestBodyProxyRequestBodyProxyRequestBodyAnyOf123` are renamed to `ProxyRequestObject`, `ProxyRequestString` and `ProxyRequestObjectArray` through `docs/spec/ai-mappings.json`.
   - **Reason**: The generated names describe the nesting of the flattening, not the content.

7. **Info description**: The 240-line `info.description` (a copy of the Apideck developer guide covering headers, error codes, pagination and connection settings) is replaced with a short description of what the Proxy API does: it forwards a request to the API of a downstream connector through Apideck Unify and returns the downstream response, with the credentials injected from Vault.
   - **Reason**: The text becomes the doc comment of the generated `Client` class and the package overview, and most of it did not apply to the Proxy API.

8. **Response descriptions**: The `components/responses` descriptions are rewritten: `Ok` now says it is the downstream service's response (JSON, XML, plain text or CSV, or the `{ url, expires_at }` object when `x-apideck-follow-redirects` is `false`), `Unauthorized` says the Apideck API key or application ID is missing or invalid, and `ProxyError` says the request could not be forwarded or the downstream service returned an error, flagged by the `x-apideck-downstream-error` header.
   - **Reason**: The `# + return -` lines of all six remote methods are derived from the `200` response description, which was a conditional note rather than a statement of what is returned.

9. **Response body type**: The shared `components/responses/Ok` response declared seven media types (`application/json` object, XML, text, CSV, PDF and octet-stream strings), which the generator turned into a `record {}|error` return on every method. The content is replaced with a single `*/*` entry whose schema is `type: string, format: binary`, and the description now says the response carries the downstream status code, headers and body (JSON object or array, XML, text, CSV, binary or empty), so every method returns `http:Response|error`. This supersedes the wording of item 8 for the `Ok` description.
   - **Reason**: A pass-through proxy cannot promise a body shape. A JSON array, a non-JSON body or an empty response (for example a 204 from a downstream DELETE) failed data binding to `record {}`, and callers could not read the status code or headers.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json -o ballerina --mode client --license docs/license.txt --client-methods remote
```

Note: The license year is hardcoded to 2026, change if necessary.
