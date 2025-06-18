# renoise.ScriptingTool<a name="renoise.ScriptingTool"></a>  
> The scripting tool interface allows your tool to interact with Renoise by
> injecting or creating menu entries and keybindings into Renoise; or by
> attaching it to some common tool related notifiers.  

<!-- toc -->
  

---  
## Properties
### bundle_path : [`string`](../../API/builtins/string.md)<a name="bundle_path"></a>
> **READ_ONLY** Full absolute path and name to your tool's bundle directory.

### tool_finished_loading_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="tool_finished_loading_observable"></a>
> Invoked when the tool finished loading/initializing and no errors happened.
> When the tool has preferences, they are loaded here as well when the
> notification fires, but 'renoise.song()' may not yet be available.
> 
> See also 'renoise.tool().app_new_document_observable'.

### tool_will_unload_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="tool_will_unload_observable"></a>
> Invoked right before a tool gets unloaded: either because it got disabled,
> reloaded or the application exists. You can cleanup resources or connections
> to other devices here if necessary.

### app_became_active_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="app_became_active_observable"></a>
> Invoked as soon as the application becomes the foreground window.
> For example, when you ATL-TAB to it, or activate it with the mouse
> from another app to Renoise.

### app_resigned_active_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="app_resigned_active_observable"></a>
> Invoked as soon as the application looses focus and another app
> becomes the foreground window.

### app_idle_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="app_idle_observable"></a>
> Invoked periodically in the background, more often when the work load
> is low, less often when Renoise's work load is high.
> The exact interval is undefined and can not be relied on, but will be
> around 10 times per sec.
> You can do stuff in the background without blocking the application here.
> Be gentle and don't do CPU heavy stuff please!

### app_release_document_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="app_release_document_observable"></a>
> Invoked each time before a new document gets created or loaded: this is the
> last time renoise.song() still points to the old song before a new one arrives.
> You can explicitly release notifiers to the old document here, or do your own
> housekeeping. Also called right before the application exits.

### app_new_document_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="app_new_document_observable"></a>
> Invoked each time a new document (song) is created or loaded. In other words:
> each time the result of renoise.song() is changed. Also called when the script
> gets reloaded (only happens with the auto_reload debugging tools), in order
> to connect the new script instance to the already running document.

### app_will_save_document_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="app_will_save_document_observable"></a>
> Invoked just before the application document (song) is saved.
> This is the last chance to make any changes that should be part of
> the saved song. You could for example write your tool data to
> `renoise.song().tool_data` here.

### app_saved_document_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="app_saved_document_observable"></a>
> Invoked each time the app's document (song) is successfully saved.
> renoise.song().file_name will point to the filename that it was saved to.

### preferences : [`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md)<a name="preferences"></a>
> Get or set an optional renoise.Document.DocumentNode object, which will be
> used as set of persistent "options" or preferences for your tool.
> By default nil. When set, the assigned document object will automatically be
> loaded and saved by Renoise, to retain the tools state.
> The preference XML file is saved/loaded within the tool bundle as
> "com.example.your_tool.xrnx/preferences.xml".
> 
> #### examples:
> ```lua
> -- create a document via "Document.create"
> my_options = renoise.Document.create("ScriptingToolPreferences") {
>  some_option = true,
>  some_value = "string_value"
> }
> 
> -- or create a document by inheriting from renoise.Document.DocumentNode
> class "ExampleToolPreferences"(renoise.Document.DocumentNode)
>   function ExampleToolPreferences:__init()
>     renoise.Document.DocumentNode.__init(self)
>     self:add_property("some_option", true)
>     self:add_property("some_value", "string_value")
>   end
> 
>   my_options = ExampleToolPreferences()
>   -- values can be accessed (read, written) via
>   my_options.some_option.value = false
>   -- also notifiers can be added to listen to changes to the values
>   -- done by you, or after new values got loaded or a view changed the value:
>   my_options.some_option:add_notifier(function() end)
> 
> -- and assign it:
> renoise.tool().preferences = my_options
> -- 'my_options' will be loaded/saved automatically with the tool now
> ```

  

---  
## Functions
### has_menu_entry([*self*](../../API/builtins/self.md), entry_name : [`string`](../../API/builtins/string.md))<a name="has_menu_entry"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true if the given entry already exists, otherwise false.
### add_menu_entry([*self*](../../API/builtins/self.md), entry : [`ToolMenuEntry`](#toolmenuentry))<a name="add_menu_entry"></a>
> Add a new menu entry.
### remove_menu_entry([*self*](../../API/builtins/self.md), entry_name : [`string`](../../API/builtins/string.md))<a name="remove_menu_entry"></a>
> Remove a previously added menu entry by specifying its full name.
### has_keybinding([*self*](../../API/builtins/self.md), keybinding_name : [`string`](../../API/builtins/string.md))<a name="has_keybinding"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true when the given keybinging already exists, otherwise false.
### add_keybinding([*self*](../../API/builtins/self.md), keybinding : [`ToolKeybindingEntry`](#toolkeybindingentry))<a name="add_keybinding"></a>
> Register key bindings somewhere in Renoise's existing set of bindings.
### remove_keybinding([*self*](../../API/builtins/self.md), keybinding_name : [`string`](../../API/builtins/string.md))<a name="remove_keybinding"></a>
> Remove a previously added key binding by specifying its name and path.
### has_midi_mapping([*self*](../../API/builtins/self.md), midi_mapping_name : [`string`](../../API/builtins/string.md))<a name="has_midi_mapping"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true when the given mapping already exists, otherwise false.
### add_midi_mapping([*self*](../../API/builtins/self.md), midi_mapping : [`ToolMidiMappingEntry`](#toolmidimappingentry))<a name="add_midi_mapping"></a>
> Add a new midi_mapping entry.
### remove_midi_mapping([*self*](../../API/builtins/self.md), midi_mapping_name : [`string`](../../API/builtins/string.md))<a name="remove_midi_mapping"></a>
> Remove a previously added midi mapping by specifying its name.
### has_file_import_hook([*self*](../../API/builtins/self.md), category : [`FileHookCategory`](#FileHookCategory), extensions_table : [`string`](../../API/builtins/string.md)[])<a name="has_file_import_hook"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true when the given hook already exists, otherwise false.
> 
> ```lua
> category:
>     | "song"
>     | "instrument"
>     | "effect chain"
>     | "effect preset"
>     | "modulation set"
>     | "phrase"
>     | "sample"
>     | "theme"
> ```
### add_file_import_hook([*self*](../../API/builtins/self.md), file_import_hook : [`ToolFileImportHook`](#toolfileimporthook))<a name="add_file_import_hook"></a>
> Add a new file import hook as described above.
### remove_file_import_hook([*self*](../../API/builtins/self.md), category : [`FileHookCategory`](#FileHookCategory), extensions_table : [`string`](../../API/builtins/string.md)[])<a name="remove_file_import_hook"></a>
> Remove a previously added file import hook by specifying its category
> and extension(s)
> 
> ```lua
> category:
>     | "song"
>     | "instrument"
>     | "effect chain"
>     | "effect preset"
>     | "modulation set"
>     | "phrase"
>     | "sample"
>     | "theme"
> ```
### has_timer([*self*](../../API/builtins/self.md), timer : [`TimerFunction`](#TimerFunction))<a name="has_timer"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true when the given function or method was registered as a timer.
### add_timer([*self*](../../API/builtins/self.md), timer : [`TimerFunction`](#TimerFunction), interval_in_ms : [`number`](../../API/builtins/number.md))<a name="add_timer"></a>
> Register a timer function or table with a function and context (a method)
> that periodically gets called by the `app_idle_observable` for your tool.
> 
> Modal dialogs will avoid that timers are called. To create a one-shot timer,
> simply call remove_timer at the end of your timer function.
> 
> `interval_in_ms` must be > 0. The exact interval your function is called
> will vary a bit, depending on workload; e.g. when enough CPU time is available
> the rounding error will be around +/- 5 ms.
### remove_timer([*self*](../../API/builtins/self.md), timer : [`TimerFunction`](#TimerFunction))<a name="remove_timer"></a>
> Remove a previously registered timer.  



---  
## Structs  
# ToolFileImportHook<a name="ToolFileImportHook"></a>  
> Add support for new filetypes in Renoise. Registered file types will show up
> in Renoise's disk browser and can also be loaded by drag and dropping the
> files onto the Renoise window. When adding hooks for files which Renoise
> already supports, your tool's import functions will override the internal
> import functions.
> 
> Always load the file into the currently selected component, like
> 'renoise.song().selected_track','selected_instrument','selected_sample'.
> 
> Preloading/prehearing sample files is not supported via tools.  

---  
## Properties
### category : [`FileHookCategory`](#FileHookCategory)<a name="category"></a>
> In which disk browser category the file type shows up.
> One of

### extensions : [`string`](../../API/builtins/string.md)[]<a name="extensions"></a>
> A list of strings, file extensions, that will invoke your hook, like for
> example {"txt", "s_wave"}

### invoke : (file_name : [`string`](../../API/builtins/string.md)) `->` [`boolean`](../../API/builtins/boolean.md)<a name="invoke"></a>
> function that is called to do the import. return true when the import
> succeeded, else false.

  



---  
## Aliases  
### FileHookCategory<a name="FileHookCategory"></a>
`"effect chain"` | `"effect preset"` | `"instrument"` | `"modulation set"` | `"phrase"` | `"sample"` | `"song"` | `"theme"`  
> ```lua
> FileHookCategory:
>     | "song"
>     | "instrument"
>     | "effect chain"
>     | "effect preset"
>     | "modulation set"
>     | "phrase"
>     | "sample"
>     | "theme"
> ```  
  

  
# ToolKeybindingEntry<a name="ToolKeybindingEntry"></a>  
> Register tool key bindings somewhere in Renoise's existing set of bindings.
> 
> Please note: there's no way to define default keyboard shortcuts for your
> entries. Users manually have to bind them in the keyboard prefs pane.
> As soon as they do, they'll get saved just like any other key binding in
> Renoise.  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> The scope, name and category of the key binding use the form:
> `$scope:$topic_name:$binding_name`:
> 
> `$scope` is where the shortcut will be applied, just like those
> in the categories list for the keyboard assignment preference pane.
> Your key binding will only fire, when the scope is currently focused,
> except it's the global scope one.
> Using an unavailable scope will not fire an error, instead it will render
> the binding useless. It will be listed and mappable, but never be invoked.
> 
> `$topic_name` is useful when grouping entries in the key assignment pane.
> Use "tool" if you can't come up with something meaningful.
> 
> `$binding_name` is the name of the binding.
> 
> -Currently available scopes are:
> ```lua
> + "Global"
> + "Automation"
> + "Disk Browser"
> + "DSPs Chain"
> + "Instrument Box"
> + "Mixer"
> + "Pattern Editor"
> + "Pattern Matrix"
> + "Pattern Sequencer"
> + "Sample Editor"
> + "Sample FX Mixer"
> + "Sample Keyzones"
> + "Sample Modulation Matrix"
> ```

### invoke : (repeated : [`boolean`](../../API/builtins/boolean.md))<a name="invoke"></a>
> A function that is called as soon as the mapped key is pressed.
> The callback parameter "repeated", indicates if its a virtual key repeat.

  

  
# ToolMenuEntry<a name="ToolMenuEntry"></a>  
> Defines a menu entry somewhere in Renoise's existing context menus or the
> global app menu. Insertion can be done during script initialization, but
> can also be done dynamically later on.
> 
> You can place your entries in any context menu or any window menu in Renoise.
> To do so, use one of the specified categories in its name:
> ```lua
> + "Window Menu" -- Renoise icon menu in the window caption on Windows/Linux
> + "Main Menu:XXX" (with XXX = ":File", ":Edit", ":View", ":Tools" or ":Help") -- Main menu
> + "Scripting Menu:XXX" (with XXX = ":File" or ":Tools") -- Scripting Editor & Terminal
> + "Disk Browser Directories"
> + "Disk Browser Files"
> + "Instrument Box"
> + "Pattern Sequencer"
> + "Pattern Editor"
> + "Pattern Matrix"
> + "Pattern Matrix Header"
> + "Phrase Editor"
> + "Phrase Mappings"
> + "Phrase Grid"
> + "Phrase Script Editor"
> + "Sample Navigator"
> + "Sample Editor"
> + "Sample Editor Ruler"
> + "Sample Editor Slice Markers"
> + "Sample List"
> + "Sample Mappings"
> + "Sample FX Mixer"
> + "Sample Modulation Matrix"
> + "Mixer"
> + "Master Spectrum"
> + "Track Automation"
> + "Track Automation List"
> + "DSP Chain"
> + "DSP Chain List"
> + "DSP Device"
> + "DSP Device Header"
> + "DSP Device Automation"
> + "Modulation Set"
> + "Modulation Set List"
> + "Tool Browser"
> + "Script File Browser"
> + "Script File Tabs"
> + "Script Editor"
> ```
> Separating entries:
> To divide entries into groups (separate entries with a line), prepend one or
> more dashes to the name, like "--- Main Menu:Tools:My Tool Group Starts Here"  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> Name and 'path' of the entry as shown in the global menus or context menus
> to the user.

### invoke : fun()<a name="invoke"></a>
> A function that is called as soon as the entry is clicked

### active : () `->` [`boolean`](../../API/builtins/boolean.md)<a name="active"></a>
> A function that should return true or false. When returning false, the action
> will not be invoked and will be "greyed out" in menus. This function is always
> called before "invoke", and every time prior to a menu becoming visible.

### selected : () `->` [`boolean`](../../API/builtins/boolean.md)<a name="selected"></a>
> A function that should return true or false. When returning true, the entry
> will be marked as "this is a selected option"

  

  
# ToolMidiMappingEntry<a name="ToolMidiMappingEntry"></a>  
> Extend Renoise's default MIDI mapping set, or add custom MIDI mappings
> for your tool.
> 
> A tool's MIDI mapping can be used just like the regular mappings in
> Renoise: Either by manually looking its up the mapping in the MIDI mapping
> list, then binding it to a MIDI message, or when your tool has a custom GUI,
> specifying the mapping via a control's `control.midi_mapping` property.
> Such controls will then get highlighted as soon as the MIDI mapping dialog is
> opened. Then, users simply click on the highlighted control to map MIDI
> messages.  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> The group, name of the midi mapping; as visible to the user.
> 
> The scope, name and category of the midi mapping use the form:
> `$topic_name:$optional_sub_topic_name:$name`:
> 
> `$topic_name` and `$optional_sub_topic_name` will create new groups in
> the list of MIDI mappings, as seen in Renoise's MIDI mapping dialog.
> If you can't come up with a meaningful string, use your tool's name
> as topic name.
> 
> Existing global mappings from Renoise can be overridden. In this case the
> original mappings are no longer called, only your tool's mapping.

### invoke : (message : [`renoise.ScriptingTool.MidiMessage`](../../API/renoise/renoise.ScriptingTool.MidiMessage.md))<a name="invoke"></a>
> A function that is called to handle a bound MIDI message.

  

  



---  
## Aliases  
### FileHookCategory<a name="FileHookCategory"></a>
`"effect chain"` | `"effect preset"` | `"instrument"` | `"modulation set"` | `"phrase"` | `"sample"` | `"song"` | `"theme"`  
> ```lua
> FileHookCategory:
>     | "song"
>     | "instrument"
>     | "effect chain"
>     | "effect preset"
>     | "modulation set"
>     | "phrase"
>     | "sample"
>     | "theme"
> ```  
  
### TimerFunction<a name="TimerFunction"></a>
fun()  
  
  

