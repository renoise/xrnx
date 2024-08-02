# renoise.SampleMapping  
General remarks: Sample mappings of sliced samples are read-only: can not be
modified. See `sample_mappings[].read_only`  

---  
## Properties
### base_note : [`integer`](../../API/builtins/integer.md) {#base_note}
Range: (0-119, c-4=48)]

### base_note_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#base_note_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### layer : [`renoise.Instrument.Layer`](renoise.Instrument.md#Layer) {#layer}
Mapping's layer (triggered via Note-Ons or Note-Offs?).

### layer_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#layer_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### map_key_to_pitch : [`boolean`](../../API/builtins/boolean.md) {#map_key_to_pitch}
### map_key_to_pitch_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#map_key_to_pitch_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### map_velocity_to_volume : [`boolean`](../../API/builtins/boolean.md) {#map_velocity_to_volume}
Mappings velocity->volume and key->pitch options.

### map_velocity_to_volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#map_velocity_to_volume_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### note_range : [`integer`](../../API/builtins/integer.md)`[]` {#note_range}
Range: (0 - 119) where C-4 is 48

### note_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#note_range_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### read_only : [`boolean`](../../API/builtins/boolean.md) {#read_only}
**READ-ONLY** True for sliced instruments. No sample mapping properties are
allowed to be modified, but can be read.

### sample : [`renoise.Sample`](../../API/renoise/renoise.Sample.md) {#sample}
Linked sample.

### velocity_range : [`integer`](../../API/builtins/integer.md)`[]` {#velocity_range}
Range: (0 - 127)

### velocity_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#velocity_range_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

