# Instruments

The [`renoise.Instrument`](../API/renoise/renoise.Instrument.md) object is a central part of the Renoise API, giving you control over everything from samples and plugins to MIDI properties and macros. This guide covers the most common instrument-related scripting tasks.

## Managing Instruments in a Song

You can add, remove, and reorder instruments in the song's instrument list.

```lua
local song = renoise.song()

-- Insert a new instrument at the end of the list
local new_instr = song:insert_instrument_at(#song.instruments + 1)
new_instr.name = "My New Instrument"

-- Select the newly created instrument
song.selected_instrument_index = #song.instruments
assert(song.selected_instrument.name == "My New Instrument")

-- Swap the first two instruments
if #song.instruments >= 2 then
  song.instruments[1].name = "First"
  song.instruments[2].name = "Second"
  song:swap_instruments_at(1, 2)
  assert(song.instruments[1].name == "Second")
  assert(song.instruments[2].name == "First")
  -- Swap them back
  song:swap_instruments_at(1, 2)
end

-- Delete the instrument we created
song:delete_instrument_at(#song.instruments)
```

## MIDI Input Properties

Each instrument has MIDI input properties that control how it responds to incoming MIDI messages.

```lua
local instrument = renoise.song().selected_instrument
if not instrument then return end

local input_props = instrument.midi_input_properties

-- Set the accepted note range (from C-1 to C-5)
-- Values are MIDI note numbers (0-119)
input_props.note_range = {12, 72}
assert(input_props.note_range[1] == 12)
assert(input_props.note_range[2] == 72)

-- Assign the instrument's output to a specific track
-- 0 means 'Default' (the track the instrument is played on)
input_props.assigned_track = 2 -- Assign to the second track
assert(input_props.assigned_track == 2)
```

## Plugin Properties

You can load VST or AU plugins into an instrument and control them via scripting.

```lua
local instrument = renoise.song().selected_instrument
if not instrument then return end

local plugin_props = instrument.plugin_properties

-- Get a list of available generator plugins
local available_plugins = plugin_props.available_plugins
if #available_plugins == 0 then
  print("No instrument plugins found.")
  return
end

-- Load the first available plugin
local plugin_path = available_plugins[1]
if plugin_props:load_plugin(plugin_path) then
  print("Loaded plugin: " .. plugin_path)
  assert(plugin_props.plugin_loaded == true)
  
  -- Access the loaded plugin as a device
  local plugin_device = plugin_props.plugin_device
  
  -- Show and hide the external editor
  plugin_device.external_editor_visible = true
  plugin_device.external_editor_visible = false
  
  -- You can also access parameters and presets
  local parameters = plugin_device.parameters
  local presets = plugin_device.presets
  print("Plugin has " .. #parameters .. " parameters and " .. #presets .. " presets.")
  
else
  print("Failed to load plugin: " .. plugin_path)
end
```

## Working with Macros

You can access and modify the instrument's eight standard macros, as well as the dedicated MIDI macros.

```lua
local instrument = renoise.song().selected_instrument
if not instrument then return end

-- Access the first standard macro
local macro = instrument.macros[1]

-- Set its name and value
macro.name = "Filter Cutoff"
macro.value = 0.75 -- 75%
assert(macro.name == "Filter Cutoff")
assert(macro.value == 0.75)

-- Access the dedicated MIDI macros
local pitchbend = instrument.pitchbend_macro
pitchbend.value = 0.5 -- Center position
assert(pitchbend.value == 0.5)

local mod_wheel = instrument.modulation_wheel_macro
mod_wheel.value = 1.0 -- Max value
assert(mod_wheel.value == 1.0)
```

## Instrument Comments

Each instrument has a comment field that you can use to store notes or other text.

```lua
local instrument = renoise.song().selected_instrument
if not instrument then return end

-- Set the comments
instrument.comments = {"Line 1: My important note.", "Line 2: Another note."}

-- Read the comments
for i, line in ipairs(instrument.comments) do
  print(string.format("Comment line %d: %s", i, line))
end

-- Clear the comments by assigning an empty table
instrument.comments = {}
assert(#instrument.comments == 0)
```
