-- ReaSet_NativeLoop.lua  v3  — PERSISTENT BACKGROUND SCRIPT
-- ─────────────────────────────────────────────────────────────────────────────
-- INSTALL (one time only):
--   Actions → Load ReaScript → select this file
--   Then: Actions → Show action list → find "ReaSet_NativeLoop" → Run
--   (or add it to REAPER startup: Options → Startup actions)
--
--   NO action ID needed in ReaSet.html.
--   Set  var REASET_NATIVE_LOOP = true;  and the system is live.
--
-- ROLE:
--   Runs forever in background via reaper.defer().
--   Watches ExtState "ReaSet / nativeLoop" each frame.
--   When ReaSet writes "on":
--     • creates a visual region at loopStart…loopEnd
--     • sets REAPER's native A/B loop points
--     • activates Repeat
--     • counts how many times playhead crosses the loop boundary
--     • after loopMax crossings (0 = infinite): disables Repeat, deletes region
--   When ReaSet writes "off": cleans up immediately.
-- ─────────────────────────────────────────────────────────────────────────────

local SEC          = "ReaSet"
local REGION_NAME  = "ReaSet Loop"
local REGION_COLOR = reaper.ColorToNative(80, 160, 255) | 0x1000000
local IDX_KEY      = "reasetLoopRegionIdx"
local NEAR_END     = 0.08   -- sec before loop_end that arms the crossing detector
local NEAR_START   = 0.30   -- sec after loop_start that confirms the jump landed

-- ─── Session state (persists across defer ticks) ──────────────────────────────
local s_active   = false   -- a loop session is currently running
local s_start    = 0
local s_end      = 0
local s_max      = 0       -- 0 = infinite
local s_crosses  = 0       -- how many full loops completed so far
local s_near_end = false   -- edge-detector: were we near the end last tick?
local s_key      = ""      -- "start:end:max" — detects when ReaSet re-arms with new params

-- ─── Region helpers ───────────────────────────────────────────────────────────
local function delete_region()
    local idx = tonumber(reaper.GetExtState(SEC, IDX_KEY))
    if idx then
        reaper.DeleteProjectMarker(nil, idx, true)
        reaper.SetExtState(SEC, IDX_KEY, "", false)
    end
    -- safety scan: remove any orphaned "ReaSet Loop" regions
    local i = 0
    while true do
        local ok, isrgn, _, _, name, midx = reaper.EnumProjectMarkers(i)
        if ok == 0 then break end
        if isrgn and name == REGION_NAME then
            reaper.DeleteProjectMarker(nil, midx, true)
            i = 0
        else
            i = i + 1
        end
    end
end

-- ─── Stop and clean up the current session ────────────────────────────────────
local function do_cleanup()
    reaper.GetSetRepeat(0)
    reaper.GetSet_LoopTimeRange(true, true, 0, 0, false)
    delete_region()
    reaper.SetExtState(SEC, "nativeLoop", "done", false)
    reaper.UpdateArrange()
    s_active   = false
    s_crosses  = 0
    s_near_end = false
    s_key      = ""
end

-- ─── Start (or re-arm) a loop session ─────────────────────────────────────────
local function arm_session(ls, le, lm)
    -- If a session is already active, tear down its region first
    if s_active then
        delete_region()
    end

    s_start    = ls
    s_end      = le
    s_max      = lm
    s_crosses  = 0
    s_near_end = false
    s_active   = true
    s_key      = string.format("%.5f:%.5f:%d", ls, le, lm)

    -- Create visual region
    local new_idx = reaper.AddProjectMarker2(
        nil, true, ls, le, REGION_NAME, -1, REGION_COLOR)
    reaper.SetExtState(SEC, IDX_KEY, tostring(new_idx), false)

    -- Set native A/B loop points
    reaper.GetSet_LoopTimeRange(true, true, ls, le, false)

    -- Enable Repeat
    reaper.GetSetRepeat(1)
    reaper.UpdateArrange()
end

-- ─── Main background loop (runs every frame via defer) ────────────────────────
local _hb_tick = 0   -- heartbeat counter: refreshes ReaSet presence flag every ~5 s
local function main_loop()

    -- Periodic heartbeat so ReaSet.html can auto-detect this script is alive
    _hb_tick = _hb_tick + 1
    if _hb_tick % 150 == 0 then
        reaper.SetExtState(SEC, "nativeLoopReady", "1", false)
    end

    local ctrl = reaper.GetExtState(SEC, "nativeLoop")

    -- ── "on": ReaSet wants to start or re-arm a loop ──────────────────────────
    if ctrl == "on" then
        local ls = tonumber(reaper.GetExtState(SEC, "loopStart"))
        local le = tonumber(reaper.GetExtState(SEC, "loopEnd"))
        local lm = tonumber(reaper.GetExtState(SEC, "loopMax")) or 0

        if ls and le and le > ls then
            local new_key = string.format("%.5f:%.5f:%d", ls, le, lm)
            if new_key ~= s_key then
                arm_session(ls, le, lm)
            end
        end
    end

    -- ── Monitor active session ─────────────────────────────────────────────────
    if s_active then

        -- Cancellation signal from ReaSet
        if ctrl == "off" then
            do_cleanup()
            reaper.defer(main_loop)
            return
        end

        local ps = reaper.GetPlayState()  -- 0=stop 1=play 2=pause 4=rec 5=rec+play

        if ps == 0 then
            -- Playback stopped — clean up and return to idle
            do_cleanup()
            reaper.defer(main_loop)
            return
        end

        if ps ~= 2 then
            -- Playing or recording: detect loop crossings
            local pos = reaper.GetPlayPosition()

            if not s_near_end then
                -- Arm the detector when approaching the loop boundary
                if pos >= (s_end - NEAR_END) then
                    s_near_end = true
                end
            else
                -- Check if playhead jumped back to the start region
                if pos >= (s_start - 0.10) and pos <= (s_start + NEAR_START) then
                    s_crosses  = s_crosses + 1
                    s_near_end = false

                    if s_max > 0 and s_crosses >= s_max then
                        -- All iterations complete
                        do_cleanup()
                        reaper.defer(main_loop)
                        return
                    end
                elseif pos > s_start + NEAR_START then
                    -- Missed the confirmation window; reset gate
                    s_near_end = false
                end
            end
        end
        -- ps == 2 (paused): do nothing this tick, stay alive
    end

    reaper.defer(main_loop)
end

-- ─── Boot ─────────────────────────────────────────────────────────────────────
-- Clear any stale "on" state from a previous REAPER session
local stale = reaper.GetExtState(SEC, "nativeLoop")
if stale == "on" then
    reaper.SetExtState(SEC, "nativeLoop", "done", false)
end

-- Announce presence immediately so ReaSet.html auto-activates native loop mode.
-- Uses non-persistent ExtState (last arg = false): vanishes when REAPER closes,
-- so ReaSet correctly falls back to JS loop next session if script is not loaded.
reaper.SetExtState(SEC, "nativeLoopReady", "1", false)

reaper.defer(main_loop)
