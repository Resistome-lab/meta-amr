#!/usr/bin/env bash

set -e

# --- Configuration ---
REPO_USER="Resistome-lab"
REPO_NAME="meta-amr"
BRANCH="main"
RAW_URL="https://raw.githubusercontent.com/${REPO_USER}/${REPO_NAME}/${BRANCH}"
INSTALL_DIR="/usr/local/bin"

echo "========================================="
echo " Installing meta-amr CLI Tool"
echo "========================================="

# 1. Download executable
echo "--> Downloading binary executable from GitHub..."
curl -fsSL "${RAW_URL}/meta-amr" -o /tmp/meta-amr

# 2. Grant execution permissions
chmod +x /tmp/meta-amr

# 3. Move to system PATH
echo "--> Deploying executable to ${INSTALL_DIR}/meta-amr..."
if [ -w "${INSTALL_DIR}" ]; then
    mv /tmp/meta-amr "${INSTALL_DIR}/meta-amr"
else
    sudo mv /tmp/meta-amr "${INSTALL_DIR}/meta-amr"
fi

echo "========================================="
echo " SUCCESS: meta-amr installed successfully!"
echo " Test installation by typing: meta-amr -h"
echo "========================================="
