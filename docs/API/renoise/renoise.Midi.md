# renoise.Midi<a name="renoise.Midi"></a>  
> Raw MIDI IO support for scripts in Renoise; the ability to send and receive
> MIDI data.  

<!-- toc -->
  

---  
## Functions
### `available_input_devices()`<a name="available_input_devices"></a>
`->`[`string`](../../API/builtins/string.md)[]  

> Return a list of strings with currently available MIDI input devices.
> This list can change when devices are hot-plugged.
> See `renoise.Midi.devices_changed_observable`
### `available_output_devices()`<a name="available_output_devices"></a>
`->`[`string`](../../API/builtins/string.md)[]  

> Return a list of strings with currently available MIDI output devices.
> This list can change when devices are hot-plugged.
> See `renoise.Midi.devices_changed_observable`
### `devices_changed_observable()`<a name="devices_changed_observable"></a>
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

> Fire notifications as soon as new devices become active or a previously
> added device gets removed/unplugged.
> This will only happen on Linux and OSX with real devices. On Windows this
> may happen when using ReWire slaves. ReWire adds virtual MIDI devices to
> Renoise.
> Already opened references to devices which are no longer available will
> do nothing: you can use them as before and they will not fire any errors.
> The messages will simply go into the void...
### create_input_device(device_name : [`string`](../../API/builtins/string.md), callback : [`MidiMessageFunction`](#MidiMessageFunction) | [`MidiMessageMethod1`](#MidiMessageMethod1) | [`MidiMessageMethod2`](#MidiMessageMethod2)[`?`](../../API/builtins/nil.md), sysex_callback : [`MidiMessageFunction`](#MidiMessageFunction) | [`MidiMessageMethod1`](#MidiMessageMethod1) | [`MidiMessageMethod2`](#MidiMessageMethod2)[`?`](../../API/builtins/nil.md))<a name="create_input_device"></a>
`->`[`renoise.Midi.MidiInputDevice`](../../API/renoise/renoise.Midi.MidiInputDevice.md)  

> Listen to incoming MIDI data: opens access to a MIDI input device by
> specifying a device name.
> Name must be one of `renoise.Midi.available_input_devices()`.
> 
> One or both callbacks should be valid, and should either point to a function
> with one parameter `function (message: number[]) end`, or a table with an object
> and class `{context, function(context, message: number[]) end}` -> a method.
> 
> All MIDI messages except active sensing will be forwarded to the callbacks.
> When Renoise is already listening to this device, your callback *and* Renoise
> (or even other scripts) will handle the message.
> 
> Messages are received until the device reference is manually closed (see
> renoise.Midi.MidiDevice:close()) or until the MidiInputDevice object gets garbage
> collected.
### create_output_device(device_name : [`string`](../../API/builtins/string.md))<a name="create_output_device"></a>
`->`[`renoise.Midi.MidiOutputDevice`](../../API/renoise/renoise.Midi.MidiOutputDevice.md)  

> Open access to a MIDI device by specifying the device name.
> Name must be one of `renoise.Midi.available_input_devices()`.
> All other device names will fire an error.
> 
> The real device driver gets automatically closed when the MidiOutputDevice
> object gets garbage collected or when the device is explicitly closed
> via midi_device:close() and nothing else references it.  



---  
## Aliases  
### MidiMessage<a name="MidiMessage"></a>
[`integer`](../../API/builtins/integer.md)[]  
  
  
### MidiMessageFunction<a name="MidiMessageFunction"></a>
(message : [`MidiMessage`](#MidiMessage))  
  
  
### MidiMessageMemberContext<a name="MidiMessageMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### MidiMessageMemberFunction<a name="MidiMessageMemberFunction"></a>
(self : [`MidiMessageMemberContext`](#MidiMessageMemberContext), message : [`MidiMessage`](#MidiMessage))  
  
  
### MidiMessageMethod1<a name="MidiMessageMethod1"></a>
{ 1 : [`MidiMessageMemberContext`](#MidiMessageMemberContext), 2 : [`MidiMessageMemberFunction`](#MidiMessageMemberFunction) }  
  
  
### MidiMessageMethod2<a name="MidiMessageMethod2"></a>
{ 1 : [`MidiMessageMemberFunction`](#MidiMessageMemberFunction), 2 : [`MidiMessageMemberContext`](#MidiMessageMemberContext) }  
  
  

