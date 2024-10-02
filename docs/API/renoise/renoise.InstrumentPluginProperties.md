# renoise.InstrumentPluginProperties  

<!-- toc -->
  

---  
## Properties
### available_plugins : [`string`](../../API/builtins/string.md)[] {#available_plugins}
> **READ-ONLY** List of all currently available plugins. This is a list of
> unique plugin names which also contains the plugin's type (VST/AU/DSSI/...),
> not including the vendor names as visible in Renoise's GUI. So its an
> identifier, and not the name as visible in the GUI. When no plugin is loaded,
> the identifier is an empty string.

### available_plugin_infos : [`PluginInfo`](#plugininfo)[] {#available_plugin_infos}
> **READ-ONLY** Returns a list of tables containing more information about the plugins.

### plugin_loaded : [`boolean`](../../API/builtins/boolean.md) {#plugin_loaded}
> **READ-ONLY** Returns true when a plugin is present; loaded successfully.

### plugin_device : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md) | [`renoise.InstrumentPluginDevice`](../../API/renoise/renoise.InstrumentPluginDevice.md) {#plugin_device}
> Valid object for successfully loaded plugins, otherwise nil. Alias plugin
> instruments of FX will return the resolved device, will link to the device
> the alias points to.
> The observable is fired when the device changes: when a plugin gets loaded or
> unloaded or a plugin alias is assigned or unassigned.

### plugin_device_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#plugin_device_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### alias_instrument_index : [`integer`](../../API/builtins/integer.md) {#alias_instrument_index}
> 0 when no alias instrument is set

### alias_instrument_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#alias_instrument_index_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### alias_fx_track_index : [`integer`](../../API/builtins/integer.md) {#alias_fx_track_index}
> **READ-ONLY** 0 when no alias FX is set

### alias_fx_track_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#alias_fx_track_index_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### alias_fx_device_index : [`integer`](../../API/builtins/integer.md) {#alias_fx_device_index}
> **READ-ONLY** 0 when no alias FX is set

### alias_fx_device_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#alias_fx_device_index_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### midi_output_routing_index : [`integer`](../../API/builtins/integer.md) {#midi_output_routing_index}
> 0 when no routing is set

### midi_output_routing_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#midi_output_routing_index_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### channel : [`integer`](../../API/builtins/integer.md) {#channel}
> Range: (1 - 16)

### channel_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#channel_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### transpose : [`integer`](../../API/builtins/integer.md) {#transpose}
> Range: (-120 - 120)

### transpose_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#transpose_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### volume : [`number`](../../API/builtins/number.md) {#volume}
> Range: (0.0 - 4.0) linear gain

### volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#volume_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### auto_suspend : [`boolean`](../../API/builtins/boolean.md) {#auto_suspend}
> Valid for loaded and unloaded plugins.

### auto_suspend_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#auto_suspend_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

  



---  
## Local Structs  
# PluginInfo  

<!-- toc -->
  

---  
## Properties
### path : [`string`](../../API/builtins/string.md) {#path}
> The plugin's path used by load_plugin()

### name : [`string`](../../API/builtins/string.md) {#name}
> The plugin's name

### short_name : [`string`](../../API/builtins/string.md) {#short_name}
> The plugin's name as displayed in shortened lists

### favorite_name : [`string`](../../API/builtins/string.md) {#favorite_name}
> The plugin's name as displayed in favorites

### is_favorite : [`string`](../../API/builtins/string.md) {#is_favorite}
> true if the plugin is a favorite

### is_bridged : [`string`](../../API/builtins/string.md) {#is_bridged}
> true if the plugin is a bridged plugin

  

  

