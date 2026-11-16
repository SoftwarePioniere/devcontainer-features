#!/bin/sh
# set -e
set -x

# ============= DEBUG ====================================

echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"


# ============= opencode-config ====================================
# mounting in .devcontainer makes owner root. change here

# if folder comes from mount
# if [ -d "/etc/opencode" ]; then
#   # mounting in .devcontainer makes owner root. change here
#   echo "/etc/opencode folder found" >&2
#   echo "change own to remote user $_REMOTE_USER" >&2
  
#   sudo chown "$_REMOTE_USER:$_REMOTE_USER" "/etc/opencode"
# fi

# # if folder comes from mount
# if [ -d "$_REMOTE_USER_HOME/.config/opencode" ]; then
#   # mounting in .devcontainer makes owner root. change here
#   echo "OpenCode config folder found: $_REMOTE_USER_HOME/.config/opencode" >&2
#   echo "change own to remote user" >&2
  
#   sudo chown "$_REMOTE_USER:$_REMOTE_USER" "$_REMOTE_USER_HOME/.config/opencode"
# else
#   echo "OpenCode config folder not found: $_REMOTE_USER_HOME/.config/opencode" >&2

#   mkdir -p "$_REMOTE_USER_HOME/.config/opencode"
#   sudo chown "$_REMOTE_USER:$_REMOTE_USER" "$_REMOTE_USER_HOME/.config/opencode"
# fi

# sudo ls -al "$_REMOTE_USER_HOME/.config"


# # if folder comes from mount
# if [ -d "$_REMOTE_USER_HOME/.ai-secrets" ]; then
#   # mounting in .devcontainer makes owner root. change here
#   echo ".ai-secrets folder found: $_REMOTE_USER_HOME/.ai-secrets" >&2
#   echo "change own to remote user $_REMOTE_USER" >&2
  
#   sudo chown "$_REMOTE_USER:$_REMOTE_USER" "$_REMOTE_USER_HOME/.ai-secrets"
# fi

# ============= opencode ====================================

if [ ! -x "$HOME/.opencode/bin/opencode" ]; then
  echo "==> Installing OpenCode CLI"
  su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/v2/install | bash"

fi

