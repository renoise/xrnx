# renoise.Application<a name="renoise.Application"></a>  
> The Renoise application.  

<!-- toc -->
  

---  
## Properties
### log_filename : [`string`](../../API/builtins/string.md)<a name="log_filename"></a>
> **READ-ONLY** Access to the application's full log filename and path. Will
> already be opened for writing, but you nevertheless should be able to read
> from it.

### current_song : [`renoise.Song`](../../API/renoise/renoise.Song.md)<a name="current_song"></a>
> **READ-ONLY** Get the apps main document, the song.
> The global "renoise.song()" function is, in fact, a shortcut to this property.

### recently_loaded_song_files : [`string`](../../API/builtins/string.md)[]<a name="recently_loaded_song_files"></a>
> **READ-ONLY** List of recently loaded song files.

### recently_saved_song_files : [`string`](../../API/builtins/string.md)[]<a name="recently_saved_song_files"></a>
> **READ-ONLY** List of recently saved song files.

### installed_tools : table<[`string`](../../API/builtins/string.md), [`string`](../../API/builtins/string.md)><a name="installed_tools"></a>
> **READ-ONLY** Returns information about all currently installed tools.

### key_modifier_states : table<[`string`](../../API/builtins/string.md), [`string`](../../API/builtins/string.md)><a name="key_modifier_states"></a>
> **Deprecated.** **READ-ONLY** Use `key_modifier_flags` instead

### key_modifier_flags : [`ModifierFlags`](#ModifierFlags)<a name="key_modifier_flags"></a>
> **READ-ONLY** Access keyboard modifier states.

### window : [`renoise.ApplicationWindow`](../../API/renoise/renoise.ApplicationWindow.md)<a name="window"></a>
> **READ-ONLY** Access to the application's window.

### theme : [`renoise.ApplicationTheme`](../../API/renoise/renoise.ApplicationTheme.md)<a name="theme"></a>
> **READ-ONLY** Access to the application's color theme.

### theme_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="theme_observable"></a>
> Fired, when *any* theme color changed. e.g. when a new theme got loaded
> or when theme colors got edited in the theme preferences.

### active_clipboard_index : `1` | `2` | `3` | `4`<a name="active_clipboard_index"></a>
> Range: (1 - 4) Get or set globally used clipboard "slots" in the application.

  

---  
## Functions
### show_message([*self*](../../API/builtins/self.md), message : [`string`](../../API/builtins/string.md))<a name="show_message"></a>
> Shows an info message dialog to the user.
### show_error([*self*](../../API/builtins/self.md), message : [`string`](../../API/builtins/string.md))<a name="show_error"></a>
> Shows an error dialog to the user.
### show_warning([*self*](../../API/builtins/self.md), message : [`string`](../../API/builtins/string.md))<a name="show_warning"></a>
> Shows a warning dialog to the user.
### show_status([*self*](../../API/builtins/self.md), message : [`string`](../../API/builtins/string.md))<a name="show_status"></a>
> Shows a message in Renoise's status bar to the user.
### show_prompt([*self*](../../API/builtins/self.md), title : [`string`](../../API/builtins/string.md), message : [`string`](../../API/builtins/string.md), button_labels : [`string`](../../API/builtins/string.md)[][`?`](../../API/builtins/nil.md))<a name="show_prompt"></a>
`->`label : [`string`](../../API/builtins/string.md)  

> Opens a modal dialog with a title, text and custom button labels.
> Returns the pressed button label or an empty string when canceled.
### show_custom_prompt([*self*](../../API/builtins/self.md), title : [`string`](../../API/builtins/string.md), content_view : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md), button_labels : [`string`](../../API/builtins/string.md)[], key_handler : [`KeyHandler`](#KeyHandler)[`?`](../../API/builtins/nil.md), key_handler_options : [`KeyHandlerOptions`](#keyhandleroptions)[`?`](../../API/builtins/nil.md), focus_handler : [`FocusHandler`](#FocusHandler)[`?`](../../API/builtins/nil.md))<a name="show_custom_prompt"></a>
`->`label : [`string`](../../API/builtins/string.md)  

> Opens a modal dialog with a title, custom content and custom button labels.  
> See: [renoise.ViewBuilder](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/viewbuilder.lua#17#10) for more info about custom views.
### show_custom_dialog([*self*](../../API/builtins/self.md), title : [`DialogTitle`](#DialogTitle), content_view : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md), key_handler : [`KeyHandler`](#KeyHandler)[`?`](../../API/builtins/nil.md), key_handler_options : [`KeyHandlerOptions`](#keyhandleroptions)[`?`](../../API/builtins/nil.md), focus_handler : [`FocusHandler`](#FocusHandler)[`?`](../../API/builtins/nil.md))<a name="show_custom_dialog"></a>
`->`[`renoise.Dialog`](../../API/renoise/renoise.Dialog.md)  

> Shows a non modal dialog (a floating tool window) with custom content.  
> When no key_handler is provided, the Escape key is used to close the dialog.
> See: [renoise.ViewBuilder](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/viewbuilder.lua#17#10) for more info about custom views.
### show_menu([*self*](../../API/builtins/self.md), dialog : [`renoise.Dialog`](../../API/renoise/renoise.Dialog.md), menu_entries : [`DialogMenuEntry`](#dialogmenuentry)[], below_view : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[`?`](../../API/builtins/nil.md))<a name="show_menu"></a>
> Shows a custom context menu on top of the given dialog.
> 
> When specifying a view, the menu will be shown below the given view instance.
> The view instance must be part of the dialog that shows the menu and must be visible.
> By default the menu will be shown at the current mouse cursor position.
### prompt_for_path([*self*](../../API/builtins/self.md), title : [`DialogTitle`](#DialogTitle))<a name="prompt_for_path"></a>
`->`path : [`string`](../../API/builtins/string.md)  

> Opens a modal dialog to query an existing directory from the user.
### prompt_for_filename_to_read([*self*](../../API/builtins/self.md), file_extensions : [`string`](../../API/builtins/string.md)[], title : [`DialogTitle`](#DialogTitle))<a name="prompt_for_filename_to_read"></a>
`->`path : [`string`](../../API/builtins/string.md)  

> Opens a modal dialog to query a filename and path to read from a file.
### prompt_for_multiple_filenames_to_read([*self*](../../API/builtins/self.md), file_extensions : [`string`](../../API/builtins/string.md)[], title : [`DialogTitle`](#DialogTitle))<a name="prompt_for_multiple_filenames_to_read"></a>
`->`paths : [`string`](../../API/builtins/string.md)[]  

> Same as 'prompt_for_filename_to_read' but allows the user to select
> more than one file.
### prompt_for_filename_to_write([*self*](../../API/builtins/self.md), file_extension : [`string`](../../API/builtins/string.md), title : [`DialogTitle`](#DialogTitle))<a name="prompt_for_filename_to_write"></a>
`->`path : [`string`](../../API/builtins/string.md)  

> Open a modal dialog to get a filename and path for writing.
> When an existing file is selected, the dialog will ask whether or not to
> overwrite it, so you don't have to take care of this on your own.
### open_url([*self*](../../API/builtins/self.md), url : [`string`](../../API/builtins/string.md))<a name="open_url"></a>
> Opens the default internet browser with the given URL. The URL can also be
> a file that browsers can open (like xml, html files...).
### open_path([*self*](../../API/builtins/self.md), file_path : [`string`](../../API/builtins/string.md))<a name="open_path"></a>
> Opens the default file browser (explorer, finder...) with the given path.
### install_tool([*self*](../../API/builtins/self.md), file_path : [`string`](../../API/builtins/string.md))<a name="install_tool"></a>
> Install order update a tool. Any errors are shown to the user
> during installation. Installing an already existing tool will upgrade
> the tool without confirmation. Upgraded tools will automatically be
> re-enabled, if necessary.
### uninstall_tool([*self*](../../API/builtins/self.md), file_path : [`string`](../../API/builtins/string.md))<a name="uninstall_tool"></a>
> Uninstall an existing tool. Any errors are shown to the user
> during uninstallation.
### new_song([*self*](../../API/builtins/self.md))<a name="new_song"></a>
> Create a new song document (will ask the user to save changes if needed).
> The song is not created immediately, but soon after the call was made and
> the user did not aborted the operation. In order to continue execution
> with the new song, attach a notifier to 'renoise.app().new_document_observable'
> See: [renoise.ScriptingTool](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/tool.lua#19#10) for more info.
### new_song_no_template([*self*](../../API/builtins/self.md))<a name="new_song_no_template"></a>
> Create a new song document, avoiding template XRNS songs (when present) to be loaded.
> The song is not created immediately, but soon after the call was made and
> the user did not aborted the operation. In order to continue execution
> with the new song, attach a notifier to 'renoise.app().new_document_observable'
> See: [renoise.ScriptingTool](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/tool.lua#19#10) for more info.
### load_song([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_song"></a>
> Load a new song document from the given filename (will ask to save
> changes if needed, any errors are shown to the user).
> Just like new_song(), the song is not loaded immediately, but soon after
> the call was made. See 'renoise.app():new_song()' for details.
### load_track_device_chain([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_track_device_chain"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load a track device chains into the currently selected track.
> Any errors during the export are shown to the user.
### load_track_device_preset([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_track_device_preset"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load a track device devices into the currently selected track.
> When no device is selected a new device will be created.
> Any errors during the export are shown to the user.
### load_instrument([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_instrument"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load an instrument into the currently selected instrument.
> Any errors during the export are shown to the user.
### load_instrument_multi_sample([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_instrument_multi_sample"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load an instrument multi sample into the currently selected instrument.
> Any errors during the export are shown to the user.
### load_instrument_device_chain([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_instrument_device_chain"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load an instrument device chain into the currently selected instrument's
> device chain. When no device chain is selected, a new one will be created.
> Any errors during the export are shown to the user.
### load_instrument_device_preset([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_instrument_device_preset"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load an instrument device into the currently selected instrument's device
> chain's device. When no device is selected, a new one will be created.
> Any errors during the export are shown to the user.
### load_instrument_modulation_set([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_instrument_modulation_set"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load an instrument modulation chain into the currently selected instrument's
> modulation chain. When no device is selected, a new one will be created.
> Any errors during the export are shown to the user.
### load_instrument_phrase([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_instrument_phrase"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load an instrument phrase into the currently selected instrument's
> phrases. When no phrase is selected, a new one will be created.
> Any errors during the export are shown to the user.
### load_instrument_sample([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_instrument_sample"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load an instrument sample into the currently selected instrument's
> sample lists. When no sample is selected, a new one will be created.
> Any errors during the export are shown to the user.
### load_theme([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_theme"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load a new theme file and apply it.
> Any errors during the export are shown to the user.
### save_song([*self*](../../API/builtins/self.md))<a name="save_song"></a>
> Quicksave or save the current song under a new name. Any errors
> during the export are shown to the user.
### save_song_as([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_song_as"></a>
> Save the current song under a new name. Any errors
> during the export are shown to the user.
### save_track_device_chain([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_track_device_chain"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Save a currently selected track device chain to a file with the given name.
> When no device chain is selected an error is raised. returns success.
### save_instrument([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_instrument"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Save a currently selected instrument to a file with the given name.
> When no instruemnt is selected an error is raised. returns success.
### save_instrument_multi_sample([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_instrument_multi_sample"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Save a currently selected instrument multi sample file to a file with the given name.
> When no instrument is selected an error is raised. returns success.
### save_instrument_device_chain([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_instrument_device_chain"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Save a currently selected instrument's device chain to a file with the given name.
> When no chain is selected an error is raised. returns success.
### save_instrument_modulation_set([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_instrument_modulation_set"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Save a currently selected instrument's modulation set to a file with the given name.
> When no modulation is selected an error is raised. returns success.
### save_instrument_phrase([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_instrument_phrase"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Save a currently selected instrument's phrase to a file with the given name.
> When no phrase is selected an error is raised. returns success.
### save_instrument_sample([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_instrument_sample"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Save a currently selected instrument's sample to a file with the given name.
> When no sample is selected an error is raised. returns success.
### save_theme([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_theme"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Save a current theme to a file with the given name. returns success.  



---  
## Structs  
# DialogMenuEntry<a name="DialogMenuEntry"></a>  
> Defines a custom menu entry, shown in custom dialog windows.
> 
> Separating entries:
> To divide entries into groups prepend one or more dashes to the name:
> ```md
> ---First Group Item
> Regular item
> ```
> 
> To create sub menus, define entries with a common path, using a colon as separator:
> ```md
> Main Menu Item
> Sub Menu:Sub Menu Item 1
> Sub Menu:Sub Menu Item 2
> ```
> 
> To insert a script menu entry into an existing context menu, see `ToolMenuEntry`.  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> Name and optional path of the menu entry

### invoke : fun()<a name="invoke"></a>
> A function that is called as soon as the entry is clicked

### active : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Default: true. When false, the action will not be invoked and will be "greyed out".

### selected : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md)<a name="selected"></a>
> Default: false. When true, the entry will be marked as "this is a selected option"

  

  
# KeyEvent<a name="KeyEvent"></a>  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> name of the key, like 'esc' or 'a'

### modifiers : [`ModifierStates`](#ModifierStates)<a name="modifiers"></a>
> **Deprecated.** Use `modifier_flags` instead
> **READ-ONLY** the held down modifiers as a string

### modifier_flags : [`ModifierFlags`](#ModifierFlags)<a name="modifier_flags"></a>
> **READ-ONLY** the held down modifiers as flags

### character : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)<a name="character"></a>
> possible character representation of the key

### note : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="note"></a>
> virtual keyboard piano key value (starting from 0)

### state : `"pressed"` | `"released"`<a name="state"></a>
> only present if `send_key_release` was set to true

### repeated : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md)<a name="repeated"></a>
> only present if `send_key_repeat` was set to true

  



---  
## Aliases  
### ModifierFlags<a name="ModifierFlags"></a>
{ alt : [`boolean`](../../API/builtins/boolean.md), control : [`boolean`](../../API/builtins/boolean.md), meta : [`boolean`](../../API/builtins/boolean.md), shift : [`boolean`](../../API/builtins/boolean.md) }  
> The currently pressed/release key's modifiers as platform independent flags.
> On macOS "control" is their "Command" key and the "meta" keyboard is the "Control" key.
> On Windows the "meta" key is the "Windows" key and on Linux the "Super" key.  
  
### ModifierStates<a name="ModifierStates"></a>
[`string`](../../API/builtins/string.md)  
> **Deprecated.** Use `ModifierFlags` instead.
> 
> The modifier keys will be provided as a string.
> Possible keys are dependent on the platform
>  * Windows : "shift", "alt", "control", "winkey"
>  * Linux : "shift", "alt", "control", "meta"
>  * Mac : "shift", "option", "control", "command".
> If multiple modifiers are held down, the string will be formatted as  
> "<key> + <key>"
> Their order will correspond to the following precedence
> `shift + alt/option + control + winkey/meta/command`  
> If no modifier is pressed, this will be an empty string.  
  

  
# KeyHandlerOptions<a name="KeyHandlerOptions"></a>  

---  
## Properties
### send_key_repeat : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md)<a name="send_key_repeat"></a>
> Default: true

### send_key_release : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md)<a name="send_key_release"></a>
> Default: false

  

  



---  
## Aliases  
### DialogTitle<a name="DialogTitle"></a>
[`string`](../../API/builtins/string.md)  
> The title that shows up at the title-bar of the dialog.  
  
### FocusHandler<a name="FocusHandler"></a>
(dialogs : [`renoise.Dialog`](../../API/renoise/renoise.Dialog.md), focused : [`boolean`](../../API/builtins/boolean.md)) `->` [`KeyEvent`](#keyevent)[`?`](../../API/builtins/nil.md)  
> Optional focus change notifier for a custom dialog.  
> Will be called when the dialog gains of loses key focus. You maybe want to initialize 
> your dloag's (modifier) keyboard states here.  
  
### KeyHandler<a name="KeyHandler"></a>
(dialog : [`renoise.Dialog`](../../API/renoise/renoise.Dialog.md), key_event : [`KeyEvent`](#keyevent)) `->` [`KeyEvent`](#keyevent)[`?`](../../API/builtins/nil.md)  
> Optional keyhandler to process key events on a custom dialog.  
> When returning the passed key from the key-handler function, the
> key will be passed back to Renoise's key event chain, in order to allow
> processing global Renoise key-bindings from your dialog. This will not work
> for modal dialogs. This also only applies to global shortcuts in Renoise,
> because your dialog will steal the focus from all other Renoise views such as
> the Pattern Editor, etc.  
  
### ModifierFlags<a name="ModifierFlags"></a>
{ alt : [`boolean`](../../API/builtins/boolean.md), control : [`boolean`](../../API/builtins/boolean.md), meta : [`boolean`](../../API/builtins/boolean.md), shift : [`boolean`](../../API/builtins/boolean.md) }  
> The currently pressed/release key's modifiers as platform independent flags.
> On macOS "control" is their "Command" key and the "meta" keyboard is the "Control" key.
> On Windows the "meta" key is the "Windows" key and on Linux the "Super" key.  
  
### ModifierStates<a name="ModifierStates"></a>
[`string`](../../API/builtins/string.md)  
> **Deprecated.** Use `ModifierFlags` instead.
> 
> The modifier keys will be provided as a string.
> Possible keys are dependent on the platform
>  * Windows : "shift", "alt", "control", "winkey"
>  * Linux : "shift", "alt", "control", "meta"
>  * Mac : "shift", "option", "control", "command".
> If multiple modifiers are held down, the string will be formatted as  
> "<key> + <key>"
> Their order will correspond to the following precedence
> `shift + alt/option + control + winkey/meta/command`  
> If no modifier is pressed, this will be an empty string.  
  

