# renoise.InstrumentMacroMapping<a name="renoise.InstrumentMacroMapping"></a>  

<!-- toc -->
  
## Constants
### Scaling<a name="Scaling"></a>
> ```lua
> {
>     SCALING_LOG_FAST: integer = 1,
>     SCALING_LOG_SLOW: integer = 2,
>     SCALING_LINEAR: integer = 3,
>     SCALING_EXP_SLOW: integer = 4,
>     SCALING_EXP_FAST: integer = 5,
> }
> ```
  

---  
## Properties
### parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="parameter"></a>
> **READ-ONLY** Linked parameter.
> Can be a sample FX- or modulation parameter. Never nil.

### parameter_min : [`number`](../../API/builtins/number.md)<a name="parameter_min"></a>
> Range: (0 - 1)

### parameter_min_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="parameter_min_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### parameter_max : [`number`](../../API/builtins/number.md)<a name="parameter_max"></a>
> Range: (0 - 1)

### parameter_max_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="parameter_max_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### parameter_scaling : [`renoise.InstrumentMacroMapping.Scaling`](renoise.InstrumentMacroMapping.md#Scaling)<a name="parameter_scaling"></a>
> Scaling which gets applied within the min/max range to set the dest value.

### parameter_scaling_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="parameter_scaling_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

