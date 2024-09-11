# renoise.AudioDevice  
> Audio DSP device in tracks or sample device chains.  

<!-- toc -->
  

---  
## Properties
### active_preset : [`integer`](../../API/builtins/integer.md) {#active_preset}
> 0 when none is active or available

### active_preset_data : [`string`](../../API/builtins/string.md) {#active_preset_data}
> raw serialized data in XML format of the active preset

### active_preset_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#active_preset_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### device_path : [`string`](../../API/builtins/string.md) {#device_path}
> **READ-ONLY** Returns a string that uniquely identifies the device, from
> `available_devices`. The string can be passed into:
> `renoise.song().tracks[]:insert_device_at()`

### display_name : [`string`](../../API/builtins/string.md) {#display_name}
> Configurable device display name. When empty `name` is displayed.

### display_name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#display_name_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### external_editor_available : [`boolean`](../../API/builtins/boolean.md) {#external_editor_available}
> **READ-ONLY** Returns whether or not the device provides its own custom GUI
> (only available for some plugin devices)

### external_editor_visible : [`boolean`](../../API/builtins/boolean.md) {#external_editor_visible}
> true to show the editor, false to close it

### is_active : [`boolean`](../../API/builtins/boolean.md) {#is_active}
> !active = bypassed

### is_active_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#is_active_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_active_parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#is_active_parameter}
> **READ-ONLY**

### is_maximized : [`boolean`](../../API/builtins/boolean.md) {#is_maximized}
> Maximize state in DSP chain.

### is_maximized_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#is_maximized_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### name : [`string`](../../API/builtins/string.md) {#name}
> **READ-ONLY**

### parameters : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)[] {#parameters}
> **READ-ONLY**

### presets : [`string`](../../API/builtins/string.md)[] {#presets}
> **READ-ONLY** preset names

### short_name : [`string`](../../API/builtins/string.md) {#short_name}
> **READ-ONLY**

  

---  
## Functions
### parameter([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#parameter}
`->`[`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)  

> Access to a single parameter by index. Use properties 'parameters' to iterate
> over all parameters and to query the parameter count.
### preset([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#preset}
`->`preset_name : [`string`](../../API/builtins/string.md)  

> Access to a single preset name by index. Use properties 'presets' to iterate
> over all presets and to query the presets count.
> comment  

