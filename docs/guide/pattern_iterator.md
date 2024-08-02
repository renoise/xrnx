# PatternIterator

## Change notes in selection

changes all "C-4"s to "E-4" in the selection in the current pattern

```lua
local pattern_iter = renoise.song().pattern_iterator
local pattern_index =  renoise.song().selected_pattern_index

for pos,line in pattern_iter:lines_in_pattern(pattern_index) do
  for _,note_column in pairs(line.note_columns) do 
    if (note_column.is_selected and 
        note_column.note_string == "C-4") then
      note_column.note_string = "E-4"
    end
  end
end
```

## Generate a simple arp sequence

... repeating in the current pattern & track from line 0 to the pattern end

```lua
local pattern_iter = renoise.song().pattern_iterator

local pattern_index =  renoise.song().selected_pattern_index
local track_index =  renoise.song().selected_track_index
local instrument_index = renoise.song().selected_instrument_index

local EMPTY_VOLUME = renoise.PatternLine.EMPTY_VOLUME
local EMPTY_INSTRUMENT = renoise.PatternLine.EMPTY_INSTRUMENT

local arp_sequence = {
  {note="C-4", instrument = instrument_index, volume = 0x20}, 
  {note="E-4", instrument = instrument_index, volume = 0x40}, 
  {note="G-4", instrument = instrument_index, volume = 0x80}, 
  {note="OFF", instrument = EMPTY_INSTRUMENT, volume = EMPTY_VOLUME}, 
  {note="G-4", instrument = instrument_index, volume = EMPTY_VOLUME}, 
  {note="---", instrument = EMPTY_INSTRUMENT, volume = EMPTY_VOLUME}, 
  {note="E-4", instrument = instrument_index, volume = 0x40}, 
  {note="C-4", instrument = instrument_index, volume = 0x20}, 
}

for pos,line in pattern_iter:lines_in_pattern_track(pattern_index, track_index) do
  if not table.is_empty(line.note_columns) then

    local note_column = line:note_column(1)
    note_column:clear()
    
    local arp_index = math.mod(pos.line - 1, #arp_sequence) + 1
    note_column.note_string = arp_sequence[arp_index].note
    note_column.instrument_value = arp_sequence[arp_index].instrument
    note_column.volume_value = arp_sequence[arp_index].volume
  end
end
```

## Hide empty volume, panning, and delay colums

```lua
for track_index, track in pairs(renoise.song().tracks) do 
  -- Set some bools
  local found_volume = false
  local found_panning = false
  local found_delay = false
  local found_sample_effects = false
  -- Check whether or not this is a regular track
  if
    track.type ~= renoise.Track.TRACK_TYPE_MASTER and
    track.type ~= renoise.Track.TRACK_TYPE_SEND
  then
    -- Iterate through the regular track
    local iter = renoise.song().pattern_iterator:lines_in_track(track_index)
    for _,line in iter do
      -- Check whether or not the line is empty
      if not line.is_empty then
        -- Check each column on the line
        for _,note_column in ipairs(line.note_columns) do
          -- Check for volume 
          if  note_column.volume_value ~= renoise.PatternLine.EMPTY_VOLUME then
            found_volume = true
          end
          -- Check for panning 
          if note_column.panning_value ~= renoise.PatternLine.EMPTY_PANNING then
            found_panning = true
          end
          -- Check for delay
          if note_column.delay_value ~= renoise.PatternLine.EMPTY_DELAY then
            found_delay = true
          end
          -- Check for sample effects
          if note_column.effect_number_value ~= renoise.PatternLine.EMPTY_EFFECT_NUMBER then
            found_sample_effects = true
          end
          if note_column.effect_amount_value ~= renoise.PatternLine.EMPTY_EFFECT_AMOUNT then
            found_sample_effects = true
          end
          
        end
        -- If we found something in all three vol, pan, and del
        -- Then there's no point in continuing down the rest of the track 
        -- We break this loop and move on to the next track
        if found_volume and found_panning and found_delay and found_sample_effects then
          break
        end
      end
    end
    -- Set some properties
    track.volume_column_visible = found_volume
    track.panning_column_visible = found_panning
    track.delay_column_visible = found_delay
    track.sample_effects_column_visible = found_sample_effects
  end
end
```