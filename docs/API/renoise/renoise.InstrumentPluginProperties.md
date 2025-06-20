# renoise.InstrumentPluginProperties<a name="renoise.InstrumentPluginProperties"></a>  

<!-- toc -->
  

---  
## Properties
### available_plugins : [`string`](../../API/builtins/string.md)[]<a name="available_plugins"></a>
> **READ-ONLY** List of all currently available plugins. This is a list of
> unique plugin names which also contains the plugin's type (VST/AU/DSSI/...),
> not including the vendor names as visible in Renoise's GUI. So its an
> identifier, and not the name as visible in the GUI. When no plugin is loaded,
> the identifier is an empty string.

### available_plugin_infos : [`PluginInfo`](#plugininfo)[]<a name="available_plugin_infos"></a>
> **READ-ONLY** Returns a list of tables containing more information about the plugins.

### plugin_loaded : [`boolean`](../../API/builtins/boolean.md)<a name="plugin_loaded"></a>
> **READ-ONLY** Returns true when a plugin is present; loaded successfully.

### plugin_device : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md) | [`renoise.InstrumentPluginDevice`](../../API/renoise/renoise.InstrumentPluginDevice.md)<a name="plugin_device"></a>
> Valid object for successfully loaded plugins, otherwise nil. Alias plugin
> instruments of FX will return the resolved device, will link to the device
> the alias points to.
> The observable is fired when the device changes: when a plugin gets loaded or
> unloaded or a plugin alias is assigned or unassigned.

### plugin_device_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="plugin_device_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### alias_instrument_index : [`integer`](../../API/builtins/integer.md)<a name="alias_instrument_index"></a>
> 0 when no alias instrument is set

### alias_instrument_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="alias_instrument_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### alias_fx_track_index : [`integer`](../../API/builtins/integer.md)<a name="alias_fx_track_index"></a>
> **READ-ONLY** 0 when no alias FX is set

### alias_fx_track_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="alias_fx_track_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### alias_fx_device_index : [`integer`](../../API/builtins/integer.md)<a name="alias_fx_device_index"></a>
> **READ-ONLY** 0 when no alias FX is set

### alias_fx_device_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="alias_fx_device_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### midi_output_routing_index : [`integer`](../../API/builtins/integer.md)<a name="midi_output_routing_index"></a>
> 0 when no routing is set

### midi_output_routing_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="midi_output_routing_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### channel : [`integer`](../../API/builtins/integer.md)<a name="channel"></a>
> Range: (1 - 16)

### channel_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="channel_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### transpose : [`integer`](../../API/builtins/integer.md)<a name="transpose"></a>
> Range: (-120 - 120)

### transpose_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="transpose_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### volume : [`number`](../../API/builtins/number.md)<a name="volume"></a>
> Range: (0.0 - 4.0) linear gain

### volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="volume_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### auto_suspend : [`boolean`](../../API/builtins/boolean.md)<a name="auto_suspend"></a>
> Valid for loaded and unloaded plugins.

### auto_suspend_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="auto_suspend_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### load_plugin([*self*](../../API/builtins/self.md), plugin_path : [`string`](../../API/builtins/string.md))<a name="load_plugin"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load an existing, new, non aliased plugin. Pass an empty string to unload
> an already assigned plugin. plugin_path must be one of the available plugins
> See: `renoise.InstrumentPluginProperties.available_plugins`  



---  
## Structs  
# PluginInfo<a name="PluginInfo"></a>  

---  
## Properties
### path : [`string`](../../API/builtins/string.md)<a name="path"></a>
> The plugin's path used by load_plugin()

### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> The plugin's name

### short_name : [`string`](../../API/builtins/string.md)<a name="short_name"></a>
> The plugin's name as displayed in shortened lists

### favorite_name : [`string`](../../API/builtins/string.md)<a name="favorite_name"></a>
> The plugin's name as displayed in favorites

### is_favorite : [`string`](../../API/builtins/string.md)<a name="is_favorite"></a>
> true if the plugin is a favorite

### is_bridged : [`string`](../../API/builtins/string.md)<a name="is_bridged"></a>
> true if the plugin is a bridged plugin

  

  

