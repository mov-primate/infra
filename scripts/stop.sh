#!/usr/bin/env bash
# MovPrimate — Script de parada local
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "🛑 Deteniendo MovPrimate..."
cd "$ROOT_DIR"
docker compose down
echo "✅ Servicios detenidos."
