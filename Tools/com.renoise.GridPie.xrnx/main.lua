require "toolbox"

--[[ Globals, capitalized for easier recognition, alphabetical order ]]--

local DBUG_MODE = false
local DISABLE_POLYRHYTHMS = false
local GRIDPIE_IDX = nil
local INDICATORS = table.create()
local MATRIX_CELLS = table.create()
local MATRIX_HEIGHT = 8
local MATRIX_WIDTH = 8
local MY_INTERFACE = nil
local POLY_COUNTER = table.create()
local REVERT_PM_SLOT = table.create()
local SPECIAL_PATTERN_NAME = "__GRID_PIE__"
local VB = nil
local X_POS = 1
local Y_POS = 1

--------------------------------------------------------------------------------
-- Debug print
--------------------------------------------------------------------------------

function dbug(msg)
  if DBUG_MODE == false then return end
  local base_types = {
    ["nil"]=true, ["boolean"]=true, ["number"]=true,
    ["string"]=true, ["thread"]=true, ["table"]=true
  }
  if not base_types[type(msg)] then oprint(msg)
  elseif type(msg) == 'table' then rprint(msg)
  else print(msg) end
end


--------------------------------------------------------------------------------
-- Keyboard input
--------------------------------------------------------------------------------

function key_handler(dialog, key)

  if (key.name == "esc") then
    dialog:close()
  else
    return key
  end

end


--------------------------------------------------------------------------------
-- Is garbage Pattern Matrix position?
--------------------------------------------------------------------------------

function is_garbage_pos(x, y)

  local sequencer = renoise.song().sequencer
  local total_sequence = #sequencer.pattern_sequence

  if
    renoise.song().sequencer.pattern_sequence[y] == nil or
    renoise.song().tracks[x] == nil or
    renoise.song().tracks[x].type == renoise.Track.TRACK_TYPE_MASTER or
    renoise.song().tracks[x].type == renoise.Track.TRACK_TYPE_SEND or
    total_sequence == y
  then
    -- Is garbage
    return true
  else
    -- Is not garbage
    return false
  end

end


--------------------------------------------------------------------------------
-- Access a cell in the Grid Pie
--------------------------------------------------------------------------------

function matrix_cell(x, y)

  if (MATRIX_CELLS[x] ~= nil) then
    return MATRIX_CELLS[x][y]
  else
    return nil
  end
end


--------------------------------------------------------------------------------
-- Toggle all slot mutes in Pattern Matrix
--------------------------------------------------------------------------------

function init_pm_slots_to(muted)

  local rns = renoise.song()
  local tracks = rns.tracks
  local sequencer = rns.sequencer
  local total_tracks = #tracks
  local total_sequence = #sequencer.pattern_sequence

  for x = 1, total_tracks do
    if
      tracks[x].type ~= renoise.Track.TRACK_TYPE_MASTER and
      tracks[x].type ~= renoise.Track.TRACK_TYPE_SEND
    then
      for y = 1, total_sequence do
        local tmp = x .. ',' .. y
        if muted and rns.sequencer:track_sequence_slot_is_muted(x, y) then
        -- Store original state
          REVERT_PM_SLOT[tmp] = true
        end
        rns.sequencer:set_track_sequence_slot_is_muted(x , y, muted)
        if not muted and REVERT_PM_SLOT ~= nil and REVERT_PM_SLOT[tmp] ~= nil then
          -- Revert to original state
          rns.sequencer:set_track_sequence_slot_is_muted(x , y, true)
        end
      end
    end
  end

end


--------------------------------------------------------------------------------
-- Initialize Grid Pie Pattern
--------------------------------------------------------------------------------

function init_gp_pattern()

  local rns = renoise.song()
  local tracks = rns.tracks
  local total_tracks = #tracks
  local sequencer = rns.sequencer
  local total_sequence = #sequencer.pattern_sequence
  local last_pattern = rns.sequencer:pattern(total_sequence)

  if rns.patterns[last_pattern].name ~= SPECIAL_PATTERN_NAME then
    -- Create new pattern
    local new_pattern = rns.sequencer:insert_new_pattern_at(total_sequence + 1)
    rns.patterns[new_pattern]:clear()
    rns.patterns[new_pattern].name = SPECIAL_PATTERN_NAME
    GRIDPIE_IDX = new_pattern
    total_sequence = total_sequence + 1
  else
    -- Clear pattern, unmute slot
    rns.patterns[last_pattern]:clear()
    rns.patterns[last_pattern].name = SPECIAL_PATTERN_NAME
    for x = 1, total_tracks do
      rns.sequencer:set_track_sequence_slot_is_muted(x , total_sequence, false)
    end
    GRIDPIE_IDX = last_pattern
  end
 

  -- Cleanup any other pattern named __GRID_PIE__
  for x = 1, total_sequence - 1 do
    local tmp = rns.sequencer:pattern(x)

    if rns.patterns[tmp].name:find(SPECIAL_PATTERN_NAME) ~= nil then
      rns.patterns[tmp].name = ""
    end
  end

  -- Ajdust the Renoise interface, move playhead to last pattern, ...
  renoise.app().window.pattern_matrix_is_visible = true
  rns.selected_sequence_index = #sequencer.pattern_sequence
  rns.transport.follow_player = false
  rns.transport.loop_pattern = true
  rns.transport:start(renoise.Transport.PLAYMODE_RESTART_PATTERN)

end


--------------------------------------------------------------------------------
-- Adjust grid
--------------------------------------------------------------------------------

function adjust_grid()

  local rns = renoise.song()
  for x = X_POS, MATRIX_WIDTH + X_POS - 1 do
    local mtx_x = x - X_POS + 1
    for y = Y_POS, MATRIX_HEIGHT + Y_POS - 1 do
      -- Cell
      local cell = matrix_cell(mtx_x, y - Y_POS + 1)
      if cell ~= nil and not is_garbage_pos(x, y) then
        local slot_is_muted = rns.sequencer:track_sequence_slot_is_muted(x, y)
        if slot_is_muted then cell.color = { 0, 0, 0 }
        else cell.color = { 0, 255, 0 } end
      elseif cell ~= nil then
         cell.color = { 0, 0, 0 }
      end
    end
    -- Indicator
    local indicator = INDICATORS[mtx_x]
    if indicator ~= nil and not is_garbage_pos(x, Y_POS) then
      local track_is_empty = rns.patterns[GRIDPIE_IDX].tracks[x].is_empty
      if track_is_empty then indicator.color = { 0, 0, 0 }
      else indicator.color = { 255, 255, 0 } end
    elseif indicator ~= nil then
      indicator.color = { 0, 0, 0 }
    end
  end
  rns.selected_track_index = X_POS
  rns.selected_sequence_index = Y_POS

end


--------------------------------------------------------------------------------
-- Copy and expand a track
--------------------------------------------------------------------------------

function copy_and_expand(source_pattern, dest_pattern, track_idx, number_of_lines)

  local source_track = source_pattern:track(track_idx)
  local dest_track = dest_pattern:track(track_idx)

  if number_of_lines == nil then
    number_of_lines = source_pattern.number_of_lines
  end

  if source_pattern ~= dest_pattern then
    dest_track:copy_from(source_track)
  end

  if dest_pattern.number_of_lines <= number_of_lines then
    return
  end

  local multiplier = math.floor(dest_pattern.number_of_lines / number_of_lines) - 1
  local to_line = 1
  local approx_line = 1

  for i=1, number_of_lines do
    for j=1, multiplier do

      to_line = i + number_of_lines * j
      local source_line = dest_track:line(i)
      local dest_line = dest_track:line(to_line)

      -- Copy the top of pattern to the expanded lines
      if not source_line.is_empty then
        dest_line:copy_from(source_line)
      end

      -- Copy the top of the automations to the expanded lines
      for _,automation in pairs(dest_track.automation) do
        for _,point in pairs(automation.points) do
          approx_line = math.floor(point.time)
          if approx_line == i then
            automation:add_point_at(to_line + point.time - approx_line, point.value)
          elseif approx_line > i then
            break
          end
        end
      end

    end
  end

end


--------------------------------------------------------------------------------
-- Toggler
--------------------------------------------------------------------------------

function toggler(x, y)

  local cell = matrix_cell(x, y)
  local muted = false
  if cell ~= nil and cell.color[2] == 255 then muted = true end

  x = x + (X_POS - 1)
  y = y + (Y_POS - 1)

  if is_garbage_pos(x, y) then return end

  local rns = renoise.song()
  local source = rns.patterns[rns.sequencer:pattern(y)]
  local dest = rns.patterns[GRIDPIE_IDX]
  if dest == nil then
    abort()
    return
  end
  local lc = least_common(dest.number_of_lines, source.number_of_lines)
  local toc = 0

  if muted then

    -- Mute
    -- TODO: This is a hackaround, fix when API is updated
    -- See: http://www.renoise.com/board/index.php?showtopic=31927
    rns.tracks[x].mute_state = renoise.Track.MUTE_STATE_OFF
    rns.patterns[GRIDPIE_IDX].tracks[x]:clear()
    OneShotIdleNotifier(100, function() rns.tracks[x].mute_state = renoise.Track.MUTE_STATE_ACTIVE end)
    POLY_COUNTER[x] = nil

  else

    -- Track polyrhythms
    POLY_COUNTER[x] = source.number_of_lines
    local poly_lines = table.create()
    for _,val in ipairs(POLY_COUNTER:values()) do poly_lines[val] = true end
    local poly_num = table.count(poly_lines)

    if poly_num > 1 then
      renoise.app():show_status("Grid Pie " .. poly_num .. "x poly combo!")
    else
      renoise.app():show_status("")
    end

    if
      DISABLE_POLYRHYTHMS or
      lc > renoise.Pattern.MAX_NUMBER_OF_LINES or
      poly_num <= 1 or
      (lc == source.number_of_lines and lc == dest.number_of_lines)
    then

      -- Simple copy
      dest.number_of_lines = source.number_of_lines
      dest.tracks[x]:copy_from(source.tracks[x])

    else

      -- Complex copy
      local old_lines = dest.number_of_lines
      dest.number_of_lines = lc

      if DBUG_MODE then dbug("Expanding track " .. x .. " from " .. source.number_of_lines .. " to " .. dest.number_of_lines .. " lines") end
      OneShotIdleNotifier(0, function()
        copy_and_expand(source, dest, x)
      end)

      if old_lines < dest.number_of_lines then
        for idx=1,#rns.tracks do
          if
            idx ~= x and
            not dest.tracks[idx].is_empty and
            rns.tracks[idx].type ~= renoise.Track.TRACK_TYPE_MASTER and
            rns.tracks[idx].type ~= renoise.Track.TRACK_TYPE_SEND
          then
            if DBUG_MODE then dbug("Also expanding track " .. idx .. " from " .. old_lines .. " to " .. dest.number_of_lines .. " lines") end
            copy_and_expand(dest, dest, idx, old_lines)
          end
        end
      end

    end

  end

  -- Change PM
  for i = 1, #rns.sequencer.pattern_sequence - 1 do
    if not is_garbage_pos(x, i) then
      if i == y then
        rns.sequencer:set_track_sequence_slot_is_muted(x , i, muted)
      else
        rns.sequencer:set_track_sequence_slot_is_muted(x , i, true)
      end
    end
  end
  adjust_grid()

end


--------------------------------------------------------------------------------
-- Build GUI Interface
--------------------------------------------------------------------------------

function build_interface()

  -- Init VB
  VB = renoise.ViewBuilder()

  local max_x = renoise.song().sequencer_track_count - MATRIX_WIDTH + 1
  if max_x < 1 then max_x = 1 end

  local max_y = #renoise.song().sequencer.pattern_sequence - MATRIX_HEIGHT
  if max_y < 1 then max_y = 1 end

  -- Reset
  X_POS = 1
  Y_POS = 1

  -- Buttons
  local button_view = VB:row {
    VB:text {
      text = "x:",
      font = "mono",
    },
    VB:valuebox {
      id = "gp_x",
      min = 1,
      max = max_x,
      value = X_POS,
      notifier = function(val)
        X_POS = val
        adjust_grid()
      end,
      midi_mapping = "Grid Pie:X Axis",
    },
    VB:text {
      text = " y:",
      font = "mono",
    },
    VB:valuebox {
      id = "gp_y",
      min = 1,
      max = max_y,
      value = Y_POS,
      notifier = function(val)
        Y_POS = val
        adjust_grid()
      end,
      midi_mapping = "Grid Pie:Y Axis",
    },
  }

  -- Matrix
  local matrix_view = VB:row { }
  for x = 1, MATRIX_WIDTH do
    local column = VB:column {  margin = 2, spacing = 2, }
    MATRIX_CELLS[x] = table.create()
    for y = 1, MATRIX_HEIGHT do
      MATRIX_CELLS[x][y] = VB:button {
        width = 35,
        height = 35,
        pressed = function()
          toggler(x, y)
        end,
        midi_mapping = "Grid Pie:Slice " .. x .. "," .. y,
      }
      column:add_child(MATRIX_CELLS[x][y])
    end
    matrix_view:add_child(column)
  end

  -- Indicators
  local indicators_view = VB:row { spacing = 29, margin = 2 }
  for x = 1, MATRIX_WIDTH do
     INDICATORS[x] = VB:button {
       width = 10,
       height = 10,
     }
     indicators_view:add_child(INDICATORS[x])
  end

  -- Assmble all the racks
  local rack = VB:column {
    uniform = true,
    margin = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN,
    spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,

    VB:column {
      VB:horizontal_aligner {
        mode = "center",
        button_view,
      },
    },

    VB:space { height = 10 },

    VB:column {
      VB:horizontal_aligner {
        mode = "center",
        matrix_view,
      },
    },

    VB:column {
      VB:horizontal_aligner {
        mode = "center",
        indicators_view,
      },
    },


  }

  -- Show dialog
  MY_INTERFACE = renoise.app():show_custom_dialog("Grid Pie", rack, key_handler)

end


--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------

function main(x, y)

  if
    not VB or
    x ~= MATRIX_WIDTH or
    y ~= MATRIX_HEIGHT
  then
    if MY_INTERFACE and MY_INTERFACE.visible then
      init_pm_slots_to(false)
      MY_INTERFACE:close()
    end
    MATRIX_WIDTH = x
    MATRIX_HEIGHT = y
    REVERT_PM_SLOT = table.create()
    POLY_COUNTER = table.create()
    init_pm_slots_to(true)
    init_gp_pattern()
    build_interface()
  end
  run()

end



--------------------------------------------------------------------------------
-- Abort
--------------------------------------------------------------------------------

function abort()

  renoise.app():show_message(
    "Unexpected problem! Usually triggered by moving or deleting the special Grid Pie pattern, and Grid Pie needs to be restarted."
  )
  if MY_INTERFACE and MY_INTERFACE.visible then MY_INTERFACE:close() end

end


--------------------------------------------------------------------------------
-- Handle track change
--------------------------------------------------------------------------------

function tracks_changed(notification)

  -- Tracks have changed, stored slots are invalid, reset table
  REVERT_PM_SLOT = table.create()

  if (notification.type == "insert") then
    -- TODO: This is a hackaround, fix when API is updated
    -- See: http://www.renoise.com/board/index.php?showtopic=31893
    OneShotIdleNotifier(100, function()
      for i = 1, #renoise.song().sequencer.pattern_sequence - 1 do
        renoise.song().sequencer:set_track_sequence_slot_is_muted(notification.index , i, true)
      end
    end)
  end
end

--------------------------------------------------------------------------------
-- Handle sequence change
--------------------------------------------------------------------------------

function sequence_changed(notification)

  -- Sequence have changed, stored slots are invalid, reset table
  REVERT_PM_SLOT = table.create()

end


--------------------------------------------------------------------------------
-- Handle document change
--------------------------------------------------------------------------------

function document_changed(notification)

  -- Document has changed, stored slots are invalid, reset table
  REVERT_PM_SLOT = table.create()
  abort()

end

--------------------------------------------------------------------------------
-- Idler
--------------------------------------------------------------------------------

function idler(notification)

  if (not VB or not MY_INTERFACE or not MY_INTERFACE.visible) then
    stop()
    return
  end

  local last_pattern = renoise.song().sequencer:pattern(#renoise.song().sequencer.pattern_sequence)
  if renoise.song().patterns[last_pattern].name ~= SPECIAL_PATTERN_NAME then
    abort()
  else

    VB.views.gp_x.max = renoise.song().sequencer_track_count - MATRIX_WIDTH + 1
    if VB.views.gp_x.max < 1 then VB.views.gp_x.max = 1 end
    if VB.views.gp_x.value > VB.views.gp_x.max then
      VB.views.gp_x.value = VB.views.gp_x.max
      adjust_grid()
    end

    VB.views.gp_y.max = #renoise.song().sequencer.pattern_sequence - MATRIX_HEIGHT
    if VB.views.gp_y.max < 1 then VB.views.gp_y.max = 1 end
    if VB.views.gp_y.value > VB.views.gp_y.max then
      VB.views.gp_x.value = VB.views.gp_x.max
      adjust_grid()
    end

  end

end


--------------------------------------------------------------------------------
-- Bootsauce
--------------------------------------------------------------------------------

function run()

  -- Observers init
  if not (renoise.tool().app_idle_observable:has_notifier(idler)) then
    renoise.tool().app_idle_observable:add_notifier(idler)
  end
  if not (renoise.song().tracks_observable:has_notifier(tracks_changed)) then
    renoise.song().tracks_observable:add_notifier(tracks_changed)
  end
  if not (renoise.song().sequencer.pattern_sequence_observable:has_notifier(sequence_changed)) then
    renoise.song().sequencer.pattern_sequence_observable:add_notifier(sequence_changed)
  end
  if not (renoise.tool().app_release_document_observable:has_notifier(document_changed)) then
    renoise.tool().app_release_document_observable:add_notifier(document_changed)
  end

end


function stop()

  -- Revert PM
  init_pm_slots_to(false)

  -- Observers takedown
  if (renoise.tool().app_idle_observable:has_notifier(idler)) then
    renoise.tool().app_idle_observable:remove_notifier(idler)
  end
  if (renoise.song().tracks_observable:has_notifier(tracks_changed)) then
    renoise.song().tracks_observable:remove_notifier(tracks_changed)
  end
  if (renoise.song().sequencer.pattern_sequence_observable:has_notifier(sequence_changed)) then
    renoise.song().sequencer.pattern_sequence_observable:remove_notifier(sequence_changed)
  end
  if (renoise.tool().app_release_document_observable:has_notifier(document_changed)) then
    renoise.tool().app_release_document_observable:remove_notifier(document_changed)
  end

  -- Destroy VB
  VB = nil

end


--------------------------------------------------------------------------------
-- MIDI Mappings
--------------------------------------------------------------------------------

renoise.tool():add_midi_mapping{
  name = "Grid Pie:X Axis",
  invoke = function(message)
    if not VB then
     return
    elseif message.int_value >= 0 and message.int_value <= 128 then
      -- Knob? Then scale
      local tmp = 1 + (message.int_value / 127) * (VB.views.gp_x.max - 1) -- Scale
      VB.views.gp_x.value = math.floor(tmp * 1 + 0.5) / 1 -- Round to int
    elseif message:is_trigger() then
      -- Button? Then increment
      if VB.views.gp_x.value == VB.views.gp_x.max then
        VB.views.gp_x.value = 1
      else
        local tmp = VB.views.gp_x.value + MATRIX_WIDTH
        if tmp > VB.views.gp_x.max then
          VB.views.gp_x.value = VB.views.gp_x.max
        else
          VB.views.gp_x.value = tmp
        end
      end
    end
  end
}


renoise.tool():add_midi_mapping{
  name = "Grid Pie:Y Axis",
  invoke = function(message)
    if not VB then
     return
    elseif message.int_value >= 0 and message.int_value <= 128 then
      -- Knob? Then scale
      local tmp = 1 + (message.int_value / 127) * (VB.views.gp_y.max - 1) -- Scale
      VB.views.gp_y.value = math.floor(tmp * 1 + 0.5) / 1 -- Round to int
    elseif message:is_trigger() then
      -- Button? Then increment
      if VB.views.gp_y.value == VB.views.gp_y.max then
        VB.views.gp_y.value = 1
      else
        local tmp = VB.views.gp_y.value + MATRIX_HEIGHT
        if tmp > VB.views.gp_y.max then
          VB.views.gp_y.value = VB.views.gp_y.max
        else
          VB.views.gp_y.value = tmp
        end
      end
    end
  end
}


for x = 1, MATRIX_WIDTH do
  for y = 1, MATRIX_HEIGHT do
    renoise.tool():add_midi_mapping{
      name = "Grid Pie:Slice " .. x .. "," .. y,
      invoke = function(message)
        if not VB then
          return
        elseif (message:is_trigger()) then
          toggler(x, y)
        end
      end
    }
  end
end


--------------------------------------------------------------------------------
-- Menu Registration
--------------------------------------------------------------------------------

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Grid Pie:4x2...",
  invoke = function() main(4, 2) end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Grid Pie:4x4...",
  invoke = function() main(4, 4) end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Grid Pie:8x2...",
  invoke = function() main(8, 2) end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Grid Pie:8x5...",
  invoke = function() main(8, 5) end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Grid Pie:8x8...",
  invoke = function() main(8, 8) end
}