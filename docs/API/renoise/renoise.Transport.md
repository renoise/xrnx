# renoise.Transport  
Transport component of the Renoise song.  
## Constants
### PlayMode {#PlayMode}
```lua
{
    PLAYMODE_RESTART_PATTERN: integer = 1,
    PLAYMODE_CONTINUE_PATTERN: integer = 2,
}
```
### RecordParameterMode {#RecordParameterMode}
```lua
{
    RECORD_PARAMETER_MODE_PATTERN: integer = 1,
    RECORD_PARAMETER_MODE_AUTOMATION: integer = 2,
}
```
### TimingModel {#TimingModel}
```lua
{
    TIMING_MODEL_SPEED: integer = 1,
    TIMING_MODEL_LPB: integer = 2,
}
```
  

---  
## Properties
### bpm : [`number`](/API/builtins/number.md) {#bpm}
Range: (32 - 999) Beats per Minute

### bpm_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#bpm_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### edit_mode : [`boolean`](/API/builtins/boolean.md) {#edit_mode}
Edit modes

### edit_mode_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#edit_mode_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### edit_pos : [`renoise.SongPos`](/API/renoise/renoise.SongPos.md) {#edit_pos}
Edit position

### edit_pos_beats : [`number`](/API/builtins/number.md) {#edit_pos_beats}
Range: (0 - song_end_beats) Song position in beats

### edit_step : [`integer`](/API/builtins/integer.md) {#edit_step}
Range: (0 - 64)

### edit_step_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#edit_step_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### follow_player : [`boolean`](/API/builtins/boolean.md) {#follow_player}
Follow, wrapped pattern, single track modes

### follow_player_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#follow_player_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### groove_amounts : [`number`](/API/builtins/number.md)`[]` {#groove_amounts}
table with 4 numbers in Range: (0 - 1)

### groove_assignment_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#groove_assignment_observable}
Attach notifiers that will be called as soon as any groove value changed.

### groove_enabled : [`boolean`](/API/builtins/boolean.md) {#groove_enabled}
Groove. (aka Shuffle)

### groove_enabled_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#groove_enabled_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### keyboard_velocity : [`integer`](/API/builtins/integer.md) {#keyboard_velocity}
Range: (0 - 127)

### keyboard_velocity_enabled : [`boolean`](/API/builtins/boolean.md) {#keyboard_velocity_enabled}
Computer Keyboard Velocity.

### keyboard_velocity_enabled_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#keyboard_velocity_enabled_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### keyboard_velocity_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#keyboard_velocity_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### loop_block_enabled : [`boolean`](/API/builtins/boolean.md) {#loop_block_enabled}
Block Loop On/Off

### loop_block_range_coeff : [`integer`](/API/builtins/integer.md) {#loop_block_range_coeff}
Range: (2 - 16)

### loop_block_start_pos : [`renoise.SongPos`](/API/renoise/renoise.SongPos.md) {#loop_block_start_pos}
Start of block loop

### loop_end : [`renoise.SongPos`](/API/renoise/renoise.SongPos.md) {#loop_end}
**READ-ONLY**

### loop_end_beats : [`number`](/API/builtins/number.md) {#loop_end_beats}
**READ-ONLY** Range: (0 - song_end_beats)

### loop_pattern : [`boolean`](/API/builtins/boolean.md) {#loop_pattern}
Pattern Loop On/Off

### loop_pattern_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#loop_pattern_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### loop_range : [`renoise.SongPos`](/API/renoise/renoise.SongPos.md)`[]` {#loop_range}
{loop start, loop end}

### loop_range_beats : [`number`](/API/builtins/number.md)`[]` {#loop_range_beats}
{loop start beats, loop end beats}

### loop_sequence_end : [`integer`](/API/builtins/integer.md) {#loop_sequence_end}
**READ-ONLY** 0 or Range: (1  -  sequence length)

### loop_sequence_range : [`integer`](/API/builtins/integer.md)`[]` {#loop_sequence_range}
{} or Range(sequence start, sequence end)

### loop_sequence_start : [`integer`](/API/builtins/integer.md) {#loop_sequence_start}
**READ-ONLY** 0 or Range: (1  -  sequence length)

### loop_start : [`renoise.SongPos`](/API/renoise/renoise.SongPos.md) {#loop_start}
**READ-ONLY**

### loop_start_beats : [`number`](/API/builtins/number.md) {#loop_start_beats}
**READ-ONLY** Range: (0 - song_end_beats)

### lpb : [`integer`](/API/builtins/integer.md) {#lpb}
Range: (1 - 256) Lines per Beat

### lpb_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#lpb_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### metronome_beats_per_bar : [`integer`](/API/builtins/integer.md) {#metronome_beats_per_bar}
Range: (1 - 16)

### metronome_beats_per_bar_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#metronome_beats_per_bar_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### metronome_enabled : [`boolean`](/API/builtins/boolean.md) {#metronome_enabled}
Metronome

### metronome_enabled_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#metronome_enabled_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### metronome_lines_per_beat : [`integer`](/API/builtins/integer.md) {#metronome_lines_per_beat}
Range: (1 - 256) or 0 = songs current LPB

### metronome_lines_per_beat_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#metronome_lines_per_beat_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### metronome_precount_bars : [`integer`](/API/builtins/integer.md) {#metronome_precount_bars}
Range: (1 - 4)

### metronome_precount_bars_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#metronome_precount_bars_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### metronome_precount_enabled : [`boolean`](/API/builtins/boolean.md) {#metronome_precount_enabled}
Metronome precount

### metronome_precount_enabled_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#metronome_precount_enabled_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### octave : [`integer`](/API/builtins/integer.md) {#octave}
Range: (0 - 8)

### octave_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#octave_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### playback_pos : [`renoise.SongPos`](/API/renoise/renoise.SongPos.md) {#playback_pos}
Playback position

### playback_pos_beats : [`number`](/API/builtins/number.md) {#playback_pos_beats}
Range: (0 - song_end_beats) Song position in beats

### playing : [`boolean`](/API/builtins/boolean.md) {#playing}
Playing

### playing_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#playing_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### record_parameter_mode : [`renoise.Transport.RecordParameterMode`](renoise.Transport.md#RecordParameterMode) {#record_parameter_mode}
Record parameter

### record_parameter_mode_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#record_parameter_mode_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### record_quantize_enabled : [`boolean`](/API/builtins/boolean.md) {#record_quantize_enabled}
Quantize

### record_quantize_enabled_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#record_quantize_enabled_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### record_quantize_lines : [`integer`](/API/builtins/integer.md) {#record_quantize_lines}
Range: (1 - 32)

### record_quantize_lines_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#record_quantize_lines_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### single_track_edit_mode : [`boolean`](/API/builtins/boolean.md) {#single_track_edit_mode}
### single_track_edit_mode_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#single_track_edit_mode_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### song_length : [`renoise.SongPos`](/API/renoise/renoise.SongPos.md) {#song_length}
**READ-ONLY**

### song_length_beats : [`number`](/API/builtins/number.md) {#song_length_beats}
**READ-ONLY**

### timing_model : [`renoise.Transport.TimingModel`](renoise.Transport.md#TimingModel) {#timing_model}
*READ-ONLY* Old school speed or new LPB timing used?
With `TIMING_MODEL_SPEED`, tpl is used as speed factor. The lpb property
is unused then. With `TIMING_MODEL_LPB`, tpl is used as event rate for effects
only and lpb defines relationship between pattern lines and beats.

### tpl : [`integer`](/API/builtins/integer.md) {#tpl}
Range: (1 - 16) Ticks per Line

### tpl_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#tpl_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### track_headroom : [`number`](/API/builtins/number.md) {#track_headroom}
Range: (math.db2lin(-12) - math.db2lin(0))

### track_headroom_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#track_headroom_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### wrapped_pattern_edit : [`boolean`](/API/builtins/boolean.md) {#wrapped_pattern_edit}
### wrapped_pattern_edit_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#wrapped_pattern_edit_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `add_scheduled_sequence`([*self*](/API/builtins/self.md), sequence_pos : [`integer`](/API/builtins/integer.md)) {#add_scheduled_sequence}
Append the sequence to the scheduled sequence list. Scheduled playback
positions will apply as soon as the currently playing pattern play to end.
### `cancel_sample_recording`([*self*](/API/builtins/self.md)) {#cancel_sample_recording}
Cancel a currently running sample recording when the sample dialog
is visible, otherwise do nothing.
### `loop_block_move_backwards`([*self*](/API/builtins/self.md)) {#loop_block_move_backwards}
Move the block loop one segment backwards, when possible.
### `loop_block_move_forwards`([*self*](/API/builtins/self.md)) {#loop_block_move_forwards}
Move the block loop one segment forwards, when possible.
### `panic`([*self*](/API/builtins/self.md)) {#panic}
Panic.
### `set_scheduled_sequence`([*self*](/API/builtins/self.md), sequence_pos : [`integer`](/API/builtins/integer.md)) {#set_scheduled_sequence}
Replace the scheduled sequence list with the given sequence.
### `start`([*self*](/API/builtins/self.md), mode : [`renoise.Transport.PlayMode`](renoise.Transport.md#PlayMode)) {#start}
Start playing in song or pattern mode.
### `start_at`([*self*](/API/builtins/self.md), line : [`integer`](/API/builtins/integer.md)) {#start_at}
Start playing the currently edited pattern at the given line offset
### `start_at`([*self*](/API/builtins/self.md), song_pos : [`renoise.SongPos`](/API/renoise/renoise.SongPos.md)) {#start_at}
Start playing a the given renoise.SongPos (sequence pos and line)
### `start_stop_sample_recording`([*self*](/API/builtins/self.md)) {#start_stop_sample_recording}
Start a new sample recording when the sample dialog is visible,
otherwise stop and finish it.
### `stop`([*self*](/API/builtins/self.md)) {#stop}
Stop playing. When already stopped this just stops all playing notes.
### `trigger_sequence`([*self*](/API/builtins/self.md), sequence_pos : [`integer`](/API/builtins/integer.md)) {#trigger_sequence}
Immediately start playing at the given sequence position.  

