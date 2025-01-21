# renoise.InstrumentMidiOutputProperties<a name="renoise.InstrumentMidiOutputProperties"></a>  

<!-- toc -->
  
## Constants
### Type<a name="Type"></a>
> ```lua
> {
>     TYPE_EXTERNAL: integer = 1,
>     TYPE_LINE_IN_RET: integer = 2,
>     TYPE_INTERNAL: integer = 3,
> }
> ```
  

---  
## Properties
### instrument_type : [`renoise.InstrumentMidiOutputProperties.Type`](renoise.InstrumentMidiOutputProperties.md#Type)<a name="instrument_type"></a>
>  Note: ReWire device always start with "ReWire: " in the device_name and
>  will always ignore the instrument_type and channel properties. MIDI
>  channels are not configurable for ReWire MIDI, and instrument_type will
>  always be "TYPE_INTERNAL" for ReWire devices.

### instrument_type_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="instrument_type_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### device_name : [`string`](../../API/builtins/string.md)<a name="device_name"></a>
>  When setting new devices, device names must be one of:
>  renoise.Midi.available_output_devices.
>  Devices are automatically opened when needed. To close a device, set its name
>  to "", e.g. an empty string.

### device_name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="device_name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### channel : [`integer`](../../API/builtins/integer.md)<a name="channel"></a>
> Range: (1 - 16)

### channel_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="channel_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### transpose : [`integer`](../../API/builtins/integer.md)<a name="transpose"></a>
> Range: (-120 - 120)

### transpose_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="transpose_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### program : [`integer`](../../API/builtins/integer.md)<a name="program"></a>
> Range: (1 - 128) 0 = OFF

### program_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="program_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### bank : [`integer`](../../API/builtins/integer.md)<a name="bank"></a>
> Range: (1 - 65536) 0 = OFF

### bank_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="bank_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### delay : [`integer`](../../API/builtins/integer.md)<a name="delay"></a>
> Range: (0 - 100)

### delay_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="delay_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### duration : [`integer`](../../API/builtins/integer.md)<a name="duration"></a>
> Range: (1 - 8000) 8000 = INF

### duration_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="duration_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

