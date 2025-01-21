# renoise.InstrumentTriggerOptions<a name="renoise.InstrumentTriggerOptions"></a>  

<!-- toc -->
  
## Constants
### QuantizeMode<a name="QuantizeMode"></a>
> ```lua
> {
>     QUANTIZE_NONE: integer = 1,
>     QUANTIZE_LINE: integer = 2,
>     QUANTIZE_BEAT: integer = 3,
>     QUANTIZE_BAR: integer = 4,
> }
> ```
  

---  
## Properties
### available_scale_modes : [`string`](../../API/builtins/string.md)[]<a name="available_scale_modes"></a>
> **READ-ONLY** List of all available scale modes.

### scale_mode : [`string`](../../API/builtins/string.md)<a name="scale_mode"></a>
> one of 'available_scales']

### scale_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="scale_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### scale_key : [`integer`](../../API/builtins/integer.md)<a name="scale_key"></a>
> Scale-key to use when transposing (1=C, 2=C#, 3=D, ...)

### scale_key_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="scale_key_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### quantize : [`renoise.InstrumentTriggerOptions.QuantizeMode`](renoise.InstrumentTriggerOptions.md#QuantizeMode)<a name="quantize"></a>
> Trigger quantization mode.

### quantize_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="quantize_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### monophonic : [`boolean`](../../API/builtins/boolean.md)<a name="monophonic"></a>
> Mono/Poly mode.

### monophonic_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="monophonic_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### monophonic_glide : [`integer`](../../API/builtins/integer.md)<a name="monophonic_glide"></a>
> Glide amount when monophonic. 0 == off, 255 = instant

### monophonic_glide_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="monophonic_glide_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

