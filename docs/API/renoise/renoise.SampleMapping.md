# renoise.SampleMapping<a name="renoise.SampleMapping"></a>  
> General remarks: Sample mappings of sliced samples are read-only: can not be
> modified. See `sample_mappings[].read_only`  

<!-- toc -->
  

---  
## Properties
### read_only : [`boolean`](../../API/builtins/boolean.md)<a name="read_only"></a>
> **READ-ONLY** True for sliced instruments. No sample mapping properties are
> allowed to be modified, but can be read.

### sample : [`renoise.Sample`](../../API/renoise/renoise.Sample.md)<a name="sample"></a>
> Linked sample.

### layer : [`renoise.Instrument.Layer`](renoise.Instrument.md#Layer)<a name="layer"></a>
> Mapping's layer (triggered via Note-Ons or Note-Offs?).

### layer_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="layer_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### map_velocity_to_volume : [`boolean`](../../API/builtins/boolean.md)<a name="map_velocity_to_volume"></a>
> Mappings velocity->volume and key->pitch options.

### map_velocity_to_volume_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="map_velocity_to_volume_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### map_key_to_pitch : [`boolean`](../../API/builtins/boolean.md)<a name="map_key_to_pitch"></a>
### map_key_to_pitch_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="map_key_to_pitch_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### base_note : [`integer`](../../API/builtins/integer.md)<a name="base_note"></a>
> Range: (0-119, c-4=48)]

### base_note_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="base_note_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### note_range : [`integer`](../../API/builtins/integer.md)[]<a name="note_range"></a>
> Range: (0 - 119) where C-4 is 48

### note_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="note_range_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### velocity_range : [`integer`](../../API/builtins/integer.md)[]<a name="velocity_range"></a>
> Range: (0 - 127)

### velocity_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="velocity_range_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

