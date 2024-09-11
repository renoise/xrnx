# renoise.InstrumentPhraseMapping  

<!-- toc -->
  
## Constants
### KeyTrackingMode {#KeyTrackingMode}
> ```lua
> {
>     KEY_TRACKING_NONE: integer = 1,
>     KEY_TRACKING_TRANSPOSE: integer = 2,
>     KEY_TRACKING_OFFSET: integer = 3,
> }
> ```
  

---  
## Properties
### base_note : [`integer`](../../API/builtins/integer.md) {#base_note}
> Range: (0 - 119) where C-4 is 48

### base_note_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#base_note_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### key_tracking : [`renoise.InstrumentPhraseMapping.KeyTrackingMode`](renoise.InstrumentPhraseMapping.md#KeyTrackingMode) {#key_tracking}
> Phrase's key-tracking mode.

### key_tracking_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#key_tracking_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_end : [`integer`](../../API/builtins/integer.md) {#loop_end}
### loop_end_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#loop_end_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_start : [`integer`](../../API/builtins/integer.md) {#loop_start}
### loop_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#loop_start_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### looping : [`boolean`](../../API/builtins/boolean.md) {#looping}
> Loop mode. The phrase plays as one-shot when disabled.

### looping_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#looping_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### note_range : [`integer`](../../API/builtins/integer.md)[] {#note_range}
> Range: (0 - 119) where C-4 is 48

### note_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#note_range_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### phrase : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md) {#phrase}
> Linked phrase.

  

