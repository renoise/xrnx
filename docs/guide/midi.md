# MIDI

The Renoise API allows you to access raw MIDI input and output devices from within your tool. You can use this to add features like bi-directional MIDI controller support.

See the [`renoise.Midi`](../API/renoise/renoise.Midi.md) API for more details.

## MIDI Input Listener (Function Callback)

```lua
-- NOTE: The MIDI device will be closed when this local variable gets garbage
-- collected. Make it global or assign it to a table that is held globally
-- to keep it active.
local midi_device = nil

local inputs = renoise.Midi.available_input_devices()
if not table.is_empty(inputs) then
  -- Use the first available device in this example
  local device_name = inputs[1]
  
  local function midi_callback(message)
    assert(#message == 3)
    assert(message[1] >= 0 and message[1] <= 0xff)
    assert(message[2] >= 0 and message[2] <= 0xff)    
    assert(message[3] >= 0 and message[3] <= 0xff)
    
    print(("%s: got MIDI %X %X %X"):format(device_name, 
      message[1], message[2], message[3]))
  end

  -- The sysex callback is an optional second argument.
  midi_device = renoise.Midi.create_input_device(
    device_name, midi_callback)
  
  -- To stop listening, call: midi_device:close()
end
```

## MIDI Input and SysEx Listener (Class Callbacks)

```lua
class "MidiDumper"
  function MidiDumper:__init(device_name)
    self.device_name = device_name
    self.device = nil
  end
  
  function MidiDumper:start()
    self.device = renoise.Midi.create_input_device(
      self.device_name, 
      { self, self.midi_callback }, 
      { self, self.sysex_callback }
    )
  end
  
  function MidiDumper:stop()
    if self.device then 
      self.device:close()
      self.device = nil
    end
  end
  
  function MidiDumper:midi_callback(message)
    print(("%s: MidiDumper got MIDI %X %X %X"):format(
      self.device_name, message[1], message[2], message[3]))
  end

  function MidiDumper:sysex_callback(message)
    print(("%s: MidiDumper got SYSEX with %d bytes"):format(
      self.device_name, #message))
  end
  
-- NOTE: The MIDI device will be closed when this dumper object gets garbage
-- collected. Make it global or assign it to a table that is held globally
-- to keep it active.
local midi_dumper = nil
  
local inputs = renoise.Midi.available_input_devices()

if not table.is_empty(inputs) then
  -- Use the first available device in this example
  local device_name = inputs[1]

  midi_dumper = MidiDumper(device_name)
  -- This will dump MIDI messages until midi_dumper:stop() is called
  -- or the MidiDumper object is garbage collected.
  midi_dumper:start()  
end
```

## MIDI Output

```lua
local outputs = renoise.Midi.available_output_devices()
if not table.is_empty(outputs) then
  local device_name = outputs[1]
  local midi_device = renoise.Midi.create_output_device(device_name)
  
  -- Note On
  midi_device:send({ 0x90, 0x10, 0x7F })
  -- SysEx (MMC Start)
  midi_device:send({ 0xF0, 0x7F, 0x00, 0x06, 0x02, 0xF7 })
 
  -- We no longer need the device in this example, so close it.
  midi_device:close()  
end
```
