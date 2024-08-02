# renoise.InstrumentMacroMapping  
## Constants
### Scaling {#Scaling}
```lua
{
    SCALING_LOG_FAST: integer = 1,
    SCALING_LOG_SLOW: integer = 2,
    SCALING_LINEAR: integer = 3,
    SCALING_EXP_SLOW: integer = 4,
    SCALING_EXP_FAST: integer = 5,
}
```
  

---  
## Properties
### parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#parameter}
**READ-ONLY** Linked parameter.
Can be a sample FX- or modulation parameter. Never nil.

### parameter_max : [`number`](../../API/builtins/number.md) {#parameter_max}
Range: (0 - 1)

### parameter_max_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#parameter_max_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### parameter_min : [`number`](../../API/builtins/number.md) {#parameter_min}
Range: (0 - 1)

### parameter_min_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#parameter_min_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### parameter_scaling : [`renoise.InstrumentMacroMapping.Scaling`](renoise.InstrumentMacroMapping.md#Scaling) {#parameter_scaling}
Scaling which gets applied within the min/max range to set the dest value.

### parameter_scaling_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#parameter_scaling_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

