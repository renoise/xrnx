# renoise.PatternIterator  
Lua pairs/ipairs alike iterator functions to walk through all lines or columns
in the entire song, track or a single pattern.

General remarks: Iterators can only be use in "for" loops like you would use
"pairs" in Lua.

### example:
```lua
for pos,line in renoise.song().pattern_iterator:lines_in_song() do [...] end
```
The returned `pos` is a table with "pattern", "track", "line" fields, and an
additional "column" field for the note/effect columns.

The `visible_only` flag controls if all content should be traversed, or only
the currently used patterns, columns, and so on. Patterns are traversed in the
order they are referenced in the pattern sequence, but each pattern is accessed
only once.
  

---  
## Functions
### `effect_columns_in_pattern`([*self*](/API/builtins/self.md), pattern_index : [`integer`](/API/builtins/integer.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#effect_columns_in_pattern}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.EffectColumn`](/API/renoise/renoise.EffectColumn.md), column : [`renoise.EffectColumn`](/API/renoise/renoise.EffectColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

 Iterate over all note columns in the specified pattern.
### `effect_columns_in_pattern_track`([*self*](/API/builtins/self.md), pattern_index : [`integer`](/API/builtins/integer.md), track_index : [`integer`](/API/builtins/integer.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#effect_columns_in_pattern_track}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.EffectColumn`](/API/renoise/renoise.EffectColumn.md), column : [`renoise.EffectColumn`](/API/renoise/renoise.EffectColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

### `effect_columns_in_song`([*self*](/API/builtins/self.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#effect_columns_in_song}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.EffectColumn`](/API/renoise/renoise.EffectColumn.md), column : [`renoise.EffectColumn`](/API/renoise/renoise.EffectColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

 Iterate over all effect columns in the song.
### `effect_columns_in_track`([*self*](/API/builtins/self.md), track_index : [`integer`](/API/builtins/integer.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#effect_columns_in_track}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.EffectColumn`](/API/renoise/renoise.EffectColumn.md), column : [`renoise.EffectColumn`](/API/renoise/renoise.EffectColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

### `lines_in_pattern`([*self*](/API/builtins/self.md), pattern_index : [`integer`](/API/builtins/integer.md)) {#lines_in_pattern}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternLinePosition`](#patternlineposition), [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md), line : [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md), pos : [`PatternLinePosition`](#patternlineposition)  

 Iterate over all lines in the given pattern only.
### `lines_in_pattern_track`([*self*](/API/builtins/self.md), pattern_index : [`integer`](/API/builtins/integer.md), track_index : [`integer`](/API/builtins/integer.md)) {#lines_in_pattern_track}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternLinePosition`](#patternlineposition), [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md), line : [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md), pos : [`PatternLinePosition`](#patternlineposition)  

 Iterate over all lines in the given pattern, track only.
### `lines_in_song`([*self*](/API/builtins/self.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#lines_in_song}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternLinePosition`](#patternlineposition), [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md), line : [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md), pos : [`PatternLinePosition`](#patternlineposition)  

 Iterate over all pattern lines in the song.
### `lines_in_track`([*self*](/API/builtins/self.md), track_index : [`integer`](/API/builtins/integer.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#lines_in_track}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternLinePosition`](#patternlineposition), [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md), line : [`renoise.PatternLine`](/API/renoise/renoise.PatternLine.md), pos : [`PatternLinePosition`](#patternlineposition)  

 Iterate over all lines in the given track only.
### `note_columns_in_pattern`([*self*](/API/builtins/self.md), pattern_index : [`integer`](/API/builtins/integer.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#note_columns_in_pattern}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.NoteColumn`](/API/renoise/renoise.NoteColumn.md), column : [`renoise.NoteColumn`](/API/renoise/renoise.NoteColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

 Iterate over all note columns in the specified pattern.
### `note_columns_in_pattern_track`([*self*](/API/builtins/self.md), pattern_index : [`integer`](/API/builtins/integer.md), track_index : [`integer`](/API/builtins/integer.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#note_columns_in_pattern_track}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.NoteColumn`](/API/renoise/renoise.NoteColumn.md), column : [`renoise.NoteColumn`](/API/renoise/renoise.NoteColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

 Iterate over all note/effect columns in the specified pattern track.
### `note_columns_in_song`([*self*](/API/builtins/self.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#note_columns_in_song}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.NoteColumn`](/API/renoise/renoise.NoteColumn.md), column : [`renoise.NoteColumn`](/API/renoise/renoise.NoteColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

 Iterate over all note columns in the song.
### `note_columns_in_track`([*self*](/API/builtins/self.md), track_index : [`integer`](/API/builtins/integer.md), visible_only : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md)) {#note_columns_in_track}
`->`(context : [`unknown`](/API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.NoteColumn`](/API/renoise/renoise.NoteColumn.md), column : [`renoise.NoteColumn`](/API/renoise/renoise.NoteColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

 Iterate over all note/effect columns in the specified track.  



---  
## Structs  
# PatternColumnPosition  
Note/Effect column iterator position.  

---  
## Properties
### column : [`integer`](/API/builtins/integer.md) {#column}
### line : [`integer`](/API/builtins/integer.md) {#line}
### pattern : [`integer`](/API/builtins/integer.md) {#pattern}
### track : [`integer`](/API/builtins/integer.md) {#track}
  

  
# PatternLinePosition  
Line iterator position.  

---  
## Properties
### line : [`integer`](/API/builtins/integer.md) {#line}
### pattern : [`integer`](/API/builtins/integer.md) {#pattern}
### track : [`integer`](/API/builtins/integer.md) {#track}
  

  

