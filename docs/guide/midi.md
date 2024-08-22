# Midi

The Renoise API allows you to access raw MIDI input and output devices from within your tool.
You can use this to add bi-directional MIDI controller support, for example.

## Midi input listener (function callback)

```lua
-- NOTE: the midi device will be closed when the local variable gets garbage
-- collected. Make it global or assign it to something which is held globally
-- to avoid that.
local midi_device = nil

local inputs = renoise.Midi.available_input_devices()
if not table.is_empty(inputs) then
  -- use the first avilable device in this example
  local device_name = inputs[1]
  
  local function midi_callback(message)
    assert(#message == 3)
    assert(message[1] >= 0 and message[1] <= 0xff)
    assert(message[2] >= 0 and message[2] <= 0xff)    
    assert(message[3] >= 0 and message[3] <= 0xff)
    
    print(("%s: got MIDI %X %X %X"):format(device_name, 
      message[1], message[2], message[3]))
  end

  -- note: sysex callback would be a optional 2nd arg...
  midi_device = renoise.Midi.create_input_device(
    device_name, midi_callback)
  
  -- stop dumping with 'midi_device:close()' ...
end
```

## Midi input and sysex listener (class callbacks)

```lua
class "MidiDumper"
  function MidiDumper:__init(device_name)
    self.device_name = device_name
  end
  
  function MidiDumper:start()
    self.device = renoise.Midi.create_input_device(
      self.device_name, 
      { self, MidiDumper.midi_callback }, 
      { MidiDumper.sysex_callback, self }
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
  
-- NOTE: the midi device will be closed when the local variable gets garbage
-- collected. Make it global or assign it to something which is held globally
-- to avoid that.
local midi_dumper = nil
  
local inputs = renoise.Midi.available_input_devices()

if not table.is_empty(inputs) then
  -- use the first avilable device in this example
  local device_name = inputs[1]

  midi_dumper = MidiDumper(device_name)
  -- will dump till midi_dumper:stop() is called or the MidiDumber object 
  -- is garbage collected...
  midi_dumper:start()  
end
```

## Midi output 

```lua
local outputs = renoise.Midi.available_output_devices()
if not table.is_empty(outputs) then
  local device_name = outputs[1]
  local midi_device = renoise.Midi.create_output_device(device_name)
  
  -- note on
  midi_device:send { 0x90, 0x10, 0x7F }
  -- sysex (MMC start)
  midi_device:send { 0xF0, 0x7F, 0x00, 0x06, 0x02, 0xF7 }
 
  -- no longer need the device in this example...
  midi_device:close()  
end
```