# renoise.PatternSequencer<a name="renoise.PatternSequencer"></a>  
> Pattern sequencer component of the Renoise song.  

<!-- toc -->
  

---  
## Properties
### keep_sequence_sorted : [`boolean`](../../API/builtins/boolean.md)<a name="keep_sequence_sorted"></a>
> When true, the sequence will be auto sorted.

### keep_sequence_sorted_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="keep_sequence_sorted_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### selection_range : [`integer`](../../API/builtins/integer.md)[]<a name="selection_range"></a>
> Access to the selected slots in the sequencer. When no selection is present
> `{0, 0}` is returned, else Range: (1 - #sequencer.pattern_sequence)

### selection_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="selection_range_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### pattern_sequence : [`integer`](../../API/builtins/integer.md)[]<a name="pattern_sequence"></a>
> Pattern order list: Notifiers will only be fired when sequence positions are
> added, removed or their order changed. To get notified of pattern assignment
> changes use the property `pattern_assignments_observable`.

### pattern_sequence_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="pattern_sequence_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### pattern_assignments_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="pattern_assignments_observable"></a>
> Attach notifiers that will be called as soon as any pattern assignment
> at any sequence position changes.

### pattern_slot_mutes_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="pattern_slot_mutes_observable"></a>
> Attach notifiers that will be fired as soon as any slot muting property
> in any track/sequence slot changes.

  

---  
## Functions
### insert_sequence_at([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md), pattern_index : [`integer`](../../API/builtins/integer.md))<a name="insert_sequence_at"></a>
> Insert the specified pattern at the given position in the sequence.
### insert_new_pattern_at([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="insert_new_pattern_at"></a>
`->`new_pattern_index : [`integer`](../../API/builtins/integer.md)  

> Insert an empty, unreferenced pattern at the given position.
### delete_sequence_at([*self*](../../API/builtins/self.md), sequence_index : [`any`](../../API/builtins/any.md))<a name="delete_sequence_at"></a>
> Delete an existing position in the sequence. Renoise needs at least one
> sequence in the song for playback. Completely removing all sequence positions
> is not allowed.
### pattern([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="pattern"></a>
`->`pattern_index : [`integer`](../../API/builtins/integer.md)  

> Access to a single sequence by index (the pattern number). Use property
> `pattern_sequence` to iterate over the whole sequence and to query the
> sequence count.
### clone_range([*self*](../../API/builtins/self.md), from_sequence_index : [`integer`](../../API/builtins/integer.md), to_sequence_index : [`integer`](../../API/builtins/integer.md))<a name="clone_range"></a>
> Clone a sequence range, appending it right after to_sequence_index.
> Slot muting is copied as well.
### make_range_unique([*self*](../../API/builtins/self.md), from_sequence_index : [`integer`](../../API/builtins/integer.md), to_sequence_index : [`integer`](../../API/builtins/integer.md))<a name="make_range_unique"></a>
> Make patterns in the given sequence pos range unique, if needed.
### sort([*self*](../../API/builtins/self.md))<a name="sort"></a>
> Sort patterns in the sequence in ascending order, keeping the old pattern
> data in place. This will only change the visual order of patterns, but
> not change the song's structure.
### sequence_is_start_of_section([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="sequence_is_start_of_section"></a>
`->`[`boolean`](../../API/builtins/boolean.md), [`boolean`](../../API/builtins/boolean.md)  

> Access to pattern sequence sections. When the `is_start_of_section flag` is
> set for a sequence pos, a section ranges from this pos to the next pos
> which starts a section, or till the end of the song when there are no others.
### set_sequence_is_start_of_section([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md), is_section : [`boolean`](../../API/builtins/boolean.md))<a name="set_sequence_is_start_of_section"></a>
### sequence_is_start_of_section_observable([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="sequence_is_start_of_section_observable"></a>
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

### sequence_section_name([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="sequence_section_name"></a>
`->`[`string`](../../API/builtins/string.md)  

> Access to a pattern sequence section's name. Section names are only visible
> for a sequence pos which starts the section (see `sequence_is_start_of_section`).
### set_sequence_section_name([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md), name : [`string`](../../API/builtins/string.md))<a name="set_sequence_section_name"></a>
### sequence_section_name_observable([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="sequence_section_name_observable"></a>
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

### sequence_is_part_of_section([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="sequence_is_part_of_section"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true if the given sequence pos is part of a section, else false.
### sequence_is_end_of_section([*self*](../../API/builtins/self.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="sequence_is_end_of_section"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true if the given sequence pos is the end of a section, else false
### sequence_sections_changed_observable([*self*](../../API/builtins/self.md))<a name="sequence_sections_changed_observable"></a>
`->`[`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)  

> Observable, which is fired, whenever the section layout in the sequence
> changed in any way, i.e. new sections got added, existing ones got deleted
### track_sequence_slot_is_muted([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="track_sequence_slot_is_muted"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Access to sequencer slot mute states. Mute slots are memorized in the
> sequencer and not in the patterns.
### set_track_sequence_slot_is_muted([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md), sequence_index : [`integer`](../../API/builtins/integer.md), muted : [`any`](../../API/builtins/any.md))<a name="set_track_sequence_slot_is_muted"></a>
### track_sequence_slot_is_selected([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md), sequence_index : [`integer`](../../API/builtins/integer.md))<a name="track_sequence_slot_is_selected"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Access to sequencer slot selection states.
### set_track_sequence_slot_is_selected([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md), sequence_index : [`integer`](../../API/builtins/integer.md), selected : [`any`](../../API/builtins/any.md))<a name="set_track_sequence_slot_is_selected"></a>  

