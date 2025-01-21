# renoise.InstrumentPhrase<a name="renoise.InstrumentPhrase"></a>  
> General remarks: Phrases do use renoise.PatternLine objects just like the
> pattern tracks do. When the instrument column is enabled and used,
> not instruments, but samples are addressed/triggered in phrases.  

<!-- toc -->
  
## Constants
### KeyTrackingMode<a name="KeyTrackingMode"></a>
> ```lua
> {
>     KEY_TRACKING_NONE: integer = 1,
>     KEY_TRACKING_TRANSPOSE: integer = 2,
>     KEY_TRACKING_OFFSET: integer = 3,
> }
> ```
### MAX_NUMBER_OF_LINES : [`integer`](../../API/builtins/integer.md)<a name="MAX_NUMBER_OF_LINES"></a>
> Maximum number of lines that can be present in a phrase.

### MIN_NUMBER_OF_NOTE_COLUMNS : [`integer`](../../API/builtins/integer.md)<a name="MIN_NUMBER_OF_NOTE_COLUMNS"></a>
> Min/Maximum number of note columns that can be present in a phrase.

### MAX_NUMBER_OF_NOTE_COLUMNS : [`integer`](../../API/builtins/integer.md)<a name="MAX_NUMBER_OF_NOTE_COLUMNS"></a>
### MIN_NUMBER_OF_EFFECT_COLUMNS : [`integer`](../../API/builtins/integer.md)<a name="MIN_NUMBER_OF_EFFECT_COLUMNS"></a>
> Min/Maximum number of effect columns that can be present in a phrase.

### MAX_NUMBER_OF_EFFECT_COLUMNS : [`integer`](../../API/builtins/integer.md)<a name="MAX_NUMBER_OF_EFFECT_COLUMNS"></a>  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> Name of the phrase as visible in the phrase editor and piano mappings.

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### mapping : [`renoise.InstrumentPhraseMapping`](../../API/renoise/renoise.InstrumentPhraseMapping.md)<a name="mapping"></a>
> (Key)Mapping properties of the phrase or nil when no mapping is present.

### is_empty : [`boolean`](../../API/builtins/boolean.md)<a name="is_empty"></a>
> **READ-ONLY**
> Quickly check if a phrase has some non empty pattern lines.

### is_empty_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="is_empty_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### number_of_lines : [`integer`](../../API/builtins/integer.md)<a name="number_of_lines"></a>
> Default: 16, Range: (1 - renoise.InstrumentPhrase.MAX_NUMBER_OF_LINES)
> Number of lines the phrase currently has.

### number_of_lines_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="number_of_lines_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### lines : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)[]<a name="lines"></a>
> **READ-ONLY** Get all lines in a range [1, number_of_lines_in_pattern]

### visible_note_columns : [`integer`](../../API/builtins/integer.md)<a name="visible_note_columns"></a>
> Range: (MIN_NUMBER_OF_NOTE_COLUMNS - MAX_NUMBER_OF_NOTE_COLUMNS)
> How many note columns are visible in the phrase.

### visible_note_columns_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="visible_note_columns_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### visible_effect_columns : [`integer`](../../API/builtins/integer.md)<a name="visible_effect_columns"></a>
> Range: (MIN_NUMBER_OF_EFFECT_COLUMNS - MAX_NUMBER_OF_EFFECT_COLUMNS)
> How many effect columns are visible in the phrase.

### visible_effect_columns_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="visible_effect_columns_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### key_tracking : [`renoise.InstrumentPhrase.KeyTrackingMode`](renoise.InstrumentPhrase.md#KeyTrackingMode)<a name="key_tracking"></a>
> Phrase's key-tracking mode.

### key_tracking_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="key_tracking_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### base_note : [`integer`](../../API/builtins/integer.md)<a name="base_note"></a>
> Range: (0 - 119) where C-4 is 48
> Phrase's base-note. Only relevant when key_tracking is set to transpose.

### base_note_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="base_note_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### looping : [`boolean`](../../API/builtins/boolean.md)<a name="looping"></a>
> Loop mode. The phrase plays as one-shot when disabled.

### looping_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="looping_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_start : [`integer`](../../API/builtins/integer.md)<a name="loop_start"></a>
> Range: (1 - number_of_lines)
> Loop start. Playback will start from the beginning before entering loop

### loop_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_start_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_end : [`integer`](../../API/builtins/integer.md)<a name="loop_end"></a>
> Range: (loop_start - number_of_lines)
> Loop end. Needs to be > loop_start and <= number_of_lines

### loop_end_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_end_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### autoseek : [`boolean`](../../API/builtins/boolean.md)<a name="autoseek"></a>
> Phrase autoseek settings

### autoseek_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="autoseek_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### lpb : [`integer`](../../API/builtins/integer.md)<a name="lpb"></a>
> Range: (1 - 256)
> Phrase local lines per beat setting. New phrases get initialized with
> the song's current LPB setting. TPL can not be configured in phrases.

### lpb_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="lpb_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### shuffle : [`number`](../../API/builtins/number.md)<a name="shuffle"></a>
> Range: (0 - 1)
> Shuffle groove amount for a phrase.
> 0.0 = no shuffle (off), 1.0 = full shuffle

### shuffle_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="shuffle_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### instrument_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="instrument_column_visible"></a>
> Column visibility.

### instrument_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="instrument_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### volume_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="volume_column_visible"></a>
### volume_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="volume_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### panning_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="panning_column_visible"></a>
### panning_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="panning_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### delay_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="delay_column_visible"></a>
### delay_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="delay_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### sample_effects_column_visible : [`boolean`](../../API/builtins/boolean.md)<a name="sample_effects_column_visible"></a>
### sample_effects_column_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sample_effects_column_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Deletes all lines.
### copy_from([*self*](../../API/builtins/self.md), phrase : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md))<a name="copy_from"></a>
> Copy contents from another phrase.
### line([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="line"></a>
`->`[`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)  

> Range: (1 - renoise.InstrumentPhrase.MAX_NUMBER_OF_LINES)
> Access to a single line by index. Line must be in Range: (1 - MAX_NUMBER_OF_LINES).
> This is a !lot! more efficient than calling the property: lines[index] to
> randomly access lines.
### lines_in_range([*self*](../../API/builtins/self.md), index_from : [`integer`](../../API/builtins/integer.md), index_to : [`integer`](../../API/builtins/integer.md))<a name="lines_in_range"></a>
`->`[`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)[]  

> Get a specific line range
### has_line_notifier([*self*](../../API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md))<a name="has_line_notifier"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Check/add/remove notifier functions or methods, which are called by
> Renoise as soon as any of the phrases's lines have changed.
> See: [renoise.Pattern.has_line_notifier](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/song/pattern.lua#86#9) for more details.
### add_line_notifier([*self*](../../API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md))<a name="add_line_notifier"></a>
### remove_line_notifier([*self*](../../API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md))<a name="remove_line_notifier"></a>
### has_line_edited_notifier([*self*](../../API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md))<a name="has_line_edited_notifier"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Same as line_notifier above, but the notifier only fires when the user
> added, changed or deleted a line with the computer keyboard.
> See: ~renoise.Pattern.has_line_editoed_notifier~ for more details.
### add_line_edited_notifier([*self*](../../API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md))<a name="add_line_edited_notifier"></a>
### remove_line_edited_notifier([*self*](../../API/builtins/self.md), func : [`PhraseLineChangeCallbackWithContext`](#PhraseLineChangeCallbackWithContext), obj : [`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md))<a name="remove_line_edited_notifier"></a>
### column_is_muted([*self*](../../API/builtins/self.md), column : [`integer`](../../API/builtins/integer.md))<a name="column_is_muted"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Note column mute states.
### column_is_muted_observable([*self*](../../API/builtins/self.md), column : [`integer`](../../API/builtins/integer.md))<a name="column_is_muted_observable"></a>
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

### set_column_is_muted([*self*](../../API/builtins/self.md), column : [`integer`](../../API/builtins/integer.md), muted : [`boolean`](../../API/builtins/boolean.md))<a name="set_column_is_muted"></a>
### column_name([*self*](../../API/builtins/self.md), column : [`integer`](../../API/builtins/integer.md))<a name="column_name"></a>
`->`[`string`](../../API/builtins/string.md)  

> Note column names.
### column_name_observable([*self*](../../API/builtins/self.md), column : [`integer`](../../API/builtins/integer.md))<a name="column_name_observable"></a>
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

### set_column_name([*self*](../../API/builtins/self.md), column : [`integer`](../../API/builtins/integer.md), name : [`string`](../../API/builtins/string.md))<a name="set_column_name"></a>
### swap_note_columns_at([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_note_columns_at"></a>
> Swap the positions of two note columns within a phrase.
### swap_effect_columns_at([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_effect_columns_at"></a>
> Swap the positions of two effect columns within a phrase.  



---  
## Structs  
# PhraseLinePosition<a name="PhraseLinePosition"></a>  
> Line iterator position.  

---  
## Properties
### line : [`integer`](../../API/builtins/integer.md)<a name="line"></a>
  

  



---  
## Aliases  
### PhraseLineChangeCallbackWithContext<a name="PhraseLineChangeCallbackWithContext"></a>
(obj : [`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md), pos : [`PhraseLinePosition`](#phraselineposition))  
  
  

