# renoise.Instrument<a name="renoise.Instrument"></a>  

<!-- toc -->
  
## Constants
### Tab<a name="Tab"></a>
> ```lua
> {
>     TAB_SAMPLES: integer = 1,
>     TAB_PLUGIN: integer = 2,
>     TAB_EXT_MIDI: integer = 3,
> }
> ```
### PhrasePlaybackMode<a name="PhrasePlaybackMode"></a>
> ```lua
> {
>     PHRASES_OFF: integer = 1,
>     PHRASES_PLAY_SELECTIVE: integer = 2,
>     PHRASES_PLAY_KEYMAP: integer = 3,
> }
> ```
### Layer<a name="Layer"></a>
> ```lua
> {
>     LAYER_NOTE_DISABLED: integer = 0,
>     LAYER_NOTE_ON: integer = 1,
>     LAYER_NOTE_OFF: integer = 2,
> }
> ```
### OverlapMode<a name="OverlapMode"></a>
> ```lua
> {
>     OVERLAP_MODE_ALL: integer = 0,
>     OVERLAP_MODE_CYCLED: integer = 1,
>     OVERLAP_MODE_RANDOM: integer = 2,
> }
> ```
### NUMBER_OF_MACROS : [`integer`](../../API/builtins/integer.md)<a name="NUMBER_OF_MACROS"></a>
### MAX_NUMBER_OF_PHRASES : [`integer`](../../API/builtins/integer.md)<a name="MAX_NUMBER_OF_PHRASES"></a>  

---  
## Properties
### active_tab : [`renoise.Instrument.Tab`](renoise.Instrument.md#Tab)<a name="active_tab"></a>
> Currently active tab in the instrument GUI (samples, plugin or MIDI).

### active_tab_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="active_tab_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> Instrument's name.

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### comments : [`string`](../../API/builtins/string.md)[]<a name="comments"></a>
> Instrument's comment list. See renoise.song().comments for more info on
> how to get notified on changes and how to change it.

### comments_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="comments_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### comments_assignment_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="comments_assignment_observable"></a>
> Notifier which is called as soon as any paragraph in the comments change.

### show_comments_after_loading : [`boolean`](../../API/builtins/boolean.md)<a name="show_comments_after_loading"></a>
> Set this to true to show the comments dialog after loading a song

### show_comments_after_loading_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="show_comments_after_loading_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### macros_visible : [`boolean`](../../API/builtins/boolean.md)<a name="macros_visible"></a>
> Macro parameter pane visibility in the GUI.

### macros_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="macros_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### macros : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md)[]<a name="macros"></a>
> **READ-ONLY** Macro parameters. Array with size Instrument.NUMBER_OF_MACROS.

### pitchbend_macro : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md)<a name="pitchbend_macro"></a>
> Access the MIDI pitch-bend macro

### modulation_wheel_macro : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md)<a name="modulation_wheel_macro"></a>
> Access the MIDI modulation-wheel macro

### channel_pressure_macro : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md)<a name="channel_pressure_macro"></a>
> Access the MIDI channel pressure macro

### volume : [`number`](../../API/builtins/number.md)<a name="volume"></a>
> Range: (0 - math.db2lin(6))

### volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="volume_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### transpose : [`integer`](../../API/builtins/integer.md)<a name="transpose"></a>
> Range: (-120 - 120). Global relative pitch in semi tones.
> Applied to all samples, MIDI and plugins in the instrument.

### transpose_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="transpose_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### trigger_options : [`renoise.InstrumentTriggerOptions`](../../API/renoise/renoise.InstrumentTriggerOptions.md)<a name="trigger_options"></a>
> Global trigger options (quantization and scaling options).

### sample_mapping_overlap_mode : [`renoise.Instrument.OverlapMode`](renoise.Instrument.md#OverlapMode)<a name="sample_mapping_overlap_mode"></a>
> Sample mapping's overlap trigger mode.

### sample_mapping_overlap_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sample_mapping_overlap_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### phrase_editor_visible : [`boolean`](../../API/builtins/boolean.md)<a name="phrase_editor_visible"></a>
> Phrase editor pane visibility in the GUI.

### phrase_editor_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="phrase_editor_visible_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### phrase_playback_mode : [`renoise.Instrument.PhrasePlaybackMode`](renoise.Instrument.md#PhrasePlaybackMode)<a name="phrase_playback_mode"></a>
> Phrase playback.

### phrase_playback_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="phrase_playback_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### phrase_program : [`integer`](../../API/builtins/integer.md)<a name="phrase_program"></a>
> Phrase playback program: 0 = Off, 1-126 = specific phrase, 127 = keymap.

### phrase_program_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="phrase_program_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### phrases : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)[]<a name="phrases"></a>
> **READ-ONLY** Phrases.

### phrases_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="phrases_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### phrase_mappings : [`renoise.InstrumentPhraseMapping`](../../API/renoise/renoise.InstrumentPhraseMapping.md)[]<a name="phrase_mappings"></a>
> **READ-ONLY** Phrase mappings.

### phrase_mappings_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="phrase_mappings_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### samples : [`renoise.Sample`](../../API/renoise/renoise.Sample.md)[]<a name="samples"></a>
> **READ-ONLY** Samples slots.

### samples_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="samples_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### sample_mappings : [`renoise.SampleMapping`](../../API/renoise/renoise.SampleMapping.md)[]<a name="sample_mappings"></a>
> **READ-ONLY**
> Sample mappings (key/velocity to sample slot mappings).
> sample_mappings[LAYER_NOTE_ON/OFF][]. Sample mappings also can
> be accessed via ---@field samples[].sample_mapping

### sample_mappings_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="sample_mappings_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### sample_modulation_sets : [`renoise.SampleModulationSet`](../../API/renoise/renoise.SampleModulationSet.md)[]<a name="sample_modulation_sets"></a>
> **READ-ONLY** Sample modulation sets.

### sample_modulation_sets_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="sample_modulation_sets_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### sample_device_chains : [`renoise.SampleDeviceChain`](../../API/renoise/renoise.SampleDeviceChain.md)[]<a name="sample_device_chains"></a>
> **READ-ONLY** Sample device chains.

### sample_device_chains_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="sample_device_chains_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### midi_input_properties : [`renoise.InstrumentMidiInputProperties`](../../API/renoise/renoise.InstrumentMidiInputProperties.md)<a name="midi_input_properties"></a>
> **READ-ONLY** MIDI input properties.

### midi_output_properties : [`renoise.InstrumentMidiOutputProperties`](../../API/renoise/renoise.InstrumentMidiOutputProperties.md)<a name="midi_output_properties"></a>
> **READ-ONLY** MIDI output properties.

### plugin_properties : [`renoise.InstrumentPluginProperties`](../../API/renoise/renoise.InstrumentPluginProperties.md)<a name="plugin_properties"></a>
> **READ-ONLY** Plugin properties.

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Reset, clear all settings and all samples.
### copy_from([*self*](../../API/builtins/self.md), instrument : [`renoise.Instrument`](../../API/renoise/renoise.Instrument.md))<a name="copy_from"></a>
> Copy all settings from the other instrument, including all samples.
### macro([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="macro"></a>
`->`instrument_macro : [`renoise.InstrumentMacro`](../../API/renoise/renoise.InstrumentMacro.md)  

> Range: (1 - renoise.Instrument.NUMBER_OF_MACROS) 
> Access a single macro by index.
> See also property `macros`.
### insert_phrase_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="insert_phrase_at"></a>
`->`new_phrase : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)  

> Insert a new phrase behind the given phrase index (1 for the first one).
### delete_phrase_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="delete_phrase_at"></a>
> Delete a new phrase at the given phrase index.
### phrase([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="phrase"></a>
`->`[`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)  

> Access a single phrase by index. Use properties 'phrases' to iterate
> over all phrases and to query the phrase count.
### can_insert_phrase_mapping_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="can_insert_phrase_mapping_at"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true if a new phrase mapping can be inserted at the given
> phrase mapping index (see See renoise.song().instruments[].phrase_mappings).
> Passed phrase must exist and must not have a mapping yet.
> Phrase note mappings may not overlap and are sorted by note, so there
> can be max 119 phrases per instrument when each phrase is mapped to
> a single key only. To make up room for new phrases, access phrases by
> index, adjust their note_range, then call 'insert_phrase_mapping_at' again.
### insert_phrase_mapping_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md), phrase : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md))<a name="insert_phrase_mapping_at"></a>
`->`new_mapping : [`renoise.InstrumentPhraseMapping`](../../API/renoise/renoise.InstrumentPhraseMapping.md)  

> Insert a new phrase mapping behind the given phrase mapping index.
> The new phrase mapping will by default use the entire free (note) range
> between the previous and next phrase (if any). To adjust the note range
> of the new phrase change its 'new_phrase_mapping.note_range' property.
### delete_phrase_mapping_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="delete_phrase_mapping_at"></a>
> Delete a new phrase mapping at the given phrase mapping index.
### phrase_mapping([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="phrase_mapping"></a>
`->`[`renoise.InstrumentPhraseMapping`](../../API/renoise/renoise.InstrumentPhraseMapping.md)  

> Access to a phrase note mapping by index. Use property 'phrase_mappings' to
> iterate over all phrase mappings and to query the phrase (mapping) count.
### insert_sample_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="insert_sample_at"></a>
`->`new_sample : [`renoise.Sample`](../../API/renoise/renoise.Sample.md)  

> Insert a new empty sample. returns the new renoise.Sample object.
> Every newly inserted sample has a default mapping, which covers the
> entire key and velocity range, or it gets added as drum kit mapping
> when the instrument used a drum-kit mapping before the sample got added.
### delete_sample_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="delete_sample_at"></a>
> Delete an existing sample.
### swap_samples_at([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_samples_at"></a>
> Swap positions of two samples.
### sample([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="sample"></a>
`->`[`renoise.Sample`](../../API/renoise/renoise.Sample.md)  

> Access to a single sample by index. Use properties 'samples' to iterate
> over all samples and to query the sample count.
### sample_mapping([*self*](../../API/builtins/self.md), layer : [`renoise.Instrument.Layer`](renoise.Instrument.md#Layer), index : [`integer`](../../API/builtins/integer.md))<a name="sample_mapping"></a>
`->`[`renoise.SampleMapping`](../../API/renoise/renoise.SampleMapping.md)  

> Access to a sample mapping by index. Use property 'sample_mappings' to
> iterate over all sample mappings and to query the sample (mapping) count.
### insert_sample_modulation_set_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="insert_sample_modulation_set_at"></a>
`->`new_sample_modulation_set : [`renoise.SampleModulationSet`](../../API/renoise/renoise.SampleModulationSet.md)  

> Insert a new modulation set at the given index
### delete_sample_modulation_set_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="delete_sample_modulation_set_at"></a>
> Delete an existing modulation set at the given index.
### swap_sample_modulation_sets_at([*self*](../../API/builtins/self.md), index1 : [`any`](../../API/builtins/any.md), index2 : [`any`](../../API/builtins/any.md))<a name="swap_sample_modulation_sets_at"></a>
> Swap positions of two modulation sets.
### sample_modulation_set([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="sample_modulation_set"></a>
`->`[`renoise.SampleModulationSet`](../../API/renoise/renoise.SampleModulationSet.md)  

> Access to a single sample modulation set by index. Use property
> 'sample_modulation_sets' to iterate over all sets and to query the set count.
### insert_sample_device_chain_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="insert_sample_device_chain_at"></a>
`->`new_sample_device_chain : [`renoise.SampleDeviceChain`](../../API/renoise/renoise.SampleDeviceChain.md)  

> Insert a new sample device chain at the given index.
### delete_sample_device_chain_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="delete_sample_device_chain_at"></a>
> Delete an existing sample device chain at the given index.
### swap_sample_device_chains_at([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_sample_device_chains_at"></a>
> Swap positions of two sample device chains.
### sample_device_chain([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="sample_device_chain"></a>
`->`[`renoise.SampleDeviceChain`](../../API/renoise/renoise.SampleDeviceChain.md)  

> Access to a single device chain by index. Use property 'sample_device_chains'
> to iterate over all chains and to query the chain count.  

