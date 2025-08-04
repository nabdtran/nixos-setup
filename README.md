#!/bin/sh

# Ensure we're running as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root (e.g., sudo $0)"
  exit 1
fi

# Set up temp dirs
TMP_DIR="/tmp/nixos-setup"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

echo ">> Removing existing /etc/nixos configuration..."
rm -rf /etc/nixos/*
mkdir -p /etc/nixos

echo ">> Cloning NixOS config..."
git clone --depth 1 https://github.com/nabdtran/nixos-config.git

echo ">> Copying new NixOS configuration to /etc/nixos..."
cp -r nixos-config/* /etc/nixos/

echo ">> Adjusting ownership and permissions..."
chown -R root:root /etc/nixos

echo ">> Cloning dotfiles..."
git clone --depth 1 https://github.com/nabdtran/dotfiles.git

echo ">> Copying dotfiles to ~/.config..."
# Use the original user's home (from $SUDO_USER)
USER_HOME=$(eval echo ~${SUDO_USER:-$USER})
CONFIG_DIR="$USER_HOME/.config"

mkdir -p "$CONFIG_DIR"

# Copy contents, create folders if missing
cd dotfiles || exit 1
for item in *; do
  [ -e "$item" ] || continue
  mkdir -p "$CONFIG_DIR/$item"
  cp -r "$item"/* "$CONFIG_DIR/$item/"
done

echo ">> Fixing ownership for dotfiles..."
chown -R "$SUDO_USER:$SUDO_USER" "$CONFIG_DIR"

echo ">> Cleaning up..."
rm -rf "$TMP_DIR"

echo "✅ NixOS setup complete!"
