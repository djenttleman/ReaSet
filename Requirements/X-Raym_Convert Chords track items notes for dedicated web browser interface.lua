--[[
 * ReaScript Name: Convert Chords track items notes for the dedicated web browser interface
 * About: Have a track named chords and text items on it. Run the web interface.
 * Based on: X-Raym's Convert Lyrics script
 * Repository: GitHub > X-Raym > REAPER-ReaScripts
 * Licence: GPL v3
 * REAPER: 5.0
--]]

-- GLOBALS -------------------------------------------------

str_no_text = "--XR-NO-TEXT--"

ext_name = "XR_Chords"
ext_keys = { "text", "next" }

next = false

-- DEBUG

function Msg( val )
  reaper.ShowConsoleMsg( tostring( val ) .. "\n" )
end

-- DEFER

 -- Set ToolBar Button State
function SetButtonState( set )
  if not set then set = 0 end
  local is_new_value, filename, sec, cmd, mode, resolution, val = reaper.get_action_context()
  local state = reaper.GetToggleCommandStateEx( sec, cmd )
  reaper.SetToggleCommandState( sec, cmd, set ) -- Set ON
  reaper.RefreshToolbar2( sec, cmd )
end

function Exit()
  for i, k in ipairs( ext_keys ) do
    reaper.SetProjExtState( 0, ext_name, k, "" )
  end
  SetButtonState()
end

-- FUNCTIONS

function GetChordsTrack()
  local chords_track = nil
  local count_tracks = reaper.CountTracks()
  for i = 0, count_tracks - 1 do
    local track = reaper.GetTrack(0,i)
    local retval, track_name = reaper.GetTrackName( track )
    if track_name:lower() == "chords" then
      chords_track = track
      break
    end
  end
  return chords_track
end

function GetTrackItemAtPos( track, pos )
  local count_track_items = reaper.GetTrackNumMediaItems( track )
  local current_item
  for i = 0, count_track_items - 1 do
    local item = reaper.GetTrackMediaItem( track, i )
    local item_pos = reaper.GetMediaItemInfo_Value( item, "D_POSITION" )
    if item_pos <= pos then -- if item is after cursor then ignore
      local item_len = reaper.GetMediaItemInfo_Value( item, "D_LENGTH" )
      if item_pos + item_len > pos then -- if item end is after cursor, then item is under cursor
        current_item = item
        break
      end
    end
  end
  return current_item
end

function GetNextTrackItem( track, pos, start_item )
  local id_start = start_item and reaper.GetMediaItemInfo_Value( start_item, "IP_ITEMNUMBER" ) or 0
  local count_track_items = reaper.GetTrackNumMediaItems( track )
  local next_item
  for i = id_start, count_track_items - 1 do
    local item = reaper.GetTrackMediaItem( track, i )
    local item_pos = reaper.GetMediaItemInfo_Value( item, "D_POSITION" )
    if item_pos > pos then
      next_item = item
      break
    end
  end
  return next_item
end

function ProcessItemNotes( item, ext_key, text )
  if not item then
    reaper.SetProjExtState( 0, ext_name, ext_key, str_no_text )
    return nil
  end
  local item_notes = reaper.ULT_GetMediaItemNote( item ):gsub("\r?\n", "<br>")
  if item_notes ~= text then
    text = item_notes == "" and str_no_text or item_notes
    reaper.SetProjExtState( 0, ext_name, ext_key, text )
  end
  return text
end


-- Main Function (which loop in background)
function Main()

  -- Get play or edit cursor
  cur_pos = reaper.GetPlayState() > 0 and reaper.GetPlayPosition() or reaper.GetCursorPosition()

  if reaper.ValidatePtr(chords_track, 'MediaTrack*') then

    item = GetTrackItemAtPos( chords_track, cur_pos )
    notes = ProcessItemNotes( item, "text", notes )

    if next then

      next_item = GetNextTrackItem( chords_track, cur_pos, item )
      next_notes = ProcessItemNotes( next_item, "next", next_notes )

    end

  else

    chords_track = GetChordsTrack()

  end

  reaper.defer( Main )

end

-- RUN -----------------------------------------------------

reaper.ClearConsole()

chords_track = GetChordsTrack()

if chords_track then
  SetButtonState( 1 )
  Main()
  reaper.atexit( Exit )
else
  reaper.MB('No tracks named "chords".', "Error", 0)
end
