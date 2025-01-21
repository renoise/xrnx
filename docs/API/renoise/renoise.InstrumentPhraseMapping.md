# renoise.InstrumentPhraseMapping<a name="renoise.InstrumentPhraseMapping"></a>  

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
  

---  
## Properties
### phrase : [`renoise.InstrumentPhrase`](../../API/renoise/renoise.InstrumentPhrase.md)<a name="phrase"></a>
> Linked phrase.

### key_tracking : [`renoise.InstrumentPhraseMapping.KeyTrackingMode`](renoise.InstrumentPhraseMapping.md#KeyTrackingMode)<a name="key_tracking"></a>
> Phrase's key-tracking mode.

### key_tracking_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="key_tracking_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### base_note : [`integer`](../../API/builtins/integer.md)<a name="base_note"></a>
> Range: (0 - 119) where C-4 is 48

### base_note_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="base_note_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### note_range : [`integer`](../../API/builtins/integer.md)[]<a name="note_range"></a>
> Range: (0 - 119) where C-4 is 48

### note_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="note_range_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### looping : [`boolean`](../../API/builtins/boolean.md)<a name="looping"></a>
> Loop mode. The phrase plays as one-shot when disabled.

### looping_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="looping_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_start : [`integer`](../../API/builtins/integer.md)<a name="loop_start"></a>
### loop_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_start_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### loop_end : [`integer`](../../API/builtins/integer.md)<a name="loop_end"></a>
### loop_end_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="loop_end_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

