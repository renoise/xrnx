# renoise.Transport<a name="renoise.Transport"></a>  
> Transport component of the Renoise song.  

<!-- toc -->
  
## Constants
### PlayMode<a name="PlayMode"></a>
> ```lua
> {
>     PLAYMODE_RESTART_PATTERN: integer = 1,
>     PLAYMODE_CONTINUE_PATTERN: integer = 2,
> }
> ```
### RecordParameterMode<a name="RecordParameterMode"></a>
> ```lua
> {
>     RECORD_PARAMETER_MODE_PATTERN: integer = 1,
>     RECORD_PARAMETER_MODE_AUTOMATION: integer = 2,
> }
> ```
### TimingModel<a name="TimingModel"></a>
> ```lua
> {
>     TIMING_MODEL_SPEED: integer = 1,
>     TIMING_MODEL_LPB: integer = 2,
> }
> ```
### SyncMode<a name="SyncMode"></a>
> ```lua
> {
>     SYNC_MODE_INTERNAL: integer = 1,
>     SYNC_MODE_MIDI_CLOCK: integer = 2,
>     SYNC_MODE_ABLETON_LINK: integer = 3,
>     SYNC_MODE_JACK: integer = 4,
> }
> ```
  

---  
## Properties
### playing : [`boolean`](../../API/builtins/boolean.md)<a name="playing"></a>
> Playing

### playing_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="playing_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### sync_mode : [`renoise.Transport.SyncMode`](renoise.Transport.md#SyncMode)<a name="sync_mode"></a>
> Transport sync mode.
> Note: `SYNC_MODE_JACK` only is available on Linux. Trying to enable it on
> other platforms will fire an error.

### sync_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sync_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### timing_model : [`renoise.Transport.TimingModel`](renoise.Transport.md#TimingModel)<a name="timing_model"></a>
> *READ-ONLY* Old school speed or new LPB timing used?
> With `TIMING_MODEL_SPEED`, tpl is used as speed factor. The lpb property
> is unused then. With `TIMING_MODEL_LPB`, tpl is used as event rate for effects
> only and lpb defines relationship between pattern lines and beats.

### bpm : [`number`](../../API/builtins/number.md)<a name="bpm"></a>
> Range: (32 - 999) Beats per Minute

### bpm_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="bpm_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### lpb : [`integer`](../../API/builtins/integer.md)<a name="lpb"></a>
> Range: (1 - 256) Lines per Beat

### lpb_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="lpb_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### tpl : [`integer`](../../API/builtins/integer.md)<a name="tpl"></a>
> Range: (1 - 16) Ticks per Line

### tpl_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="tpl_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### playback_pos : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)<a name="playback_pos"></a>
> Playback position

### playback_pos_beats : [`number`](../../API/builtins/number.md)<a name="playback_pos_beats"></a>
> Range: (0 - song_end_beats) Song position in beats

### edit_pos : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)<a name="edit_pos"></a>
> Edit position

### edit_pos_beats : [`number`](../../API/builtins/number.md)<a name="edit_pos_beats"></a>
> Range: (0 - song_end_beats) Song position in beats

### song_length : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)<a name="song_length"></a>
> **READ-ONLY**

### song_length_beats : [`number`](../../API/builtins/number.md)<a name="song_length_beats"></a>
> **READ-ONLY**

### loop_start : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)<a name="loop_start"></a>
> **READ-ONLY**

### loop_end : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)<a name="loop_end"></a>
> **READ-ONLY**

### loop_range : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)[]<a name="loop_range"></a>
> {loop start, loop end}

### loop_start_beats : [`number`](../../API/builtins/number.md)<a name="loop_start_beats"></a>
> **READ-ONLY** Range: (0 - song_end_beats)

### loop_end_beats : [`number`](../../API/builtins/number.md)<a name="loop_end_beats"></a>
> **READ-ONLY** Range: (0 - song_end_beats)

### loop_range_beats : [`number`](../../API/builtins/number.md)[]<a name="loop_range_beats"></a>
> {loop start beats, loop end beats}

### loop_sequence_start : [`integer`](../../API/builtins/integer.md)<a name="loop_sequence_start"></a>
> **READ-ONLY** 0 or Range: (1  -  sequence length)

### loop_sequence_end : [`integer`](../../API/builtins/integer.md)<a name="loop_sequence_end"></a>
> **READ-ONLY** 0 or Range: (1  -  sequence length)

### loop_sequence_range : [`integer`](../../API/builtins/integer.md)[]<a name="loop_sequence_range"></a>
> {} or Range(sequence start, sequence end)

### loop_pattern : [`boolean`](../../API/builtins/boolean.md)<a name="loop_pattern"></a>
> Pattern Loop On/Off

### loop_pattern_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_pattern_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_block_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="loop_block_enabled"></a>
> Block Loop On/Off

### loop_block_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_block_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_block_range_coeff : [`integer`](../../API/builtins/integer.md)<a name="loop_block_range_coeff"></a>
> Range: (2 - 16)

### loop_block_range_coeff_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_block_range_coeff_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_block_start_pos : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md)<a name="loop_block_start_pos"></a>
> Start of block loop

### edit_mode : [`boolean`](../../API/builtins/boolean.md)<a name="edit_mode"></a>
> Pattern edit/record mode On/Off

### edit_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="edit_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### edit_step : [`integer`](../../API/builtins/integer.md)<a name="edit_step"></a>
> Range: (0 - 64)

### edit_step_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="edit_step_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### octave : [`integer`](../../API/builtins/integer.md)<a name="octave"></a>
> Range: (0 - 8)

### octave_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="octave_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### octave_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="octave_enabled"></a>
> Enabled for MIDI keyboards

### octave_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="octave_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### metronome_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="metronome_enabled"></a>
> Metronome playback On/Off

### metronome_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="metronome_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### metronome_beats_per_bar : [`integer`](../../API/builtins/integer.md)<a name="metronome_beats_per_bar"></a>
> Range: (1 - 16) or 0 = guess from pattern length

### metronome_beats_per_bar_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="metronome_beats_per_bar_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### metronome_lines_per_beat : [`integer`](../../API/builtins/integer.md)<a name="metronome_lines_per_beat"></a>
> Range: (1 - 256) or 0 = songs current LPB

### metronome_lines_per_beat_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="metronome_lines_per_beat_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### metronome_precount_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="metronome_precount_enabled"></a>
> Metronome precount playback On/Off

### metronome_precount_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="metronome_precount_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### metronome_precount_bars : [`integer`](../../API/builtins/integer.md)<a name="metronome_precount_bars"></a>
> Range: (1 - 4)

### metronome_precount_bars_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="metronome_precount_bars_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### metronome_volume : [`number`](../../API/builtins/number.md)<a name="metronome_volume"></a>
> Range: (0 - math.db2lin(6))

### metronome_volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="metronome_volume_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### record_quantize_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="record_quantize_enabled"></a>
> Record note quantization On/Off

### record_quantize_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="record_quantize_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### record_quantize_lines : [`integer`](../../API/builtins/integer.md)<a name="record_quantize_lines"></a>
> Range: (1 - 32)

### record_quantize_lines_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="record_quantize_lines_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### record_parameter_mode : [`renoise.Transport.RecordParameterMode`](renoise.Transport.md#RecordParameterMode)<a name="record_parameter_mode"></a>
> Record parameter

### record_parameter_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="record_parameter_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### follow_player : [`boolean`](../../API/builtins/boolean.md)<a name="follow_player"></a>
> Follow, wrapped pattern, single track modes

### follow_player_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="follow_player_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### wrapped_pattern_edit : [`boolean`](../../API/builtins/boolean.md)<a name="wrapped_pattern_edit"></a>
### wrapped_pattern_edit_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="wrapped_pattern_edit_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### single_track_edit_mode : [`boolean`](../../API/builtins/boolean.md)<a name="single_track_edit_mode"></a>
### single_track_edit_mode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="single_track_edit_mode_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### groove_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="groove_enabled"></a>
> Groove (aka Shuffle)

### groove_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="groove_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### groove_amounts : [`number`](../../API/builtins/number.md)[]<a name="groove_amounts"></a>
> table with 4 numbers in Range: (0 - 1)

### groove_assignment_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="groove_assignment_observable"></a>
> Will be called as soon as any groove value changed.

### track_headroom : [`number`](../../API/builtins/number.md)<a name="track_headroom"></a>
> Global Track Headroom
> To convert to dB: `dB = math.lin2db(renoise.Transport.track_headroom)`
> To convert from dB: `renoise.Transport.track_headroom = math.db2lin(dB)`
> Range: (math.db2lin(-12) - math.db2lin(0))

### track_headroom_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="track_headroom_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### keyboard_velocity_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="keyboard_velocity_enabled"></a>
> Computer Keyboard Velocity.

### keyboard_velocity_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="keyboard_velocity_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### keyboard_velocity : [`integer`](../../API/builtins/integer.md)<a name="keyboard_velocity"></a>
> Will return the default value of 127 when keyboard_velocity_enabled == false.
> Range: (0 - 127)

### keyboard_velocity_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="keyboard_velocity_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### sample_recording : [`boolean`](../../API/builtins/boolean.md)<a name="sample_recording"></a>
> *READ-ONLY* true when sample sample dialog is visible and recording started.

### sample_recording_sync_enabled : [`boolean`](../../API/builtins/boolean.md)<a name="sample_recording_sync_enabled"></a>
> Sample recording pattern quantization On/Off.

### sample_recording_sync_enabled_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="sample_recording_sync_enabled_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### panic([*self*](../../API/builtins/self.md))<a name="panic"></a>
> Panic.
### start([*self*](../../API/builtins/self.md), mode : [`renoise.Transport.PlayMode`](renoise.Transport.md#PlayMode))<a name="start"></a>
> Start playing in song or pattern mode.
### start_at([*self*](../../API/builtins/self.md), line : [`integer`](../../API/builtins/integer.md))<a name="start_at"></a>
> Start playing the currently edited pattern at the given line offset
### start_at([*self*](../../API/builtins/self.md), song_pos : [`renoise.SongPos`](../../API/renoise/renoise.SongPos.md))<a name="start_at"></a>
> Start playing a the given renoise.SongPos (sequence pos and line)
### stop([*self*](../../API/builtins/self.md))<a name="stop"></a>
> Stop playing. When already stopped this just stops all playing notes.
### trigger_sequence([*self*](../../API/builtins/self.md), sequence_pos : [`integer`](../../API/builtins/integer.md))<a name="trigger_sequence"></a>
> Immediately start playing at the given sequence position.
### add_scheduled_sequence([*self*](../../API/builtins/self.md), sequence_pos : [`integer`](../../API/builtins/integer.md))<a name="add_scheduled_sequence"></a>
> Append the sequence to the scheduled sequence list. Scheduled playback
> positions will apply as soon as the currently playing pattern play to end.
### set_scheduled_sequence([*self*](../../API/builtins/self.md), sequence_pos : [`integer`](../../API/builtins/integer.md))<a name="set_scheduled_sequence"></a>
> Replace the scheduled sequence list with the given sequence.
### loop_block_move_forwards([*self*](../../API/builtins/self.md))<a name="loop_block_move_forwards"></a>
> Move the block loop one segment forwards, when possible.
### loop_block_move_backwards([*self*](../../API/builtins/self.md))<a name="loop_block_move_backwards"></a>
> Move the block loop one segment backwards, when possible.
### start_sample_recording([*self*](../../API/builtins/self.md))<a name="start_sample_recording"></a>
> Start a new sample recording when the sample dialog is visible.
### stop_sample_recording([*self*](../../API/builtins/self.md))<a name="stop_sample_recording"></a>
> Stop sample recording when the sample dialog is visible and running
### start_stop_sample_recording([*self*](../../API/builtins/self.md))<a name="start_stop_sample_recording"></a>
> **Deprecated.** Use `start_sample_recording` or `stop_sample_recording` instead.
### cancel_sample_recording([*self*](../../API/builtins/self.md))<a name="cancel_sample_recording"></a>
> Cancel a currently running sample recording when the sample dialog
> is visible, otherwise do nothing.  

