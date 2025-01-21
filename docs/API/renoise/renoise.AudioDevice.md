# renoise.AudioDevice<a name="renoise.AudioDevice"></a>  
> Audio DSP device in tracks or sample device chains.  

<!-- toc -->
  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> **READ-ONLY**

### short_name : [`string`](../../API/builtins/string.md)<a name="short_name"></a>
> **READ-ONLY**

### display_name : [`string`](../../API/builtins/string.md)<a name="display_name"></a>
> Configurable device display name. When empty `name` is displayed.

### display_name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="display_name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_active : [`boolean`](../../API/builtins/boolean.md)<a name="is_active"></a>
> !active = bypassed

### is_active_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="is_active_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_maximized : [`boolean`](../../API/builtins/boolean.md)<a name="is_maximized"></a>
> Maximize state in DSP chain.

### is_maximized_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="is_maximized_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### active_preset : [`integer`](../../API/builtins/integer.md)<a name="active_preset"></a>
> 0 when none is active or available

### active_preset_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="active_preset_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### active_preset_data : [`string`](../../API/builtins/string.md)<a name="active_preset_data"></a>
> raw serialized data in XML format of the active preset

### presets : [`string`](../../API/builtins/string.md)[]<a name="presets"></a>
> **READ-ONLY** preset names

### is_active_parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="is_active_parameter"></a>
> **READ-ONLY**

### parameters : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)[]<a name="parameters"></a>
> **READ-ONLY**

### external_editor_available : [`boolean`](../../API/builtins/boolean.md)<a name="external_editor_available"></a>
> **READ-ONLY** Returns whether or not the device provides its own custom GUI
> (only available for some plugin devices)

### external_editor_visible : [`boolean`](../../API/builtins/boolean.md)<a name="external_editor_visible"></a>
> true to show the editor, false to close it

### device_path : [`string`](../../API/builtins/string.md)<a name="device_path"></a>
> **READ-ONLY** Returns a string that uniquely identifies the device, from
> `available_devices`. The string can be passed into:
> `renoise.song().tracks[]:insert_device_at()`

  

---  
## Functions
### preset([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="preset"></a>
`->`preset_name : [`string`](../../API/builtins/string.md)  

> Access to a single preset name by index. Use properties 'presets' to iterate
> over all presets and to query the presets count.
> comment
### parameter([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="parameter"></a>
`->`[`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)  

> Access to a single parameter by index. Use properties 'parameters' to iterate
> over all parameters and to query the parameter count.  

