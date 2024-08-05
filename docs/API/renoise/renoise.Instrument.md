# renoise.Instrument  
## Constants
### Layer {#Layer}
```lua
{
    LAYER_NOTE_DISABLED: integer = 0,
    LAYER_NOTE_ON: integer = 1,
    LAYER_NOTE_OFF: integer = 2,
}
```
### OverlapMode {#OverlapMode}
```lua
{
    OVERLAP_MODE_ALL: integer = 0,
    OVERLAP_MODE_CYCLED: integer = 1,
    OVERLAP_MODE_RANDOM: integer = 2,
}
```
### PhrasePlaybackMode {#PhrasePlaybackMode}
```lua
{
    PHRASES_OFF: integer = 1,
    PHRASES_PLAY_SELECTIVE: integer = 2,
    PHRASES_PLAY_KEYMAP: integer = 3,
}
```
### Tab {#Tab}
```lua
{
    TAB_SAMPLES: integer = 1,
    TAB_PLUGIN: integer = 2,
    TAB_EXT_MIDI: integer = 3,
}
```
### MAX_NUMBER_OF_PHRASES : [`integer`](../../API/builtins/integer.md) {#MAX_NUMBER_OF_PHRASES}
### NUMBER_OF_MACROS : [`integer`](../../API/builtins/integer.md) {#NUMBER_OF_MACROS}  

---  
## Properties
### active_tab : [`renoise.Instrument.Tab`](renoise.Instrument.md#Tab) {#active_tab}
Currently active tab in the instrument GUI (samples, plugin or MIDI).

### active_tab_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#active_tab_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### channel_pressure_macro : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md) {#channel_pressure_macro}
Access the MIDI channel pressure macro

### comments : [`string`](../../API/builtins/string.md)`[]` {#comments}
Instrument's comment list. See renoise.song().comments for more info on
how to get notified on changes and how to change it.

### comments_assignment_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#comments_assignment_observable}
Notifier which is called as soon as any paragraph in the comments change.

### comments_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#comments_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### macros : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md)`[]` {#macros}
**READ-ONLY** Macro parameters. Array with size Instrument.NUMBER_OF_MACROS.

### macros_visible : [`boolean`](../../API/builtins/boolean.md) {#macros_visible}
Macro parameter pane visibility in the GUI.

### macros_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#macros_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### midi_input_properties : [`renoise.InstrumentMidiInputProperties`](../../API/renoise/renoise.InstrumentMidiInputProperties.md) {#midi_input_properties}
**READ-ONLY** MIDI input properties.

### midi_output_properties : [`renoise.InstrumentMidiOutputProperties`](../../API/renoise/renoise.InstrumentMidiOutputProperties.md) {#midi_output_properties}
**READ-ONLY** MIDI output properties.

### modulation_wheel_macro : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md) {#modulation_wheel_macro}
Access the MIDI modulation-wheel macro

### name : [`string`](../../API/builtins/string.md) {#name}
Instrument's name.

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#name_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### phrase_editor_visible : [`boolean`](../../API/builtins/boolean.md) {#phrase_editor_visible}
Phrase editor pane visibility in the GUI.

### phrase_editor_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#phrase_editor_visible_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### phrase_mappings : [`renoise.InstrumentPhraseMapping`](../../API/renoise/renoise.InstrumentPhraseMapping.md)`[]` {#phrase_mappings}
**READ-ONLY** Phrase mappings.

### phrase_mappings_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#phrase_mappings_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### phrase_playback_mode : [`renoise.Instrument.PhrasePlaybackMode`](renoise.Instrument.md#PhrasePlaybackMode) {#phrase_playback_mode}
Phrase playback.

### phrase_playback_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#phrase_playback_mode_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### phrase_program : [`integer`](../../API/builtins/integer.md) {#phrase_program}
Phrase playback program: 0 = Off, 1-126 = specific phrase, 127 = keymap.

### phrase_program_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#phrase_program_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### phrases : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)`[]` {#phrases}
**READ-ONLY** Phrases.

### phrases_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#phrases_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### pitchbend_macro : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md) {#pitchbend_macro}
Access the MIDI pitch-bend macro

### plugin_properties : [`renoise.InstrumentPluginProperties`](../../API/renoise/renoise.InstrumentPluginProperties.md) {#plugin_properties}
**READ-ONLY** Plugin properties.

### sample_device_chains : [`renoise.SampleDeviceChain`](../../API/renoise/renoise.SampleDeviceChain.md)`[]` {#sample_device_chains}
**READ-ONLY** Sample device chains.

### sample_device_chains_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#sample_device_chains_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### sample_mapping_overlap_mode : [`renoise.Instrument.OverlapMode`](renoise.Instrument.md#OverlapMode) {#sample_mapping_overlap_mode}
Sample mapping's overlap trigger mode.

### sample_mapping_overlap_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#sample_mapping_overlap_mode_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### sample_mappings : [`renoise.SampleMapping`](../../API/renoise/renoise.SampleMapping.md)`[]` {#sample_mappings}
**READ-ONLY**
Sample mappings (key/velocity to sample slot mappings).
sample_mappings[LAYER_NOTE_ON/OFF][]. Sample mappings also can
be accessed via ---@field samples[].sample_mapping

### sample_mappings_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#sample_mappings_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### sample_modulation_sets : [`renoise.SampleModulationSet`](../../API/renoise/renoise.SampleModulationSet.md)`[]` {#sample_modulation_sets}
**READ-ONLY** Sample modulation sets.

### sample_modulation_sets_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#sample_modulation_sets_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### samples : [`renoise.Sample`](../../API/renoise/renoise.Sample.md)`[]` {#samples}
**READ-ONLY** Samples slots.

### samples_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#samples_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### show_comments_after_loading : [`boolean`](../../API/builtins/boolean.md) {#show_comments_after_loading}
Set this to true to show the comments dialog after loading a song

### show_comments_after_loading_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#show_comments_after_loading_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### transpose : [`integer`](../../API/builtins/integer.md) {#transpose}
Range: (-120 - 120). Global relative pitch in semi tones.
Applied to all samples, MIDI and plugins in the instrument.

### transpose_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#transpose_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### trigger_options : [`renoise.InstrumentTriggerOptions`](../../API/renoise/renoise.InstrumentTriggerOptions.md) {#trigger_options}
Global trigger options (quantization and scaling options).

### volume : [`number`](../../API/builtins/number.md) {#volume}
Range: (0 - math.db2lin(6))

### volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#volume_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `can_insert_phrase_mapping_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#can_insert_phrase_mapping_at}
`->`[`boolean`](../../API/builtins/boolean.md)  

Returns true if a new phrase mapping can be inserted at the given
phrase mapping index (see See renoise.song().instruments[].phrase_mappings).
Passed phrase must exist and must not have a mapping yet.
Phrase note mappings may not overlap and are sorted by note, so there
can be max 119 phrases per instrument when each phrase is mapped to
a single key only. To make up room for new phrases, access phrases by
index, adjust their note_range, then call 'insert_phrase_mapping_at' again.
### `clear`([*self*](../../API/builtins/self.md)) {#clear}
Reset, clear all settings and all samples.
### `copy_from`([*self*](../../API/builtins/self.md), instrument : [`renoise.Instrument`](../../API/renoise/renoise.Instrument.md)) {#copy_from}
Copy all settings from the other instrument, including all samples.
### `delete_phrase_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#delete_phrase_at}
Delete a new phrase at the given phrase index.
### `delete_phrase_mapping_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#delete_phrase_mapping_at}
Delete a new phrase mapping at the given phrase mapping index.
### `delete_sample_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#delete_sample_at}
Delete an existing sample.
### `delete_sample_device_chain_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#delete_sample_device_chain_at}
Delete an existing sample device chain at the given index.
### `delete_sample_modulation_set_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#delete_sample_modulation_set_at}
Delete an existing modulation set at the given index.
### `insert_phrase_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#insert_phrase_at}
`->`new_phrase : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)  

Insert a new phrase behind the given phrase index (1 for the first one).
### `insert_phrase_mapping_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md), phrase : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)) {#insert_phrase_mapping_at}
`->`new_mapping : [`renoise.InstrumentPhraseMapping`](../../API/renoise/renoise.InstrumentPhraseMapping.md)  

Insert a new phrase mapping behind the given phrase mapping index.
The new phrase mapping will by default use the entire free (note) range
between the previous and next phrase (if any). To adjust the note range
of the new phrase change its 'new_phrase_mapping.note_range' property.
### `insert_sample_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#insert_sample_at}
`->`new_sample : [`renoise.Sample`](../../API/renoise/renoise.Sample.md)  

Insert a new empty sample. returns the new renoise.Sample object.
Every newly inserted sample has a default mapping, which covers the
entire key and velocity range, or it gets added as drum kit mapping
when the instrument used a drum-kit mapping before the sample got added.
### `insert_sample_device_chain_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#insert_sample_device_chain_at}
`->`new_sample_device_chain : [`renoise.SampleDeviceChain`](../../API/renoise/renoise.SampleDeviceChain.md)  

Insert a new sample device chain at the given index.
### `insert_sample_modulation_set_at`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#insert_sample_modulation_set_at}
`->`new_sample_modulation_set : [`renoise.SampleModulationSet`](../../API/renoise/renoise.SampleModulationSet.md)  

Insert a new modulation set at the given index
### `macro`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#macro}
`->`instrument_macro : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md)  

Range: (1 - renoise.Instrument.NUMBER_OF_MACROS) 
Access a single macro by index.
See also property `macros`.
### `phrase`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#phrase}
`->`[`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)  

Access a single phrase by index. Use properties 'phrases' to iterate
over all phrases and to query the phrase count.
### `phrase_mapping`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#phrase_mapping}
`->`[`renoise.InstrumentPhraseMapping`](../../API/renoise/renoise.InstrumentPhraseMapping.md)  

Access to a phrase note mapping by index. Use property 'phrase_mappings' to
iterate over all phrase mappings and to query the phrase (mapping) count.
### `sample`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#sample}
`->`[`renoise.Sample`](../../API/renoise/renoise.Sample.md)  

Access to a single sample by index. Use properties 'samples' to iterate
over all samples and to query the sample count.
### `sample_device_chain`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#sample_device_chain}
`->`[`renoise.SampleDeviceChain`](../../API/renoise/renoise.SampleDeviceChain.md)  

Access to a single device chain by index. Use property 'sample_device_chains'
to iterate over all chains and to query the chain count.
### `sample_mapping`([*self*](../../API/builtins/self.md), layer : [`renoise.Instrument.Layer`](renoise.Instrument.md#Layer), index : [`integer`](../../API/builtins/integer.md)) {#sample_mapping}
`->`[`renoise.SampleMapping`](../../API/renoise/renoise.SampleMapping.md)  

Access to a sample mapping by index. Use property 'sample_mappings' to
iterate over all sample mappings and to query the sample (mapping) count.
### `sample_modulation_set`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#sample_modulation_set}
`->`[`renoise.SampleModulationSet`](../../API/renoise/renoise.SampleModulationSet.md)  

Access to a single sample modulation set by index. Use property
'sample_modulation_sets' to iterate over all sets and to query the set count.
### `swap_sample_device_chains_at`([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md)) {#swap_sample_device_chains_at}
Swap positions of two sample device chains.
### `swap_sample_modulation_sets_at`([*self*](../../API/builtins/self.md), index1 : [`any`](../../API/builtins/any.md), index2 : [`any`](../../API/builtins/any.md)) {#swap_sample_modulation_sets_at}
Swap positions of two modulation sets.
### `swap_samples_at`([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md)) {#swap_samples_at}
Swap positions of two samples.  

