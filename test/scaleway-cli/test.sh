#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'scaleway-cli' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "scaleway-cli": {}
#    },
#    "remoteUser": "root"
# }
#
# The 'scaleway-cli' Feature installs the Scaleway CLI ('scw') via the upstream
# install script. If the download fails, install.sh only warns, so these checks
# guard against a silent no-op.
#
# This test can be run with the following command:
#
#    devcontainer features test       \
#                   --features scaleway-cli \
#                   --remote-user root \
#                   --skip-scenarios   \
#                   --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#                   /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "scw is on the PATH" bash -c "command -v scw"
check "scw version runs" bash -c "scw version"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
