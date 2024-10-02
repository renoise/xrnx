# renoise.Track  
> Track component of a Renoise song.  

<!-- toc -->
  
## Constants
### TrackType {#TrackType}
> ```lua
> {
>     TRACK_TYPE_SEQUENCER: integer = 1,
>     TRACK_TYPE_MASTER: integer = 2,
>     TRACK_TYPE_SEND: integer = 3,
>     TRACK_TYPE_GROUP: integer = 4,
> }
> ```
### MuteState {#MuteState}
> ```lua
> {
>     MUTE_STATE_ACTIVE: integer = 1,
>     MUTE_STATE_OFF: integer = 2,
>     MUTE_STATE_MUTED: integer = 3,
> }
> ```
  

---  
## Properties
### type : [`renoise.Track.TrackType`](renoise.Track.md#TrackType) {#type}
> **READ-ONLY**

### name : [`string`](../../API/builtins/string.md) {#name}
> Name, as visible in track headers

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#name_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### color : [`RGBColor`](#RGBColor) {#color}
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo

### color_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#color_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### color_blend : [`integer`](../../API/builtins/integer.md) {#color_blend}
> Range: (0 - 100) Color blend in percent

### color_blend_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#color_blend_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### mute_state : [`renoise.Track.MuteState`](renoise.Track.md#MuteState) {#mute_state}
> Mute and solo states. Not available for the master track.

### mute_state_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#mute_state_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### solo_state : [`boolean`](../../API/builtins/boolean.md) {#solo_state}
### solo_state_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#solo_state_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### prefx_volume : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#prefx_volume}
> **READ-ONLY**

### prefx_panning : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#prefx_panning}
> **READ-ONLY**

### prefx_width : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#prefx_width}
> **READ-ONLY**

### postfx_volume : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#postfx_volume}
> **READ-ONLY**

### postfx_panning : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#postfx_panning}
> **READ-ONLY**

### collapsed : [`boolean`](../../API/builtins/boolean.md) {#collapsed}
> Collapsed/expanded visual appearance.

### collapsed_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#collapsed_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### group_parent : [`renoise.GroupTrack`](../../API/renoise/renoise.GroupTrack.md) {#group_parent}
> **READ-ONLY**

### available_output_routings : [`string`](../../API/builtins/string.md)[] {#available_output_routings}
> **READ-ONLY**

### output_routing : [`string`](../../API/builtins/string.md) {#output_routing}
> One of `available_output_routings`

### output_routing_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#output_routing_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### output_delay : [`number`](../../API/builtins/number.md) {#output_delay}
> Range: (-100.0-100.0) in ms

### output_delay_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#output_delay_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### max_effect_columns : [`integer`](../../API/builtins/integer.md) {#max_effect_columns}
> **READ-ONLY** 8 OR 0 depending on the track type

### min_effect_columns : [`integer`](../../API/builtins/integer.md) {#min_effect_columns}
> **READ-ONLY** 1 OR 0 depending on the track type

### max_note_columns : [`integer`](../../API/builtins/integer.md) {#max_note_columns}
> **READ-ONLY** 12 OR 0 depending on the track type

### min_note_columns : [`integer`](../../API/builtins/integer.md) {#min_note_columns}
> **READ-ONLY** 1 OR 0 depending on the track type

### visible_effect_columns : [`integer`](../../API/builtins/integer.md) {#visible_effect_columns}
> 1-8 OR 0-8, depending on the track type

### visible_effect_columns_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#visible_effect_columns_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### visible_note_columns : [`integer`](../../API/builtins/integer.md) {#visible_note_columns}
> 0 OR 1-12, depending on the track type

### visible_note_columns_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#visible_note_columns_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### volume_column_visible : [`boolean`](../../API/builtins/boolean.md) {#volume_column_visible}
### volume_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#volume_column_visible_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### panning_column_visible : [`boolean`](../../API/builtins/boolean.md) {#panning_column_visible}
### panning_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#panning_column_visible_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### delay_column_visible : [`boolean`](../../API/builtins/boolean.md) {#delay_column_visible}
### delay_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#delay_column_visible_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### sample_effects_column_visible : [`boolean`](../../API/builtins/boolean.md) {#sample_effects_column_visible}
### sample_effects_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#sample_effects_column_visible_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### available_devices : [`string`](../../API/builtins/string.md)[] {#available_devices}
> **READ-ONLY** FX devices this track can handle.

### available_device_infos : [`AudioDeviceInfo`](#audiodeviceinfo)[] {#available_device_infos}
> **READ-ONLY** Array of tables containing information about the devices.

### devices : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)[] {#devices}
> **READ-ONLY** List of audio DSP FX.

### devices_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#devices_observable}
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

  

---  
## Functions
### insert_device_at([*self*](../../API/builtins/self.md), device_path : [`string`](../../API/builtins/string.md), device_index : [`integer`](../../API/builtins/integer.md)) {#insert_device_at}
`->`[`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)  

> Insert a new device at the given position. `device_path` must be one of
> `renoise.Track.available_devices`.
### delete_device_at([*self*](../../API/builtins/self.md), device_index : [`any`](../../API/builtins/any.md)) {#delete_device_at}
> Delete an existing device in a track. The mixer device at index 1 can not
> be deleted from any track.
### swap_devices_at([*self*](../../API/builtins/self.md), device_index1 : [`integer`](../../API/builtins/integer.md), device_index2 : [`integer`](../../API/builtins/integer.md)) {#swap_devices_at}
> Swap the positions of two devices in the device chain. The mixer device at
> index 1 can not be swapped or moved.
### device([*self*](../../API/builtins/self.md), device_index : [`integer`](../../API/builtins/integer.md)) {#device}
`->`[`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)  

> Access to a single device by index. Use property `devices` to iterate
> over all devices and to query the device count.
### mute([*self*](../../API/builtins/self.md)) {#mute}
> Uses default mute state from the prefs. Not for the master track.
### unmute([*self*](../../API/builtins/self.md)) {#unmute}
### solo([*self*](../../API/builtins/self.md)) {#solo}
### column_is_muted([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md)) {#column_is_muted}
`->`[`boolean`](../../API/builtins/boolean.md)  

> Note column mutes. Only valid within (1-track.max_note_columns)
### column_is_muted_observable([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md)) {#column_is_muted_observable}
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

### set_column_is_muted([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md), muted : [`boolean`](../../API/builtins/boolean.md)) {#set_column_is_muted}
### column_name([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md)) {#column_name}
`->`[`string`](../../API/builtins/string.md)  

> Note column names. Only valid within (1-track.max_note_columns)
### column_name_observable([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md)) {#column_name_observable}
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

### set_column_name([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md), name : [`string`](../../API/builtins/string.md)) {#set_column_name}
### swap_note_columns_at([*self*](../../API/builtins/self.md), column_index1 : [`integer`](../../API/builtins/integer.md), column_index2 : [`integer`](../../API/builtins/integer.md)) {#swap_note_columns_at}
> Swap the positions of two note or effect columns within a track.
### swap_effect_columns_at([*self*](../../API/builtins/self.md), column_index1 : [`integer`](../../API/builtins/integer.md), column_index2 : [`integer`](../../API/builtins/integer.md)) {#swap_effect_columns_at}  



---  
## Local Structs  
# AudioDeviceInfo  
> Audio device info  

<!-- toc -->
  

---  
## Properties
### path : [`string`](../../API/builtins/string.md) {#path}
> The device's path used by `renoise.Track:insert_device_at`

### name : [`string`](../../API/builtins/string.md) {#name}
> The device's name

### short_name : [`string`](../../API/builtins/string.md) {#short_name}
> The device's name as displayed in shortened lists

### favorite_name : [`string`](../../API/builtins/string.md) {#favorite_name}
> The device's name as displayed in favorites

### is_favorite : [`boolean`](../../API/builtins/boolean.md) {#is_favorite}
> true if the device is a favorite

### is_bridged : [`boolean`](../../API/builtins/boolean.md) {#is_bridged}
> true if the device is a bridged plugin

  

  



---  
## Local Aliases  
### RGBColor {#RGBColor}
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  

