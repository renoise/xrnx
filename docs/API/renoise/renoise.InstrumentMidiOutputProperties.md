# renoise.InstrumentMidiOutputProperties  

<!-- toc -->
  
## Constants
### Type {#Type}
> ```lua
> {
>     TYPE_EXTERNAL: integer = 1,
>     TYPE_LINE_IN_RET: integer = 2,
>     TYPE_INTERNAL: integer = 3,
> }
> ```
  

---  
## Properties
### bank : [`integer`](../../API/builtins/integer.md) {#bank}
> Range: (1 - 65536) 0 = OFF

### bank_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#bank_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### channel : [`integer`](../../API/builtins/integer.md) {#channel}
> Range: (1 - 16)

### channel_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#channel_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### delay : [`integer`](../../API/builtins/integer.md) {#delay}
> Range: (0 - 100)

### delay_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#delay_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### device_name : [`string`](../../API/builtins/string.md) {#device_name}
>  When setting new devices, device names must be one of:
>  renoise.Midi.available_output_devices.
>  Devices are automatically opened when needed. To close a device, set its name
>  to "", e.g. an empty string.

### device_name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#device_name_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### duration : [`integer`](../../API/builtins/integer.md) {#duration}
> Range: (1 - 8000) 8000 = INF

### duration_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#duration_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### instrument_type : [`renoise.InstrumentMidiOutputProperties.Type`](renoise.InstrumentMidiOutputProperties.md#Type) {#instrument_type}
>  Note: ReWire device always start with "ReWire: " in the device_name and
>  will always ignore the instrument_type and channel properties. MIDI
>  channels are not configurable for ReWire MIDI, and instrument_type will
>  always be "TYPE_INTERNAL" for ReWire devices.

### instrument_type_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#instrument_type_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### program : [`integer`](../../API/builtins/integer.md) {#program}
> Range: (1 - 128) 0 = OFF

### program_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#program_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### transpose : [`integer`](../../API/builtins/integer.md) {#transpose}
> Range: (-120 - 120)

### transpose_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#transpose_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

  

