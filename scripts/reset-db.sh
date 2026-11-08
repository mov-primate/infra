#!/usr/bin/env bash
# MovPrimate — Reset de base de datos local (⚠️ destructivo)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "⚠️  ADVERTENCIA: Esto eliminará todos los datos locales de MongoDB."
read -r -p "¿Confirmar reset? (escribe 'yes' para continuar): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
  echo "Operación cancelada."
  exit 0
fi

cd "$ROOT_DIR"
echo "🗑️  Eliminando volumen mongo_data..."
docker compose down -v
echo "🐳 Reiniciando con base de datos limpia..."
docker compose up -d mongo mongo-express
echo "✅ Base de datos reiniciada."
