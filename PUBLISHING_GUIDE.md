# 📦 Guía de Publicación - Seguros Bolívar UI

Esta guía te ayudará a publicar la librería en NPM y hacerla disponible en CDNs públicos.

## 🎯 Requisitos Previos

### 1. Cuenta en NPM

Si no tienes una cuenta en NPM:

```bash
# Crear cuenta en https://www.npmjs.com/signup
# O desde la terminal:
npm adduser
```

### 2. Login en NPM

```bash
npm login
```

Te pedirá:
- **Username**: tu usuario de NPM
- **Password**: tu contraseña
- **Email**: tu email (será público)
- **OTP**: código de autenticación de dos factores (si lo tienes activado)

### 3. Verificar que estás logueado

```bash
npm whoami
```

Debe mostrar tu nombre de usuario.

## 🚀 Proceso de Publicación

### Paso 1: Build del Bundle

Primero, construye los archivos finales:

```bash
cd /Users/CamiloContrerasRomero/Documents/FRONT\ BOLIVAR/Desing-sistem-bolivar/root-block

# Limpiar y construir todo
pnpm run clean
pnpm run build
```

Verifica que se generaron los archivos en `packages/bundle/dist/`:
- ✅ `sb-ui-*.min.css` (12 archivos CSS)
- ✅ `sb-ui-components.min.js` (1 archivo JS)
- ✅ `*.gz` y `*.br` (archivos comprimidos)

### Paso 2: Dry Run (Simulación)

Antes de publicar, verifica qué archivos se incluirán:

```bash
cd packages/bundle
npm publish --dry-run
```

Esto mostrará:
- Tamaño del paquete
- Lista de archivos a publicar
- Warnings o errores

**Revisa que solo se incluyan archivos del `dist/` y el `README.md`**

### Paso 3: Publicar en NPM

#### Opción A: Primera Publicación (Recomendada)

```bash
cd packages/bundle
npm publish --access public
```

El flag `--access public` es necesario para paquetes con scope (`@seguros-bolivar-ui/`).

#### Opción B: Usar el script del package.json

```bash
cd packages/bundle
pnpm run publish:public
```

### Paso 4: Verificar la Publicación

1. **En NPM:**
   - https://www.npmjs.com/package/@seguros-bolivar-ui/bundle

2. **En unpkg.com (CDN):**
   - https://unpkg.com/@seguros-bolivar-ui/bundle@latest/

3. **En jsDelivr (CDN):**
   - https://cdn.jsdelivr.net/npm/@seguros-bolivar-ui/bundle@latest/

**Nota:** Los CDNs pueden tardar 5-10 minutos en sincronizar después de la publicación.

## 📝 Versionado

Usamos **Semantic Versioning** (SemVer):

- **MAJOR** (1.0.0 → 2.0.0): Cambios que rompen compatibilidad
- **MINOR** (1.0.0 → 1.1.0): Nuevas funcionalidades compatibles
- **PATCH** (1.0.0 → 1.0.1): Correcciones de bugs

### Actualizar Versión

#### Opción 1: Manual

Edita el `version` en `packages/bundle/package.json`:

```json
{
  "version": "1.0.1"
}
```

#### Opción 2: npm version (Recomendado)

```bash
cd packages/bundle

# Patch (1.0.0 → 1.0.1)
npm version patch

# Minor (1.0.0 → 1.1.0)
npm version minor

# Major (1.0.0 → 2.0.0)
npm version major
```

Esto actualiza automáticamente el `package.json` y crea un git tag.

### Publicar Nueva Versión

```bash
# 1. Actualizar versión
cd packages/bundle
npm version patch  # o minor, o major

# 2. Build
cd ../..
pnpm run build

# 3. Publicar
cd packages/bundle
npm publish --access public

# 4. Push del tag a GitHub
git push --tags
```

## 🔒 Seguridad

### Autenticación de Dos Factores (2FA)

Si tienes 2FA activado en NPM, necesitarás un código OTP al publicar:

```bash
npm publish --access public --otp=123456
```

### Token de Acceso (CI/CD)

Para automatizar publicaciones en GitHub Actions:

1. Genera un token en https://www.npmjs.com/settings/USERNAME/tokens
2. Selecciona "Automation" type
3. Guarda el token como secret en GitHub: `NPM_TOKEN`

## 🌐 Uso desde CDN

Una vez publicado, los usuarios podrán usarlo así:

### unpkg.com

```html
<!-- CSS -->
<link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar-ui/bundle@1.0.0/dist/sb-ui-seguros-bolivar-light.min.css">

<!-- JS -->
<script type="module" src="https://unpkg.com/@seguros-bolivar-ui/bundle@1.0.0/dist/sb-ui-components.min.js"></script>
```

### jsDelivr.com

```html
<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@seguros-bolivar-ui/bundle@1.0.0/dist/sb-ui-seguros-bolivar-light.min.css">

<!-- JS -->
<script type="module" src="https://cdn.jsdelivr.net/npm/@seguros-bolivar-ui/bundle@1.0.0/dist/sb-ui-components.min.js"></script>
```

## 📦 Descarga Directa

### GitHub Releases

Para permitir descargas directas, crea un release en GitHub:

```bash
# 1. Crear tag
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0

# 2. En GitHub:
# - Ve a "Releases" → "Draft a new release"
# - Selecciona el tag v1.0.0
# - Adjunta los archivos del dist/ como assets
# - Publica el release
```

Los usuarios podrán descargar desde:
- https://github.com/seguros-bolivar/bolivar-ui/releases

### Crear ZIP para Descarga

```bash
cd packages/bundle

# Crear archivo ZIP con todos los bundles
zip -r seguros-bolivar-ui-v1.0.0.zip dist/

# Resultado: seguros-bolivar-ui-v1.0.0.zip (~500KB)
```

## 🔄 Automatización con GitHub Actions

Crea `.github/workflows/publish.yml`:

```yaml
name: Publish to NPM

on:
  push:
    tags:
      - 'v*'

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - uses: pnpm/action-setup@v2
        with:
          version: 8
      
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
          registry-url: 'https://registry.npmjs.org'
      
      - name: Install dependencies
        run: pnpm install
      
      - name: Build
        run: pnpm run build
      
      - name: Publish to NPM
        run: |
          cd packages/bundle
          npm publish --access public
        env:
          NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}
```

## ⚠️ Troubleshooting

### Error: 403 Forbidden

**Causa:** No tienes permisos o el paquete ya existe.

**Solución:**
```bash
# Verifica que el nombre está disponible
npm search @seguros-bolivar-ui/bundle

# Si ya existe, necesitas permisos del owner
# O cambia el nombre en package.json
```

### Error: 402 Payment Required

**Causa:** Intentas publicar un paquete privado con scope sin cuenta de pago.

**Solución:**
```bash
# Agrega --access public
npm publish --access public
```

### Error: ENEEDAUTH

**Causa:** No estás autenticado.

**Solución:**
```bash
npm login
```

### Error: Missing files

**Causa:** Los archivos del `dist/` no existen.

**Solución:**
```bash
# Build antes de publicar
cd /Users/CamiloContrerasRomero/Documents/FRONT\ BOLIVAR/Desing-sistem-bolivar/root-block
pnpm run build
```

## 📊 Monitoreo Post-Publicación

### Estadísticas de NPM

Ver descargas del paquete:
- https://npm-stat.com/charts.html?package=@seguros-bolivar-ui/bundle

### CDN Stats

Ver uso del CDN:
- unpkg: https://unpkg.com/@seguros-bolivar-ui/bundle@latest/
- jsDelivr: https://www.jsdelivr.com/package/npm/@seguros-bolivar-ui/bundle

## 📞 Contacto

Si tienes problemas durante la publicación:
- **Issues:** https://github.com/seguros-bolivar/bolivar-ui/issues
- **Email:** ui-team@segurosbolivar.com

---

## ✅ Checklist de Publicación

Antes de publicar, verifica:

- [ ] ✅ Build completo ejecutado (`pnpm run build`)
- [ ] ✅ Archivos del `dist/` generados correctamente
- [ ] ✅ `package.json` actualizado (versión, descripción, keywords)
- [ ] ✅ `README.md` actualizado con ejemplos
- [ ] ✅ Autenticado en NPM (`npm whoami`)
- [ ] ✅ Dry run ejecutado sin errores (`npm publish --dry-run`)
- [ ] ✅ Tests pasando (si aplica)
- [ ] ✅ Git commit y push realizados
- [ ] ✅ Tag creado (opcional: `git tag v1.0.0`)
- [ ] ✅ Publicación ejecutada (`npm publish --access public`)
- [ ] ✅ Verificado en npmjs.com
- [ ] ✅ Verificado en unpkg.com (esperar 5-10 min)
- [ ] ✅ Documentación actualizada
- [ ] ✅ GitHub Release creado (opcional)

¡Listo! Tu librería está ahora disponible para todo el mundo 🎉

