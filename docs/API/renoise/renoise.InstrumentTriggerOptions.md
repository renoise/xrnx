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

### mts_esp_tuning : [`boolean`](../../API/builtins/boolean.md)<a name="mts_esp_tuning"></a>
> When true, act as MTS ESP client. Disables custom tunings.

### mts_esp_tuning_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="mts_esp_tuning_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### tuning : [`number`](../../API/builtins/number.md)[]<a name="tuning"></a>
> Array of custom pitch values relative to 1/1, used as custom tuning values for
> instrument sample playback. The root key is assumed to be middle C (48 in Renoise),
> The scale will be repeated, so only one octave of values should be defined. An
> octave may contain more or less than 12 notes.
> 
> When set mts_esp_tuning is disabled. Set an empty table to disable custom tuning
> using default 12-TET tuning instead.
> 
> Use property `tuning_name` to give your custom tuning a name.
> 
> #### examples:
> ```lua
> -- Andreas Werckmeister's temperament III (the most famous one, 1681)
> local well_tempered_tuning = {
>   256/243, 1.117403, 32/27, 1.252827, 4/3, 1024/729,
>   1.494927, 128/81, 1.670436, 16/9, 1.879241, 2/1
> }
> instrument.tuning = well_tempered_tuning
> ```

### tuning_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="tuning_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### tuning_name : [`string`](../../API/builtins/string.md)<a name="tuning_name"></a>
> Name, as displayed in the UI for a custom tuning or a tuning loaded from a file.

### tuning_name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="tuning_name_observable"></a>
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

  

---  
## Functions
### load_tuning([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_tuning"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load and apply a scala tuning file as custom tuning. Disables `mts_esp_tuning`.
> Any errors during the export are shown to the user.  

