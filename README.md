# ReaSet
ReaSet is a REAPER web interface focused on live performance: it manages setlists, reorders songs, controls transport, and displays real-time lyrics/chords. It is based on ReaSetlistManager (suckyble) and extended with lyrics/chords integration inspired by X-Raym scripts.

## 1) What is ReaSet?
**ReaSet** is a web interface for **REAPER**, designed as a live setlist manager.

Project foundation:
- Inspired by **ReaSetlistManager** by `suckyble`.
- Extended with **lyrics and chords** display based on **X-Raym** scripts/logic.

Main goals:
- Organize and run songs (regions) during live shows.
- Control transport (play/stop/cue/next).
- Manage multiple setlists with local persistence.
- Display synced lyrics and chords from dedicated REAPER tracks.

## 2) Main features
- Setlist management (create/delete/switch).
- Drag & drop song reordering.
- Song states: active, queued, skipped, loop, chain.
- On-screen transport controls.
- JSON export/import for backups.
- Local persistence through `localStorage`.
- Lyrics panel and chords panel.
- Visual customization (themes, fonts, sizes, chord color).

Main project file:
- `ReaSet.html`

Included dependencies:
- `Sortable.min.js`
- Lua bridge scripts for lyrics/chords in `Requirements/`

## 3) Credits and acknowledgements
### Base project
- **suckyble / ReaSetlistManager**
- Repository: https://github.com/suckyble/ReaSetlistManager

### Lyrics and chords integration (Web Interface)
- **X-Raym / REAPER-ReaScripts**
- Repository: https://github.com/X-Raym/REAPER-ReaScripts/tree/master/Web%20Interfaces
- Reference script:
  - `Convert Lyrics track items notes for the dedicated web browser interface.lua`

### Sorting library
- **SortableJS** (`Sortable.min.js`)

### AI-assisted development process
This script and integration were built/tested using an AI-assisted workflow to speed up iteration, debugging, and code testing:
- **Claude (cowork)**
- **Google (Antigravity)**

Functional design, final adjustments, and real-world validation were done directly in REAPER during practical setlist testing.

> Note: Keep and respect original licenses of reused components (e.g., GPL v3 for X-Raym scripts when applicable).

## 4) Requirements
### Software
1. **REAPER** (v5+ recommended; latest version preferred).
2. A web browser (desktop/tablet/mobile) to open the interface.
3. A REAPER project with regions (typically one region per song).

### Minimum files
- `ReaSet.html`
- `Sortable.min.js`
- Scripts in `Requirements/`:
  - `X-Raym_Convert Lyrics track items notes for dedicated web browser interface.lua`
  - `X-Raym_Convert Chords track items notes for dedicated web browser interface.lua`

### Track requirements (lyrics/chords)
- Track named exactly: `lyrics`
- Track named exactly: `chords`
- Each item must contain text in **Item Notes**.

### Script compatibility
Scripts use `reaper.ULT_GetMediaItemNote`.
- If your REAPER build does not recognize that function, install the compatible scripting/API environment (e.g., Ultraschall API) or adapt note reading to an alternative method.

## 5) Installation
### Step 1 — Copy web interface files
Place these files in REAPER’s web interface folder (same place where `main.js` is located):
- `ReaSet.html`
- `Sortable.min.js`

#### Default paths (REAPER Resource Path)
> If unsure, in REAPER go to: **Options > Show REAPER resource path in explorer/finder**.

**macOS**
- Resource Path: `~/Library/Application Support/REAPER/`
- Web interface root (typical): `~/Library/Application Support/REAPER/Plugins/reaper_www_root/`
- Copy here: `ReaSet.html` and `Sortable.min.js`

**Windows**
- Resource Path: `%APPDATA%\REAPER\`
- Web interface root (typical): `%APPDATA%\REAPER\Plugins\reaper_www_root\`
- Copy here: `ReaSet.html` and `Sortable.min.js`

**Linux**
- Resource Path: `~/.config/REAPER/`
- Web interface root (typical): `~/.config/REAPER/Plugins/reaper_www_root/`
- Copy here: `ReaSet.html` and `Sortable.min.js`

> `main.js` is not included in this project: it is provided by REAPER Web Interface.

### Step 2 — Install Lua scripts
1. Open REAPER.
2. Go to **Actions > Show action list**.
3. Use **ReaScript: Load...** and load both scripts from `Requirements/`.
4. (Recommended) Move/copy scripts to REAPER script folder for persistence.
5. (Optional) Assign shortcuts or add scripts to a toolbar.

#### Default script paths
**macOS:** `~/Library/Application Support/REAPER/Scripts/`  
**Windows:** `%APPDATA%\REAPER\Scripts\`  
**Linux:** `~/.config/REAPER/Scripts/`

### Step 3 — Prepare your project
1. Create/rename track `lyrics`.
2. Create/rename track `chords`.
3. Add text items in each track and write lyrics/chords into item notes.
4. Make sure song regions are correctly defined on the timeline.

### Step 4 — Launch interface
1. Open REAPER and load your project.
2. Open web interface and load `ReaSet.html`.
3. Run Lyrics and Chords Lua scripts to publish content to the interface.

## 6) Usage setup
### Recommended live workflow
1. Open project and verify regions.
2. Run Lyrics/Chords scripts.
3. Open `ReaSet.html`.
4. Create/select a setlist.
5. Reorder songs (drag & drop) and set status (skip/loop/chain).
6. Test transport controls before the show.
7. Export setlist (`.json`) as backup.

### Persistence and backups
- The app stores state locally in browser (`localStorage`).
- Use **Export/Import JSON** to move/backup setlists.
- Recommended: save dated backups before major edits.

### Best practices
- Use consistent region naming (avoid ambiguous duplicates).
- Keep a dedicated “Show-Ready” project separate from production sessions.
- Test on the same device/browser used on stage.

## 7) Quick troubleshooting
### Lyrics are not showing
- Verify exact track name `lyrics`.
- Verify items contain notes.
- Verify Lyrics script is running.

### Chords are not showing
- Verify exact track name `chords`.
- Verify item notes.
- Verify Chords script is running.

### `ULT_GetMediaItemNote` error
- Missing compatible scripting/API environment; install required dependency or adapt script.

### Interface has no data / no control
- Check REAPER Web Interface is enabled and reachable.
- Confirm `main.js` loads from the same directory.

## 8) Suggested distribution structure
```text
ReaSetlist/
├─ ReaSet.html
├─ Sortable.min.js
├─ Requirements/
│  ├─ X-Raym_Convert Lyrics ... .lua
│  └─ X-Raym_Convert Chords ... .lua
└─ Docs/
```



# ReaSet — Descripción, Requisitos, Instalación y Configuración

## 1) ¿Qué es ReaSet?
**ReaSet** es una interfaz web para usar dentro de **REAPER** como gestor de setlists en vivo.

Base del proyecto:
- Inspirado en **ReaSetlistManager** de `suckyble`.
- Extendido con visualización de **letras y acordes** usando la lógica/script de **X-Raym**.

Objetivo principal:
- Ordenar y ejecutar canciones (regiones) durante un show.
- Controlar transporte (play/stop/cue/next).
- Administrar múltiples setlists con persistencia local.
- Mostrar letras y acordes sincronizados desde pistas dedicadas en el proyecto.

---

## 2) Funcionalidades principales
- Gestión de setlists (crear/eliminar/cambiar).
- Drag & drop para reordenar canciones.
- Estado por canción: activa, en cola, omitida, loop, chain.
- Controles de transporte en pantalla.
- Exportación/importación de setlists en JSON.
- Persistencia local vía `localStorage`.
- Panel de letras y panel de acordes.
- Personalización visual (temas, tipografías, tamaños y color de acordes).

Archivo principal del proyecto:
- `ReaSet.html`

Dependencias incluidas en carpeta:
- `Sortable.min.js`
- Scripts Lua de puente para letras/acordes en `Requirements/`

---

## 3) Agradecimientos y créditos de código
### Proyecto base
- **suckyble / ReaSetlistManager**
- Repositorio: https://github.com/suckyble/ReaSetlistManager

### Integración letras y acordes (Web Interface)
- **X-Raym / REAPER-ReaScripts**
- Repositorio: https://github.com/X-Raym/REAPER-ReaScripts/tree/master/Web%20Interfaces
- Script original de referencia:
  - `Convert Lyrics track items notes for the dedicated web browser interface.lua`

### Librería de ordenamiento
- **SortableJS** (`Sortable.min.js`)

### Proceso de desarrollo asistido por IA
Este script y su integración se generaron/probaron en un flujo de trabajo asistido por IA para acelerar iteración, depuración y testeo de código:
- **Claude (cowork)**
- **Google (Antigravity)**

El diseño funcional, ajustes finales y validación en entorno real se realizaron sobre REAPER con pruebas prácticas de uso en setlist.

> Nota: Mantener y respetar licencias originales de los componentes reutilizados (ej. GPL v3 en scripts de X-Raym donde aplique).

---

## 4) Requisitos
## Software
1. **REAPER** (v5+ recomendado; ideal versión reciente).
2. Navegador web (desktop/tablet/móvil) para abrir la interfaz.
3. Proyecto REAPER con regiones (cada canción normalmente representada por una región).

## Archivos mínimos
- `ReaSet.html`
- `Sortable.min.js`
- Scripts en `Requirements/`:
  - `X-Raym_Convert Lyrics track items notes for dedicated web browser interface.lua`
  - `X-Raym_Convert Chords track items notes for dedicated web browser interface.lua`

## Pistas para letras/acordes
- Pista llamada exactamente: `lyrics`
- Pista llamada exactamente: `chords`
- Cada item debe contener el texto en **Item Notes**.

## Compatibilidad scripting
Los scripts usan `reaper.ULT_GetMediaItemNote`.
- Si tu REAPER no reconoce esa función, instala el entorno/API compatible usado por el script (por ejemplo, Ultraschall API) o adapta la lectura de notas a un método alternativo.

---

## 5) Instalación
## Paso 1 — Copiar interfaz web
Coloca estos archivos en la carpeta de interfaz web de REAPER (el mismo lugar donde vive `main.js` del web control):
- `ReaSet.html`
- `Sortable.min.js`

### Rutas por defecto (REAPER Resource Path)
> Si no estás seguro, en REAPER abre: **Options > Show REAPER resource path in explorer/finder**.

**macOS**
- Resource Path: `~/Library/Application Support/REAPER/`
- Web interface root (habitual): `~/Library/Application Support/REAPER/Plugins/reaper_www_root/`
- Copiar aquí: `ReaSet.html` y `Sortable.min.js`

**Windows**
- Resource Path: `%APPDATA%\REAPER\`
- Web interface root (habitual): `%APPDATA%\REAPER\Plugins\reaper_www_root\`
- Copiar aquí: `ReaSet.html` y `Sortable.min.js`

**Linux**
- Resource Path: `~/.config/REAPER/`
- Web interface root (habitual): `~/.config/REAPER/Plugins/reaper_www_root/`
- Copiar aquí: `ReaSet.html` y `Sortable.min.js`

> `main.js` no viene en este proyecto: lo provee REAPER Web Interface.

## Paso 2 — Instalar scripts Lua
1. Abre REAPER.
2. Ve a **Actions > Show action list**.
3. Usa **ReaScript: Load...** y carga ambos scripts desde `Requirements/`.
4. (Opcional recomendado) Mueve/copia scripts a la carpeta de scripts de REAPER para mantenerlos persistentes.
5. (Opcional recomendado) Asigna atajos o agrega los scripts a toolbar.

### Rutas por defecto para scripts
**macOS:** `~/Library/Application Support/REAPER/Scripts/`  
**Windows:** `%APPDATA%\REAPER\Scripts\`  
**Linux:** `~/.config/REAPER/Scripts/`

## Paso 3 — Preparar proyecto
1. Crea/renombra pista `lyrics`.
2. Crea/renombra pista `chords`.
3. Agrega items de texto en cada pista y escribe letras/acordes en notas del item.
4. Asegura que las canciones/regiones estén bien delimitadas en timeline.

## Paso 4 — Abrir la interfaz
1. Inicia REAPER y abre tu proyecto.
2. Abre la web interface y carga `ReaSet.html`.
3. Ejecuta los scripts Lua de **Lyrics** y **Chords** para publicar contenido hacia la interfaz.

---

## 6) Configuración de uso
## Flujo recomendado (show en vivo)
1. Abrir proyecto y verificar regiones.
2. Ejecutar scripts de Lyrics/Chords.
3. Abrir `ReaSet.html`.
4. Crear o seleccionar setlist.
5. Reordenar canciones (drag & drop) y marcar estados (skip/loop/chain).
6. Probar transporte (play/cue/stop) antes del show.
7. Exportar setlist (`.json`) como backup.

## Persistencia y respaldos
- La app guarda estado local en navegador (`localStorage`).
- Para mover o respaldar setlists, usa **Export/Import JSON**.
- Recomendado: guardar backup por fecha antes de cambios grandes.

## Buenas prácticas
- Usar nombres consistentes de regiones (evitar duplicados ambiguos).
- Mantener un proyecto “Show-Ready” separado de proyecto de producción.
- Probar en el mismo dispositivo/navegador que usarás en vivo.

---

## 7) Solución rápida de problemas
### No aparecen letras
- Verifica pista `lyrics` (nombre exacto).
- Verifica que los items tengan notas.
- Verifica que el script de Lyrics esté ejecutándose.

### No aparecen acordes
- Verifica pista `chords` (nombre exacto).
- Verifica notas de items.
- Verifica que el script de Chords esté ejecutándose.

### Error por función `ULT_GetMediaItemNote`
- Falta entorno/API compatible; instala dependencia de scripting necesaria o adapta el script.

### Interfaz sin datos o sin control
- Verifica que REAPER Web Interface esté activa y accesible.
- Revisa que `main.js` cargue correctamente en el mismo directorio.

---

## 8) Estructura sugerida de distribución
```text
ReaSetlist/
├─ ReaSet.html
├─ Sortable.min.js
├─ Requirements/
│  ├─ X-Raym_Convert Lyrics ... .lua
│  └─ X-Raym_Convert Chords ... .lua
└─ Docs/
```



