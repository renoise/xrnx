# renoise.PatternIterator<a name="renoise.PatternIterator"></a>  
> Lua pairs/ipairs alike iterator functions to walk through all lines or columns
> in the entire song, track or a single pattern.
> 
> General remarks: Iterators can only be use in "for" loops like you would use
> "pairs" in Lua.
> 
> #### examples:
> ```lua
> for pos,line in renoise.song().pattern_iterator:lines_in_song() do [...] end
> ```
> The returned `pos` is a table with "pattern", "track", "line" fields, and an
> additional "column" field for the note/effect columns.
> 
> The `visible_only` flag controls if all content should be traversed, or only
> the currently used patterns, columns, and so on. Patterns are traversed in the
> order they are referenced in the pattern sequence, but each pattern is accessed
> only once.  

<!-- toc -->
  

---  
## Functions
### lines_in_song([*self*](../../API/builtins/self.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="lines_in_song"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternLinePosition`](#patternlineposition), [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md), line : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md), pos : [`PatternLinePosition`](#patternlineposition)  

>  Iterate over all pattern lines in the song.
### note_columns_in_song([*self*](../../API/builtins/self.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="note_columns_in_song"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md), column : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

>  Iterate over all note columns in the song.
### effect_columns_in_song([*self*](../../API/builtins/self.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="effect_columns_in_song"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md), column : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

>  Iterate over all effect columns in the song.
### lines_in_pattern([*self*](../../API/builtins/self.md), pattern_index : [`integer`](../../API/builtins/integer.md))<a name="lines_in_pattern"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternLinePosition`](#patternlineposition), [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md), line : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md), pos : [`PatternLinePosition`](#patternlineposition)  

>  Iterate over all lines in the given pattern only.
### note_columns_in_pattern([*self*](../../API/builtins/self.md), pattern_index : [`integer`](../../API/builtins/integer.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="note_columns_in_pattern"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md), column : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

>  Iterate over all note columns in the specified pattern.
### effect_columns_in_pattern([*self*](../../API/builtins/self.md), pattern_index : [`integer`](../../API/builtins/integer.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="effect_columns_in_pattern"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md), column : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

>  Iterate over all note columns in the specified pattern.
### lines_in_track([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="lines_in_track"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternLinePosition`](#patternlineposition), [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md), line : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md), pos : [`PatternLinePosition`](#patternlineposition)  

>  Iterate over all lines in the given track only.
### note_columns_in_track([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="note_columns_in_track"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md), column : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

>  Iterate over all note/effect columns in the specified track.
### effect_columns_in_track([*self*](../../API/builtins/self.md), track_index : [`integer`](../../API/builtins/integer.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="effect_columns_in_track"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md), column : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

### lines_in_pattern_track([*self*](../../API/builtins/self.md), pattern_index : [`integer`](../../API/builtins/integer.md), track_index : [`integer`](../../API/builtins/integer.md))<a name="lines_in_pattern_track"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternLinePosition`](#patternlineposition), [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md), line : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md), pos : [`PatternLinePosition`](#patternlineposition)  

>  Iterate over all lines in the given pattern, track only.
### note_columns_in_pattern_track([*self*](../../API/builtins/self.md), pattern_index : [`integer`](../../API/builtins/integer.md), track_index : [`integer`](../../API/builtins/integer.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="note_columns_in_pattern_track"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md), column : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  

>  Iterate over all note/effect columns in the specified pattern track.
### effect_columns_in_pattern_track([*self*](../../API/builtins/self.md), pattern_index : [`integer`](../../API/builtins/integer.md), track_index : [`integer`](../../API/builtins/integer.md), visible_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="effect_columns_in_pattern_track"></a>
`->`(context : [`unknown`](../../API/builtins/unknown.md)) `->` [`PatternColumnPosition`](#patterncolumnposition), [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md), column : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md), pos : [`PatternColumnPosition`](#patterncolumnposition)  
  



---  
## Structs  
# PatternColumnPosition<a name="PatternColumnPosition"></a>  
> Note/Effect column iterator position.  

---  
## Properties
### pattern : [`integer`](../../API/builtins/integer.md)<a name="pattern"></a>
### track : [`integer`](../../API/builtins/integer.md)<a name="track"></a>
### line : [`integer`](../../API/builtins/integer.md)<a name="line"></a>
### column : [`integer`](../../API/builtins/integer.md)<a name="column"></a>
  

  
# PatternLinePosition<a name="PatternLinePosition"></a>  
> Line iterator position.  

---  
## Properties
### pattern : [`integer`](../../API/builtins/integer.md)<a name="pattern"></a>
### track : [`integer`](../../API/builtins/integer.md)<a name="track"></a>
### line : [`integer`](../../API/builtins/integer.md)<a name="line"></a>
  

  

