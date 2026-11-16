#!/bin/bash

# This test is executed against an auto-generated devcontainer.json that
# includes the opencode Feature with its default options.
#
# Run it with:
#   devcontainer features test \
#     --features opencode \
#     --skip-scenarios \
#     --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#     .

set -e

source dev-container-features-test-lib

check "opencode binary is installed" bash -c 'test -x "$HOME/.opencode/bin/opencode"'
check "opencode version runs" bash -c '"$HOME/.opencode/bin/opencode" --version'

reportResults
