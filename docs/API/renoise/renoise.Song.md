# renoise.Song<a name="renoise.Song"></a>  
> Renoise's main document - the song.  

<!-- toc -->
  
## Constants
### SubColumnType<a name="SubColumnType"></a>
> ```lua
> {
>     SUB_COLUMN_NOTE: integer = 1,
>     SUB_COLUMN_INSTRUMENT: integer = 2,
>     SUB_COLUMN_VOLUME: integer = 3,
>     SUB_COLUMN_PANNING: integer = 4,
>     SUB_COLUMN_DELAY: integer = 5,
>     SUB_COLUMN_SAMPLE_EFFECT_NUMBER: integer = 6,
>     SUB_COLUMN_SAMPLE_EFFECT_AMOUNT: integer = 7,
>     SUB_COLUMN_EFFECT_NUMBER: integer = 8,
>     SUB_COLUMN_EFFECT_AMOUNT: integer = 9,
> }
> ```
### MAX_NUMBER_OF_INSTRUMENTS : [`integer`](../../API/builtins/integer.md)<a name="MAX_NUMBER_OF_INSTRUMENTS"></a>  

---  
## Properties
### file_name : [`string`](../../API/builtins/string.md)<a name="file_name"></a>
> **READ-ONLY** When the song is loaded from or saved to a file, the absolute
> path and name to the XRNS file, otherwise an empty string.

### artist : [`string`](../../API/builtins/string.md)<a name="artist"></a>
> Song Comments

### artist_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="artist_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### comments : [`string`](../../API/builtins/string.md)[]<a name="comments"></a>
> Note: All property tables of basic types in the API are temporary copies.
> In other words `comments = { "Hello", "World" }` will work,
> `comments[1] = "Hello"; renoise.song().comments[2] = "World"`
> will *not* work.

### comments_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="comments_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### comments_assignment_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="comments_assignment_observable"></a>
> **READ-ONLY** Notifier is called as soon as any paragraph in the comments change.

### show_comments_after_loading : [`boolean`](../../API/builtins/boolean.md)<a name="show_comments_after_loading"></a>
> Set this to true to show the comments dialog after loading a song

### show_comments_after_loading_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="show_comments_after_loading_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### tool_data : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)<a name="tool_data"></a>
> Inject/fetch custom XRNX scripting tool data into the song. Can only be called
> from scripts that are running in Renoise scripting tool bundles; attempts to
> access the data from e.g. the scripting terminal will result in an error.
> Returns nil when no data is present.
> 
> Each tool gets it's own data slot in the song, which is resolved by the tool's
> bundle id, so this data is unique for every tool and persistent across tools
> with the same bundle id (but possibly different versions).
> If you want to store renoise.Document data in here, you can use the
> renoise.Document's 'to_string' and 'from_string' functions to serialize the data.
> Alternatively, write your own serializers for your custom data.

### rendering : [`boolean`](../../API/builtins/boolean.md)<a name="rendering"></a>
> **READ-ONLY** True while rendering is in progress.

### rendering_progress : [`number`](../../API/builtins/number.md)<a name="rendering_progress"></a>
> Range: (0.0 - 1.0)

### transport : [`renoise.Transport`](../../API/renoise/renoise.Transport.md)<a name="transport"></a>
> **READ-ONLY**

### sequencer : [`renoise.PatternSequencer`](../../API/renoise/renoise.PatternSequencer.md)<a name="sequencer"></a>
> **READ-ONLY**

### pattern_iterator : [`renoise.PatternIterator`](../../API/renoise/renoise.PatternIterator.md)<a name="pattern_iterator"></a>
> **READ-ONLY**

### sequencer_track_count : [`integer`](../../API/builtins/integer.md)<a name="sequencer_track_count"></a>
> **READ-ONLY** number of normal playback tracks (non-master or sends) in song.

### send_track_count : [`integer`](../../API/builtins/integer.md)<a name="send_track_count"></a>
> -**READ-ONLY** number of send tracks in song.

### instruments : [`renoise.Instrument`](../../API/renoise/renoise.Instrument.md)[]<a name="instruments"></a>
> **READ-ONLY** Instrument arrays

### instruments_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="instruments_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### patterns : [`renoise.Pattern`](../../API/renoise/renoise.Pattern.md)[]<a name="patterns"></a>
> **READ-ONLY** Pattern arrays

### patterns_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="patterns_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### tracks : [`renoise.Track`](../../API/renoise/renoise.Track.md)[]<a name="tracks"></a>
> **READ-ONLY** Track array

### tracks_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="tracks_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### selected_instrument : [`renoise.Instrument`](../../API/renoise/renoise.Instrument.md)<a name="selected_instrument"></a>
> **READ-ONLY** Selected in the instrument box.

### selected_instrument_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_instrument_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_instrument_index : [`integer`](../../API/builtins/integer.md)<a name="selected_instrument_index"></a>
> **READ-ONLY** Selected instrument index in the instrument box.

### selected_instrument_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_instrument_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_phrase : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)<a name="selected_phrase"></a>
> **READ-ONLY** Selected phrase the instrument's phrase map piano view.

### selected_phrase_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_phrase_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_phrase_index : [`integer`](../../API/builtins/integer.md)<a name="selected_phrase_index"></a>
> **READ-ONLY** Selected phrase index the instrument's phrase map piano view.

### selected_sample : [`renoise.Sample`](../../API/renoise/renoise.Sample.md)<a name="selected_sample"></a>
> **READ-ONLY** Selected in the instrument's sample list.
> Only nil when no samples are present in the selected instrument.

### selected_sample_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_sample_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_sample_index : [`integer`](../../API/builtins/integer.md)<a name="selected_sample_index"></a>
> **READ-ONLY** Selected sample index in the instrument's sample list. 
> Only 0 when no samples are present in the selected instrument.

### selected_sample_modulation_set : [`renoise.SampleModulationSet`](../../API/renoise/renoise.SampleModulationSet.md)<a name="selected_sample_modulation_set"></a>
> **READ-ONLY** Selected in the instrument's modulation view.

### selected_sample_modulation_set_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_sample_modulation_set_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_sample_modulation_set_index : [`integer`](../../API/builtins/integer.md)<a name="selected_sample_modulation_set_index"></a>
> **READ-ONLY** Selected modulation set index in the instrument's modulation view.

### selected_sample_device_chain : [`renoise.SampleDeviceChain`](../../API/renoise/renoise.SampleDeviceChain.md)<a name="selected_sample_device_chain"></a>
> **READ-ONLY** Selected in the instrument's effects view.

### selected_sample_device_chain_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_sample_device_chain_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_sample_device_chain_index : [`integer`](../../API/builtins/integer.md)<a name="selected_sample_device_chain_index"></a>
> **READ-ONLY** Selected chain index in the instrument's effects view.

### selected_sample_device : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)<a name="selected_sample_device"></a>
> **READ-ONLY** Selected in the sample effect mixer.

### selected_sample_device_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_sample_device_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_sample_device_index : [`integer`](../../API/builtins/integer.md)<a name="selected_sample_device_index"></a>
> **READ-ONLY** Selected device index in the sample effect mixer.

### selected_track : [`renoise.Track`](../../API/renoise/renoise.Track.md)<a name="selected_track"></a>
> **READ-ONLY** Selected in the pattern editor or mixer.

### selected_track_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_track_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_track_index : [`integer`](../../API/builtins/integer.md)<a name="selected_track_index"></a>
> **READ-ONLY** Selected track index in the pattern editor or mixer.

### selected_track_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_track_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_track_device : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)<a name="selected_track_device"></a>
> **READ-ONLY** Selected in the track DSP chain editor.

### selected_track_device_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_track_device_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_track_device_index : [`integer`](../../API/builtins/integer.md)<a name="selected_track_device_index"></a>
> **READ-ONLY** Selected device index in the track DSP chain editor.

### selected_device : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)<a name="selected_device"></a>
### selected_device_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_device_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_device_index : [`integer`](../../API/builtins/integer.md)<a name="selected_device_index"></a>
### selected_parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="selected_parameter"></a>
### selected_parameter_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_parameter_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_automation_parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)<a name="selected_automation_parameter"></a>
> Selected parameter in the automation editor.
> When setting a new parameter, parameter must be automateable and
> must be one of the currently selected track device chain.

### selected_automation_parameter_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_automation_parameter_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_automation_device : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)<a name="selected_automation_device"></a>
> **READ-ONLY** parent device of 'selected_automation_parameter'. not settable.

### selected_automation_device_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_automation_device_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_pattern : [`renoise.Pattern`](../../API/renoise/renoise.Pattern.md)<a name="selected_pattern"></a>
> **READ-ONLY** The currently edited pattern.

### selected_pattern_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_pattern_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_pattern_index : [`integer`](../../API/builtins/integer.md)<a name="selected_pattern_index"></a>
> **READ-ONLY** The currently edited pattern index.

### selected_pattern_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_pattern_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_pattern_track : [`renoise.PatternTrack`](../../API/renoise/renoise.PatternTrack.md)<a name="selected_pattern_track"></a>
> **READ-ONLY** The currently edited pattern track object.
> and selected_track_observable for notifications.

### selected_pattern_track_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_pattern_track_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_sequence_index : [`integer`](../../API/builtins/integer.md)<a name="selected_sequence_index"></a>
> The currently edited sequence position.

### selected_sequence_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selected_sequence_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_line : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)<a name="selected_line"></a>
> **READ-ONLY** The currently edited line in the edited pattern.

### selected_line_index : [`integer`](../../API/builtins/integer.md)<a name="selected_line_index"></a>
### selected_note_column : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md)<a name="selected_note_column"></a>
> **READ-ONLY** The currently edited column in the selected line in the edited
> sequence/pattern. Nil when an effect column is selected.

### selected_note_column_index : [`integer`](../../API/builtins/integer.md)<a name="selected_note_column_index"></a>
### selected_effect_column : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md)<a name="selected_effect_column"></a>
> **READ-ONLY** The currently edited column in the selected line in the edited
> sequence/pattern. Nil when a note column is selected.

### selected_effect_column_index : [`integer`](../../API/builtins/integer.md)<a name="selected_effect_column_index"></a>
### selected_sub_column_type : [`renoise.Song.SubColumnType`](renoise.Song.md#SubColumnType)<a name="selected_sub_column_type"></a>
> **READ-ONLY** The currently edited sub column type within the selected
> note/effect column.

### selection_in_pattern : [`PatternSelection`](#patternselection)[`?`](../../API/builtins/nil.md)<a name="selection_in_pattern"></a>
> Read/write access to the selection in the pattern editor.
> 
> Line indexes are valid from 1 to patterns[].number_of_lines
> Track indexes are valid from 1 to #tracks
> Column indexes are valid from 1 to
>   (tracks[].visible_note_columns + tracks[].visible_effect_columns)
> 
> When setting the selection, all members are optional. Combining them in
> various different ways will affect how specific the selection is. When
> `selection_in_pattern` returns nil or is set to nil, no selection is present.
> 
> #### examples:
> ```lua
> renoise.song().selection_in_pattern = {}
>   --> clear
> renoise.song().selection_in_pattern = { start_line = 1, end_line = 4 }
>   --> select line 1 to 4, first to last track
> renoise.song().selection_in_pattern =
>   { start_line = 1, start_track = 1, end_line = 4, end_track = 1 }
>   --> select line 1 to 4, in the first track only
> ```

### selection_in_phrase : [`PhraseSelection`](#phraseselection)[`?`](../../API/builtins/nil.md)<a name="selection_in_phrase"></a>
> Same as `selection_in_pattern` but for the currently selected phrase (if any).

  

---  
## Functions
### can_undo([*self*](../../API/builtins/self.md))<a name="can_undo"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Test if something in the song can be undone.
### undo([*self*](../../API/builtins/self.md))<a name="undo"></a>
> Undo the last performed action. Will do nothing if nothing can be undone.
### can_redo([*self*](../../API/builtins/self.md))<a name="can_redo"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Test if something in the song can be redone.
### redo([*self*](../../API/builtins/self.md))<a name="redo"></a>
> Redo a previously undo action. Will do nothing if nothing can be redone.
### describe_undo([*self*](../../API/builtins/self.md), description : [`any`](../../API/builtins/any.md))<a name="describe_undo"></a>
> When modifying the song, Renoise will automatically add descriptions for
> undo/redo by looking at what first changed (a track was inserted, a pattern
> line changed, and so on). When the song is changed from an action in a menu
> entry callback, the menu entry's label will automatically be used for the
> undo description.
> If those auto-generated names do not work for you, or you want  to use
> something more descriptive, you can (!before changing anything in the song!)
> give your changes a custom undo description (like: "Generate Synth Sample")
### insert_track_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="insert_track_at"></a>
`->`[`renoise.Track`](../../API/renoise/renoise.Track.md)  

> Insert a new track at the given index. Inserting a track behind or at the
> Master Track's index will create a Send Track. Otherwise, a regular track is
> created.
### delete_track_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="delete_track_at"></a>
> Delete an existing track. The Master track can not be deleted, but all Sends
> can. Renoise needs at least one regular track to work, thus trying to
> delete all regular tracks will fire an error.
### swap_tracks_at([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_tracks_at"></a>
> Swap the positions of two tracks. A Send can only be swapped with a Send
> track and a regular track can only be swapped with another regular track.
> The Master can not be swapped at all.
### track([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="track"></a>
`->`[`renoise.Track`](../../API/renoise/renoise.Track.md)  

> Access to a single track by index. Use properties 'tracks' to iterate over
> all tracks and to query the track count.
### select_previous_track([*self*](../../API/builtins/self.md))<a name="select_previous_track"></a>
> Set the selected track to prev relative to the current track. Takes
> care of skipping over hidden tracks and wrapping around at the edges.
### select_next_track([*self*](../../API/builtins/self.md))<a name="select_next_track"></a>
> Set the selected track to next relative to the current track. Takes
> care of skipping over hidden tracks and wrapping around at the edges.
### insert_group_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="insert_group_at"></a>
`->`[`renoise.GroupTrack`](../../API/renoise/renoise.GroupTrack.md)  

> Insert a new group track at the given index. Group tracks can only be
> inserted before the Master track.
### add_track_to_group([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md), group_index : [`integer`](../../API/builtins/integer.md))<a name="add_track_to_group"></a>
> Add track at track_index to group at group_index by first moving it to the
> right spot to the left of the group track, and then adding it. If group_index
> is not a group track, a new group track will be created and both tracks
> will be added to it.
### remove_track_from_group([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md))<a name="remove_track_from_group"></a>
> Removes track from its immediate parent group and places it outside it to
> the left. Can only be called for tracks that are actually part of a group.
### delete_group_at([*self*](../../API/builtins/self.md), group_index : [`integer`](../../API/builtins/integer.md))<a name="delete_group_at"></a>
> Delete the group with the given index and all its member tracks.
> Index must be that of a group or a track that is a member of a group.
### insert_instrument_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="insert_instrument_at"></a>
`->`[`renoise.Instrument`](../../API/renoise/renoise.Instrument.md)  

> Insert a new instrument at the given index. This will remap all existing
> notes in all patterns, if needed, and also update all other instrument links
> in the song. Can't have more than MAX_NUMBER_OF_INSTRUMENTS in a song.
### delete_instrument_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="delete_instrument_at"></a>
> Delete an existing instrument at the given index. Renoise needs at least one
> instrument, thus trying to completely remove all instruments is not allowed.
> This will remap all existing notes in all patterns and update all other
> instrument links in the song.
### swap_instruments_at([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_instruments_at"></a>
> Swap the position of two instruments. Will remap all existing notes in all
> patterns and update all other instrument links in the song.
### instrument([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="instrument"></a>
`->`[`renoise.Instrument`](../../API/renoise/renoise.Instrument.md)  

> Access to a single instrument by index. Use properties 'instruments' to iterate
> over all instruments and to query the instrument count.
### capture_instrument_from_pattern([*self*](../../API/builtins/self.md))<a name="capture_instrument_from_pattern"></a>
> Captures the current instrument (selects the instrument) from the current
> note column at the current cursor pos. Changes the selected instrument
> accordingly, but does not return the result. When no instrument is present at
> the current cursor pos, nothing will be done.
### capture_nearest_instrument_from_pattern([*self*](../../API/builtins/self.md))<a name="capture_nearest_instrument_from_pattern"></a>
> Tries to captures the nearest instrument from the current pattern track,
> starting to look at the cursor pos, then advancing until an instrument is
> found. Changes the selected instrument accordingly, but does not return
> the result. When no instruments (notes) are present in the current pattern
> track, nothing will be done.
### pattern([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="pattern"></a>
`->`[`renoise.Pattern`](../../API/renoise/renoise.Pattern.md)  

> Access to a single pattern by index. Use properties 'patterns' to iterate
> over all patterns and to query the pattern count.
### cancel_rendering([*self*](../../API/builtins/self.md))<a name="cancel_rendering"></a>
> When rendering (see rendering, renoise.song().rendering_progress),
> the current render process is canceled. Otherwise, nothing is done.
### render([*self*](../../API/builtins/self.md), options : [`RenderOptions`](#renderoptions), filename : [`string`](../../API/builtins/string.md), rendering_done_callback : fun())<a name="render"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)  

> Start rendering a section of the song or the whole song to a WAV file.
> 
> Rendering job will be done in the background and the call will return
> back immediately, but the Renoise GUI will be blocked during rendering. The
> passed `rendering_done_callback` function is called as soon as rendering is
> done, e.g. successfully completed.
> 
> While rendering, the rendering status can be polled with the `song().rendering`
> and `song().rendering_progress` properties, for example, in idle notifier
> loops. If starting the rendering process fails (because of file IO errors for
> example), the render function will return false and the error message is set
> as the second return value. On success, only a single `true` value is
> returned.
> 
> To render only specific tracks or columns, mute the undesired tracks/columns
> before starting to render.
> 
> Parameter `file_name` must point to a valid, maybe already existing file. If it
> already exists, the file will be silently overwritten. The renderer will
> automatically add a ".wav" extension to the file_name, if missing.
> 
> Parameter `rendering_done_callback` is ONLY called when rendering has succeeded.
> You can do something with the file you've passed to the renderer here, like
> for example loading the file into a sample buffer.
### load_midi_mappings([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="load_midi_mappings"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)  

> Load all global MIDI mappings in the song into a XRNM file.
> Returns true when loading/saving succeeded, else false and the error message.
### save_midi_mappings([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md))<a name="save_midi_mappings"></a>
`->`success : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)  

> Save all global MIDI mappings in the song into a XRNM file.
> Returns true when loading/saving succeeded, else false and the error message.
### clear_midi_mappings([*self*](../../API/builtins/self.md))<a name="clear_midi_mappings"></a>
> clear all MIDI mappings in the song  



---  
## Structs  
# PatternSelection<a name="PatternSelection"></a>  
> Selection range in the current pattern  

---  
## Properties
### start_line : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="start_line"></a>
> Start pattern line index

### start_track : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="start_track"></a>
> Start track index

### start_column : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="start_column"></a>
> Start column index within start_track

### end_line : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="end_line"></a>
> End pattern line index

### end_track : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="end_track"></a>
> End track index

### end_column : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="end_column"></a>
> End column index within end_track

  

  
# PhraseSelection<a name="PhraseSelection"></a>  
> Selection range in the current phrase  

---  
## Properties
### start_line : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="start_line"></a>
> Start pattern line index

### start_column : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="start_column"></a>
> Start column index within start_track

### end_line : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="end_line"></a>
> End pattern line index

### end_column : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="end_column"></a>
> End column index within end_track

  

  
# RenderOptions<a name="RenderOptions"></a>  

---  
## Properties
### start_pos : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)<a name="start_pos"></a>
> by default the song start.

### end_pos : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)<a name="end_pos"></a>
> by default the song end.

### sample_rate : `192000` | `22050` | `44100` | `48000` | `88200` | `96000`<a name="sample_rate"></a>
> by default the players current rate.

### bit_depth : `16` | `24` | `32`<a name="bit_depth"></a>
> by default 32.

### interpolation : `"default"` | `"precise"`<a name="interpolation"></a>
> by default "default".

### priority : `"high"` | `"low"` | `"realtime"`<a name="priority"></a>
> by default "high".

  

  

