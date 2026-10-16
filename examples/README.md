# Examples

The `ballerinax/apideck.proxy` connector provides practical examples illustrating usage in various scenarios.

1. **[CRM company onboarding](https://github.com/ballerina-platform/module-ballerinax-apideck.proxy/tree/main/examples/crm_company_onboarding)** - Read the companies a downstream CRM holds and onboard a new one through the proxy.

2. **[CRM company cleanup](https://github.com/ballerina-platform/module-ballerinax-apideck.proxy/tree/main/examples/crm_company_cleanup)** - Check the methods a company endpoint supports, rename a company and optionally delete it.

## Prerequisites

1. Generate Apideck credentials to authenticate the connector as described in the [Setup guide](https://central.ballerina.io/ballerinax/apideck.proxy/latest#setup-guide).

2. For each example, create a `Config.toml` file with the related configuration. Here's an example of how your Config.toml file should look:

```toml
apiKey = "<API key>"
appId = "<Application ID>"
consumerId = "<Consumer ID>"
serviceId = "<Service ID>"
```

Each example lists the additional values it needs in its own README.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
