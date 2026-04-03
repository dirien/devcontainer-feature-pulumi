# devcontainer-feature-pulumi

A Dev Container feature to install the [Pulumi CLI](https://www.pulumi.com/) — an infrastructure as code tool for building, deploying, and managing cloud infrastructure.

## Usage

Add the following to your `devcontainer.json`:

```json
{
    "features": {
        "ghcr.io/dirien/devcontainer-feature-pulumi/pulumi:0": {}
    }
}
```

## Options

| Option    | Type   | Default    | Description                                                                 |
|-----------|--------|------------|-----------------------------------------------------------------------------|
| `version` | string | `"latest"` | Version of Pulumi to install (e.g., `3.228.0`). Set to `latest` for the latest release. |

### Pin to a specific version

```json
{
    "features": {
        "ghcr.io/dirien/devcontainer-feature-pulumi/pulumi:0": {
            "version": "3.228.0"
        }
    }
}
```

## Authentication

Set the `PULUMI_ACCESS_TOKEN` environment variable to authenticate with Pulumi Cloud:

```json
{
    "remoteEnv": {
        "PULUMI_ACCESS_TOKEN": "${localEnv:PULUMI_ACCESS_TOKEN}"
    }
}
```

Alternatively, run `pulumi login` inside the container.
