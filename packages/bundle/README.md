# 📦 Seguros Bolívar UI - Bundle CDN

Sistema de Diseño Multi-Marca para aplicaciones web empresariales de Seguros Bolívar.

## 🚀 Instalación

### Opción 1: CDN (Recomendado)

Usa el CDN público de **unpkg** o **jsDelivr** para cargar los archivos directamente:

#### unpkg.com

```html
<!-- CSS - Seguros Bolívar Light -->
<link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-seguros-bolivar-light.min.css">

<!-- JavaScript - Web Components -->
<script type="module" src="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-components.min.js"></script>
```

#### jsDelivr.com

```html
<!-- CSS - Seguros Bolívar Light -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-seguros-bolivar-light.min.css">

<!-- JavaScript - Web Components -->
<script type="module" src="https://cdn.jsdelivr.net/npm/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-components.min.js"></script>
```

### Opción 2: NPM

Instala el paquete en tu proyecto:

```bash
npm install @seguros-bolivar/ui-bundle
```

```bash
pnpm add @seguros-bolivar/ui-bundle
```

```bash
yarn add @seguros-bolivar/ui-bundle
```

### Opción 3: Descarga Directa

Descarga los archivos desde [GitHub Releases](https://github.com/seguros-bolivar/bolivar-ui/releases) y cópialos a tu proyecto.

## 📚 Uso Básico

### HTML

```html
<!DOCTYPE html>
<html lang="es" data-brand="seguros-bolivar" data-theme="light">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mi App - Seguros Bolívar</title>
  
  <!-- CSS del Design System -->
  <link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-seguros-bolivar-light.min.css">
  
  <!-- Web Components (opcional) -->
  <script type="module" src="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-components.min.js"></script>
</head>
<body>
  <!-- Usa los componentes -->
  <button class="sb-ui-button sb-ui-button--primary sb-ui-button--fill">
    Acción Principal
  </button>
  
  <!-- Web Component: Datepicker -->
  <sb-ui-datepicker
    label="Fecha de nacimiento"
    placeholder="DD/MM/YYYY">
  </sb-ui-datepicker>
</body>
</html>
```

## 🎨 Marcas Disponibles

El bundle incluye 6 marcas y 2 temas (light/dark) cada una:

| Marca | Light | Dark |
|-------|-------|------|
| **Seguros Bolívar** | `sb-ui-seguros-bolivar-light.min.css` | `sb-ui-seguros-bolivar-dark.min.css` |
| **Davivienda** | `sb-ui-davivienda-light.min.css` | `sb-ui-davivienda-dark.min.css` |
| **Jelpit** | `sb-ui-jelpit-light.min.css` | `sb-ui-jelpit-dark.min.css` |
| **Cien Cuadras** | `sb-ui-cien-cuadras-light.min.css` | `sb-ui-cien-cuadras-dark.min.css` |
| **Doctor Aki** | `sb-ui-doctor-aki-light.min.css` | `sb-ui-doctor-aki-dark.min.css` |
| **White Label** | `sb-ui-white-label-light.min.css` | `sb-ui-white-label-dark.min.css` |

### Cambiar de Marca/Tema

Actualiza el atributo `data-brand` y `data-theme` en el `<html>`:

```html
<!-- Seguros Bolívar Light -->
<html data-brand="seguros-bolivar" data-theme="light">

<!-- Davivienda Dark -->
<html data-brand="davivienda" data-theme="dark">

<!-- Jelpit Light -->
<html data-brand="jelpit" data-theme="light">
```

O cambia el archivo CSS cargado:

```html
<!-- Cambiar de Seguros Bolívar a Davivienda -->
<link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-davivienda-light.min.css">
```

## 📦 Contenido del Bundle

Cada archivo CSS incluye:

- ✅ **Tokens** (colores, tipografía, espaciado)
- ✅ **Componentes Atómicos** (botones, inputs, selects, etc.)
- ✅ **Componentes Moleculares** (modales, dropdowns, toasts)
- ✅ **Brand Overrides** (estilos específicos de cada marca)

### Tamaños de Archivos (Gzipped)

| Archivo | Tamaño |
|---------|--------|
| CSS (minificado + gzip) | ~23-27 KB |
| JavaScript (minificado + gzip) | ~16 KB |
| **Total** | **~40 KB** |

## 🎯 Componentes Disponibles

### Atoms (CSS)
- Button
- Input
- Select
- Checkbox
- Radio
- Toggle
- TextArea
- Accordion
- Alert
- Breadcrumb
- Calendar
- Spinner
- Tabs
- Table
- FileUpload

### Molecules (Web Components)
- `<sb-ui-datepicker>`
- `<sb-ui-modal>`
- `<sb-ui-dropdown>`
- `<sb-ui-toast>`
- `<sb-ui-stepper>`

## 🔧 Configuración Avanzada

### Versión Específica

Para producción, es recomendable usar una versión específica en lugar de `@latest`:

```html
<!-- Versión fija (ejemplo: 1.0.0) -->
<link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@1.0.0/dist/sb-ui-seguros-bolivar-light.min.css">
```

### Preload para Mejor Performance

```html
<!-- Precargar CSS para renderizado más rápido -->
<link rel="preload" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-seguros-bolivar-light.min.css" as="style">
<link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-seguros-bolivar-light.min.css">
```

### Integrity Hash (SRI)

Para mayor seguridad, usa Subresource Integrity:

```bash
# Generar hash SHA-384
openssl dgst -sha384 -binary sb-ui-seguros-bolivar-light.min.css | openssl base64 -A
```

```html
<link 
  rel="stylesheet" 
  href="https://unpkg.com/@seguros-bolivar/ui-bundle@1.0.0/dist/sb-ui-seguros-bolivar-light.min.css"
  integrity="sha384-HASH_AQUI"
  crossorigin="anonymous">
```

## 📖 Documentación Completa

- **Storybook:** https://seguros-bolivar.github.io/bolivar-ui/
- **GitHub:** https://github.com/seguros-bolivar/bolivar-ui
- **Ejemplos:** https://seguros-bolivar.github.io/bolivar-ui/examples/

## 🤝 Soporte

- **Issues:** https://github.com/seguros-bolivar/bolivar-ui/issues
- **Discussions:** https://github.com/seguros-bolivar/bolivar-ui/discussions

## 📄 Licencia

MIT © Seguros Bolívar

