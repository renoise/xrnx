# renoise.PatternLine<a name="renoise.PatternLine"></a>  

<!-- toc -->
  
## Constants

### EMPTY_NOTE : [`integer`](../../API/builtins/integer.md)<a name="EMPTY_NOTE"></a>
### NOTE_OFF : [`integer`](../../API/builtins/integer.md)<a name="NOTE_OFF"></a>
### EMPTY_INSTRUMENT : [`integer`](../../API/builtins/integer.md)<a name="EMPTY_INSTRUMENT"></a>
### EMPTY_VOLUME : [`integer`](../../API/builtins/integer.md)<a name="EMPTY_VOLUME"></a>
### EMPTY_PANNING : [`integer`](../../API/builtins/integer.md)<a name="EMPTY_PANNING"></a>
### EMPTY_DELAY : [`integer`](../../API/builtins/integer.md)<a name="EMPTY_DELAY"></a>
### EMPTY_EFFECT_NUMBER : [`integer`](../../API/builtins/integer.md)<a name="EMPTY_EFFECT_NUMBER"></a>
### EMPTY_EFFECT_AMOUNT : [`integer`](../../API/builtins/integer.md)<a name="EMPTY_EFFECT_AMOUNT"></a>  

---  
## Properties
### is_empty : [`boolean`](../../API/builtins/boolean.md)<a name="is_empty"></a>
> **READ-ONLY**

### note_columns : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md)[]<a name="note_columns"></a>
> **READ-ONLY**

### effect_columns : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md)[]<a name="effect_columns"></a>
> **READ-ONLY**

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Clear all note and effect columns.
### copy_from([*self*](../../API/builtins/self.md), other : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md))<a name="copy_from"></a>
> Copy contents from other_line, trashing column content.
### note_column([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="note_column"></a>
`->`[`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md)  

> Access to a single note column by index. Use properties 'note_columns'
> to iterate over all note columns and to query the note_column count.
> This is a !lot! more efficient than calling the property:
> note_columns[index] to randomly access columns. When iterating over all
> columns, use pairs(note_columns).
### effect_column([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="effect_column"></a>
`->`[`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md)  

> Access to a single effect column by index. Use properties 'effect_columns'
> to iterate over all effect columns and to query the effect_column count.
> This is a !lot! more efficient than calling the property:
> effect_columns[index] to randomly access columns. When iterating over all
> columns, use pairs(effect_columns).  

