# 🚀 Guía de Despliegue

Esta guía explica cómo desplegar la página de ejemplos y el Storybook a GitHub Pages.

---

## 📋 Tabla de Contenidos

- [Requisitos](#-requisitos)
- [Opción 1: Despliegue Automático (GitHub Actions)](#-opción-1-despliegue-automático-github-actions)
- [Opción 2: Despliegue Manual](#-opción-2-despliegue-manual)
- [Opción 3: Otros Servicios](#-opción-3-otros-servicios)
- [Verificación](#-verificación)
- [Solución de Problemas](#-solución-de-problemas)

---

## ✅ Requisitos

- Node.js >= 18.0.0
- pnpm >= 8.0.0
- Git inicializado
- Repositorio en GitHub
- Acceso push al repositorio

---

## 🤖 Opción 1: Despliegue Automático (GitHub Actions)

### Configuración Inicial (Solo una vez)

#### 1. Habilitar GitHub Pages

1. Ve a tu repositorio en GitHub
2. Click en **Settings** (Configuración)
3. En el menú lateral, click en **Pages**
4. En **Source**, selecciona:
   - Source: **GitHub Actions**
5. Click en **Save**

#### 2. Push el Workflow

El workflow ya está configurado en `.github/workflows/deploy-site.yml`. Solo necesitas hacer push:

```bash
git add .
git commit -m "feat: add GitHub Actions deployment workflow"
git push origin main
```

#### 3. ¡Listo! 🎉

Cada vez que hagas push a `main`, el sitio se desplegará automáticamente.

### URLs del Sitio

Una vez desplegado, tu sitio estará disponible en:

```
📍 Página principal:  https://TU-USUARIO.github.io/TU-REPO/
📖 Storybook:         https://TU-USUARIO.github.io/TU-REPO/storybook/
📝 Documentación:     https://TU-USUARIO.github.io/TU-REPO/getting-started.html
```

Reemplaza `TU-USUARIO` y `TU-REPO` con tu información real.

### Monitorear el Despliegue

1. Ve a tu repositorio en GitHub
2. Click en la pestaña **Actions**
3. Verás el workflow "🚀 Deploy Site & Storybook" ejecutándose
4. Click en él para ver el progreso

---

## 🖐️ Opción 2: Despliegue Manual

Si prefieres controlar manualmente cuándo desplegar:

### Método A: Script Automático

```bash
# 1. Build completo (examples + storybook)
pnpm run build:site

# 2. Deploy a GitHub Pages
pnpm run deploy

# ¡Listo! Espera 2-3 minutos para que se publique
```

### Método B: Paso a Paso

#### 1. Build del Sitio

```bash
# Build de todos los paquetes
pnpm run build

# Build del Storybook
pnpm run build:storybook

# Generar carpeta docs/ con todo
pnpm run build:site
```

Esto creará una carpeta `docs/` con:
```
docs/
├── index.html              # Página principal
├── getting-started.html    # Documentación
├── button/                 # Ejemplos de componentes
├── table/
├── ...
├── dist/                   # Assets (CSS, JS)
└── storybook/              # Storybook estático
    └── index.html
```

#### 2. Habilitar GitHub Pages (Solo primera vez)

1. Ve a tu repositorio en GitHub
2. **Settings** → **Pages**
3. En **Source**, selecciona:
   - Branch: `main`
   - Folder: `/docs`
4. Click en **Save**

#### 3. Commit y Push

```bash
git add docs/
git commit -m "docs: deploy site and storybook"
git push origin main
```

#### 4. Esperar

GitHub Pages tarda 2-5 minutos en publicar. Verás el progreso en:
- **Settings** → **Pages** (mostrará el estado)

---

## 🌐 Opción 3: Otros Servicios

### Netlify

```bash
# 1. Build
pnpm run build:site

# 2. Instalar Netlify CLI
npm install -g netlify-cli

# 3. Deploy
netlify deploy --prod --dir=docs
```

### Vercel

```bash
# 1. Build
pnpm run build:site

# 2. Instalar Vercel CLI
npm install -g vercel

# 3. Deploy
vercel --prod docs/
```

---

## ✅ Verificación

### Verificar Local (antes de desplegar)

```bash
# 1. Build el sitio
pnpm run build:site

# 2. Servir localmente
cd docs
npx serve -p 3000

# 3. Abrir en navegador
# http://localhost:3000/              - Página principal
# http://localhost:3000/storybook/    - Storybook
```

### Verificar en Producción

Después de desplegar, verifica:

1. ✅ **Página principal** carga correctamente
2. ✅ **Estilos** se ven bien (CSS cargado)
3. ✅ **Botones interactivos** funcionan
4. ✅ **Storybook** accesible en `/storybook/`
5. ✅ **Documentación** accesible en `/getting-started.html`
6. ✅ **Ejemplos de componentes** funcionan

---

## 🐛 Solución de Problemas

### ❌ "404 - Page not found"

**Problema:** El sitio no carga, muestra 404.

**Soluciones:**
1. Verifica que GitHub Pages esté habilitado (Settings → Pages)
2. Verifica que la rama y carpeta sean correctas (`main` y `/docs`)
3. Espera 5 minutos (puede tardar en propagarse)
4. Verifica que `docs/` existe en tu repositorio

### ❌ Estilos no cargan (página sin CSS)

**Problema:** La página carga pero sin estilos.

**Soluciones:**
1. Verifica que `docs/dist/` existe y tiene archivos `.min.css`
2. Ejecuta `pnpm run build` antes de `pnpm run build:site`
3. Verifica las rutas en el HTML (deben ser relativas, no absolutas)
4. Limpia caché del navegador (Ctrl+Shift+R)

### ❌ Storybook no carga

**Problema:** `/storybook/` muestra 404.

**Soluciones:**
1. Ejecuta `pnpm run build:storybook` antes de `pnpm run build:site`
2. Verifica que `docs/storybook/` existe
3. Verifica que `packages/docs/storybook-static/` se generó correctamente

### ❌ GitHub Actions falla

**Problema:** El workflow en Actions muestra error.

**Soluciones:**
1. Verifica que GitHub Pages esté habilitado con **Source: GitHub Actions**
2. Revisa los logs del workflow para ver el error específico
3. Verifica que `pnpm-lock.yaml` esté commiteado
4. Verifica que todos los scripts en `package.json` existen

### ❌ "gh-pages command not found"

**Problema:** `pnpm run deploy` falla con "command not found".

**Solución:**
```bash
pnpm add -D gh-pages
pnpm run deploy
```

---

## 🔄 Actualizar el Sitio

### Con GitHub Actions (Automático)

```bash
# Solo haz cambios y push
git add .
git commit -m "feat: update components"
git push origin main

# GitHub Actions se encargará del resto
```

### Manual

```bash
# 1. Rebuild
pnpm run build:site

# 2. Commit y push
git add docs/
git commit -m "docs: update site"
git push origin main
```

---

## 📊 Scripts Disponibles

| Script | Descripción |
|--------|-------------|
| `pnpm run build` | Build de todos los paquetes |
| `pnpm run build:storybook` | Build solo del Storybook |
| `pnpm run build:site` | Build completo (examples + storybook → docs/) |
| `pnpm run deploy` | Deploy a GitHub Pages (usando gh-pages) |
| `pnpm run demo` | Servir examples/ localmente (puerto 3000) |
| `pnpm run storybook` | Servir Storybook en modo dev (puerto 6006) |

---

## 🎯 Mejores Prácticas

1. ✅ **Siempre testea localmente** antes de desplegar
   ```bash
   pnpm run build:site && cd docs && npx serve
   ```

2. ✅ **Usa GitHub Actions** para despliegues consistentes

3. ✅ **Commitea docs/** si usas despliegue manual desde branch

4. ✅ **No commitees docs/** si usas GitHub Actions (se genera en CI)

5. ✅ **Actualiza URLs** en el README con tu dominio real

6. ✅ **Configura CNAME** si tienes dominio personalizado
   ```bash
   # En scripts/build-site.js, descomenta:
   writeFileSync(join(docsDir, 'CNAME'), 'tu-dominio.com');
   ```

---

## 📚 Recursos Adicionales

- 📖 [GitHub Pages Docs](https://docs.github.com/en/pages)
- 📖 [GitHub Actions Docs](https://docs.github.com/en/actions)
- 📖 [Storybook Deployment](https://storybook.js.org/docs/sharing/publish-storybook)
- 📖 [Netlify Docs](https://docs.netlify.com/)
- 📖 [Vercel Docs](https://vercel.com/docs)

---

## 💬 Soporte

¿Problemas con el despliegue?

- 🐛 [Abrir Issue](https://github.com/seguros-bolivar/bolivar-ui/issues)
- 💬 [GitHub Discussions](https://github.com/seguros-bolivar/bolivar-ui/discussions)

---

<div align="center">
  <sub>Construido con ❤️ por el equipo de Seguros Bolívar</sub>
</div>

