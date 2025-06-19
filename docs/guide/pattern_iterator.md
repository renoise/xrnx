
## Generate a simple arp sequence

This example generates a repeating arpeggio in the current pattern and track.

```lua
local song = renoise.song()
local pattern_iter = song.pattern_iterator

local pattern_index = song.selected_pattern_index
local track_index = song.selected_track_index
local instrument_index = song.selected_instrument_index

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

## Hide empty volume, panning, and delay columns

This example iterates through all tracks and hides the Volume, Panning, Delay, and Effects columns if they are not used.

```lua
for track_index, track in ipairs(renoise.song().tracks) do 
  -- Only process regular sequence tracks
  if (track.type == renoise.Track.TRACK_TYPE_SEQUENCER) then
    local found_volume = false
    local found_panning = false
    local found_delay = false
    local found_sample_effects = false
    
    local iter = renoise.song().pattern_iterator:lines_in_track(track_index)
    for _,line in iter do
      if not line.is_empty then
        for _,note_column in ipairs(line.note_columns) do
          if note_column.volume_is_set then found_volume = true end
          if note_column.panning_is_set then found_panning = true end
          if note_column.delay_is_set then found_delay = true end
          if note_column.effect_is_set then found_sample_effects = true end
        end
        
        -- If we found content in all columns, we can stop searching this track
        if found_volume and found_panning and found_delay and found_sample_effects then
          break
        end
      end
    end
    
    -- Set column visibility based on what was found
    track.volume_column_visible = found_volume
    track.panning_column_visible = found_panning
    track.delay_column_visible = found_delay
    track.sample_effects_column_visible = found_sample_effects
  end
end
```
