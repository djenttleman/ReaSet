<h1 align="center">
  <img src="assets/reaset-logo-transparent.svg" alt="ReaSet" width="520">
</h1>

<p align="center">
  <strong>Live setlist, transport, lyrics and chords for REAPER.</strong>
</p>

<p align="center">
  <a href="README.md"><strong>English</strong></a> ·
  <a href="README.es.md">Español</a> ·
  <a href="https://reasetpro.com">Website</a> ·
  <a href="docs/USER_GUIDE.md">User guide</a> ·
  <a href="CHANGELOG.md">Changelog</a>
</p>

<p align="center">
  <a href="https://www.reaboot.com/install/https%3A%2F%2Fraw.githubusercontent.com%2Fdjenttleman%2FReaSet%2Fmain%2Freaboot.json">
    <img src="assets/install-via-reaboot.svg" alt="Install via ReaBoot" height="52">
  </a>
</p>

<p align="center">
  <sub>Free to use · macOS · Windows · Linux</sub>
</p>

<img src="assets/readme-hero-v2.svg" alt="Your setlist. Your show. In control.">

## Built for the stage

**ReaSet turns REAPER regions into a focused live-performance workspace.** Build setlists, run transport, follow song sections and display synchronized lyrics and chords from any browser on your local network.

| **Your show, organized** | **Your performance, protected** | **Your band, connected** |
|---|---|---|
| Unlimited project-local setlists, drag-and-drop ordering and nested song sections. | Armed auto-stop, Stop Hold, queue/auto modes, looping and MIDI Init. | Live View, lyrics, chords and read-only Director/Player synchronization. |

> [!TIP]
> Want to see it before installing? Visit **[reasetpro.com](https://reasetpro.com)** for the full visual tour.

## Highlights

- **Project-local library** — setlists live in `<project>/reaset/setlists/`, travel with the `.rpp` and remain readable JSON files.
- **Live-aware transport** — play, stop, cue, loop, chain and skip regions without leaving the performance interface.
- **Song sections** — nested sub-regions expose the active section, progress, next section and independent behavior.
- **Lyrics and chords** — synchronized panels driven by dedicated REAPER tracks and Item Notes.
- **Stage-ready views** — fullscreen Live View, Canvas overlay and read-only Player instances for musicians.
- **Designed for touch** — responsive list/grid layouts, MIDI Learn and safeguards against accidental stops.

## Install

### Recommended — ReaBoot

<p>
  <a href="https://www.reaboot.com/install/https%3A%2F%2Fraw.githubusercontent.com%2Fdjenttleman%2FReaSet%2Fmain%2Freaboot.json">
    <img src="assets/install-via-reaboot.svg" alt="Install via ReaBoot" height="52">
  </a>
</p>

ReaBoot installs ReaPack when needed, registers the unified `Reaset.lua` companion script and places the web files in `reaper_www_root`. It can also install the optional ReaSet tools, ReaImGui and the recommended SWS extension.

> [!IMPORTANT]
> ReaBoot does not change REAPER preferences. After installation, run **Reaset** once from **Actions → Show action list** and configure it as a Startup Action if you want it available automatically.

<details>
<summary><strong>Manual installation</strong></summary>

1. Copy `ReaSet.html` and `Sortable.min.js` to your REAPER `reaper_www_root`.
2. Load `Reaset.lua` through **Actions → ReaScript: Load…**.
3. Run **Reaset** once and optionally configure it as a Startup Action.
4. Enable REAPER Web Remote and open `http://localhost:8080/ReaSet.html`.

See the [complete installation guide](docs/USER_GUIDE.md#6-installation) for platform paths and troubleshooting.

</details>

## Quick start

1. **Prepare the timeline** — create one REAPER region per song.
2. **Start the bridge** — run `Reaset` from REAPER's Action List.
3. **Open ReaSet** — load `http://localhost:8080/ReaSet.html` and press **Sync**.
4. **Build the show** — create a setlist, add songs and drag them into order.
5. **Go live** — cue a song, press Play and switch to Live View when needed.

Lyrics and chords are optional. To use them, create tracks matching `lyrics` and `chords`, then place the displayed text in Item Notes.

## Requirements

| Required | Optional |
|---|---|
| REAPER, a modern browser and a project containing regions | SWS for Item Notes and precise armed transport |
| `ReaSet.html`, `Sortable.min.js` and `Reaset.lua` | ReaImGui for Lyrics Tapper |
| REAPER Web Remote enabled | A tablet/phone on the same network |

## Included tools

| Tool | Purpose |
|---|---|
| **Lyrics Tapper** | Tap lyric/chord lines into timed REAPER items while the song plays. |
| **ReaSet Diagnose** | Inspect tracks, Item Notes, bridge selection and SWS availability. |
| **Library Doctor** | Audit project-local setlists and the browser → script → disk path. |
| **Text to MIDI Bitmap** | Convert text into MIDI bitmap data for supported workflows. |

Tools are optional and selectable in the ReaBoot installer. See [Tools in the user guide](docs/USER_GUIDE.md#5-tools).

## Documentation

| Resource | What it contains |
|---|---|
| **[User guide](docs/USER_GUIDE.md)** | Full setup, usage manual, region commands, MIDI Learn and troubleshooting. |
| **[Guía en español](docs/USER_GUIDE.es.md)** | Manual completo en español. |
| **[ReaBoot maintenance](reaboot/README.md)** | Package layout and release procedure. |
| **[Changelog](CHANGELOG.md)** | Release history and technical changes. |
| **[Contributing](CONTRIBUTING.md)** | Contribution rules and licence agreement. |

## Support the project

If ReaSet makes your shows safer or easier, you can support its continued development:

<a href="https://ko-fi.com/W7W81VLW05">
  <img src="https://storage.ko-fi.com/cdn/kofi3.png?v=6" alt="Support ReaSet on Ko-fi" height="36">
</a>

## Credits and licence

ReaSet was inspired by [ReaSetlistManager](https://github.com/suckyble/ReaSetlistManager) by `suckyble`; its lyrics/chords workflow was informed by [X-Raym's REAPER scripts](https://github.com/X-Raym/REAPER-ReaScripts/tree/master/Web%20Interfaces), and sorting uses [SortableJS](https://sortablejs.github.io/Sortable/).

ReaSet v3.0+ is **proprietary and free to use**. You may use it commercially, on any number of machines, and share unmodified copies. Selling it or distributing modified versions requires written permission. Versions up to v2.x remain GPL v3. See [`LICENSE`](LICENSE) and [`docs/RELICENSING.md`](docs/RELICENSING.md).

---

<p align="center">
  <strong>Your setlist. Your show. In control.</strong><br>
  <a href="https://reasetpro.com">reasetpro.com</a>
</p>
