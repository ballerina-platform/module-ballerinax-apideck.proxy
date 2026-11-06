# CRM company onboarding

This example reads the companies a downstream CRM currently holds through the Apideck Proxy API and then, when `createCompany` is `true`, onboards a new company by forwarding a POST request. It shows how the downstream URL, consumer and service are passed as headers.

## Prerequisites

### 1. Set up Apideck

Follow the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-apideck.proxy/blob/main/ballerina/README.md#setup-guide) to obtain an API key, an application ID, a consumer ID and a service ID for a connected CRM.

### 2. Configuration

Create a `Config.toml` file in this example's directory with the following content:

```toml
apiKey = "<API key>"
appId = "<Application ID>"
consumerId = "<Consumer ID>"
serviceId = "<Service ID, e.g. pipedrive>"
companiesUrl = "<Downstream URL of the CRM companies endpoint>"
companyName = "<Name of the company to create>"
companyWebsite = "<Website of the company to create>"
createCompany = false
```

Set `createCompany` to `true` to create the company in the downstream CRM.

## Run the example

Execute the following command to run the example:

```bash
bal run
```
