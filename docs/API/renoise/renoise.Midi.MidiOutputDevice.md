# renoise.Midi.MidiOutputDevice<a name="renoise.Midi.MidiOutputDevice"></a>  
> Midi device interface for sending MIDI messages.
> Instances are created via `renoise.Midi.create_output_device`  

<!-- toc -->
  

---  
## Properties
### is_open : [`boolean`](../../API/builtins/boolean.md)<a name="is_open"></a>
> Returns true while the device is open (ready to send or receive messages).
> Your device refs will never be auto-closed, "is_open" will only be false if
> you explicitly call "midi_device:close()" to release a device.

### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> The name of a device. This is the name you create a device with via
> `renoise.Midi.create_input_device` or `renoise.Midi.create_output_device`.

  

---  
## Functions
### close([*self*](../../API/builtins/self.md))<a name="close"></a>
> Close a running MIDI device. When no other client is using a device, Renoise
> will also shut off the device driver so that, for example, Windows OS other
> applications can use the device again. This is automatically done when
> scripts are closed or your device objects are garbage collected.
### send([*self*](../../API/builtins/self.md), message : [`integer`](../../API/builtins/integer.md)[])<a name="send"></a>
> Send raw 1-3 byte MIDI messages or sysex messages. Message is expected
> to be an array of numbers. It must not be empty and can only contain
> numbers >= 0 and <= 0xFF (bytes). Sysex messages must be sent in one block,
> and must start with 0xF0, and end with 0xF7.  

