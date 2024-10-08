# renoise.SampleModulationDevice  

<!-- toc -->
  
## Constants
### TargetType {#TargetType}
> ```lua
> {
>     TARGET_VOLUME: integer = 1,
>     TARGET_PANNING: integer = 2,
>     TARGET_PITCH: integer = 3,
>     TARGET_CUTOFF: integer = 4,
>     TARGET_RESONANCE: integer = 5,
>     TARGET_DRIVE: integer = 6,
> }
> ```
### OperatorType {#OperatorType}
> ```lua
> {
>     OPERATOR_ADD: integer = 1,
>     OPERATOR_SUB: integer = 2,
>     OPERATOR_MUL: integer = 3,
>     OPERATOR_DIV: integer = 4,
> }
> ```
  

---  
## Properties
### name : [`string`](../../API/builtins/string.md) {#name}
> **READ-ONLY** Fixed name of the device.

### short_name : [`string`](../../API/builtins/string.md) {#short_name}
> **READ-ONLY**

### display_name : [`string`](../../API/builtins/string.md) {#display_name}
> Configurable device display name.

### display_name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#display_name_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### enabled : [`boolean`](../../API/builtins/boolean.md) {#enabled}
### enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#enabled_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_active : [`boolean`](../../API/builtins/boolean.md) {#is_active}
> not active = bypassed

### is_active_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#is_active_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_maximized : [`boolean`](../../API/builtins/boolean.md) {#is_maximized}
> Maximize state in modulation chain.

### is_maximized_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#is_maximized_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### target : [`renoise.SampleModulationDevice.TargetType`](renoise.SampleModulationDevice.md#TargetType) {#target}
> **READ-ONLY** Where the modulation gets applied (Volume,
> Pan, Pitch, Cutoff, Resonance).

### operator : [`renoise.SampleModulationDevice.OperatorType`](renoise.SampleModulationDevice.md#OperatorType) {#operator}
> Modulation operator: how the device applies.

### operator_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#operator_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### bipolar : [`boolean`](../../API/builtins/boolean.md) {#bipolar}
> Modulation polarity:
> when bipolar, the device applies it's values in a -1 to 1 range,
> when unipolar in a 0 to 1 range.

### bipolar_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#bipolar_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### tempo_sync_switching_allowed : [`boolean`](../../API/builtins/boolean.md) {#tempo_sync_switching_allowed}
> **READ-ONLY** When true, the device has one of more time parameters,
> which can be switched to operate in synced or unsynced mode.
>  see also field tempo_synced.

### tempo_synced : [`boolean`](../../API/builtins/boolean.md) {#tempo_synced}
> When true and the device supports sync switching the device operates
> in wall-clock (ms) instead of beat times.
> see also property 'tempo_sync_switching_allowed'

### tempo_synced_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#tempo_synced_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_active_parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#is_active_parameter}
> **READ-ONLY** Generic access to all parameters of this device.

### parameters : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)[] {#parameters}
> **READ-ONLY**

  

---  
## Functions
### init([*self*](../../API/builtins/self.md)) {#init}
> Reset the device to its default state.
### copy_from([*self*](../../API/builtins/self.md), other_device : [`renoise.SampleModulationDevice`](../../API/renoise/renoise.SampleModulationDevice.md)) {#copy_from}
> Copy a device's state from another device. 'other_device' must be of the
> same type.
### parameter([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#parameter}
`->`[`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)  

> Access to a single parameter by index. Use properties 'parameters' to iterate
> over all parameters and to query the parameter count.  

