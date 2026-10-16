// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

listener http:Listener ep0 = new (9090);

@http:ServiceConfig {treatNilableAsOptional: true}
service /proxy on ep0 {
    # Proxy a downstream DELETE request
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from
    # + xApideckAppId - The ID of your Unify application
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). Only needed when a consumer has activated multiple integrations for a Unified API
    # + xApideckUnifiedApi - Specify which unified API to use for the connection lookup. Required for multi-API connectors (e.g., Workday) to ensure the correct credentials are used
    # + xApideckDownstreamUrl - Downstream URL
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection
    # + xApideckTimeout - Override the default downstream request timeout in milliseconds. The default is 28000 (28 seconds)
    # + xApideckFollowRedirects - Set to `false` to opt out of the redirect to the presigned download URL. Instead of a `30x` response, you receive a `200` JSON body `{ url, expires_at }` containing the URL and its expiry, which you can fetch explicitly. Use this if your client automatically forwards the `Authorization` header onto redirects, since the downstream storage provider will reject that request. Any value other than `false` (or omitting the header) preserves the default redirect behavior
    # + return - returns can be any of following types 
    # http:Ok (Ok. When the request includes `x-apideck-follow-redirects: false` and the downstream response would otherwise redirect to a presigned URL (oversized responses), the body is instead an `application/json` object `{ url, expires_at }` — fetch `url` explicitly (without the Authorization header) to retrieve the payload)
    # http:Unauthorized (Unauthorized)
    # http:DefaultStatusCodeResponse (Proxy error)
    resource function delete .(@http:Header {name: "x-apideck-consumer-id"} string xApideckConsumerId, @http:Header {name: "x-apideck-app-id"} string xApideckAppId, @http:Header {name: "x-apideck-service-id"} string xApideckServiceId, @http:Header {name: "x-apideck-unified-api"} string? xApideckUnifiedApi, @http:Header {name: "x-apideck-downstream-url"} string xApideckDownstreamUrl, @http:Header {name: "x-apideck-downstream-authorization"} string? xApideckDownstreamAuthorization, @http:Header {name: "x-apideck-timeout"} int? xApideckTimeout = 28000, @http:Header {name: "x-apideck-follow-redirects"} boolean? xApideckFollowRedirects = true) returns anydata {
        return {status_code: 200, status: "OK", data: {id: "9f3c2a10", deleted: true}};
    }

    # Proxy a downstream GET request
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from
    # + xApideckAppId - The ID of your Unify application
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). Only needed when a consumer has activated multiple integrations for a Unified API
    # + xApideckUnifiedApi - Specify which unified API to use for the connection lookup. Required for multi-API connectors (e.g., Workday) to ensure the correct credentials are used
    # + xApideckDownstreamUrl - Downstream URL
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection
    # + xApideckTimeout - Override the default downstream request timeout in milliseconds. The default is 28000 (28 seconds)
    # + xApideckFollowRedirects - Set to `false` to opt out of the redirect to the presigned download URL. Instead of a `30x` response, you receive a `200` JSON body `{ url, expires_at }` containing the URL and its expiry, which you can fetch explicitly. Use this if your client automatically forwards the `Authorization` header onto redirects, since the downstream storage provider will reject that request. Any value other than `false` (or omitting the header) preserves the default redirect behavior
    # + return - returns can be any of following types 
    # http:Ok (Ok. When the request includes `x-apideck-follow-redirects: false` and the downstream response would otherwise redirect to a presigned URL (oversized responses), the body is instead an `application/json` object `{ url, expires_at }` — fetch `url` explicitly (without the Authorization header) to retrieve the payload)
    # http:Unauthorized (Unauthorized)
    # http:DefaultStatusCodeResponse (Proxy error)
    resource function get .(@http:Header {name: "x-apideck-consumer-id"} string xApideckConsumerId, @http:Header {name: "x-apideck-app-id"} string xApideckAppId, @http:Header {name: "x-apideck-service-id"} string xApideckServiceId, @http:Header {name: "x-apideck-unified-api"} string? xApideckUnifiedApi, @http:Header {name: "x-apideck-downstream-url"} string xApideckDownstreamUrl, @http:Header {name: "x-apideck-downstream-authorization"} string? xApideckDownstreamAuthorization, @http:Header {name: "x-apideck-timeout"} int? xApideckTimeout = 28000, @http:Header {name: "x-apideck-follow-redirects"} boolean? xApideckFollowRedirects = true) returns anydata {
        return {status_code: 200, status: "OK", data: {id: "9f3c2a10", name: "Bluth Company", url: "http://thebluthcompany.tumblr.com/"}};
    }

    # Proxy a downstream OPTIONS request
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from
    # + xApideckAppId - The ID of your Unify application
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). Only needed when a consumer has activated multiple integrations for a Unified API
    # + xApideckUnifiedApi - Specify which unified API to use for the connection lookup. Required for multi-API connectors (e.g., Workday) to ensure the correct credentials are used
    # + xApideckDownstreamUrl - Downstream URL
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection
    # + xApideckTimeout - Override the default downstream request timeout in milliseconds. The default is 28000 (28 seconds)
    # + xApideckFollowRedirects - Set to `false` to opt out of the redirect to the presigned download URL. Instead of a `30x` response, you receive a `200` JSON body `{ url, expires_at }` containing the URL and its expiry, which you can fetch explicitly. Use this if your client automatically forwards the `Authorization` header onto redirects, since the downstream storage provider will reject that request. Any value other than `false` (or omitting the header) preserves the default redirect behavior
    # + return - returns can be any of following types 
    # http:Ok (Ok. When the request includes `x-apideck-follow-redirects: false` and the downstream response would otherwise redirect to a presigned URL (oversized responses), the body is instead an `application/json` object `{ url, expires_at }` — fetch `url` explicitly (without the Authorization header) to retrieve the payload)
    # http:Unauthorized (Unauthorized)
    # http:DefaultStatusCodeResponse (Proxy error)
    resource function options .(@http:Header {name: "x-apideck-consumer-id"} string xApideckConsumerId, @http:Header {name: "x-apideck-app-id"} string xApideckAppId, @http:Header {name: "x-apideck-service-id"} string xApideckServiceId, @http:Header {name: "x-apideck-unified-api"} string? xApideckUnifiedApi, @http:Header {name: "x-apideck-downstream-url"} string xApideckDownstreamUrl, @http:Header {name: "x-apideck-downstream-authorization"} string? xApideckDownstreamAuthorization, @http:Header {name: "x-apideck-timeout"} int? xApideckTimeout = 28000, @http:Header {name: "x-apideck-follow-redirects"} boolean? xApideckFollowRedirects = true) returns anydata {
        return {status_code: 200, status: "OK", data: {allow: "GET,POST,PUT,PATCH,DELETE,OPTIONS"}};
    }

    # Proxy a downstream PATCH request
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from
    # + xApideckAppId - The ID of your Unify application
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). Only needed when a consumer has activated multiple integrations for a Unified API
    # + xApideckUnifiedApi - Specify which unified API to use for the connection lookup. Required for multi-API connectors (e.g., Workday) to ensure the correct credentials are used
    # + xApideckDownstreamUrl - Downstream URL
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection
    # + xApideckTimeout - Override the default downstream request timeout in milliseconds. The default is 28000 (28 seconds)
    # + xApideckFollowRedirects - Set to `false` to opt out of the redirect to the presigned download URL. Instead of a `30x` response, you receive a `200` JSON body `{ url, expires_at }` containing the URL and its expiry, which you can fetch explicitly. Use this if your client automatically forwards the `Authorization` header onto redirects, since the downstream storage provider will reject that request. Any value other than `false` (or omitting the header) preserves the default redirect behavior
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT 
    # + return - returns can be any of following types 
    # http:Ok (Ok. When the request includes `x-apideck-follow-redirects: false` and the downstream response would otherwise redirect to a presigned URL (oversized responses), the body is instead an `application/json` object `{ url, expires_at }` — fetch `url` explicitly (without the Authorization header) to retrieve the payload)
    # http:Unauthorized (Unauthorized)
    # http:DefaultStatusCodeResponse (Proxy error)
    resource function patch .(@http:Header {name: "x-apideck-consumer-id"} string xApideckConsumerId, @http:Header {name: "x-apideck-app-id"} string xApideckAppId, @http:Header {name: "x-apideck-service-id"} string xApideckServiceId, @http:Header {name: "x-apideck-unified-api"} string? xApideckUnifiedApi, @http:Header {name: "x-apideck-downstream-url"} string xApideckDownstreamUrl, @http:Header {name: "x-apideck-downstream-authorization"} string? xApideckDownstreamAuthorization, @http:Payload ProxyRequestBody payload, @http:Header {name: "x-apideck-timeout"} int? xApideckTimeout = 28000, @http:Header {name: "x-apideck-follow-redirects"} boolean? xApideckFollowRedirects = true) returns anydata {
        return {status_code: 200, status: "OK", data: {id: "9f3c2a10", name: "Bluth Company", updated: true}};
    }

    # Proxy a downstream POST request
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from
    # + xApideckAppId - The ID of your Unify application
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). Only needed when a consumer has activated multiple integrations for a Unified API
    # + xApideckUnifiedApi - Specify which unified API to use for the connection lookup. Required for multi-API connectors (e.g., Workday) to ensure the correct credentials are used
    # + xApideckDownstreamUrl - Downstream URL
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection
    # + xApideckTimeout - Override the default downstream request timeout in milliseconds. The default is 28000 (28 seconds)
    # + xApideckFollowRedirects - Set to `false` to opt out of the redirect to the presigned download URL. Instead of a `30x` response, you receive a `200` JSON body `{ url, expires_at }` containing the URL and its expiry, which you can fetch explicitly. Use this if your client automatically forwards the `Authorization` header onto redirects, since the downstream storage provider will reject that request. Any value other than `false` (or omitting the header) preserves the default redirect behavior
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT 
    # + return - returns can be any of following types 
    # http:Ok (Ok. When the request includes `x-apideck-follow-redirects: false` and the downstream response would otherwise redirect to a presigned URL (oversized responses), the body is instead an `application/json` object `{ url, expires_at }` — fetch `url` explicitly (without the Authorization header) to retrieve the payload)
    # http:Unauthorized (Unauthorized)
    # http:DefaultStatusCodeResponse (Proxy error)
    resource function post .(@http:Header {name: "x-apideck-consumer-id"} string xApideckConsumerId, @http:Header {name: "x-apideck-app-id"} string xApideckAppId, @http:Header {name: "x-apideck-service-id"} string xApideckServiceId, @http:Header {name: "x-apideck-unified-api"} string? xApideckUnifiedApi, @http:Header {name: "x-apideck-downstream-url"} string xApideckDownstreamUrl, @http:Header {name: "x-apideck-downstream-authorization"} string? xApideckDownstreamAuthorization, @http:Payload ProxyRequestBody payload, @http:Header {name: "x-apideck-timeout"} int? xApideckTimeout = 28000, @http:Header {name: "x-apideck-follow-redirects"} boolean? xApideckFollowRedirects = true) returns anydata {
        return {status_code: 201, status: "Created", data: {id: "9f3c2a10", name: "Bluth Company", url: "http://thebluthcompany.tumblr.com/"}};
    }

    # Proxy a downstream PUT request
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from
    # + xApideckAppId - The ID of your Unify application
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). Only needed when a consumer has activated multiple integrations for a Unified API
    # + xApideckUnifiedApi - Specify which unified API to use for the connection lookup. Required for multi-API connectors (e.g., Workday) to ensure the correct credentials are used
    # + xApideckDownstreamUrl - Downstream URL
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection
    # + xApideckTimeout - Override the default downstream request timeout in milliseconds. The default is 28000 (28 seconds)
    # + xApideckFollowRedirects - Set to `false` to opt out of the redirect to the presigned download URL. Instead of a `30x` response, you receive a `200` JSON body `{ url, expires_at }` containing the URL and its expiry, which you can fetch explicitly. Use this if your client automatically forwards the `Authorization` header onto redirects, since the downstream storage provider will reject that request. Any value other than `false` (or omitting the header) preserves the default redirect behavior
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT 
    # + return - returns can be any of following types 
    # http:Ok (Ok. When the request includes `x-apideck-follow-redirects: false` and the downstream response would otherwise redirect to a presigned URL (oversized responses), the body is instead an `application/json` object `{ url, expires_at }` — fetch `url` explicitly (without the Authorization header) to retrieve the payload)
    # http:Unauthorized (Unauthorized)
    # http:DefaultStatusCodeResponse (Proxy error)
    resource function put .(@http:Header {name: "x-apideck-consumer-id"} string xApideckConsumerId, @http:Header {name: "x-apideck-app-id"} string xApideckAppId, @http:Header {name: "x-apideck-service-id"} string xApideckServiceId, @http:Header {name: "x-apideck-unified-api"} string? xApideckUnifiedApi, @http:Header {name: "x-apideck-downstream-url"} string xApideckDownstreamUrl, @http:Header {name: "x-apideck-downstream-authorization"} string? xApideckDownstreamAuthorization, @http:Payload ProxyRequestBody payload, @http:Header {name: "x-apideck-timeout"} int? xApideckTimeout = 28000, @http:Header {name: "x-apideck-follow-redirects"} boolean? xApideckFollowRedirects = true) returns anydata {
        return {status_code: 200, status: "OK", data: {id: "9f3c2a10", name: "Rich Company", updated: true}};
    }
}
