# renoise.SampleKeyTrackingModulationDevice<a name="renoise.SampleKeyTrackingModulationDevice"></a>  

<!-- toc -->
  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> **READ-ONLY** Fixed name of the device.

### short_name : [`string`](../../API/builtins/string.md)<a name="short_name"></a>
> **READ-ONLY**

### display_name : [`string`](../../API/builtins/string.md)<a name="display_name"></a>
> Configurable device display name.

### display_name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="display_name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### enabled : [`boolean`](../../API/builtins/boolean.md)<a name="enabled"></a>
> **Deprecated.** Use `is_active` instead.

### enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_active : [`boolean`](../../API/builtins/boolean.md)<a name="is_active"></a>
> not active = bypassed

### is_active_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="is_active_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_maximized : [`boolean`](../../API/builtins/boolean.md)<a name="is_maximized"></a>
> Maximize state in modulation chain.

### is_maximized_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="is_maximized_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### target : [`renoise.SampleModulationDevice.TargetType`](renoise.SampleModulationDevice.md#TargetType)<a name="target"></a>
> **READ-ONLY** Where the modulation gets applied (Volume,
> Pan, Pitch, Cutoff, Resonance).

### operator : [`renoise.SampleModulationDevice.OperatorType`](renoise.SampleModulationDevice.md#OperatorType)<a name="operator"></a>
> Modulation operator: how the device applies.

### operator_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="operator_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### bipolar : [`boolean`](../../API/builtins/boolean.md)<a name="bipolar"></a>
> Modulation polarity:
> when bipolar, the device applies it's values in a -1 to 1 range,
> when unipolar in a 0 to 1 range.

### bipolar_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="bipolar_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### tempo_sync_switching_allowed : [`boolean`](../../API/builtins/boolean.md)<a name="tempo_sync_switching_allowed"></a>
> **READ-ONLY** When true, the device has one of more time parameters,
> which can be switched to operate in synced or unsynced mode.
>  see also field tempo_synced.

### tempo_synced : [`boolean`](../../API/builtins/boolean.md)<a name="tempo_synced"></a>
> When true and the device supports sync switching the device operates
> in wall-clock (ms) instead of beat times.
> see also property 'tempo_sync_switching_allowed'

### tempo_synced_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="tempo_synced_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_active_parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="is_active_parameter"></a>
> **READ-ONLY** Generic access to all parameters of this device.

### parameters : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)[]<a name="parameters"></a>
> **READ-ONLY**

### min : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="min"></a>
> with range (0-119)

### max : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="max"></a>
> with range (0-119)

  

---  
## Functions
### init([*self*](../../API/builtins/self.md))<a name="init"></a>
> Reset the device to its default state.
### copy_from([*self*](../../API/builtins/self.md), other_device : [`renoise.SampleModulationDevice`](../../API/renoise/renoise.SampleModulationDevice.md))<a name="copy_from"></a>
> Copy a device's state from another device. 'other_device' must be of the
> same type.
### parameter([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="parameter"></a>
`->`[`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)  

> Access to a single parameter by index. Use properties 'parameters' to iterate
> over all parameters and to query the parameter count.  

