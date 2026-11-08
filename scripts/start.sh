#!/usr/bin/env bash
# MovPrimate — Script de arranque local
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "🏋️  MovPrimate — Arranque local"
echo "================================"

# Copiar .env si no existe
if [ ! -f "$ROOT_DIR/.env" ]; then
  echo "⚠️  No se encontró .env — copiando desde .env.example..."
  cp "$ROOT_DIR/.env.example" "$ROOT_DIR/.env"
  echo "✅ .env creado. Edítalo con tus valores antes de continuar."
  exit 1
fi

cd "$ROOT_DIR"

echo "🐳 Levantando servicios con Docker Compose..."
docker compose up -d

echo ""
echo "⏳ Esperando que los servicios estén listos..."
sleep 10

echo ""
echo "📋 Estado de servicios:"
docker compose ps

echo ""
echo "🔗 URLs del ecosistema:"
echo "  App Angular:      http://localhost:4200"
echo "  BFF:              http://localhost:3000"
echo "  API:              http://localhost:3003"
echo "  ms-alumnos:       http://localhost:3001"
echo "  ms-agenda:        http://localhost:3002"
echo "  ms-notificaciones: http://localhost:3004"
echo "  Mongo Express:    http://localhost:8081"
echo ""
echo "✅ MovPrimate levantado. Logs: docker compose logs -f"
