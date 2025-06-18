# renoise.SampleEnvelopeModulationDevice<a name="renoise.SampleEnvelopeModulationDevice"></a>  

<!-- toc -->
  
## Constants
### PlayMode<a name="PlayMode"></a>
> ```lua
> {
>     PLAYMODE_POINTS: integer = 1,
>     PLAYMODE_LINES: integer = 2,
>     PLAYMODE_CURVES: integer = 3,
> }
> ```
### LoopMode<a name="LoopMode"></a>
> ```lua
> {
>     LOOP_MODE_OFF: integer = 1,
>     LOOP_MODE_FORWARD: integer = 2,
>     LOOP_MODE_REVERSE: integer = 3,
>     LOOP_MODE_PING_PONG: integer = 4,
> }
> ```
### MIN_NUMBER_OF_POINTS : [`integer`](../../API/builtins/integer.md)<a name="MIN_NUMBER_OF_POINTS"></a>
### MAX_NUMBER_OF_POINTS : [`integer`](../../API/builtins/integer.md)<a name="MAX_NUMBER_OF_POINTS"></a>  

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

### external_editor_visible : [`boolean`](../../API/builtins/boolean.md)<a name="external_editor_visible"></a>
> External editor visibility.
>  set to true to show the editor, false to close it

### play_mode : [`renoise.SampleEnvelopeModulationDevice.PlayMode`](renoise.SampleEnvelopeModulationDevice.md#PlayMode)<a name="play_mode"></a>
> Play mode (interpolation mode).

### play_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="play_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### length : [`integer`](../../API/builtins/integer.md)<a name="length"></a>
> Range: (6 - 1000)

### length_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="length_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_mode : [`renoise.SampleEnvelopeModulationDevice.LoopMode`](renoise.SampleEnvelopeModulationDevice.md#LoopMode)<a name="loop_mode"></a>
> Loop.

### loop_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_start : [`integer`](../../API/builtins/integer.md)<a name="loop_start"></a>
> Range: (1 - envelope.length)

### loop_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_start_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_end : [`integer`](../../API/builtins/integer.md)<a name="loop_end"></a>
> Range: (1 - envelope.length)

### loop_end_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_end_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### sustain_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="sustain_enabled"></a>
> Sustain.

### sustain_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sustain_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### sustain_position : [`integer`](../../API/builtins/integer.md)<a name="sustain_position"></a>
> Range: (1 - envelope.length)

### sustain_position_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sustain_position_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### fade_amount : [`integer`](../../API/builtins/integer.md)<a name="fade_amount"></a>
> Range: (0 - 4095)

### fade_amount_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="fade_amount_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### points : [`SampleEnvelopeModulationDevice.Point`](#sampleenvelopemodulationdevice.point)[]<a name="points"></a>
> Get all points of the envelope. When setting a new list of points,
> items may be unsorted by time, but there may not be multiple points
> for the same time. Returns a copy of the list, so changing
> `points[1].value` will not do anything. Instead, change them via
> `points = { something }` instead.

### points_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="points_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

  

---  
## Functions
### parameter([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="parameter"></a>
`->`[`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)  

> Access to a single parameter by index. Use properties 'parameters' to iterate
> over all parameters and to query the parameter count.
### init([*self*](../../API/builtins/self.md))<a name="init"></a>
> Reset the envelope back to its default initial state.
### copy_from([*self*](../../API/builtins/self.md), other_device : [`renoise.SampleEnvelopeModulationDevice`](../../API/renoise/renoise.SampleEnvelopeModulationDevice.md))<a name="copy_from"></a>
> Copy all properties from another SampleEnvelopeModulation object.
### clear_points([*self*](../../API/builtins/self.md))<a name="clear_points"></a>
> Remove all points from the envelope.
### clear_points_in_range([*self*](../../API/builtins/self.md), from_time : [`integer`](../../API/builtins/integer.md), to_time : [`integer`](../../API/builtins/integer.md))<a name="clear_points_in_range"></a>
> Remove points in the given [from, to) time range from the envelope.
### copy_points_from([*self*](../../API/builtins/self.md), other_device : [`renoise.SampleEnvelopeModulationDevice`](../../API/renoise/renoise.SampleEnvelopeModulationDevice.md))<a name="copy_points_from"></a>
> Copy all points from another SampleEnvelopeModulation object.
### has_point_at([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md))<a name="has_point_at"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Test if a point exists at the given time.
### add_point_at([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md), value : [`number`](../../API/builtins/number.md), scaling : [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md))<a name="add_point_at"></a>
> Add a new point value (or replace any existing value) at time.
### remove_point_at([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md))<a name="remove_point_at"></a>
> Removes a point at the given time. Point must exist.  



---  
## Structs  
# SampleEnvelopeModulationDevice.Point<a name="SampleEnvelopeModulationDevice.Point"></a>  

---  
## Properties
### time : [`integer`](../../API/builtins/integer.md)<a name="time"></a>
> Range: (1 - envelope.length)

### value : [`number`](../../API/builtins/number.md)<a name="value"></a>
> Range: (0.0 - 1.0)

### scaling : [`number`](../../API/builtins/number.md)<a name="scaling"></a>
> Range: (-1.0 - 1.0)

  

  

