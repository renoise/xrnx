# renoise.InstrumentMidiInputProperties  

<!-- toc -->
  

---  
## Properties
### device_name : [`string`](../../API/builtins/string.md) {#device_name}
> When setting new devices, device names must be one of
> renoise.Midi.available_input_devices.
> Devices are automatically opened when needed. To close a device, set its
> name to "", e.g. an empty string.

### device_name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#device_name_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### channel : [`integer`](../../API/builtins/integer.md) {#channel}
> Range: (1 - 16) 0 = Omni

### channel_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#channel_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### note_range : [`integer`](../../API/builtins/integer.md)[] {#note_range}
> Table of two numbers in range (0-119) where C-4 is 48

### note_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#note_range_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### assigned_track : [`integer`](../../API/builtins/integer.md) {#assigned_track}
> Range: (1 - song.sequencer_track_count) 0 = Current track

### assigned_track_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#assigned_track_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

  

