# renoise.InstrumentPhrase  
General remarks: Phrases do use renoise.PatternLine objects just like the
pattern tracks do. When the instrument column is enabled and used,
not instruments, but samples are addressed/triggered in phrases.  
## Constants
### KeyTrackingMode {#KeyTrackingMode}
```lua
{
    KEY_TRACKING_NONE: integer = 1,
    KEY_TRACKING_TRANSPOSE: integer = 2,
    KEY_TRACKING_OFFSET: integer = 3,
}
```
  

---  
## Properties
### MAX_NUMBER_OF_EFFECT_COLUMNS : [`integer`](/API/builtins/integer.md) {#MAX_NUMBER_OF_EFFECT_COLUMNS}
### MAX_NUMBER_OF_LINES : [`integer`](/API/builtins/integer.md) {#MAX_NUMBER_OF_LINES}
Maximum number of lines that can be present in a phrase.

### MAX_NUMBER_OF_NOTE_COLUMNS : [`integer`](/API/builtins/integer.md) {#MAX_NUMBER_OF_NOTE_COLUMNS}
### MIN_NUMBER_OF_EFFECT_COLUMNS : [`integer`](/API/builtins/integer.md) {#MIN_NUMBER_OF_EFFECT_COLUMNS}
Min/Maximum number of effect columns that can be present in a phrase.

### MIN_NUMBER_OF_NOTE_COLUMNS : [`integer`](/API/builtins/integer.md) {#MIN_NUMBER_OF_NOTE_COLUMNS}
Min/Maximum number of note columns that can be present in a phrase.

### autoseek : [`boolean`](/API/builtins/boolean.md) {#autoseek}
Phrase autoseek settings

### autoseek_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#autoseek_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### base_note : [`integer`](/API/builtins/integer.md) {#base_note}
Range: (0 - 119) where C-4 is 48
Phrase's base-note. Only relevant when key_tracking is set to transpose.

### base_note_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#base_note_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### delay_column_visible : [`boolean`](/API/builtins/boolean.md) {#delay_column_visible}
### delay_column_visible_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#delay_column_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### instrument_column_visible : [`boolean`](/API/builtins/boolean.md) {#instrument_column_visible}
Column visibility.

### instrument_column_visible_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#instrument_column_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### is_empty : [`boolean`](/API/builtins/boolean.md) {#is_empty}
**READ-ONLY**
Quickly check if a phrase has some non empty pattern lines.

### is_empty_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#is_empty_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### key_tracking : [`renoise.InstrumentPhrase.KeyTrackingMode`](renoise.InstrumentPhrase.md#KeyTrackingMode) {#key_tracking}
Phrase's key-tracking mode.

### key_tracking_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#key_tracking_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### lines : [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md)`[]` {#lines}
**READ-ONLY** Get all lines in a range [1, number_of_lines_in_pattern]

### loop_end : [`integer`](/API/builtins/integer.md) {#loop_end}
Range: (loop_start - number_of_lines)
Loop end. Needs to be > loop_start and <= number_of_lines

### loop_end_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#loop_end_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### loop_start : [`integer`](/API/builtins/integer.md) {#loop_start}
Range: (1 - number_of_lines)
Loop start. Playback will start from the beginning before entering loop

### loop_start_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#loop_start_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### looping : [`boolean`](/API/builtins/boolean.md) {#looping}
Loop mode. The phrase plays as one-shot when disabled.

### looping_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#looping_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### lpb : [`integer`](/API/builtins/integer.md) {#lpb}
Range: (1 - 256)
Phrase local lines per beat setting. New phrases get initialized with
the song's current LPB setting. TPL can not be configured in phrases.

### lpb_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#lpb_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### mapping : [`renoise.InstrumentPhraseMapping`](/API/renoise/renoise.InstrumentPhraseMapping.md) {#mapping}
(Key)Mapping properties of the phrase or nil when no mapping is present.

### name : [`string`](/API/builtins/string.md) {#name}
Name of the phrase as visible in the phrase editor and piano mappings.

### name_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#name_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### number_of_lines : [`integer`](/API/builtins/integer.md) {#number_of_lines}
Default: 16, Range: (1 - renoise.InstrumentPhrase.MAX_NUMBER_OF_LINES)
Number of lines the phrase currently has.

### number_of_lines_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#number_of_lines_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### panning_column_visible : [`boolean`](/API/builtins/boolean.md) {#panning_column_visible}
### panning_column_visible_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#panning_column_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### sample_effects_column_visible : [`boolean`](/API/builtins/boolean.md) {#sample_effects_column_visible}
### sample_effects_column_visible_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#sample_effects_column_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### shuffle : [`number`](/API/builtins/number.md) {#shuffle}
Range: (0 - 1)
Shuffle groove amount for a phrase.
0.0 = no shuffle (off), 1.0 = full shuffle

### shuffle_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#shuffle_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### visible_effect_columns : [`integer`](/API/builtins/integer.md) {#visible_effect_columns}
Range: (MIN_NUMBER_OF_EFFECT_COLUMNS - MAX_NUMBER_OF_EFFECT_COLUMNS)
How many effect columns are visible in the phrase.

### visible_effect_columns_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#visible_effect_columns_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### visible_note_columns : [`integer`](/API/builtins/integer.md) {#visible_note_columns}
Range: (MIN_NUMBER_OF_NOTE_COLUMNS - MAX_NUMBER_OF_NOTE_COLUMNS)
How many note columns are visible in the phrase.

### visible_note_columns_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#visible_note_columns_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### volume_column_visible : [`boolean`](/API/builtins/boolean.md) {#volume_column_visible}
### volume_column_visible_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#volume_column_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `add_line_edited_notifier`([*self*](/API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#add_line_edited_notifier}
### `add_line_notifier`([*self*](/API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#add_line_notifier}
### `clear`([*self*](/API/builtins/self.md)) {#clear}
Deletes all lines.
### `column_is_muted`([*self*](/API/builtins/self.md), column : [`integer`](/API/builtins/integer.md)) {#column_is_muted}
`->`[`boolean`](/API/builtins/boolean.md)  

Note column mute states.
### `column_is_muted_observable`([*self*](/API/builtins/self.md), column : [`integer`](/API/builtins/integer.md)) {#column_is_muted_observable}
`->`[`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md)  

### `column_name`([*self*](/API/builtins/self.md), column : [`integer`](/API/builtins/integer.md)) {#column_name}
`->`[`string`](/API/builtins/string.md)  

Note column names.
### `column_name_observable`([*self*](/API/builtins/self.md), column : [`integer`](/API/builtins/integer.md)) {#column_name_observable}
`->`[`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md)  

### `copy_from`([*self*](/API/builtins/self.md), phrase : [`renoise.InstrumentPhrase`](/API/renoise/renoise.InstrumentPhrase.md)) {#copy_from}
Copy contents from another phrase.
### `has_line_edited_notifier`([*self*](/API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#has_line_edited_notifier}
`->`[`boolean`](/API/builtins/boolean.md)  

Same as line_notifier above, but the notifier only fires when the user
added, changed or deleted a line with the computer keyboard.
See: ~renoise.Pattern.has_line_editoed_notifier~ for more details.
### `has_line_notifier`([*self*](/API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#has_line_notifier}
`->`[`boolean`](/API/builtins/boolean.md)  

Check/add/remove notifier functions or methods, which are called by
Renoise as soon as any of the phrases's lines have changed.
See: [renoise.Pattern.has_line_notifier](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/song/pattern.lua#85#9) for more details.
### `line`([*self*](/API/builtins/self.md), index : [`integer`](/API/builtins/integer.md)) {#line}
`->`[`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md)  

Range: (1 - renoise.InstrumentPhrase.MAX_NUMBER_OF_LINES)
Access to a single line by index. Line must be in Range: (1 - MAX_NUMBER_OF_LINES).
This is a !lot! more efficient than calling the property: lines[index] to
randomly access lines.
### `lines_in_range`([*self*](/API/builtins/self.md), index_from : [`integer`](/API/builtins/integer.md), index_to : [`integer`](/API/builtins/integer.md)) {#lines_in_range}
`->`[`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md)`[]`  

Get a specific line range
### `remove_line_edited_notifier`([*self*](/API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#remove_line_edited_notifier}
### `remove_line_notifier`([*self*](/API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#remove_line_notifier}
### `set_column_is_muted`([*self*](/API/builtins/self.md), column : [`integer`](/API/builtins/integer.md), muted : [`boolean`](/API/builtins/boolean.md)) {#set_column_is_muted}
### `set_column_name`([*self*](/API/builtins/self.md), column : [`integer`](/API/builtins/integer.md), name : [`string`](/API/builtins/string.md)) {#set_column_name}
### `swap_effect_columns_at`([*self*](/API/builtins/self.md), index1 : [`integer`](/API/builtins/integer.md), index2 : [`integer`](/API/builtins/integer.md)) {#swap_effect_columns_at}
Swap the positions of two effect columns within a phrase.
### `swap_note_columns_at`([*self*](/API/builtins/self.md), index1 : [`integer`](/API/builtins/integer.md), index2 : [`integer`](/API/builtins/integer.md)) {#swap_note_columns_at}
Swap the positions of two note columns within a phrase.  



---  
## Structs  
# PhraseLinePosition  
Line iterator position.  

---  
## Properties
### line : [`integer`](/API/builtins/integer.md) {#line}
  

  



---  
## Aliases  
# alias PhraseLineChangeCallbackWithContext {#PhraseLineChangeCallbackWithContext}
(obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md), pos : [`PhraseLinePosition`](#phraselineposition))  
  
  

