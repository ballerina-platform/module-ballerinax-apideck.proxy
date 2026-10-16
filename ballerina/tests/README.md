# Running Tests

## Prerequisites

To run the tests against the live Apideck API you need an Apideck API key, the application ID, a consumer ID with a connected downstream service, and the URL of a downstream endpoint to read. Follow the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-apideck.proxy/blob/main/ballerina/README.md#setup-guide) to obtain them.

## Test environments

There are two test environments. The default is a mock server for the Proxy API. The other is the live Apideck API.

 Test Groups | Environment
-------------|------------------------------------------------
 mock_tests  | Mock server for the Proxy API (default)
 live_tests  | Apideck Proxy API (read-only operations only)

## Running tests against the mock server

No configuration is needed. When `IS_LIVE_SERVER` is not set to `true`, the tests run against the mock server on port `9090`.

```bash
./gradlew clean test
```

## Running tests against the live API

The live tests only call the read-only `proxyGet` and `proxyOptions` operations, so nothing is changed downstream.

1. Set the environment variables:

    ```bash
    export IS_LIVE_SERVER=true
    export APIDECK_API_KEY=<API key>
    export APIDECK_APP_ID=<Application ID>
    export APIDECK_CONSUMER_ID=<Consumer ID>
    export APIDECK_DOWNSTREAM_URL=<Downstream URL>
    ```

2. Run the live tests:

    ```bash
    ./gradlew clean test -Pgroups=live_tests
    ```
