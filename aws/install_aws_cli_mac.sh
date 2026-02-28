#!/usr/bin/env bash
#
# install_aws_cli_mac.sh — Install AWS CLI v2 on macOS and configure credentials
#
# Usage:
#   chmod +x install_aws_cli_mac.sh
#   ./install_aws_cli_mac.sh
#

set -euo pipefail

# ── Guard: macOS only ──────────────────────────────────────────────
if [[ "$(uname)" != "Darwin" ]]; then
  echo "ERROR: This script is intended for macOS only." >&2
  exit 1
fi

# ── Install AWS CLI v2 ─────────────────────────────────────────────
if command -v aws &>/dev/null; then
  echo "AWS CLI is already installed: $(aws --version)"
else
  echo "Installing AWS CLI v2 for macOS..."
  curl -fSL "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o /tmp/AWSCLIV2.pkg
  sudo installer -pkg /tmp/AWSCLIV2.pkg -target /
  rm -f /tmp/AWSCLIV2.pkg
  echo "AWS CLI installed: $(aws --version)"
fi

# ── Configure credentials ─────────────────────────────────────────
echo ""
echo "============================================================"
echo "  AWS Credentials Setup"
echo "============================================================"
echo ""
echo "You need an Access Key ID and Secret Access Key."
echo ""
echo "To create them:"
echo "  1. Sign in to the AWS Console: https://console.aws.amazon.com/"
echo "  2. Click your username (top-right) → Security credentials"
echo "     (or go to IAM → Users → <your user> → Security credentials)"
echo "  3. Under 'Access keys', click 'Create access key'"
echo "  4. Copy the Access Key ID and Secret Access Key shown"
echo ""
echo "IMPORTANT: The Secret Access Key is only shown once at creation time."
echo "           Save it somewhere secure (e.g. a password manager)."
echo ""
echo "============================================================"
echo ""

read -rp "Do you want to configure credentials now? [y/N]: " configure
if [[ "$configure" == "y" || "$configure" == "Y" ]]; then
  aws configure
  echo ""
  echo "Credentials saved to ~/.aws/credentials"
  echo "Config saved to ~/.aws/config"
  echo ""
  echo "Verify with:  aws sts get-caller-identity"
else
  echo ""
  echo "Skipped. You can configure later by running:  aws configure"
fi
