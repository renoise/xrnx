# renoise.GroupTrack<a name="renoise.GroupTrack"></a>  
> Group track component of a Renoise song.  

<!-- toc -->
  

---  
## Properties
### type : [`renoise.Track.TrackType`](renoise.Track.md#TrackType)<a name="type"></a>
> **READ-ONLY**

### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> Name, as visible in track headers

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### color : [`RGBColor`](#RGBColor)<a name="color"></a>
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo

### color_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="color_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### color_blend : [`integer`](../../API/builtins/integer.md)<a name="color_blend"></a>
> Range: (0 - 100) Color blend in percent

### color_blend_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="color_blend_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### mute_state : [`renoise.Track.MuteState`](renoise.Track.md#MuteState)<a name="mute_state"></a>
> Mute and solo states. Not available for the master track.

### mute_state_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="mute_state_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### solo_state : [`boolean`](../../API/builtins/boolean.md)<a name="solo_state"></a>
### solo_state_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="solo_state_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### prefx_volume : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="prefx_volume"></a>
> **READ-ONLY**

### prefx_panning : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="prefx_panning"></a>
> **READ-ONLY**

### prefx_width : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="prefx_width"></a>
> **READ-ONLY**

### postfx_volume : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="postfx_volume"></a>
> **READ-ONLY**

### postfx_panning : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="postfx_panning"></a>
> **READ-ONLY**

### collapsed : [`boolean`](../../API/builtins/boolean.md)<a name="collapsed"></a>
> Collapsed/expanded visual appearance.

### collapsed_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="collapsed_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### group_parent : [`renoise.GroupTrack`](../../API/renoise/renoise.GroupTrack.md)<a name="group_parent"></a>
> **READ-ONLY**

### available_output_routings : [`string`](../../API/builtins/string.md)[]<a name="available_output_routings"></a>
> **READ-ONLY**

### output_routing : [`string`](../../API/builtins/string.md)<a name="output_routing"></a>
> One of `available_output_routings`

### output_routing_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="output_routing_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### output_delay : [`number`](../../API/builtins/number.md)<a name="output_delay"></a>
> Range: (-100.0-100.0) in ms

### output_delay_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="output_delay_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### max_effect_columns : [`integer`](../../API/builtins/integer.md)<a name="max_effect_columns"></a>
> **READ-ONLY** 8 OR 0 depending on the track type

### min_effect_columns : [`integer`](../../API/builtins/integer.md)<a name="min_effect_columns"></a>
> **READ-ONLY** 1 OR 0 depending on the track type

### max_note_columns : [`integer`](../../API/builtins/integer.md)<a name="max_note_columns"></a>
> **READ-ONLY** 12 OR 0 depending on the track type

### min_note_columns : [`integer`](../../API/builtins/integer.md)<a name="min_note_columns"></a>
> **READ-ONLY** 1 OR 0 depending on the track type

### visible_effect_columns : [`integer`](../../API/builtins/integer.md)<a name="visible_effect_columns"></a>
> 1-8 OR 0-8, depending on the track type

### visible_effect_columns_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="visible_effect_columns_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### visible_note_columns : [`integer`](../../API/builtins/integer.md)<a name="visible_note_columns"></a>
> 0 OR 1-12, depending on the track type

### visible_note_columns_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="visible_note_columns_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### volume_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="volume_column_visible"></a>
### volume_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="volume_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### panning_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="panning_column_visible"></a>
### panning_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="panning_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### delay_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="delay_column_visible"></a>
### delay_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="delay_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### sample_effects_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="sample_effects_column_visible"></a>
### sample_effects_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sample_effects_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### available_devices : [`string`](../../API/builtins/string.md)[]<a name="available_devices"></a>
> **READ-ONLY** FX devices this track can handle.

### available_device_infos : [`AudioDeviceInfo`](#audiodeviceinfo)[]<a name="available_device_infos"></a>
> **READ-ONLY** Array of tables containing information about the devices.

### devices : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)[]<a name="devices"></a>
> **READ-ONLY** List of audio DSP FX.

### devices_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="devices_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### members : [`renoise.Track`](../../API/renoise/renoise.Track.md)[]<a name="members"></a>
> **READ-ONLY** All member tracks of this group, including subgroups and
> their tracks.

### group_collapsed : [`boolean`](../../API/builtins/boolean.md)<a name="group_collapsed"></a>
> Collapsed/expanded visual appearance of whole group.

  

---  
## Functions
### insert_device_at([*self*](../../API/builtins/self.md), device_path : [`string`](../../API/builtins/string.md), device_index : [`integer`](../../API/builtins/integer.md))<a name="insert_device_at"></a>
`->`[`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)  

> Insert a new device at the given position. `device_path` must be one of
> `renoise.Track.available_devices`.
### delete_device_at([*self*](../../API/builtins/self.md), device_index : [`any`](../../API/builtins/any.md))<a name="delete_device_at"></a>
> Delete an existing device in a track. The mixer device at index 1 can not
> be deleted from any track.
### swap_devices_at([*self*](../../API/builtins/self.md), device_index1 : [`integer`](../../API/builtins/integer.md), device_index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_devices_at"></a>
> Swap the positions of two devices in the device chain. The mixer device at
> index 1 can not be swapped or moved.
### device([*self*](../../API/builtins/self.md), device_index : [`integer`](../../API/builtins/integer.md))<a name="device"></a>
`->`[`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)  

> Access to a single device by index. Use property `devices` to iterate
> over all devices and to query the device count.
### mute([*self*](../../API/builtins/self.md))<a name="mute"></a>
> Uses default mute state from the prefs. Not for the master track.
### unmute([*self*](../../API/builtins/self.md))<a name="unmute"></a>
### solo([*self*](../../API/builtins/self.md))<a name="solo"></a>
### column_is_muted([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md))<a name="column_is_muted"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Note column mutes. Only valid within (1-track.max_note_columns)
### column_is_muted_observable([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md))<a name="column_is_muted_observable"></a>
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

### set_column_is_muted([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md), muted : [`boolean`](../../API/builtins/boolean.md))<a name="set_column_is_muted"></a>
### column_name([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md))<a name="column_name"></a>
`->`[`string`](../../API/builtins/string.md)  

> Note column names. Only valid within (1-track.max_note_columns)
### column_name_observable([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md))<a name="column_name_observable"></a>
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

### set_column_name([*self*](../../API/builtins/self.md), column_index : [`integer`](../../API/builtins/integer.md), name : [`string`](../../API/builtins/string.md))<a name="set_column_name"></a>
### swap_note_columns_at([*self*](../../API/builtins/self.md), column_index1 : [`integer`](../../API/builtins/integer.md), column_index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_note_columns_at"></a>
> Swap the positions of two note or effect columns within a track.
### swap_effect_columns_at([*self*](../../API/builtins/self.md), column_index1 : [`integer`](../../API/builtins/integer.md), column_index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_effect_columns_at"></a>  



---  
## Structs  
# AudioDeviceInfo<a name="AudioDeviceInfo"></a>  
> Audio device info  

---  
## Properties
### path : [`string`](../../API/builtins/string.md)<a name="path"></a>
> The device's path used by `renoise.Track:insert_device_at`

### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> The device's name

### short_name : [`string`](../../API/builtins/string.md)<a name="short_name"></a>
> The device's name as displayed in shortened lists

### favorite_name : [`string`](../../API/builtins/string.md)<a name="favorite_name"></a>
> The device's name as displayed in favorites

### is_favorite : [`boolean`](../../API/builtins/boolean.md)<a name="is_favorite"></a>
> true if the device is a favorite

### is_bridged : [`boolean`](../../API/builtins/boolean.md)<a name="is_bridged"></a>
> true if the device is a bridged plugin

  

  



---  
## Aliases  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  

