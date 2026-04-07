#!/bin/bash
set -e

KIRO_DIR="$HOME/.kiro"

mkdir -p "$KIRO_DIR/agents" "$KIRO_DIR/skills"
cp -r .kiro/skills/superpowers "$KIRO_DIR/skills/"
cp .kiro/agents/superpowers.json "$KIRO_DIR/agents/"

echo "✅ Superpowers installed to $KIRO_DIR"
echo "   Restart kiro-cli and press Ctrl+Shift+S to activate."
