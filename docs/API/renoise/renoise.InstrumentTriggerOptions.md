# renoise.InstrumentTriggerOptions  
## Constants
### QuantizeMode {#QuantizeMode}
```lua
{
    QUANTIZE_NONE: integer = 1,
    QUANTIZE_LINE: integer = 2,
    QUANTIZE_BEAT: integer = 3,
    QUANTIZE_BAR: integer = 4,
}
```
  

---  
## Properties
### available_scale_modes : [`string`](../../API/builtins/string.md)`[]` {#available_scale_modes}
**READ-ONLY** List of all available scale modes.

### monophonic : [`boolean`](../../API/builtins/boolean.md) {#monophonic}
Mono/Poly mode.

### monophonic_glide : [`integer`](../../API/builtins/integer.md) {#monophonic_glide}
Glide amount when monophonic. 0 == off, 255 = instant

### monophonic_glide_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#monophonic_glide_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### monophonic_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#monophonic_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### quantize : [`renoise.InstrumentTriggerOptions.QuantizeMode`](renoise.InstrumentTriggerOptions.md#QuantizeMode) {#quantize}
Trigger quantization mode.

### quantize_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#quantize_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### scale_key : [`integer`](../../API/builtins/integer.md) {#scale_key}
Scale-key to use when transposing (1=C, 2=C#, 3=D, ...)

### scale_key_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#scale_key_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### scale_mode : [`string`](../../API/builtins/string.md) {#scale_mode}
one of 'available_scales']

### scale_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#scale_mode_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

