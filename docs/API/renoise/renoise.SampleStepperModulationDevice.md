# renoise.SampleStepperModulationDevice  

<!-- toc -->
  
## Constants
### PlayMode {#PlayMode}
> ```lua
> {
>     PLAYMODE_POINTS: integer = 1,
>     PLAYMODE_LINES: integer = 2,
>     PLAYMODE_CURVES: integer = 3,
> }
> ```
### MIN_NUMBER_OF_POINTS : [`integer`](../../API/builtins/integer.md) {#MIN_NUMBER_OF_POINTS}
### MAX_NUMBER_OF_POINTS : [`integer`](../../API/builtins/integer.md) {#MAX_NUMBER_OF_POINTS}  

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

### external_editor_visible : [`boolean`](../../API/builtins/boolean.md) {#external_editor_visible}
> External editor visibility.
> set to true to show the editor, false to close it

### play_mode : [`renoise.SampleStepperModulationDevice.PlayMode`](renoise.SampleStepperModulationDevice.md#PlayMode) {#play_mode}
> Play mode (interpolation mode).

### play_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#play_mode_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### play_step : [`integer`](../../API/builtins/integer.md) {#play_step}
> Range: (-1 - 16)

### play_step_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#play_step_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### length : [`integer`](../../API/builtins/integer.md) {#length}
> Range: (1 - 256)

### length_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#length_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### points : [`SampleStepperModulationDevice.Point`](#samplesteppermodulationdevice.point)[] {#points}
> Get all points of the envelope. When setting a new list of points,
> items may be unsorted by time, but there may not be multiple points
> for the same time. Returns a copy of the list, so changing
> `points[1].value` will not do anything. Instead, change them via
> `points = { something }`.

### points_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#points_observable}
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

  

---  
## Functions
### parameter([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#parameter}
`->`[`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)  

> Access to a single parameter by index. Use properties 'parameters' to iterate
> over all parameters and to query the parameter count.
### init([*self*](../../API/builtins/self.md)) {#init}
> Reset the envelope back to its default initial state.
### copy_from([*self*](../../API/builtins/self.md), other_device : [`renoise.SampleStepperModulationDevice`](../../API/renoise/renoise.SampleStepperModulationDevice.md)) {#copy_from}
> Copy all properties from another SampleStepperModulation object.
### clear_points([*self*](../../API/builtins/self.md)) {#clear_points}
> Remove all points from the envelope.
### clear_points_in_range([*self*](../../API/builtins/self.md), from_time : [`integer`](../../API/builtins/integer.md), to_time : [`integer`](../../API/builtins/integer.md)) {#clear_points_in_range}
> Remove points in the given [from, to) time range from the envelope.
### copy_points_from([*self*](../../API/builtins/self.md), other_device : [`renoise.SampleStepperModulationDevice`](../../API/renoise/renoise.SampleStepperModulationDevice.md)) {#copy_points_from}
> Copy all points from another SampleStepperModulation object.
### has_point_at([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md)) {#has_point_at}
`->`[`boolean`](../../API/builtins/boolean.md)  

> Test if a point exists at the given time.
### add_point_at([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md), value : [`number`](../../API/builtins/number.md), scaling : [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)) {#add_point_at}
> Add a new point value (or replace any existing value) at time.
### remove_point_at([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md)) {#remove_point_at}
> Removes a point at the given time. Point must exist.  



---  
## Local Structs  
# SampleStepperModulationDevice.Point  

<!-- toc -->
  

---  
## Properties
### time : [`integer`](../../API/builtins/integer.md) {#time}
> Range: (1 - envelope.length)

### value : [`number`](../../API/builtins/number.md) {#value}
> Range: (0.0 - 1.0)

### scaling : [`number`](../../API/builtins/number.md) {#scaling}
> Range: (-1.0 - 1.0)

  

  

