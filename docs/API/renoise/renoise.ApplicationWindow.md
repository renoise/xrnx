# renoise.ApplicationWindow<a name="renoise.ApplicationWindow"></a>  
> Application window and general UI properties of the Renoise app.  

<!-- toc -->
  
## Constants
### UpperFrame<a name="UpperFrame"></a>
> ```lua
> {
>     UPPER_FRAME_TRACK_SCOPES: integer = 1,
>     UPPER_FRAME_MASTER_SPECTRUM: integer = 2,
> }
> ```
### MiddleFrame<a name="MiddleFrame"></a>
> ```lua
> {
>     MIDDLE_FRAME_PATTERN_EDITOR: integer = 1,
>     MIDDLE_FRAME_MIXER: integer = 2,
>     MIDDLE_FRAME_INSTRUMENT_PHRASE_EDITOR: integer = 3,
>     MIDDLE_FRAME_INSTRUMENT_SAMPLE_KEYZONES: integer = 4,
>     MIDDLE_FRAME_INSTRUMENT_SAMPLE_EDITOR: integer = 5,
>     MIDDLE_FRAME_INSTRUMENT_SAMPLE_MODULATION: integer = 6,
>     MIDDLE_FRAME_INSTRUMENT_SAMPLE_EFFECTS: integer = 7,
>     MIDDLE_FRAME_INSTRUMENT_PLUGIN_EDITOR: integer = 8,
>     MIDDLE_FRAME_INSTRUMENT_MIDI_EDITOR: integer = 9,
> }
> ```
### LowerFrame<a name="LowerFrame"></a>
> ```lua
> {
>     LOWER_FRAME_TRACK_DSPS: integer = 1,
>     LOWER_FRAME_TRACK_AUTOMATION: integer = 2,
> }
> ```
### DiskBrowserCategory<a name="DiskBrowserCategory"></a>
> ```lua
> {
>     DISK_BROWSER_CATEGORY_SONGS: integer = 1,
>     DISK_BROWSER_CATEGORY_INSTRUMENTS: integer = 2,
>     DISK_BROWSER_CATEGORY_SAMPLES: integer = 3,
>     DISK_BROWSER_CATEGORY_OTHER: integer = 4,
> }
> ```
### InstrumentBoxSlotSize<a name="InstrumentBoxSlotSize"></a>
> ```lua
> {
>     INSTRUMENT_BOX_SLOT_SIZE_SMALL: integer = 1,
>     INSTRUMENT_BOX_SLOT_SIZE_MEDIUM: integer = 2,
>     INSTRUMENT_BOX_SLOT_SIZE_LARGE: integer = 3,
> }
> ```
### MixerFader<a name="MixerFader"></a>
> ```lua
> {
>     MIXER_FADER_TYPE_24DB: integer = 1,
>     MIXER_FADER_TYPE_48DB: integer = 2,
>     MIXER_FADER_TYPE_96DB: integer = 3,
>     MIXER_FADER_TYPE_LINEAR: integer = 4,
> }
> ```
  

---  
## Properties
### fullscreen : [`boolean`](../../API/builtins/boolean.md)<a name="fullscreen"></a>
> Get/set if the application is running fullscreen.

### is_maximized : [`boolean`](../../API/builtins/boolean.md)<a name="is_maximized"></a>
> **READ-ONLY**. Window status flag.

### is_minimized : [`boolean`](../../API/builtins/boolean.md)<a name="is_minimized"></a>
> **READ-ONLY**. Window status flag.

### lock_keyboard_focus : [`boolean`](../../API/builtins/boolean.md)<a name="lock_keyboard_focus"></a>
> When true, the middle frame views (like the pattern editor) will
> stay focused unless alt or middle mouse is clicked.

### sample_record_dialog_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="sample_record_dialog_is_visible"></a>
> Dialog for recording new samples, floating above the main window.

### disk_browser_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="disk_browser_is_visible"></a>
> Diskbrowser Panel.

### disk_browser_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="disk_browser_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### disk_browser_category : [`renoise.ApplicationWindow.DiskBrowserCategory`](renoise.ApplicationWindow.md#DiskBrowserCategory)<a name="disk_browser_category"></a>
### disk_browser_category_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="disk_browser_category_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### instrument_box_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_box_is_visible"></a>
> InstrumentBox

### instrument_box_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="instrument_box_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### instrument_box_slot_size : [`renoise.ApplicationWindow.InstrumentBoxSlotSize`](renoise.ApplicationWindow.md#InstrumentBoxSlotSize)<a name="instrument_box_slot_size"></a>
> InstrumentBox slot size

### instrument_box_slot_size_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="instrument_box_slot_size_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### instrument_editor_is_detached : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_editor_is_detached"></a>
> Instrument Editor detaching.

### instrument_editor_is_detached_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="instrument_editor_is_detached_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### instrument_properties_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_is_visible"></a>
> InstrumentProperties (below InstrumentBox)

### instrument_properties_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="instrument_properties_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### instrument_properties_show_volume_transpose : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_volume_transpose"></a>
### instrument_properties_show_trigger_options : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_trigger_options"></a>
### instrument_properties_show_scale_options : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_scale_options"></a>
### instrument_properties_show_plugin : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_plugin"></a>
### instrument_properties_show_plugin_program : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_plugin_program"></a>
### instrument_properties_show_midi : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_midi"></a>
### instrument_properties_show_midi_program : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_midi_program"></a>
### instrument_properties_show_macros : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_macros"></a>
### instrument_properties_show_phrases : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_properties_show_phrases"></a>
### sample_properties_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="sample_properties_is_visible"></a>
> SampleProperties (below SampleNavigator)

### sample_properties_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sample_properties_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### mixer_view_is_detached : [`boolean`](../../API/builtins/boolean.md)<a name="mixer_view_is_detached"></a>
> Mixer View detaching.

### mixer_view_is_detached_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="mixer_view_is_detached_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### upper_frame_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="upper_frame_is_visible"></a>
> Frame with the scopes/master spectrum...

### upper_frame_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="upper_frame_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### active_upper_frame : [`renoise.ApplicationWindow.UpperFrame`](renoise.ApplicationWindow.md#UpperFrame)<a name="active_upper_frame"></a>
### active_upper_frame_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="active_upper_frame_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### active_middle_frame : [`renoise.ApplicationWindow.MiddleFrame`](renoise.ApplicationWindow.md#MiddleFrame)<a name="active_middle_frame"></a>
> Frame with the pattern editor, mixer...

### active_middle_frame_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="active_middle_frame_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### lower_frame_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="lower_frame_is_visible"></a>
> Frame with the DSP chain view, automation, etc.

### lower_frame_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="lower_frame_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### active_lower_frame : [`renoise.ApplicationWindow.LowerFrame`](renoise.ApplicationWindow.md#LowerFrame)<a name="active_lower_frame"></a>
### active_lower_frame_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="active_lower_frame_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### right_frame_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="right_frame_is_visible"></a>
> Frame with Disk Browser and Instrument Box.

### right_frame_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="right_frame_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### pattern_matrix_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="pattern_matrix_is_visible"></a>
> Pattern matrix, visible in pattern editor and mixer only...

### pattern_matrix_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="pattern_matrix_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### pattern_advanced_edit_is_visible : [`boolean`](../../API/builtins/boolean.md)<a name="pattern_advanced_edit_is_visible"></a>
> Pattern advanced edit, visible in pattern editor only...

### pattern_advanced_edit_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="pattern_advanced_edit_is_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### mixer_view_post_fx : [`boolean`](../../API/builtins/boolean.md)<a name="mixer_view_post_fx"></a>
> Mixer views Pre/Post volume setting.

### mixer_view_post_fx_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="mixer_view_post_fx_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### mixer_fader_type : [`renoise.ApplicationWindow.MixerFader`](renoise.ApplicationWindow.md#MixerFader)<a name="mixer_fader_type"></a>
> Mixer fader type setting.

### mixer_fader_type_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="mixer_fader_type_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### maximize([*self*](../../API/builtins/self.md))<a name="maximize"></a>
> Expand the window over the entire screen, without hiding menu bars,
> docks and so on.
### minimize([*self*](../../API/builtins/self.md))<a name="minimize"></a>
> Minimize the window to the dock or taskbar, depending on the OS.
### restore([*self*](../../API/builtins/self.md))<a name="restore"></a>
> "un-maximize" or "un-minimize" the window, or just bring it to front.
### select_preset([*self*](../../API/builtins/self.md), preset_index : [`integer`](../../API/builtins/integer.md))<a name="select_preset"></a>
> Select/activate one of the global view presets, to memorize/restore
> the user interface layout.  

