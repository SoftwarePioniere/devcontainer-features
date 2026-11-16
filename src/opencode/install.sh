#!/bin/sh
set -e

mkdir -p "$HOME/.config/opencode"

if [ ! -x "$HOME/.opencode/bin/opencode" ]; then
  echo "==> Installing OpenCode CLI"
  su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/v2/install | bash"

fi

# mounting in .devcontainer makes owner root. change here
# sudo chown $_REMOTE_USER:$_REMOTE_USER "$_REMOTE_USER_HOME/.config/opencode"