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
