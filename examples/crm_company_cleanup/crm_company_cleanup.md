# CRM company cleanup

This example checks which methods a downstream CRM company endpoint supports, renames the company with a forwarded PATCH request and, when `deleteCompany` is `true`, deletes it with a forwarded DELETE request.

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
companyUrl = "<Downstream URL of one company in the CRM>"
newCompanyName = "<New name for the company>"
deleteCompany = false
```

Set `deleteCompany` to `true` to delete the company after renaming it.

## Run the example

Execute the following command to run the example:

```bash
bal run
```
