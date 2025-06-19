# The Renoise Song

The `renoise.song()` function is the main entry point for scripting in Renoise. It returns a [`renoise.Song`](../API/renoise/renoise.Song.md) object that represents the entire project currently loaded in the application. 

Here is a simplified tree view of the song object model:

```
renoise.song()
├── transport              (BPM, LPB, playback control)
├── tracks[]               (List of all tracks in the song)
│   ├── devices[]
│   │   └── parameters[]
│   └── ...
├── instruments[]          (List of all instruments)
│   ├── samples[]
│   │   └── sample_buffer
│   ├── sample_device_chains[]
│   └── ...
├── patterns[]             (The pool of all available patterns)
│   └── tracks[]
│       ├── lines[]
│       │   ├── note_columns[]
│       │   └── ...
│       └── automation[]
├── sequencer              (The pattern sequence matrix)
│   └── pattern_sequence[]
└── selected_track         (And other `selected_...` properties)
```

Let's look at some important components in more detail.

## Transport

The [`renoise.Transport`](../API/renoise/renoise.Transport.md) object controls global song properties related to timing and playback.

```lua
local song = renoise.song()
local transport = song.transport

-- Read properties
print("Current BPM: " .. transport.bpm)
print("Current LinesPerBeat: " .. transport.lpb)

-- Change properties
transport.bpm = 140

-- Start playback
if not transport.playing then
  transport:start(renoise.Transport.PLAYMODE_RESTART_PATTERN)
end
```

## Tracks

The `renoise.song().tracks` property is a list of all tracks in the song, including sequencer tracks, group tracks, send tracks, the master track. Each [`renoise.Track`](../API/renoise/renoise.Track.md) has its own device chain and other properties.

```lua
local song = renoise.song()

-- Iterate over all tracks
for _, track in ipairs(song.tracks) do
  -- Check the track type
  if track.type == renoise.Track.TRACK_TYPE_SEQUENCER then
    print("Sequencer Track: " .. track.name)
    -- Access the track's device chain
    local devices = track.devices
    print("  - Devices: " .. #devices)
  end
end

-- Access a specific track by its index (1-based)
local first_track = song.tracks[1]
first_track.name = "New Name" -- Set the track's name
```

### Track Devices and Parameters

Once you have a device chain, you can iterate over its ([`renoise.AudioDevice`](../API/renoise/renoise.AudioDevice.md)) and ([`renoise.DeviceParameter`](../API/renoise/renoise.DeviceParameter.md)). The first device in a track's chain is always the "Mixer" device, which contains the track's built-in parameters like volume and panning.

```lua
local selected_track = renoise.song().selected_track
local mixer_device = selected_track.devices[1]

print("Parameters for '" .. mixer_device.display_name .. "':")
for _, param in ipairs(mixer_device.parameters) do
  print(string.format("  - %s: %s", param.name, param.value_string))
end
```

### Modifying Parameter Values

You can read and write a parameter's value using its `.value` (a number from 0.0 to 1.0) or `.value_string` (a formatted string like "1.000 dB") properties.

Also, the Mixer device properties can also be accessed directly from the track object.

```lua
local selected_track = renoise.song().selected_track

-- Access a parameter by its property name on the track object
local pre_volume = selected_track.prefx_volume
print("Pre-Mixer Volume is: " .. pre_volume.value_string)

-- Set the value using a string
pre_volume.value_string = "1.0 dB"
-- Note: When reading the value back, the string may be formatted differently
assert(pre_volume.value_string == "1.000 dB")

-- Set the value using a normalized number
local pre_width = selected_track.prefx_width
pre_width.value = 1.0 -- 100% wide
assert(pre_width.value == 1.0)
```

### Adding, Removing, and Swapping Devices

You can dynamically manage the devices in a chain. To add a device, you need its identifier path, which you can query via `track.available_devices`.

```lua
local track = renoise.song().selected_track

print("Available devices:")
rprint(track.available_devices)

-- Get a random device path (excluding plugins to avoid popups)
local device_path
repeat
  device_path = track.available_devices[
    math.random(1, #track.available_devices)]
until (device_path:find("Native/"))

-- Insert the device at the end of the chain
local device_count = #track.devices
local new_device = track:insert_device_at(
  device_path, device_count + 1)
assert(#track.devices == device_count + 1)
print("Added device: " .. new_device.display_name)

-- Insert another one
track:insert_device_at(device_path, #track.devices + 1)

-- Swap the last two devices
track:swap_devices_at(#track.devices, #track.devices - 1)
print("Swapped the last two devices.")

-- Remove the last device
track:delete_device_at(#track.devices)
print("Removed the last added device.")
```

### PatternTrack Lines

A [`renoise.PatternTrack`](../API/renoise/renoise.PatternTrack.md) holds pattern lines and automations for a single track in a single pattern.

The following example writes a C-4 note in the first pattern's track.

```lua
local song = renoise.song()

-- Get the first pattern in the song
local pattern = song.patterns[1]

-- Get the first pattern track within that pattern
local pattern_track = pattern.tracks[1]

-- Access a specific line (1-based)
local line = pattern_track:line(1)

-- Access the first note column in that line
local note_column = line.note_columns[1]
if note_column then
  -- Set a C-4 note
  note_column.note_string = "C-4"
end
```

For efficiently iterating over pattern data, it's recommended to use the [`renoise.PatternIterator`](../API/renoise/renoise.PatternIterator.md).

This example changes all "C-4" notes to "E-4" within the *current selection* in the pattern editor.

```lua
local song = renoise.song()
local pattern_iter = song.pattern_iterator
local pattern_index = song.selected_pattern_index

for pos,line in pattern_iter:lines_in_pattern(pattern_index) do
  for _,note_column in ipairs(line.note_columns) do 
    if (note_column.is_selected and 
        note_column.note_string == "C-4") then
      note_column.note_string = "E-4"
    end
  end
end
```

### PatternTrack Automation

A [`renoise.PatternTrackAutomation`](../API/renoise/renoise.PatternTrackAutomation.md) automates track device parameters. 

This example accesses the automation for the parameter currently selected in the "Automation" tab in Renoise. Note that the example code uses `song.selected_parameter`, which is deprecated. You should use `song.selected_automation_parameter` in new scripts.

```lua
local song = renoise.song()
local selected_track_parameter = song.selected_parameter
local selected_pattern_track = song.selected_pattern_track

-- Is a parameter selected?
if selected_track_parameter then
  local automation = selected_pattern_track:find_automation(
    selected_track_parameter)

  -- Check if automation for the selected parameter already exists
  if not automation then
    -- If not, create it for the current pattern/track
    automation = selected_pattern_track:create_automation(
      selected_track_parameter)
  end

  ---- Do something with the automation ----
  
  -- Iterate over all existing automation points
  for _,point in ipairs(automation.points) do
    print(("track automation: time=%s, value=%s"):format( 
      point.time, point.value))
  end
  
  -- Clear all points
  automation.points = {} 

  -- Insert a single new point at line 2
  automation:add_point_at(2, 0.5) 
  -- Change its value if it already exists
  automation:add_point_at(2, 0.8) 
  -- Remove it again (must exist at this time)
  automation:remove_point_at(2) 
  
  -- Batch creation/insertion of points
  local new_points = {}
  for i=1, #selected_pattern_track.lines do
    table.insert(new_points, {
      time = i, 
      value = i / automation.length
    })
  end
  
  -- Assign them (note: new_points must be sorted by time)
  automation.points = new_points 

  -- Change the automation's interpolation mode
  automation.playmode =
    renoise.PatternTrackAutomation.PLAYMODE_POINTS
end
```

## Instruments

The `renoise.song().instruments` property contains a list of all instruments. An [`renoise.Instrument`](../API/renoise/renoise.Instrument.md) can contain samples, phrases, modulation, and DSP FX chains.

```lua
local song = renoise.song()

-- Get the selected instrument
local instrument = song.selected_instrument
if instrument then
  print("Selected instrument: " .. instrument.name)
  
  -- Access its samples
  if #instrument.samples > 0 then
    print("  - It has " .. #instrument.samples .. " samples.")
    local first_sample = instrument.samples[1]
    print("    - First sample name: " .. first_sample.name)
  end
end
```

### Samples

The [`renoise.SampleBuffer`](../API/renoise/renoise.SampleBuffer.md) object provides low-level access to the audio data of a sample.

This example inverts the phase of the selected sample data.

```lua
local sample = renoise.song().selected_sample
if not sample then 
  print("No sample selected") 
  return
end

local sample_buffer = sample.sample_buffer
if not sample_buffer.has_sample_data then 
  print("No sample buffer present")
  return
end

-- Before modifying sample data, let Renoise prepare for undo/redo actions
sample_buffer:prepare_sample_data_changes()

-- Modify sample data in the selection (defaults to the whole sample)
for channel = 1, sample_buffer.number_of_channels do
  for frame = sample_buffer.selection_start, sample_buffer.selection_end do
    local value = sample_buffer:sample_data(channel, frame)
    value = -value -- Invert the sample value
    sample_buffer:set_sample_data(channel, frame, value)
  end
end

-- Let Renoise know the changes are done. This updates UI overviews,
-- applies bit-depth quantization, and finalizes the undo/redo data.
sample_buffer:finalize_sample_data_changes()
```

This example creates a new sample from scratch and generates a simple sine wave.

```lua
local selected_sample = renoise.song().selected_sample
if not selected_sample then return end

local sample_buffer = selected_sample.sample_buffer

-- Define properties for the new sample data
local sample_rate = 44100
local num_channels = 1
local bit_depth = 32
local num_frames = sample_rate / 2 -- half a second

-- Create new or overwrite existing sample data
local allocation_succeeded = sample_buffer:create_sample_data(
  sample_rate, bit_depth, num_channels, num_frames)
  
-- Check for allocation failures
if not allocation_succeeded then
  renoise.app():show_error("Out of memory. Failed to allocate sample data.")
  return
end

-- Let Renoise know we are about to change the sample buffer
sample_buffer:prepare_sample_data_changes()
  
-- Fill the sample data with a sine wave
for frame = 1, num_frames do
  -- We only have one channel, so we use 1
  local sample_value = math.sin((frame / num_frames) * math.pi * 2)
  sample_buffer:set_sample_data(1, frame, sample_value)
end

-- Finalize the changes
sample_buffer:finalize_sample_data_changes()

-- Set up a ping-pong loop for our new sample
selected_sample.loop_mode = renoise.Sample.LOOP_MODE_PING_PONG
selected_sample.loop_start = 1
selected_sample.loop_end = num_frames
```

## Sequencer

The [`renoise.PatternSequencer`](../API/renoise/renoise.PatternSequencer.md) manages the arrangement of patterns in the song. 

The `pattern_sequence` property is a list of pattern indices that defines the playback order.

```lua
local song = renoise.song()
local sequencer = song.sequencer

print("Song sequence:")
for position, pattern_index in ipairs(sequencer.pattern_sequence) do
  print(string.format("  Position %d: Pattern %d", position, pattern_index))
end

-- Set a new sequence
sequencer.pattern_sequence = { 1, 1 }

-- Change the sequence: make the second slot play pattern 2
sequencer:set_pattern(2, 2)

-- Add a new slot at the end of the sequence, playing pattern 3
sequencer:insert_sequence_at(#sequencer.pattern_sequence + 1, 3)
```

## Selected Elements

The song object also provides convenient properties to directly access elements that are currently selected in the Renoise user interface. This is very useful for creating tools that operate on the user's current context.

```lua
local song = renoise.song()

-- Get the currently selected track object
local selected_track = song.selected_track
print("Selected track: " .. selected_track.name)

-- Get the index of the selected pattern
local selected_pattern_index = song.selected_pattern_index
print("Selected pattern index: " .. selected_pattern_index)

-- Get the selected device in a track's device chain
local selected_device = song.selected_track_device
if selected_device then
  print("Selected device: " .. selected_device.display_name)
end
```
