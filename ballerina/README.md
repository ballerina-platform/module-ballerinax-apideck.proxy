## Overview

[Apideck](https://www.apideck.com/) provides Unify, a platform of unified APIs that lets applications integrate with many third-party SaaS services through one interface. The Proxy API is the pass-through part of Unify: it forwards a request to a downstream service and injects the credentials stored for that consumer in Apideck Vault, so you get an extra security layer and request logging without relying on Unify's data normalization.

This connector supports version 10.62.0 of the Apideck Proxy API. It lets Ballerina applications send GET, POST, PUT, PATCH, DELETE and OPTIONS requests to any downstream URL through Apideck, with the downstream URL, consumer and service passed as request headers.

### Key features

- Forward GET, POST, PUT, PATCH, DELETE and OPTIONS requests to any downstream service
- Reuse the credentials stored in Apideck Vault instead of handling downstream tokens yourself
- Send JSON objects, plain strings or arrays of JSON objects as the forwarded request body
- Override the downstream authorization, timeout and redirect behavior per request
- Authenticate once with an Apideck API key and application ID

## Setup guide

To use the Apideck Proxy connector, you need an Apideck account with a Unify application and at least one consumer connected to a downstream service in Vault.

### Step 1: Create an Apideck account and application

1. Sign up or log in at [Apideck](https://app.apideck.com/).
2. Open **Unify** and create an application, or pick an existing one.

### Step 2: Get the API key and application ID

1. In your application's **Configuration** settings, copy the **API key**. Keep it secret and never use it in client-side code.
2. On the same page, copy the **Application ID**.

### Step 3: Connect a consumer to a downstream service

1. Open **Vault** and create a consumer, noting its **consumer ID**.
2. Activate the downstream service you want to call (for example Pipedrive) for that consumer and complete its authorization.
3. Note the **service ID** of the connection. It is only needed when the consumer has activated more than one integration.

## Quickstart

To use the Apideck Proxy connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

Import the `apideck.proxy` module.

```ballerina
import ballerina/http;
import ballerinax/apideck.proxy;
```

### Step 2: Instantiate a new connector

1. Create a `Config.toml` file and configure the credentials obtained in the steps above:

```toml
apiKey = "<API key>"
appId = "<Application ID>"
consumerId = "<Consumer ID>"
serviceId = "<Service ID>"
downstreamUrl = "<Downstream URL>"
```

2. Create a `proxy:ApiKeysConfig` with the API key and application ID, and initialize the connector with it.

```ballerina
configurable string apiKey = ?;
configurable string appId = ?;
configurable string consumerId = ?;
configurable string serviceId = ?;
configurable string downstreamUrl = ?;

final proxy:Client apideck = check new ({
    authorization: apiKey,
    xApideckAppId: appId
});
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

#### Forward a GET request to a downstream service

```ballerina
public function main() returns error? {
    http:Response _ = check apideck->proxyGet({
        "x-apideck-consumer-id": consumerId,
        "x-apideck-service-id": serviceId,
        "x-apideck-downstream-url": downstreamUrl
    });
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `Apideck Proxy` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-apideck.proxy/tree/main/examples/), covering the following use cases:

1. [Crm company onboarding](../examples/crm_company_onboarding/crm_company_onboarding.md) - Read the companies a downstream CRM holds and onboard a new one through the proxy.
2. [Crm company cleanup](../examples/crm_company_cleanup/crm_company_cleanup.md) - Check the methods a company endpoint supports, rename a company and optionally delete it.
