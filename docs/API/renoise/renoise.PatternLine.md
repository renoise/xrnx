# renoise.PatternLine  

<!-- toc -->
  
## Constants

### EMPTY_DELAY : [`integer`](../../API/builtins/integer.md) {#EMPTY_DELAY}
### EMPTY_EFFECT_AMOUNT : [`integer`](../../API/builtins/integer.md) {#EMPTY_EFFECT_AMOUNT}
### EMPTY_EFFECT_NUMBER : [`integer`](../../API/builtins/integer.md) {#EMPTY_EFFECT_NUMBER}
### EMPTY_INSTRUMENT : [`integer`](../../API/builtins/integer.md) {#EMPTY_INSTRUMENT}
### EMPTY_NOTE : [`integer`](../../API/builtins/integer.md) {#EMPTY_NOTE}
### EMPTY_PANNING : [`integer`](../../API/builtins/integer.md) {#EMPTY_PANNING}
### EMPTY_VOLUME : [`integer`](../../API/builtins/integer.md) {#EMPTY_VOLUME}
### NOTE_OFF : [`integer`](../../API/builtins/integer.md) {#NOTE_OFF}  

---  
## Properties
### effect_columns : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md)[] {#effect_columns}
> **READ-ONLY**

### is_empty : [`boolean`](../../API/builtins/boolean.md) {#is_empty}
> **READ-ONLY**

### note_columns : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md)[] {#note_columns}
> **READ-ONLY**

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md)) {#clear}
> Clear all note and effect columns.
### copy_from([*self*](../../API/builtins/self.md), other : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)) {#copy_from}
> Copy contents from other_line, trashing column content.
### effect_column([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#effect_column}
`->`[`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md)  

> Access to a single effect column by index. Use properties 'effect_columns'
> to iterate over all effect columns and to query the effect_column count.
> This is a !lot! more efficient than calling the property:
> effect_columns[index] to randomly access columns. When iterating over all
> columns, use pairs(effect_columns).
### note_column([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#note_column}
`->`[`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md)  

> Access to a single note column by index. Use properties 'note_columns'
> to iterate over all note columns and to query the note_column count.
> This is a !lot! more efficient than calling the property:
> note_columns[index] to randomly access columns. When iterating over all
> columns, use pairs(note_columns).  

