#### 🇬🇧 ENGLISH

## 📌 Table of Contents (EN)
- [💛 Support this project](#-support-this-project)
- [1) What is ReaSet?](#1-what-is-reaset)
- [2) Main features](#2-main-features)
- [3) Credits and acknowledgements](#3-credits-and-acknowledgements)
- [4) Requirements](#4-requirements)
- [5) Installation](#5-installation)
- [6) Usage setup](#6-usage-setup)
- [7) Quick troubleshooting](#7-quick-troubleshooting)


---

## 💛 Support this project
If this project helps you, you can support development here:

<a href="https://ko-fi.com/W7W81VLW05" target="_blank">
  <img src="https://storage.ko-fi.com/cdn/kofi3.png?v=6" alt="Buy Me a Coffee at ko-fi.com" height="36" style="border:0px;height:36px;" />
</a>


---

## 1) What is ReaSet?
**ReaSet** is a web interface for **REAPER**, designed for live setlist management.

Project foundation:
- Inspired by **ReaSetlistManager** by `suckyble`.
- Extended with **lyrics and chords** display based on **X-Raym** scripts/logic.

Main goals:
- Organize and run songs (regions) during live shows.
- Control transport (play/stop/cue/next).
- Manage multiple setlists with local persistence.
- Display synced lyrics/chords from dedicated tracks.

---

## 2) Main features
- ✅ Setlist management (create/delete/switch).
- 🔀 Drag & drop song reordering.
- 🎯 Song states: active, queued, skipped, loop, chain.
- ⏯️ On-screen transport controls.
- 💾 JSON export/import.
- 🧠 Local persistence via `localStorage`.
- 🎤 Lyrics panel + 🎸 chords panel.
- 🎨 Visual customization (themes/fonts/sizes/chord color).

Main file:
- `ReaSet.html`

Included dependencies:
- `Sortable.min.js`
- Lua bridge scripts under `Requirements/`

---

## 3) Credits and acknowledgements
### Base project
- **suckyble / ReaSetlistManager**  
- https://github.com/suckyble/ReaSetlistManager

### Lyrics/chords integration
- **X-Raym / REAPER-ReaScripts**  
- https://github.com/X-Raym/REAPER-ReaScripts/tree/master/Web%20Interfaces
- Reference script:  
  `Convert Lyrics track items notes for the dedicated web browser interface.lua`

### Sorting library
- **SortableJS** (`Sortable.min.js`)

### AI-assisted development process
This project was iterated, debugged, and tested with:
- **Claude (cowork)**
- **Google (Antigravity)**

Final functional validation was performed in REAPER with real setlist usage tests.

> ⚖️ Legal note: keep and respect original licenses of reused components (e.g., GPL v3 where applicable).

---

## 4) Requirements
### Software
1. **REAPER** (v5+ recommended; latest preferred).
2. A web browser (desktop/tablet/mobile).
3. A REAPER project with regions (typically one region per song).

### Minimum files
- `ReaSet.html`
- `Sortable.min.js`
- Scripts in `Requirements/`:
  - `X-Raym_Convert Lyrics track items notes for dedicated web browser interface.lua`
  - `X-Raym_Convert Chords track items notes for dedicated web browser interface.lua`

### Required tracks for lyrics/chords
- Track named exactly: `lyrics`
- Track named exactly: `chords`
- Each item must contain text in **Item Notes**.

### Script compatibility
Scripts use `reaper.ULT_GetMediaItemNote`.
- If your REAPER build does not recognize it, install a compatible scripting/API environment (e.g., Ultraschall API) or adapt note reading.

---

## 5) Installation
### Step 1 — Copy web interface files
Copy to REAPER web folder (where `main.js` is located):
- `ReaSet.html`
- `Sortable.min.js`

#### Default paths (REAPER Resource Path)
> In REAPER: **Options > Show REAPER resource path in explorer/finder**.

**macOS**
- Resource Path: `~/Library/Application Support/REAPER/`
- Web root (typical): `~/Library/Application Support/REAPER/Plugins/reaper_www_root/`

**Windows**
- Resource Path: `%APPDATA%\REAPER\`
- Web root (typical): `%APPDATA%\REAPER\Plugins\reaper_www_root\`

**Linux**
- Resource Path: `~/.config/REAPER/`
- Web root (typical): `~/.config/REAPER/Plugins/reaper_www_root/`

> `main.js` is provided by REAPER Web Interface (not included in this project).

### Step 2 — Install Lua scripts
1. Open REAPER.
2. Go to **Actions > Show action list**.
3. Use **ReaScript: Load...** and load both scripts from `Requirements/`.
4. (Recommended) Copy scripts into REAPER’s scripts folder.
5. (Optional) Assign shortcuts or add to toolbar.

#### Default script paths
- **macOS:** `~/Library/Application Support/REAPER/Scripts/`
- **Windows:** `%APPDATA%\REAPER\Scripts\`
- **Linux:** `~/.config/REAPER/Scripts/`

### Step 3 — Prepare project
1. Create/rename track `lyrics`.
2. Create/rename track `chords`.
3. Add lyrics/chords into item notes.
4. Verify song regions in timeline.

### Step 4 — Launch interface
1. Open REAPER + project.
2. Open web interface and load `ReaSet.html`.
3. Run Lyrics and Chords Lua scripts.

---

## 6) Usage setup
### Recommended live workflow
1. Verify regions.
2. Run Lyrics/Chords scripts.
3. Open `ReaSet.html`.
4. Create/select setlist.
5. Reorder songs and set states (skip/loop/chain).
6. Test transport before showtime.
7. Export `.json` backup.

### Persistence and backups
- Browser-local state (`localStorage`).
- Use Export/Import JSON for backup/migration.
- Recommended: dated backups before major edits.

### Best practices
- Keep consistent region naming.
- Keep a dedicated “Show-Ready” project.
- Test on the same device/browser used on stage.

---

## 7) Quick troubleshooting
### ❌ Lyrics not showing
- Check exact track name `lyrics`.
- Check item notes.
- Check if Lyrics script is running.

### ❌ Chords not showing
- Check `chords` track.
- Check item notes.
- Check if Chords script is running.

### ❌ `ULT_GetMediaItemNote` error
- Missing compatible scripting/API environment; install dependency or adapt script.

### ❌ No interface data/control
- Verify Web Interface is enabled and reachable.
- Verify `main.js` loads from the same folder.

---


#### ESPAÑOL
---
## 📌 Índice (ES)
- [💛 Apoya el proyecto](#-apoya-el-proyecto)
- [1) ¿Qué es ReaSet?](#1-qué-es-reaset)
- [2) Funcionalidades principales](#2-funcionalidades-principales)
- [3) Créditos y agradecimientos](#3-créditos-y-agradecimientos)
- [4) Requisitos](#4-requisitos)
- [5) Instalación](#5-instalación)
- [6) Configuración de uso](#6-configuración-de-uso)
- [7) Solución rápida de problemas](#7-solución-rápida-de-problemas)

---

## 💛 Apoya el proyecto
Si este proyecto te sirve, puedes apoyar su desarrollo aquí:

<a href="https://ko-fi.com/W7W81VLW05" target="_blank">
  <img src="https://storage.ko-fi.com/cdn/kofi3.png?v=6" alt="Invítame un café en Ko-fi" height="36" style="border:0px;height:36px;" />
</a>

---

## 1) ¿Qué es ReaSet?
**ReaSet** es una interfaz web para **REAPER** orientada a shows en vivo y gestión de setlists.

Base del proyecto:
- Inspirado en **ReaSetlistManager** de `suckyble`.
- Extendido con visualización de **letras y acordes** usando lógica/script de **X-Raym**.

Objetivo principal:
- Ordenar y ejecutar canciones (regiones) durante un show.
- Controlar transporte (play/stop/cue/next).
- Administrar múltiples setlists con persistencia local.
- Mostrar letras y acordes sincronizados desde pistas dedicadas.

---

## 2) Funcionalidades principales
- ✅ Gestión de setlists (crear/eliminar/cambiar).
- 🔀 Drag & drop para reordenar canciones.
- 🎯 Estado por canción: activa, en cola, omitida, loop, chain.
- ⏯️ Controles de transporte en pantalla.
- 💾 Exportación/importación de setlists en JSON.
- 🧠 Persistencia local vía `localStorage`.
- 🎤 Panel de letras + 🎸 panel de acordes.
- 🎨 Personalización visual (temas, tipografías, tamaños, color de acordes).

Archivo principal:
- `ReaSet.html`

Dependencias incluidas:
- `Sortable.min.js`
- Scripts Lua de puente en `Requirements/`

---

## 3) Créditos y agradecimientos
### Proyecto base
- **suckyble / ReaSetlistManager**  
- https://github.com/suckyble/ReaSetlistManager

### Integración de letras y acordes
- **X-Raym / REAPER-ReaScripts**  
- https://github.com/X-Raym/REAPER-ReaScripts/tree/master/Web%20Interfaces
- Script de referencia:  
  `Convert Lyrics track items notes for the dedicated web browser interface.lua`

### Librería de ordenamiento
- **SortableJS** (`Sortable.min.js`)

### Proceso de desarrollo asistido por IA
Este proyecto fue iterado, depurado y testeado con apoyo de:
- **Claude (cowork)**
- **Google (Antigravity)**

La validación funcional final se hizo en REAPER con pruebas reales de uso en setlist.

> ⚖️ Nota legal: mantener y respetar licencias originales de los componentes reutilizados (por ejemplo, GPL v3 donde aplique).

---

## 4) Requisitos
### Software
1. **REAPER** (v5+ recomendado; ideal versión reciente).
2. Navegador web (desktop/tablet/móvil).
3. Proyecto REAPER con regiones (normalmente una región por canción).

### Archivos mínimos
- `ReaSet.html`
- `Sortable.min.js`
- Scripts en `Requirements/`:
  - `X-Raym_Convert Lyrics track items notes for dedicated web browser interface.lua`
  - `X-Raym_Convert Chords track items notes for dedicated web browser interface.lua`

### Pistas requeridas para letras/acordes
- Pista llamada exactamente: `lyrics`
- Pista llamada exactamente: `chords`
- Cada item debe tener texto en **Item Notes**.

### Compatibilidad de scripting
Los scripts usan `reaper.ULT_GetMediaItemNote`.
- Si tu REAPER no reconoce esa función, instala entorno/API compatible (ej. Ultraschall API) o adapta el método de lectura de notas.

---

## 5) Instalación
### Paso 1 — Copiar interfaz web
Copiar en la carpeta web de REAPER (donde existe `main.js`):
- `ReaSet.html`
- `Sortable.min.js`

#### Rutas por defecto (REAPER Resource Path)
> En REAPER: **Options > Show REAPER resource path in explorer/finder**.

**macOS**
- Resource Path: `~/Library/Application Support/REAPER/`
- Web root (habitual): `~/Library/Application Support/REAPER/Plugins/reaper_www_root/`

**Windows**
- Resource Path: `%APPDATA%\REAPER\`
- Web root (habitual): `%APPDATA%\REAPER\Plugins\reaper_www_root\`

**Linux**
- Resource Path: `~/.config/REAPER/`
- Web root (habitual): `~/.config/REAPER/Plugins/reaper_www_root/`

> `main.js` lo provee REAPER Web Interface (no viene en este proyecto).

### Paso 2 — Instalar scripts Lua
1. Abrir REAPER.
2. Ir a **Actions > Show action list**.
3. Usar **ReaScript: Load...** y cargar ambos scripts desde `Requirements/`.
4. (Recomendado) Copiar scripts a carpeta oficial de scripts de REAPER.
5. (Opcional) Asignar atajos o toolbar.

#### Rutas por defecto para scripts
- **macOS:** `~/Library/Application Support/REAPER/Scripts/`
- **Windows:** `%APPDATA%\REAPER\Scripts\`
- **Linux:** `~/.config/REAPER/Scripts/`

### Paso 3 — Preparar proyecto
1. Crear/renombrar pista `lyrics`.
2. Crear/renombrar pista `chords`.
3. Escribir letras/acordes en notas de items.
4. Verificar regiones de canciones en timeline.

### Paso 4 — Abrir interfaz
1. Abrir REAPER + proyecto.
2. Abrir interfaz web y cargar `ReaSet.html`.
3. Ejecutar scripts Lua de Lyrics y Chords.

---

## 6) Configuración de uso
### Flujo recomendado (en vivo)
1. Verificar regiones.
2. Ejecutar scripts Lyrics/Chords.
3. Abrir `ReaSet.html`.
4. Crear/seleccionar setlist.
5. Reordenar canciones y definir estados (skip/loop/chain).
6. Probar transporte antes del show.
7. Exportar `.json` de respaldo.

### Persistencia y backups
- Estado local en navegador (`localStorage`).
- Respaldos/migración vía Export/Import JSON.
- Recomendado: backup por fecha antes de cambios grandes.

### Buenas prácticas
- Nombres consistentes de regiones.
- Proyecto “Show-Ready” separado del de producción.
- Testear en el mismo dispositivo/navegador que usarás en vivo.

---

## 7) Solución rápida de problemas
### ❌ No aparecen letras
- Revisar nombre exacto de pista `lyrics`.
- Revisar notas en items.
- Revisar que el script de Lyrics esté activo.

### ❌ No aparecen acordes
- Revisar pista `chords`.
- Revisar notas en items.
- Revisar script de Chords activo.

### ❌ Error `ULT_GetMediaItemNote`
- Falta entorno/API compatible; instalar dependencia o adaptar script.

### ❌ Interfaz sin datos/control
- Verificar Web Interface habilitada y accesible.
- Verificar carga correcta de `main.js` en la misma carpeta.

---
