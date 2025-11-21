#!/bin/bash

# Script para verificar que todo está listo para publicación
# Uso: ./scripts/pre-publish-check.sh

set -e

echo "🔍 Verificando preparación para publicación..."
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para verificar
check() {
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ $1${NC}"
  else
    echo -e "${RED}❌ $1${NC}"
    exit 1
  fi
}

# 1. Verificar que estamos en el directorio correcto
cd "$(dirname "$0")/.."
check "Directorio raíz encontrado"

# 2. Verificar que existe el package.json del bundle
if [ -f "packages/bundle/package.json" ]; then
  check "package.json del bundle existe"
else
  echo -e "${RED}❌ package.json del bundle no encontrado${NC}"
  exit 1
fi

# 3. Verificar que el bundle NO es privado
PRIVATE=$(grep '"private": false' packages/bundle/package.json)
if [ -n "$PRIVATE" ]; then
  check "Bundle configurado como público"
else
  echo -e "${RED}❌ Bundle está marcado como privado${NC}"
  exit 1
fi

# 4. Verificar versión
VERSION=$(grep '"version"' packages/bundle/package.json | head -1 | sed 's/.*"version": "\(.*\)".*/\1/')
echo -e "${GREEN}📦 Versión actual: ${VERSION}${NC}"

# 5. Verificar que existe el dist/
if [ -d "packages/bundle/dist" ]; then
  FILE_COUNT=$(find packages/bundle/dist -name "*.min.css" -o -name "*.min.js" | wc -l)
  if [ "$FILE_COUNT" -gt 0 ]; then
    check "Archivos compilados encontrados ($FILE_COUNT archivos)"
  else
    echo -e "${YELLOW}⚠️  No hay archivos compilados. Ejecuta: pnpm run build${NC}"
  fi
else
  echo -e "${YELLOW}⚠️  Directorio dist/ no existe. Ejecuta: pnpm run build${NC}"
fi

# 6. Verificar que existe README.md
if [ -f "packages/bundle/README.md" ]; then
  check "README.md existe"
else
  echo -e "${YELLOW}⚠️  README.md no encontrado${NC}"
fi

# 7. Verificar que existe LICENSE
if [ -f "packages/bundle/LICENSE" ]; then
  check "LICENSE existe"
else
  echo -e "${YELLOW}⚠️  LICENSE no encontrado${NC}"
fi

# 8. Verificar autenticación NPM
echo ""
echo "🔐 Verificando autenticación en NPM..."
if npm whoami &> /dev/null; then
  NPM_USER=$(npm whoami)
  check "Autenticado en NPM como: ${NPM_USER}"
else
  echo -e "${RED}❌ No estás autenticado en NPM${NC}"
  echo -e "${YELLOW}   Ejecuta: npm login${NC}"
  exit 1
fi

# 9. Mostrar tamaños de archivos
echo ""
echo "📊 Tamaños de archivos:"
if [ -d "packages/bundle/dist" ]; then
  echo ""
  du -sh packages/bundle/dist/*.min.css 2>/dev/null | sort -h || echo "  No hay archivos CSS"
  echo ""
  du -sh packages/bundle/dist/*.min.js 2>/dev/null | sort -h || echo "  No hay archivos JS"
fi

# 10. Resumen final
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✅ Todo listo para publicación!${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📦 Paquete: @seguros-bolivar-ui/bundle"
echo "🏷️  Versión: ${VERSION}"
echo "👤 Usuario NPM: ${NPM_USER}"
echo ""
echo "🚀 Para publicar, ejecuta:"
echo ""
echo "   cd packages/bundle"
echo "   npm publish --dry-run    # Primero simula"
echo "   npm publish --access public  # Luego publica"
echo ""
echo "📖 Guía completa: PUBLISHING_GUIDE.md"
echo ""

