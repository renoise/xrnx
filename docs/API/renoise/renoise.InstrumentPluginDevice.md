# renoise.InstrumentPluginDevice  

---  
## Properties
### active_preset : [`integer`](/API/builtins/integer.md) {#active_preset}
Preset handling. 0 when when none is active (or available)

### active_preset_data : [`string`](/API/builtins/string.md) {#active_preset_data}
raw XML data of the active preset

### active_preset_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#active_preset_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### device_path : [`string`](/API/builtins/string.md) {#device_path}
**READ-ONLY** Returns a string that uniquely identifies the plugin
The string can be passed into: renoise.InstrumentPluginProperties:load_plugin()

### external_editor_available : [`boolean`](/API/builtins/boolean.md) {#external_editor_available}
**READ-ONLY** Returns whether or not the plugin provides its own custom GUI.

### external_editor_visible : [`boolean`](/API/builtins/boolean.md) {#external_editor_visible}
When the plugin has no custom GUI, Renoise will create a dummy editor for it which
lists the plugin parameters.
set to true to show the editor, false to close it

### name : [`string`](/API/builtins/string.md) {#name}
**READ-ONLY** Device name.

### parameters : [`renoise.DeviceParameter`](/API/renoise/renoise.DeviceParameter.md)`[]` {#parameters}
**READ-ONLY**

### presets : [`string`](/API/builtins/string.md)`[]` {#presets}
**READ-ONLY**

### short_name : [`string`](/API/builtins/string.md) {#short_name}
**READ-ONLY**

  

---  
## Functions
### `parameter`([*self*](/API/builtins/self.md), index : [`integer`](/API/builtins/integer.md)) {#parameter}
`->`[`renoise.DeviceParameter`](/API/renoise/renoise.DeviceParameter.md)  

Access to a single parameter by index. Use properties 'parameters' to iterate
over all parameters and to query the parameter count.
### `preset`([*self*](/API/builtins/self.md), index : [`integer`](/API/builtins/integer.md)) {#preset}
`->`[`string`](/API/builtins/string.md)  

Access to a single preset name by index. Use properties 'presets' to iterate
over all presets and to query the presets count.  

