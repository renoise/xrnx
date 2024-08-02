# renoise.ApplicationWindow  
Application window and general UI properties of the Renoise app.  
## Constants
### LowerFrame {#LowerFrame}
```lua
{
    LOWER_FRAME_TRACK_DSPS: integer = 1,
    LOWER_FRAME_TRACK_AUTOMATION: integer = 2,
}
```
### MiddleFrame {#MiddleFrame}
```lua
{
    MIDDLE_FRAME_PATTERN_EDITOR: integer = 1,
    MIDDLE_FRAME_MIXER: integer = 2,
    MIDDLE_FRAME_INSTRUMENT_PHRASE_EDITOR: integer = 3,
    MIDDLE_FRAME_INSTRUMENT_SAMPLE_KEYZONES: integer = 4,
    MIDDLE_FRAME_INSTRUMENT_SAMPLE_EDITOR: integer = 5,
    MIDDLE_FRAME_INSTRUMENT_SAMPLE_MODULATION: integer = 6,
    MIDDLE_FRAME_INSTRUMENT_SAMPLE_EFFECTS: integer = 7,
    MIDDLE_FRAME_INSTRUMENT_PLUGIN_EDITOR: integer = 8,
    MIDDLE_FRAME_INSTRUMENT_MIDI_EDITOR: integer = 9,
}
```
### MixerFader {#MixerFader}
```lua
{
    MIXER_FADER_TYPE_24DB: integer = 1,
    MIXER_FADER_TYPE_48DB: integer = 2,
    MIXER_FADER_TYPE_96DB: integer = 3,
    MIXER_FADER_TYPE_LINEAR: integer = 4,
}
```
### UpperFrame {#UpperFrame}
```lua
{
    UPPER_FRAME_TRACK_SCOPES: integer = 1,
    UPPER_FRAME_MASTER_SPECTRUM: integer = 2,
}
```
  

---  
## Properties
### active_lower_frame : [`renoise.ApplicationWindow.LowerFrame`](renoise.ApplicationWindow.md#LowerFrame) {#active_lower_frame}
### active_lower_frame_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#active_lower_frame_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### active_middle_frame : [`renoise.ApplicationWindow.MiddleFrame`](renoise.ApplicationWindow.md#MiddleFrame) {#active_middle_frame}
Frame with the pattern editor, mixer...

### active_middle_frame_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#active_middle_frame_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### active_upper_frame : [`renoise.ApplicationWindow.UpperFrame`](renoise.ApplicationWindow.md#UpperFrame) {#active_upper_frame}
### active_upper_frame_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#active_upper_frame_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### disk_browser_is_visible : [`boolean`](../../API/builtins/boolean.md) {#disk_browser_is_visible}
Diskbrowser Panel.

### disk_browser_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#disk_browser_is_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### fullscreen : [`boolean`](../../API/builtins/boolean.md) {#fullscreen}
Get/set if the application is running fullscreen.

### instrument_box_is_visible : [`boolean`](../../API/builtins/boolean.md) {#instrument_box_is_visible}
InstrumentBox

### instrument_box_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#instrument_box_is_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### instrument_editor_is_detached : [`boolean`](../../API/builtins/boolean.md) {#instrument_editor_is_detached}
Instrument Editor detaching.

### instrument_editor_is_detached_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#instrument_editor_is_detached_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### is_maximized : [`boolean`](../../API/builtins/boolean.md) {#is_maximized}
**READ-ONLY**. Window status flag.

### is_minimized : [`boolean`](../../API/builtins/boolean.md) {#is_minimized}
**READ-ONLY**. Window status flag.

### lock_keyboard_focus : [`boolean`](../../API/builtins/boolean.md) {#lock_keyboard_focus}
When true, the middle frame views (like the pattern editor) will
stay focused unless alt or middle mouse is clicked.

### lower_frame_is_visible : [`boolean`](../../API/builtins/boolean.md) {#lower_frame_is_visible}
Frame with the DSP chain view, automation, etc.

### lower_frame_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#lower_frame_is_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### mixer_fader_type : [`renoise.ApplicationWindow.MixerFader`](renoise.ApplicationWindow.md#MixerFader) {#mixer_fader_type}
Mixer fader type setting.

### mixer_fader_type_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#mixer_fader_type_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### mixer_view_is_detached : [`boolean`](../../API/builtins/boolean.md) {#mixer_view_is_detached}
Mixer View detaching.

### mixer_view_is_detached_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#mixer_view_is_detached_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### mixer_view_post_fx : [`boolean`](../../API/builtins/boolean.md) {#mixer_view_post_fx}
Mixer views Pre/Post volume setting.

### mixer_view_post_fx_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#mixer_view_post_fx_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### pattern_advanced_edit_is_visible : [`boolean`](../../API/builtins/boolean.md) {#pattern_advanced_edit_is_visible}
Pattern advanced edit, visible in pattern editor only...

### pattern_advanced_edit_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#pattern_advanced_edit_is_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### pattern_matrix_is_visible : [`boolean`](../../API/builtins/boolean.md) {#pattern_matrix_is_visible}
Pattern matrix, visible in pattern editor and mixer only...

### pattern_matrix_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#pattern_matrix_is_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### sample_record_dialog_is_visible : [`boolean`](../../API/builtins/boolean.md) {#sample_record_dialog_is_visible}
Dialog for recording new samples, floating above the main window.

### upper_frame_is_visible : [`boolean`](../../API/builtins/boolean.md) {#upper_frame_is_visible}
Frame with the scopes/master spectrum...

### upper_frame_is_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#upper_frame_is_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `maximize`([*self*](../../API/builtins/self.md)) {#maximize}
Expand the window over the entire screen, without hiding menu bars,
docks and so on.
### `minimize`([*self*](../../API/builtins/self.md)) {#minimize}
Minimize the window to the dock or taskbar, depending on the OS.
### `restore`([*self*](../../API/builtins/self.md)) {#restore}
"un-maximize" or "un-minimize" the window, or just bring it to front.
### `select_preset`([*self*](../../API/builtins/self.md), preset_index : [`integer`](../../API/builtins/integer.md)) {#select_preset}
Select/activate one of the global view presets, to memorize/restore
the user interface layout.  

