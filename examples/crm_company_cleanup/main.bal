// Checks what a downstream CRM company endpoint allows, renames a company, and optionally deletes it through the Apideck proxy.

import ballerina/http;
import ballerina/io;
import ballerinax/apideck.proxy;

configurable string apiKey = ?;
configurable string appId = ?;
configurable string consumerId = ?;
configurable string serviceId = ?;
configurable string companyUrl = ?;
configurable string newCompanyName = ?;
configurable boolean deleteCompany = false;

public function main() returns error? {
    proxy:Client apideck = check new ({authorization: apiKey, xApideckAppId: appId});

    map<string|string[]> headers = {
        "x-apideck-consumer-id": consumerId,
        "x-apideck-service-id": serviceId,
        "x-apideck-downstream-url": companyUrl
    };

    // Step 1: Discover which methods the downstream company endpoint supports.
    http:Response options = check apideck->proxyOptions(headers);
    io:println("Supported methods response status: ", options.statusCode);

    // Step 2: Rename the company.
    proxy:ProxyRequestBody update = {"name": newCompanyName};
    http:Response updated = check apideck->proxyPatch(update, headers);
    io:println("Updated company response status: ", updated.statusCode);

    if !deleteCompany {
        io:println("deleteCompany is false, keeping the company.");
        return;
    }

    // Step 3: Remove the company.
    http:Response deleted = check apideck->proxyDelete(headers);
    io:println("Deleted company response status: ", deleted.statusCode);
}
