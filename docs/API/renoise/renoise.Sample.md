# renoise.Sample<a name="renoise.Sample"></a>  

<!-- toc -->
  
## Constants
### InterpolationMode<a name="InterpolationMode"></a>
> ```lua
> {
>     INTERPOLATE_NONE: integer = 1,
>     INTERPOLATE_LINEAR: integer = 2,
>     INTERPOLATE_CUBIC: integer = 3,
>     INTERPOLATE_SINC: integer = 4,
> }
> ```
### LoopMode<a name="LoopMode"></a>
> ```lua
> {
>     LOOP_MODE_OFF: integer = 1,
>     LOOP_MODE_FORWARD: integer = 2,
>     LOOP_MODE_REVERSE: integer = 3,
>     LOOP_MODE_PING_PONG: integer = 4,
> }
> ```
### BeatSyncMode<a name="BeatSyncMode"></a>
> ```lua
> {
>     BEAT_SYNC_REPITCH: integer = 1,
>     BEAT_SYNC_PERCUSSION: integer = 2,
>     BEAT_SYNC_TEXTURE: integer = 3,
> }
> ```
### NewNoteActionMode<a name="NewNoteActionMode"></a>
> ```lua
> {
>     NEW_NOTE_ACTION_NOTE_CUT: integer = 1,
>     NEW_NOTE_ACTION_NOTE_OFF: integer = 2,
>     NEW_NOTE_ACTION_SUSTAIN: integer = 3,
> }
> ```
  

---  
## Properties
### is_slice_alias : [`boolean`](../../API/builtins/boolean.md)<a name="is_slice_alias"></a>
> **READ-ONLY** True, when the sample slot is an alias to a sliced master sample.
> Such sample slots are read-only and automatically managed with the master samples
> slice list.

### slice_markers : [`integer`](../../API/builtins/integer.md)[]<a name="slice_markers"></a>
> Read/write access to the slice marker list of a sample. When new markers are
> set or existing ones unset, existing 0S effects or notes to existing slices
> will NOT be remapped (unlike its done with the insert/remove/move_slice_marker
> functions). See function insert_slice_marker for info about marker limitations
> and preconditions.

### slice_markers_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="slice_markers_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> Name.

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### panning : [`number`](../../API/builtins/number.md)<a name="panning"></a>
> Range: (0.0 - 1.0)

### panning_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="panning_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### volume : [`number`](../../API/builtins/number.md)<a name="volume"></a>
> Range: (0.0 - 4.0)

### volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="volume_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### transpose : [`integer`](../../API/builtins/integer.md)<a name="transpose"></a>
> Range: (-120 - 120)

### transpose_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="transpose_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### fine_tune : [`integer`](../../API/builtins/integer.md)<a name="fine_tune"></a>
> Range: (-127 - 127)

### fine_tune_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="fine_tune_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### beat_sync_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="beat_sync_enabled"></a>
> Beat sync.

### beat_sync_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="beat_sync_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### beat_sync_lines : [`integer`](../../API/builtins/integer.md)<a name="beat_sync_lines"></a>
> Range: (1 - 512)

### beat_sync_lines_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="beat_sync_lines_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### beat_sync_mode : [`renoise.Sample.BeatSyncMode`](renoise.Sample.md#BeatSyncMode)<a name="beat_sync_mode"></a>
### beat_sync_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="beat_sync_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### interpolation_mode : [`renoise.Sample.InterpolationMode`](renoise.Sample.md#InterpolationMode)<a name="interpolation_mode"></a>
> Interpolation, new note action, oneshot, mute_group, autoseek, autofade.

### interpolation_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="interpolation_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### oversample_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="oversample_enabled"></a>
### oversample_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="oversample_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### new_note_action : [`renoise.Sample.NewNoteActionMode`](renoise.Sample.md#NewNoteActionMode)<a name="new_note_action"></a>
### new_note_action_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="new_note_action_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### oneshot : [`boolean`](../../API/builtins/boolean.md)<a name="oneshot"></a>
### oneshot_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="oneshot_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### mute_group : [`integer`](../../API/builtins/integer.md)<a name="mute_group"></a>
> Range: (0 - 15) where 0 means no group

### mute_group_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="mute_group_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### autoseek : [`boolean`](../../API/builtins/boolean.md)<a name="autoseek"></a>
### autoseek_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="autoseek_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### autofade : [`boolean`](../../API/builtins/boolean.md)<a name="autofade"></a>
### autofade_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="autofade_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_mode : [`renoise.Sample.LoopMode`](renoise.Sample.md#LoopMode)<a name="loop_mode"></a>
> Loops.

### loop_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_release : [`boolean`](../../API/builtins/boolean.md)<a name="loop_release"></a>
### loop_release_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_release_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_start : [`integer`](../../API/builtins/integer.md)<a name="loop_start"></a>
> Range: (1 - num_sample_frames)

### loop_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_start_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_end : [`integer`](../../API/builtins/integer.md)<a name="loop_end"></a>
> Range: (1 - num_sample_frames)

### loop_end_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_end_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### modulation_set_index : [`integer`](../../API/builtins/integer.md)<a name="modulation_set_index"></a>
> The linked modulation set. 0 when disable, else a valid index for the
> renoise.Instrument.sample_modulation_sets table

### modulation_set_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="modulation_set_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### device_chain_index : [`integer`](../../API/builtins/integer.md)<a name="device_chain_index"></a>
> The linked instrument device chain. 0 when disable, else a valid index for the
> renoise.Instrument.sample_device_chain table

### device_chain_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="device_chain_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### sample_buffer : [`renoise.SampleBuffer`](../../API/renoise/renoise.SampleBuffer.md)<a name="sample_buffer"></a>
> **READ-ONLY**

### sample_buffer_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sample_buffer_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### sample_mapping : [`renoise.SampleMapping`](../../API/renoise/renoise.SampleMapping.md)<a name="sample_mapping"></a>
> **READ-ONLY** Keyboard Note/velocity mapping

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Reset, clear all sample settings and sample data.
### copy_from([*self*](../../API/builtins/self.md), sample : [`renoise.Sample`](../../API/renoise/renoise.Sample.md))<a name="copy_from"></a>
> Copy all settings, including sample data from another sample.
### insert_slice_marker([*self*](../../API/builtins/self.md), marker_sample_pos : [`integer`](../../API/builtins/integer.md))<a name="insert_slice_marker"></a>
> Insert a new slice marker at the given sample position. Only samples in
> the first sample slot may use slices. Creating slices will automatically
> create sample aliases in the following slots: read-only sample slots that
> play the sample slice and are mapped to notes. Sliced sample lists can not
> be modified manually then. To update such aliases, modify the slice marker
> list instead.
> Existing 0S effects or notes will be updated to ensure that the old slices
> are played back just as before.
### delete_slice_marker([*self*](../../API/builtins/self.md), marker_sample_pos : [`integer`](../../API/builtins/integer.md))<a name="delete_slice_marker"></a>
> Delete an existing slice marker. marker_sample_pos must point to an existing
> marker. See also property 'samples[].slice_markers'. Existing 0S effects or
> notes will be updated to ensure that the old slices are played back just as
> before.
### move_slice_marker([*self*](../../API/builtins/self.md), old_marker_pos : [`integer`](../../API/builtins/integer.md), new_marker_pos : [`integer`](../../API/builtins/integer.md))<a name="move_slice_marker"></a>
> Change the sample position of an existing slice marker. see also property
> 'samples[].slice_markers'.
> When moving a marker behind or before an existing other marker, existing 0S
> effects or notes will automatically be updated to ensure that the old slices
> are played back just as before.  

