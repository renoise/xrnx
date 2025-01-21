# renoise.Midi.MidiInputDevice<a name="renoise.Midi.MidiInputDevice"></a>  
> Midi device interface for receiving MIDI messages.
> Instances are created via `renoise.Midi.create_input_device`  

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

