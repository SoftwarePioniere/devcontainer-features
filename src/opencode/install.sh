#!/bin/sh
set -e

if ! command -v curl >/dev/null 2>&1; then
  echo "==> Installing curl"
  apt-get update
  apt-get install -y --no-install-recommends curl ca-certificates
  rm -rf /var/lib/apt/lists/*
fi

if [ ! -x "$HOME/.opencode/bin/opencode" ]; then
  echo "==> Installing OpenCode CLI"
  su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/v2/install | bash"
fi