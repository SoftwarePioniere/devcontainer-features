#!/bin/sh
set -e

has_command() {
    command -v "$1" > /dev/null 2>&1
}


echo "==> Installing Scaleway CLI"

curl -fsSL https://raw.githubusercontent.com/scaleway/scaleway-cli/master/scripts/get.sh | sh \
    || echo "WARNING: could not install the Scaleway CLI - install it manually if needed."


echo
echo "==> Scaleway CLI version:"
scw version 2>/dev/null || echo "scw: not found"
