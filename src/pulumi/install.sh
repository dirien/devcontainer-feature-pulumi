#!/bin/sh
set -e

VERSION="${VERSION:-"latest"}"

# Install Pulumi
if [ "$VERSION" = "latest" ]; then
    su - "$_REMOTE_USER" -c "curl -fsSL https://get.pulumi.com | sh"
else
    su - "$_REMOTE_USER" -c "curl -fsSL https://get.pulumi.com | sh -s -- --version ${VERSION}"
fi

# Add Pulumi to PATH in shell rc files
PULUMI_PATH_LINE='export PATH="$HOME/.pulumi/bin:$PATH"'

BASHRC_PATH="/home/${_REMOTE_USER}/.bashrc"
echo "$PULUMI_PATH_LINE" >> "$BASHRC_PATH"

ZSHRC_PATH="/home/${_REMOTE_USER}/.zshrc"
echo "$PULUMI_PATH_LINE" >> "$ZSHRC_PATH"

echo "Pulumi CLI installed successfully."
su - "$_REMOTE_USER" -c 'export PATH="$HOME/.pulumi/bin:$PATH" && pulumi version' || true
