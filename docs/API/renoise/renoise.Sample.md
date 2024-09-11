# renoise.Sample  

<!-- toc -->
  
## Constants
### BeatSyncMode {#BeatSyncMode}
> ```lua
> {
>     BEAT_SYNC_REPITCH: integer = 1,
>     BEAT_SYNC_PERCUSSION: integer = 2,
>     BEAT_SYNC_TEXTURE: integer = 3,
> }
> ```
### InterpolationMode {#InterpolationMode}
> ```lua
> {
>     INTERPOLATE_NONE: integer = 1,
>     INTERPOLATE_LINEAR: integer = 2,
>     INTERPOLATE_CUBIC: integer = 3,
>     INTERPOLATE_SINC: integer = 4,
> }
> ```
### LoopMode {#LoopMode}
> ```lua
> {
>     LOOP_MODE_OFF: integer = 1,
>     LOOP_MODE_FORWARD: integer = 2,
>     LOOP_MODE_REVERSE: integer = 3,
>     LOOP_MODE_PING_PONG: integer = 4,
> }
> ```
### NewNoteActionMode {#NewNoteActionMode}
> ```lua
> {
>     NEW_NOTE_ACTION_NOTE_CUT: integer = 1,
>     NEW_NOTE_ACTION_NOTE_OFF: integer = 2,
>     NEW_NOTE_ACTION_SUSTAIN: integer = 3,
> }
> ```
  

---  
## Properties
### autofade : [`boolean`](../../API/builtins/boolean.md) {#autofade}
### autofade_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#autofade_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### autoseek : [`boolean`](../../API/builtins/boolean.md) {#autoseek}
### autoseek_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#autoseek_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### beat_sync_enabled : [`boolean`](../../API/builtins/boolean.md) {#beat_sync_enabled}
> Beat sync.

### beat_sync_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#beat_sync_enabled_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### beat_sync_lines : [`integer`](../../API/builtins/integer.md) {#beat_sync_lines}
> Range: (1 - 512)

### beat_sync_lines_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#beat_sync_lines_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### beat_sync_mode : [`renoise.Sample.BeatSyncMode`](renoise.Sample.md#BeatSyncMode) {#beat_sync_mode}
### beat_sync_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#beat_sync_mode_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### device_chain_index : [`integer`](../../API/builtins/integer.md) {#device_chain_index}
> The linked instrument device chain. 0 when disable, else a valid index for the
> renoise.Instrument.sample_device_chain table

### device_chain_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#device_chain_index_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### fine_tune : [`integer`](../../API/builtins/integer.md) {#fine_tune}
> Range: (-127 - 127)

### fine_tune_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#fine_tune_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### interpolation_mode : [`renoise.Sample.InterpolationMode`](renoise.Sample.md#InterpolationMode) {#interpolation_mode}
> Interpolation, new note action, oneshot, mute_group, autoseek, autofade.

### interpolation_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#interpolation_mode_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_slice_alias : [`boolean`](../../API/builtins/boolean.md) {#is_slice_alias}
> **READ-ONLY** True, when the sample slot is an alias to a sliced master sample.
> Such sample slots are read-only and automatically managed with the master samples
> slice list.

### loop_end : [`integer`](../../API/builtins/integer.md) {#loop_end}
> Range: (1 - num_sample_frames)

### loop_end_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#loop_end_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_mode : [`renoise.Sample.LoopMode`](renoise.Sample.md#LoopMode) {#loop_mode}
> Loops.

### loop_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#loop_mode_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_release : [`boolean`](../../API/builtins/boolean.md) {#loop_release}
### loop_release_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#loop_release_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_start : [`integer`](../../API/builtins/integer.md) {#loop_start}
> Range: (1 - num_sample_frames)

### loop_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#loop_start_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### modulation_set_index : [`integer`](../../API/builtins/integer.md) {#modulation_set_index}
> The linked modulation set. 0 when disable, else a valid index for the
> renoise.Instrument.sample_modulation_sets table

### modulation_set_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#modulation_set_index_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### mute_group : [`integer`](../../API/builtins/integer.md) {#mute_group}
> Range: (0 - 15) where 0 means no group

### mute_group_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#mute_group_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### name : [`string`](../../API/builtins/string.md) {#name}
> Name.

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#name_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### new_note_action : [`renoise.Sample.NewNoteActionMode`](renoise.Sample.md#NewNoteActionMode) {#new_note_action}
### new_note_action_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#new_note_action_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### oneshot : [`boolean`](../../API/builtins/boolean.md) {#oneshot}
### oneshot_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#oneshot_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### oversample_enabled : [`boolean`](../../API/builtins/boolean.md) {#oversample_enabled}
### oversample_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#oversample_enabled_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### panning : [`number`](../../API/builtins/number.md) {#panning}
> Range: (0.0 - 1.0)

### panning_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#panning_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### sample_buffer : [`renoise.SampleBuffer`](../../API/renoise/renoise.SampleBuffer.md) {#sample_buffer}
> **READ-ONLY**

### sample_buffer_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#sample_buffer_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### sample_mapping : [`renoise.SampleMapping`](../../API/renoise/renoise.SampleMapping.md) {#sample_mapping}
> **READ-ONLY** Keyboard Note/velocity mapping

### slice_markers : [`integer`](../../API/builtins/integer.md)[] {#slice_markers}
> Read/write access to the slice marker list of a sample. When new markers are
> set or existing ones unset, existing 0S effects or notes to existing slices
> will NOT be remapped (unlike its done with the insert/remove/move_slice_marker
> functions). See function insert_slice_marker for info about marker limitations
> and preconditions.

### slice_markers_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#slice_markers_observable}
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### transpose : [`integer`](../../API/builtins/integer.md) {#transpose}
> Range: (-120 - 120)

### transpose_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#transpose_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### volume : [`number`](../../API/builtins/number.md) {#volume}
> Range: (0.0 - 4.0)

### volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#volume_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md)) {#clear}
> Reset, clear all sample settings and sample data.
### copy_from([*self*](../../API/builtins/self.md), sample : [`renoise.Sample`](../../API/renoise/renoise.Sample.md)) {#copy_from}
> Copy all settings, including sample data from another sample.
### delete_slice_marker([*self*](../../API/builtins/self.md), marker_sample_pos : [`integer`](../../API/builtins/integer.md)) {#delete_slice_marker}
> Delete an existing slice marker. marker_sample_pos must point to an existing
> marker. See also property 'samples[].slice_markers'. Existing 0S effects or
> notes will be updated to ensure that the old slices are played back just as
> before.
### insert_slice_marker([*self*](../../API/builtins/self.md), marker_sample_pos : [`integer`](../../API/builtins/integer.md)) {#insert_slice_marker}
> Insert a new slice marker at the given sample position. Only samples in
> the first sample slot may use slices. Creating slices will automatically
> create sample aliases in the following slots: read-only sample slots that
> play the sample slice and are mapped to notes. Sliced sample lists can not
> be modified manually then. To update such aliases, modify the slice marker
> list instead.
> Existing 0S effects or notes will be updated to ensure that the old slices
> are played back just as before.
### move_slice_marker([*self*](../../API/builtins/self.md), old_marker_pos : [`integer`](../../API/builtins/integer.md), new_marker_pos : [`integer`](../../API/builtins/integer.md)) {#move_slice_marker}
> Change the sample position of an existing slice marker. see also property
> 'samples[].slice_markers'.
> When moving a marker behind or before an existing other marker, existing 0S
> effects or notes will automatically be updated to ensure that the old slices
> are played back just as before.  

