# renoise.InstrumentPluginDevice<a name="renoise.InstrumentPluginDevice"></a>  

<!-- toc -->
  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> **READ-ONLY** Device name.

### short_name : [`string`](../../API/builtins/string.md)<a name="short_name"></a>
> **READ-ONLY**

### presets : [`string`](../../API/builtins/string.md)[]<a name="presets"></a>
> **READ-ONLY**

### active_preset : [`integer`](../../API/builtins/integer.md)<a name="active_preset"></a>
> Preset handling. 0 when when none is active (or available)

### active_preset_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="active_preset_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### active_preset_data : [`string`](../../API/builtins/string.md)<a name="active_preset_data"></a>
> raw XML data of the active preset

### parameters : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)[]<a name="parameters"></a>
> **READ-ONLY**

### external_editor_available : [`boolean`](../../API/builtins/boolean.md)<a name="external_editor_available"></a>
> **READ-ONLY** Returns whether or not the plugin provides its own custom GUI.

### external_editor_visible : [`boolean`](../../API/builtins/boolean.md)<a name="external_editor_visible"></a>
> When the plugin has no custom GUI, Renoise will create a dummy editor for it which
> lists the plugin parameters.
> set to true to show the editor, false to close it

### device_path : [`string`](../../API/builtins/string.md)<a name="device_path"></a>
> **READ-ONLY** Returns a string that uniquely identifies the plugin
> The string can be passed into: renoise.InstrumentPluginProperties:load_plugin()

  

---  
## Functions
### preset([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="preset"></a>
`->`[`string`](../../API/builtins/string.md)  

> Access to a single preset name by index. Use properties 'presets' to iterate
> over all presets and to query the presets count.
### parameter([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="parameter"></a>
`->`[`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)  

> Access to a single parameter by index. Use properties 'parameters' to iterate
> over all parameters and to query the parameter count.  

