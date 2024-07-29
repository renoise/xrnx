# renoise.DeviceParameter  
A single parameter within an audio DSP effect (renoise.AudioDevice)  
## Constants
### Polarity {#Polarity}
```lua
{
    POLARITY_UNIPOLAR: integer = 1,
    POLARITY_BIPOLAR: integer = 2,
}
```
  

---  
## Properties
### is_automatable : [`boolean`](/API/builtins/boolean.md) {#is_automatable}
**READ-ONLY**

### is_automated : [`boolean`](/API/builtins/boolean.md) {#is_automated}
**READ-ONLY** Is automated. Not valid for parameters of instrument devices.

### is_automated_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#is_automated_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### is_midi_mapped : [`boolean`](/API/builtins/boolean.md) {#is_midi_mapped}
**READ-ONLY** Parameter has a custom MIDI mapping in the current song.

### is_midi_mapped_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#is_midi_mapped_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### name : [`string`](/API/builtins/string.md) {#name}
**READ-ONLY**

### polarity : [`renoise.DeviceParameter.Polarity`](renoise.DeviceParameter.md#Polarity) {#polarity}
**READ-ONLY**

### show_in_mixer : [`boolean`](/API/builtins/boolean.md) {#show_in_mixer}
-
Show in mixer. Not valid for parameters of instrument devices.

### show_in_mixer_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#show_in_mixer_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### time_quantum : [`number`](/API/builtins/number.md) {#time_quantum}
**READ-ONLY**

### value : [`number`](/API/builtins/number.md) {#value}
value in Range: (value_min - value_max)

### value_default : [`number`](/API/builtins/number.md) {#value_default}
**READ-ONLY**

### value_max : [`number`](/API/builtins/number.md) {#value_max}
**READ-ONLY**

### value_min : [`number`](/API/builtins/number.md) {#value_min}
**READ-ONLY**

### value_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#value_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### value_quantum : [`number`](/API/builtins/number.md) {#value_quantum}
**READ-ONLY**

### value_string : [`string`](/API/builtins/string.md) {#value_string}
### value_string_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#value_string_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `record_value`([*self*](/API/builtins/self.md), value : [`number`](/API/builtins/number.md)) {#record_value}
Set a new value and write automation when the MIDI mapping
"record to automation" option is set. Only works for parameters
of track devices, not for instrument devices.  

