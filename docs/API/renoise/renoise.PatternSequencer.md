# renoise.PatternSequencer  
Pattern sequencer component of the Renoise song.  

---  
## Properties
### keep_sequence_sorted : [`boolean`](/API/builtins/boolean.md) {#keep_sequence_sorted}
When true, the sequence will be auto sorted.

### keep_sequence_sorted_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#keep_sequence_sorted_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### pattern_assignments_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#pattern_assignments_observable}
Attach notifiers that will be called as soon as any pattern assignment
at any sequence position changes.

### pattern_sequence : [`integer`](/API/builtins/integer.md)`[]` {#pattern_sequence}
Pattern order list: Notifiers will only be fired when sequence positions are
added, removed or their order changed. To get notified of pattern assignment
changes use the property `pattern_assignments_observable`.

### pattern_sequence_observable : [`renoise.Document.ObservableList`](/API/renoise/renoise.Document.ObservableList.md) {#pattern_sequence_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### pattern_slot_mutes_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#pattern_slot_mutes_observable}
Attach notifiers that will be fired as soon as any slot muting property
in any track/sequence slot changes.

### selection_range : [`integer`](/API/builtins/integer.md)`[]` {#selection_range}
Access to the selected slots in the sequencer. When no selection is present
`{0, 0}` is returned, else Range: (1 - #sequencer.pattern_sequence)

### selection_range_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#selection_range_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `clone_range`([*self*](/API/builtins/self.md), from_sequence_index : [`integer`](/API/builtins/integer.md), to_sequence_index : [`integer`](/API/builtins/integer.md)) {#clone_range}
Clone a sequence range, appending it right after to_sequence_index.
Slot muting is copied as well.
### `delete_sequence_at`([*self*](/API/builtins/self.md), sequence_index : [`any`](/API/builtins/any.md)) {#delete_sequence_at}
Delete an existing position in the sequence. Renoise needs at least one
sequence in the song for playback. Completely removing all sequence positions
is not allowed.
### `insert_new_pattern_at`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#insert_new_pattern_at}
`->`new_pattern_index : [`integer`](/API/builtins/integer.md)  

Insert an empty, unreferenced pattern at the given position.
### `insert_sequence_at`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md), pattern_index : [`integer`](/API/builtins/integer.md)) {#insert_sequence_at}
Insert the specified pattern at the given position in the sequence.
### `make_range_unique`([*self*](/API/builtins/self.md), from_sequence_index : [`integer`](/API/builtins/integer.md), to_sequence_index : [`integer`](/API/builtins/integer.md)) {#make_range_unique}
Make patterns in the given sequence pos range unique, if needed.
### `pattern`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#pattern}
`->`pattern_index : [`integer`](/API/builtins/integer.md)  

Access to a single sequence by index (the pattern number). Use property
`pattern_sequence` to iterate over the whole sequence and to query the
sequence count.
### `sequence_is_end_of_section`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#sequence_is_end_of_section}
`->`[`boolean`](/API/builtins/boolean.md)  

Returns true if the given sequence pos is the end of a section, else false
### `sequence_is_part_of_section`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#sequence_is_part_of_section}
`->`[`boolean`](/API/builtins/boolean.md)  

Returns true if the given sequence pos is part of a section, else false.
### `sequence_is_start_of_section`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#sequence_is_start_of_section}
`->`[`boolean`](/API/builtins/boolean.md), [`boolean`](/API/builtins/boolean.md)  

Access to pattern sequence sections. When the `is_start_of_section flag` is
set for a sequence pos, a section ranges from this pos to the next pos
which starts a section, or till the end of the song when there are no others.
### `sequence_is_start_of_section_observable`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#sequence_is_start_of_section_observable}
`->`[`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md)  

### `sequence_section_name`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#sequence_section_name}
`->`[`string`](/API/builtins/string.md)  

Access to a pattern sequence section's name. Section names are only visible
for a sequence pos which starts the section (see `sequence_is_start_of_section`).
### `sequence_section_name_observable`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#sequence_section_name_observable}
`->`[`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md)  

### `sequence_sections_changed_observable`([*self*](/API/builtins/self.md)) {#sequence_sections_changed_observable}
`->`[`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md)  

Observable, which is fired, whenever the section layout in the sequence
changed in any way, i.e. new sections got added, existing ones got deleted
### `set_sequence_is_start_of_section`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md), is_section : [`boolean`](/API/builtins/boolean.md)) {#set_sequence_is_start_of_section}
### `set_sequence_section_name`([*self*](/API/builtins/self.md), sequence_index : [`integer`](/API/builtins/integer.md), name : [`string`](/API/builtins/string.md)) {#set_sequence_section_name}
### `set_track_sequence_slot_is_muted`([*self*](/API/builtins/self.md), track_index : [`integer`](/API/builtins/integer.md), sequence_index : [`integer`](/API/builtins/integer.md), muted : [`any`](/API/builtins/any.md)) {#set_track_sequence_slot_is_muted}
### `set_track_sequence_slot_is_selected`([*self*](/API/builtins/self.md), track_index : [`integer`](/API/builtins/integer.md), sequence_index : [`integer`](/API/builtins/integer.md), selected : [`any`](/API/builtins/any.md)) {#set_track_sequence_slot_is_selected}
### `sort`([*self*](/API/builtins/self.md)) {#sort}
Sort patterns in the sequence in ascending order, keeping the old pattern
data in place. This will only change the visual order of patterns, but
not change the song's structure.
### `track_sequence_slot_is_muted`([*self*](/API/builtins/self.md), track_index : [`integer`](/API/builtins/integer.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#track_sequence_slot_is_muted}
`->`[`boolean`](/API/builtins/boolean.md)  

Access to sequencer slot mute states. Mute slots are memorized in the
sequencer and not in the patterns.
### `track_sequence_slot_is_selected`([*self*](/API/builtins/self.md), track_index : [`integer`](/API/builtins/integer.md), sequence_index : [`integer`](/API/builtins/integer.md)) {#track_sequence_slot_is_selected}
`->`[`boolean`](/API/builtins/boolean.md)  

Access to sequencer slot selection states.  

