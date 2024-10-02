# renoise.SampleBuffer  
> NOTE: All properties are invalid when no sample data is present,
> 'has_sample_data' returns false:  

<!-- toc -->
  
## Constants
### Channel {#Channel}
> ```lua
> {
>     CHANNEL_LEFT: integer = 1,
>     CHANNEL_RIGHT: integer = 2,
>     CHANNEL_LEFT_AND_RIGHT: integer = 3,
> }
> ```
  

---  
## Properties
### has_sample_data : [`boolean`](../../API/builtins/boolean.md) {#has_sample_data}
> **READ-ONLY** Check this before accessing properties

### read_only : [`boolean`](../../API/builtins/boolean.md) {#read_only}
> **READ-ONLY** True, when the sample buffer can only be read, but not be
> modified. true for sample aliases of sliced samples. To modify such sample
> buffers, modify the sliced master sample buffer instead.

### sample_rate : [`integer`](../../API/builtins/integer.md) {#sample_rate}
> **READ-ONLY** The current sample rate in Hz, like 44100.

### bit_depth : [`integer`](../../API/builtins/integer.md) {#bit_depth}
> **READ-ONLY** The current bit depth, like 32, 16, 8.

### number_of_channels : [`integer`](../../API/builtins/integer.md) {#number_of_channels}
> **READ-ONLY** The integer of sample channels (1 or 2)

### number_of_frames : [`integer`](../../API/builtins/integer.md) {#number_of_frames}
> **READ-ONLY** The sample frame count (integer of samples per channel)

### display_start : [`integer`](../../API/builtins/integer.md) {#display_start}
> Range: (1 - number_of_frames)

### display_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#display_start_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### display_length : [`integer`](../../API/builtins/integer.md) {#display_length}
> Range: (1 - number_of_frames)

### display_length_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#display_length_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### display_range : [`integer`](../../API/builtins/integer.md)[] {#display_range}
> Range: (1 - number_of_frames)

### display_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#display_range_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### vertical_zoom_factor : [`number`](../../API/builtins/number.md) {#vertical_zoom_factor}
> Range(0.0-1.0)

### vertical_zoom_factor_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#vertical_zoom_factor_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### selection_start : [`integer`](../../API/builtins/integer.md) {#selection_start}
> Range: (1 - number_of_frames)

### selection_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#selection_start_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### selection_end : [`integer`](../../API/builtins/integer.md) {#selection_end}
> Range: (1 - number_of_frames)

### selection_end_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#selection_end_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### selection_range : [`integer`](../../API/builtins/integer.md)[] {#selection_range}
> Range: (1 - number_of_frames)

### selection_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#selection_range_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### selected_channel : [`renoise.SampleBuffer.Channel`](renoise.SampleBuffer.md#Channel) {#selected_channel}
> The selected channel.

### selected_channel_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#selected_channel_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### create_sample_data([*self*](../../API/builtins/self.md), sample_rate : [`integer`](../../API/builtins/integer.md), bit_depth : [`integer`](../../API/builtins/integer.md), num_channels : [`integer`](../../API/builtins/integer.md), num_frames : [`integer`](../../API/builtins/integer.md)) {#create_sample_data}
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Create new sample data with the given rate, bit-depth, channel and frame
> count. Will trash existing sample data. Initial buffer is all zero.
> Will only return false when memory allocation fails (you're running out
> of memory). All other errors are fired as usual.
### delete_sample_data([*self*](../../API/builtins/self.md)) {#delete_sample_data}
> Delete existing sample data.
### sample_data([*self*](../../API/builtins/self.md), channel_index : [`integer`](../../API/builtins/integer.md), frame_index : [`integer`](../../API/builtins/integer.md)) {#sample_data}
`->`values : [`number`](../../API/builtins/number.md)[]  

> Read access to samples in a sample data buffer.
### set_sample_data([*self*](../../API/builtins/self.md), channel_index : [`integer`](../../API/builtins/integer.md), frame_index : [`integer`](../../API/builtins/integer.md), sample_value : [`integer`](../../API/builtins/integer.md)) {#set_sample_data}
> Write access to samples in a sample data buffer. New samples values must be
> within [-1, 1] and will be clipped automatically. Sample buffers may be
> read-only (see property 'read_only'). Attempts to write on such buffers
> will result into errors.
> IMPORTANT: before modifying buffers, call 'prepare_sample_data_changes'.
> When you are done, call 'finalize_sample_data_changes' to generate undo/redo
> data for your changes and update sample overview caches!
### prepare_sample_data_changes([*self*](../../API/builtins/self.md)) {#prepare_sample_data_changes}
> To be called once BEFORE sample data gets manipulated via 'set_sample_data'.
> This will prepare undo/redo data for the whole sample. See also
> 'finalize_sample_data_changes'.
### finalize_sample_data_changes([*self*](../../API/builtins/self.md)) {#finalize_sample_data_changes}
> To be called once AFTER the sample data is manipulated via 'set_sample_data'.
> This will create undo/redo data for the whole sample, and also  update the
> sample view caches for the sample. The reason this isn't automatically
> invoked is to avoid performance overhead when changing sample data 'sample by
> sample'. Don't forget to call this after any data changes, or changes may not
> be visible in the GUI and can not be un/redone!
### load_from([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md)) {#load_from}
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Load sample data from a file. Files can be any audio format Renoise supports.
> Possible errors are shown to the user, otherwise success is returned.
### save_as([*self*](../../API/builtins/self.md), filename : [`string`](../../API/builtins/string.md), format : [`SampleBuffer.ExportType`](#SampleBuffer.ExportType)) {#save_as}
`->`success : [`boolean`](../../API/builtins/boolean.md)  

> Export sample data to a file. Possible errors are shown to the user,
> otherwise success is returned.
> 
> ```lua
> format:
>     | "wav"
>     | "flac"
> ```  



---  
## Local Aliases  
### SampleBuffer.ExportType {#SampleBuffer.ExportType}
`"flac"` | `"wav"`  
> ```lua
> SampleBuffer.ExportType:
>     | "wav"
>     | "flac"
> ```  
  

