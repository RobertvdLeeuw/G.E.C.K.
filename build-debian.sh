#!/usr/bin/env bash

set -e

WORK_DIR="debian-custom"
ISO_OUTPUT="ISOs/debian-custom.iso"

echo "==> Installing build dependencies..."
apt-get update >/dev/null 2>&1
apt-get install -y live-build xorriso isolinux syslinux-utils >/dev/null 2>&1

echo "==> Setting up build environment..."
rm -rf "$WORK_DIR" >/dev/null 2>&1
mkdir -p "$WORK_DIR" >/dev/null 2>&1
cd "$WORK_DIR"

echo "==> Configuring live-build..."
lb config \
  --architectures amd64 \
  --debian-installer live \
  --archive-areas "main contrib non-free non-free-firmware" \
  --bootappend-live "boot=live components quiet splash" \
  --iso-application "Custom Debian" \
  --iso-volume "DEBIAN_CUSTOM" >/dev/null 2>&1

echo "==> Adding packages to install..."
mkdir -p config/package-lists
cat >config/package-lists/custom.list.chroot <<'EOF'
smartmontools
neovim
curl
wget
git
htop
tmux
EOF

echo "==> Building ISO..."
lb build # >/dev/null 2>&1

echo "==> Moving ISO to output directory..."
cd ..
mkdir -p ISOs >/dev/null 2>&1
mv "$WORK_DIR"/live-image-amd64.hybrid.iso "$ISO_OUTPUT" >/dev/null 2>&1
chown $USER:$USER "$ISO_OUTPUT" >/dev/null 2>&1

echo "==> Cleaning up..."
lb clean --purge >/dev/null 2>&1

echo "==> Done! ISO created at: $ISO_OUTPUT"
ls -lh "$ISO_OUTPUT"
