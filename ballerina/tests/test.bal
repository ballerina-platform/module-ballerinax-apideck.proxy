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
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://unify.apideck.com" : "http://localhost:9090";
final string apiKey = isLiveServer ? os:getEnv("APIDECK_API_KEY") : "test_api_key";
final string appId = isLiveServer ? os:getEnv("APIDECK_APP_ID") : "test_app_id";
final string consumerId = isLiveServer ? os:getEnv("APIDECK_CONSUMER_ID") : "test_consumer";
final string downstreamUrl = isLiveServer ? os:getEnv("APIDECK_DOWNSTREAM_URL") : "https://api.example-crm.test/companies";

final map<string|string[]> proxyHeaders = {
    "x-apideck-service-id": "pipedrive",
    "x-apideck-consumer-id": consumerId,
    "x-apideck-downstream-url": downstreamUrl
};

final Client apideck = check new ({authorization: apiKey, xApideckAppId: appId}, {httpVersion: http:HTTP_1_1}, serviceUrl);

@test:Config {groups: ["live_tests", "mock_tests"]}
function testProxyGet() returns error? {
    http:Response response = check apideck->proxyGet(proxyHeaders);
    test:assertEquals(response.statusCode, 200);
    json body = check response.getJsonPayload();
    test:assertTrue(body is map<json>);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testProxyOptions() returns error? {
    http:Response response = check apideck->proxyOptions(proxyHeaders);
    test:assertEquals(response.statusCode, 200);
    json body = check response.getJsonPayload();
    test:assertTrue(body is map<json>);
}

@test:Config {groups: ["mock_tests"]}
function testProxyPost() returns error? {
    ProxyRequestBody payload = {"name": "Bluth Company", "url": "http://thebluthcompany.tumblr.com/"};
    http:Response response = check apideck->proxyPost(payload, proxyHeaders);
    test:assertEquals(response.statusCode, 201);
    json body = check response.getJsonPayload();
    test:assertTrue(body is map<json>);
}

@test:Config {groups: ["mock_tests"]}
function testProxyPut() returns error? {
    ProxyRequestBody payload = {"name": "Rich Company"};
    http:Response response = check apideck->proxyPut(payload, proxyHeaders);
    test:assertEquals(response.statusCode, 200);
    json body = check response.getJsonPayload();
    test:assertTrue(body is map<json>);
}

@test:Config {groups: ["mock_tests"]}
function testProxyPatch() returns error? {
    ProxyRequestBody payload = {"name": "Bluth Company"};
    http:Response response = check apideck->proxyPatch(payload, proxyHeaders);
    test:assertEquals(response.statusCode, 200);
    json body = check response.getJsonPayload();
    test:assertTrue(body is map<json>);
}

@test:Config {groups: ["mock_tests"]}
function testProxyDelete() returns error? {
    http:Response response = check apideck->proxyDelete(proxyHeaders);
    test:assertEquals(response.statusCode, 200);
    json body = check response.getJsonPayload();
    test:assertTrue(body is map<json>);
}
