#!/bin/bash

set -e

echo "🔧 Welcome! We're setting up the t3rn Executor via Docker Compose."

echo "📦 Cloning Executor release repository..."
git clone https://github.com/t3rn/executor-release || {
  echo "⚠️ Repo already exists or failed to clone. Continuing..."
}
cd executor-release || {
  echo "❌ Failed to enter executor-release directory."
  exit 1
}

echo ""
echo "⚠️ The Executor requires a PRIVATE_KEY in the .envrc file."
echo "You can either:"
echo "  [1] Edit it yourself later (recommended if you're unsure)."
echo "  [2] Let this script update it for you now."

read -p "Do you want to update the PRIVATE_KEY in .envrc now? (y/n): " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
  read -s -p "🔑 Enter your PRIVATE_KEY (starts with 0x): " PRIVATE_KEY
  echo ""

  if [[ "$PRIVATE_KEY" =~ ^0x[a-fA-F0-9]{64}$ ]]; then
    if grep -q '^export PRIVATE_KEY=' .envrc; then
      sed -i.bak "s|^export PRIVATE_KEY=.*|export PRIVATE_KEY=\"$PRIVATE_KEY\"|" .envrc
    else
      echo "export PRIVATE_KEY=\"$PRIVATE_KEY\"" >> .envrc
    fi
    echo "✅ PRIVATE_KEY updated in .envrc"
  else
    echo "❌ Invalid PRIVATE_KEY format. Aborting key replacement."
    exit 1
  fi
else
  echo "📝 Skipping PRIVATE_KEY update. Please edit .envrc manually before starting."
fi

echo ""
echo "🚀 Starting Docker Compose..."
docker compose up

