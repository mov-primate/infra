#!/usr/bin/env bash
# MovPrimate — Verificación de salud de servicios
set -e

declare -A SERVICES=(
  ["BFF"]="http://localhost:3000/health"
  ["API"]="http://localhost:3003/health"
  ["ms-alumnos"]="http://localhost:3001/health"
  ["ms-agenda"]="http://localhost:3002/health"
  ["ms-notificaciones"]="http://localhost:3004/health"
)

echo "🏥 Verificando salud de servicios MovPrimate..."
echo ""

ALL_OK=true
for name in "${!SERVICES[@]}"; do
  url="${SERVICES[$name]}"
  if curl -sf "$url" > /dev/null 2>&1; then
    echo "  ✅ $name — OK ($url)"
  else
    echo "  ❌ $name — NO RESPONDE ($url)"
    ALL_OK=false
  fi
done

echo ""
if $ALL_OK; then
  echo "✅ Todos los servicios están activos."
else
  echo "⚠️  Algunos servicios no responden. Revisa: docker compose logs"
  exit 1
fi
