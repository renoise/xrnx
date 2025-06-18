# renoise.DeviceParameter<a name="renoise.DeviceParameter"></a>  
> A single parameter within an audio DSP effect (renoise.AudioDevice)  

<!-- toc -->
  
## Constants
### Polarity<a name="Polarity"></a>
> ```lua
> {
>     POLARITY_UNIPOLAR: integer = 1,
>     POLARITY_BIPOLAR: integer = 2,
> }
> ```
  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> **READ-ONLY**

### name_observable : [`renoise.Document.ObservableString`](../../API/renoise/renoise.Document.ObservableString.md)<a name="name_observable"></a>
### polarity : [`renoise.DeviceParameter.Polarity`](renoise.DeviceParameter.md#Polarity)<a name="polarity"></a>
> **READ-ONLY**

### value_min : [`number`](../../API/builtins/number.md)<a name="value_min"></a>
> **READ-ONLY**

### value_max : [`number`](../../API/builtins/number.md)<a name="value_max"></a>
> **READ-ONLY**

### value_quantum : [`number`](../../API/builtins/number.md)<a name="value_quantum"></a>
> **READ-ONLY**

### value_default : [`number`](../../API/builtins/number.md)<a name="value_default"></a>
> **READ-ONLY**

### time_quantum : [`number`](../../API/builtins/number.md)<a name="time_quantum"></a>
> **READ-ONLY**

### is_automatable : [`boolean`](../../API/builtins/boolean.md)<a name="is_automatable"></a>
> **READ-ONLY**

### is_automated : [`boolean`](../../API/builtins/boolean.md)<a name="is_automated"></a>
> **READ-ONLY** Is automated. Not valid for parameters of instrument devices.

### is_automated_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="is_automated_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_midi_mapped : [`boolean`](../../API/builtins/boolean.md)<a name="is_midi_mapped"></a>
> **READ-ONLY** Parameter has a custom MIDI mapping in the current song.

### is_midi_mapped_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="is_midi_mapped_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### show_in_mixer : [`boolean`](../../API/builtins/boolean.md)<a name="show_in_mixer"></a>
> Show in mixer. Not valid for parameters of instrument devices.

### show_in_mixer_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="show_in_mixer_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### value : [`number`](../../API/builtins/number.md)<a name="value"></a>
> value in Range: (value_min - value_max)

### value_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="value_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### value_string : [`string`](../../API/builtins/string.md)<a name="value_string"></a>
### value_string_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="value_string_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### record_value([*self*](../../API/builtins/self.md), value : [`number`](../../API/builtins/number.md))<a name="record_value"></a>
> Set a new value and write automation when the MIDI mapping
> "record to automation" option is set. Only works for parameters
> of track devices, not for instrument devices.  

