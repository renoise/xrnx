# renoise.NoteColumn  
> A single note column in a pattern line.
> 
> General remarks: instrument columns are available for lines in phrases
> but are ignored. See renoise.InstrumentPhrase for detail.
> 
> Access note column properties either by values (numbers) or by strings.
> The string representation uses exactly the same notation as you see
> them in Renoise's pattern or phrase editor.  

<!-- toc -->
  

---  
## Properties
### is_empty : [`boolean`](../../API/builtins/boolean.md) {#is_empty}
> **READ-ONLY** True, when all note column properties are empty.

### is_selected : [`boolean`](../../API/builtins/boolean.md) {#is_selected}
> **READ-ONLY** True, when this column is selected in the pattern or phrase
> editors current pattern.

### note_value : [`integer`](../../API/builtins/integer.md) {#note_value}
> Range: (0-119) or 120=Off or 121=Empty

### note_string : [`string`](../../API/builtins/string.md) {#note_string}
> Range: (\'C-0\'-\'G-9\') or \'OFF\' or \'---\'

### instrument_value : [`integer`](../../API/builtins/integer.md) {#instrument_value}
> Range: (0-254), 255==Empty

### instrument_string : [`string`](../../API/builtins/string.md) {#instrument_string}
> Range: (\'00\'-\'FE\') or \'..\'

### volume_value : [`integer`](../../API/builtins/integer.md) {#volume_value}
> Range: (0-127) or 255==Empty when column value is <= 0x80 or is 0xFF,
> i.e. to specify a volume value.
> 
> Range: (0-65535) in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2,
> when column value is > 0x80, i.e. to specify an effect.

### volume_string : [`string`](../../API/builtins/string.md) {#volume_string}
> Range(\'00\'-\'ZF\') or \'..\'

### panning_value : [`integer`](../../API/builtins/integer.md) {#panning_value}
> Range: (0-127) or 255==Empty when column value is <= 0x80 or is 0xFF,
> i.e. to specify a pan value.
> 
> Range: (0-65535) in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2,
> when column value is > 0x80, i.e. to specify an effect.

### panning_string : [`string`](../../API/builtins/string.md) {#panning_string}
> Range: (\'00'-\'ZF\') or \'..\'

### delay_value : [`integer`](../../API/builtins/integer.md) {#delay_value}
> Range: (0-255)

### delay_string : [`string`](../../API/builtins/string.md) {#delay_string}
> Range: (\'00'-\'FF\') or \'..\'

### effect_number_value : [`integer`](../../API/builtins/integer.md) {#effect_number_value}
> Range: (0-65535) in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2

### effect_number_string : [`string`](../../API/builtins/string.md) {#effect_number_string}
> Range: (\'00\'-\'ZZ\')

### effect_amount_value : [`integer`](../../API/builtins/integer.md) {#effect_amount_value}
> Range: (0-255)

### effect_amount_string : [`string`](../../API/builtins/string.md) {#effect_amount_string}
> Range: (\'00\' - \'FF\')

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md)) {#clear}
> Clear the note column.
### copy_from([*self*](../../API/builtins/self.md), other : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md)) {#copy_from}
> Copy the column's content from another column.  

