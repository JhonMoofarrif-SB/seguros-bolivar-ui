# 🎨 Seguros Bolívar UI Design System

> Sistema de Diseño Multi-Marca para aplicaciones web empresariales

[![npm version](https://img.shields.io/npm/v/@seguros-bolivar/ui-bundle.svg)](https://www.npmjs.com/package/@seguros-bolivar/ui-bundle)
[![npm downloads](https://img.shields.io/npm/dm/@seguros-bolivar/ui-bundle.svg)](https://www.npmjs.com/package/@seguros-bolivar/ui-bundle)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 📋 Tabla de Contenidos

- [¿Qué es?](#-qué-es)
- [Características](#-características)
- [Instalación](#-instalación)
- [Uso Rápido](#-uso-rápido)
- [Marcas Disponibles](#-marcas-disponibles)
- [Componentes](#-componentes)
- [Documentación](#-documentación)
- [Desarrollo](#-desarrollo)
- [Contribuir](#-contribuir)

---

## 🎯 ¿Qué es?

**Seguros Bolívar UI** es un Design System moderno y completo que permite construir aplicaciones web consistentes para **6 marcas diferentes** con **soporte para tema claro y oscuro**.

### Características Principales

✨ **Multi-Marca**: 6 marcas pre-configuradas (Seguros Bolívar, Davivienda, Jelpit, Cien Cuadras, Doctor Aki, White Label)  
🌓 **Temas**: Light y Dark mode para cada marca  
📦 **Todo en Uno**: Un solo archivo CSS/JS contiene todo lo que necesitas  
🚀 **Ultra Ligero**: ~40 KB (gzipped)  
🎨 **15+ Componentes**: Desde botones hasta tablas y modales  
♿ **Accesible**: WCAG 2.1 AA compliant  
📱 **Responsive**: Mobile-first design  
🧩 **Web Components**: Componentes interactivos con Lit  
🎭 **CSS Moderno**: CSS Nesting, @layer, Logical Properties, clamp()

---

## 🚀 Instalación

### Opción 1: CDN (Recomendado para prototipos)

La forma más rápida de empezar es usar un CDN público:

#### unpkg.com

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mi App - Seguros Bolívar</title>
  
  <!-- CSS del Design System -->
  <link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-seguros-bolivar-light.min.css">
  
  <!-- Web Components (opcional, solo si usas modales, datepickers, etc.) -->
  <script type="module" src="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-components.min.js"></script>
</head>
<body>
  <!-- Tu contenido aquí -->
  <button class="sb-ui-button sb-ui-button--primary sb-ui-button--fill">
    ¡Hola Mundo!
  </button>
</body>
</html>
```

#### jsDelivr (alternativa)

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-seguros-bolivar-light.min.css">
<script type="module" src="https://cdn.jsdelivr.net/npm/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-components.min.js"></script>
```

### Opción 2: NPM (Recomendado para producción)

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

Luego importa en tu aplicación:

```javascript
// En tu archivo principal (ej: main.js, index.js)
import '@seguros-bolivar/ui-bundle/dist/sb-ui-seguros-bolivar-light.min.css';
import '@seguros-bolivar/ui-bundle/dist/sb-ui-components.min.js';
```

---

## 💡 Uso Rápido

### 1. Componentes CSS (Atoms)

Simplemente agrega las clases CSS a tus elementos HTML:

```html
<!-- Botón -->
<button class="sb-ui-button sb-ui-button--primary sb-ui-button--fill">
  Acción Principal
</button>

<!-- Input -->
<input type="text" class="sb-ui-input" placeholder="Escribe algo...">

<!-- Select -->
<select class="sb-ui-select">
  <option>Opción 1</option>
  <option>Opción 2</option>
</select>

<!-- Tabla -->
<table class="sb-ui-table sb-ui-table--striped sb-ui-table--hover">
  <thead>
    <tr>
      <th>Nombre</th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Juan Pérez</td>
      <td>juan@example.com</td>
    </tr>
  </tbody>
</table>
```

### 2. Web Components (Molecules)

Usa los Web Components personalizados para componentes interactivos:

```html
<!-- Datepicker -->
<sb-ui-datepicker
  label="Fecha de nacimiento"
  placeholder="DD/MM/YYYY"
  required>
</sb-ui-datepicker>

<!-- Modal -->
<sb-ui-modal id="mi-modal" title="Título del Modal">
  <p>Contenido del modal aquí</p>
</sb-ui-modal>

<button onclick="document.getElementById('mi-modal').open = true">
  Abrir Modal
</button>
```

### 3. Cambiar de Marca/Tema

Simplemente cambia el archivo CSS que cargas:

```html
<!-- Seguros Bolívar Light -->
<link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-seguros-bolivar-light.min.css">

<!-- Davivienda Dark -->
<link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-davivienda-dark.min.css">

<!-- Jelpit Light -->
<link rel="stylesheet" href="https://unpkg.com/@seguros-bolivar/ui-bundle@latest/dist/sb-ui-jelpit-light.min.css">
```

---

## 🎨 Marcas Disponibles

| Marca | Light | Dark |
|-------|-------|------|
| **Seguros Bolívar** | `sb-ui-seguros-bolivar-light.min.css` | `sb-ui-seguros-bolivar-dark.min.css` |
| **Davivienda** | `sb-ui-davivienda-light.min.css` | `sb-ui-davivienda-dark.min.css` |
| **Jelpit** | `sb-ui-jelpit-light.min.css` | `sb-ui-jelpit-dark.min.css` |
| **Cien Cuadras** | `sb-ui-cien-cuadras-light.min.css` | `sb-ui-cien-cuadras-dark.min.css` |
| **Doctor Aki** | `sb-ui-doctor-aki-light.min.css` | `sb-ui-doctor-aki-dark.min.css` |
| **White Label** | `sb-ui-white-label-light.min.css` | `sb-ui-white-label-dark.min.css` |

Cada bundle incluye:
- ✅ Design Tokens (colores, tipografía, espaciado)
- ✅ Componentes Atómicos (botones, inputs, etc.)
- ✅ Componentes Moleculares (modales, dropdowns)
- ✅ Brand-specific overrides (estilos personalizados por marca)

---

## 🧩 Componentes

### Atoms (CSS puro)

| Componente | Clase Base | Variantes |
|------------|------------|-----------|
| **Button** | `.sb-ui-button` | `--primary`, `--secondary`, `--tertiary`, `--error` |
| **Input** | `.sb-ui-input` | `--small`, `--medium`, `--large` |
| **Select** | `.sb-ui-select` | `--small`, `--medium`, `--large` |
| **Checkbox** | `.sb-ui-checkbox` | `--small`, `--medium`, `--large` |
| **Radio** | `.sb-ui-radio` | `--small`, `--medium`, `--large` |
| **Toggle** | `.sb-ui-toggle` | `--small`, `--medium`, `--large` |
| **TextArea** | `.sb-ui-textarea` | `--small`, `--medium`, `--large` |
| **Accordion** | `.sb-ui-accordion` | `--primary`, `--secondary` |
| **Alert** | `.sb-ui-alert` | `--info`, `--success`, `--warning`, `--error` |
| **Breadcrumb** | `.sb-ui-breadcrumb` | - |
| **Calendar** | `.sb-ui-calendar` | - |
| **Spinner** | `.sb-ui-spinner` | `--small`, `--medium`, `--large` |
| **Tabs** | `.sb-ui-tabs` | - |
| **Table** | `.sb-ui-table` | `--striped`, `--bordered`, `--hover`, `--compact` |
| **File Upload** | `.sb-ui-file-upload` | - |

### Molecules (Web Components)

| Componente | Tag | Descripción |
|------------|-----|-------------|
| **Datepicker** | `<sb-ui-datepicker>` | Selector de fecha con calendario |
| **Modal** | `<sb-ui-modal>` | Ventana modal con overlay |
| **Dropdown** | `<sb-ui-dropdown>` | Menú desplegable |
| **Toast** | `<sb-ui-toast>` | Notificación temporal |
| **Stepper** | `<sb-ui-stepper>` | Indicador de pasos |

---

## 📖 Documentación

### Ejemplos Interactivos

Visita nuestra página de ejemplos para ver todos los componentes en acción:

🌐 **[Ver Ejemplos en Vivo](examples/index.html)**

### Guías Detalladas

- 📘 [Guía de Inicio Rápido](examples/getting-started.html) - Todo lo que necesitas saber para empezar
- 📗 [Componentes](examples/) - Ejemplos de cada componente
- 📙 [Storybook](#) - Documentación interactiva completa (ver [Despliegue](DEPLOYMENT.md))
- 📕 [Publicación en CDN](PUBLISHING_GUIDE.md) - Cómo publicar actualizaciones
- 🚀 [Despliegue del Sitio](DEPLOYMENT.md) - Cómo publicar la documentación y Storybook

### Recursos Adicionales

- 📦 [NPM Package](https://www.npmjs.com/package/@seguros-bolivar/ui-bundle)
- 🌐 [unpkg CDN](https://unpkg.com/@seguros-bolivar/ui-bundle@latest/)
- 🚀 [jsDelivr CDN](https://cdn.jsdelivr.net/npm/@seguros-bolivar/ui-bundle@latest/)

---

## 🛠️ Desarrollo

### Requisitos Previos

- Node.js >= 18.0.0
- pnpm >= 8.0.0

### Instalación Local

```bash
# Clonar el repositorio
git clone https://github.com/seguros-bolivar/bolivar-ui.git
cd bolivar-ui

# Instalar dependencias
pnpm install

# Build
pnpm run build

# Ver ejemplos
pnpm run demo
```

### Scripts Disponibles

```bash
pnpm run build          # Build todos los paquetes
pnpm run dev            # Modo desarrollo
pnpm run demo           # Servidor de ejemplos (puerto 3000)
pnpm run storybook      # Storybook (puerto 6006)
pnpm run test           # Ejecutar tests
pnpm run lint           # Linter
pnpm run clean          # Limpiar archivos compilados
```

### Estructura del Proyecto

```
root-block/
├── packages/
│   ├── tokens/          # Design tokens (colores, tipografía)
│   ├── atoms/           # Componentes CSS atómicos
│   ├── molecules/       # Web Components
│   ├── brand-overrides/ # Estilos por marca
│   ├── bundle/          # CDN bundles
│   └── docs/            # Storybook
├── examples/            # Páginas de ejemplo
└── scripts/             # Scripts de desarrollo
```

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'feat: agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

### Guías de Contribución

- Sigue las reglas de CSS en `.cursor/rules/CSS.mdc`
- Usa commits semánticos (feat, fix, docs, style, refactor, test, chore)
- Agrega tests para nuevas funcionalidades
- Actualiza la documentación

---

## 📄 Licencia

MIT © Seguros Bolívar

---

## 🔗 Enlaces Útiles

- 📦 **NPM**: https://www.npmjs.com/package/@seguros-bolivar/ui-bundle
- 🌐 **unpkg**: https://unpkg.com/@seguros-bolivar/ui-bundle@latest/
- 🚀 **jsDelivr**: https://cdn.jsdelivr.net/npm/@seguros-bolivar/ui-bundle@latest/
- 📊 **Estadísticas**: https://npm-stat.com/charts.html?package=@seguros-bolivar/ui-bundle
- 🐛 **Issues**: https://github.com/seguros-bolivar/bolivar-ui/issues
- 💬 **Discussions**: https://github.com/seguros-bolivar/bolivar-ui/discussions

---

## 💬 Soporte

¿Necesitas ayuda? Contáctanos:

- 📧 **Email**: ui-team@segurosbolivar.com
- 🐛 **Issues**: [GitHub Issues](https://github.com/seguros-bolivar/bolivar-ui/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/seguros-bolivar/bolivar-ui/discussions)

---

<div align="center">
  <sub>Construido con ❤️ por el equipo de Seguros Bolívar</sub>
</div>
