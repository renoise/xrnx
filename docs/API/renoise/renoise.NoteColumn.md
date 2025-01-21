# renoise.NoteColumn<a name="renoise.NoteColumn"></a>  
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
### is_empty : [`boolean`](../../API/builtins/boolean.md)<a name="is_empty"></a>
> **READ-ONLY** True, when all note column properties are empty.

### is_selected : [`boolean`](../../API/builtins/boolean.md)<a name="is_selected"></a>
> **READ-ONLY** True, when this column is selected in the pattern or phrase
> editors current pattern.

### note_value : [`integer`](../../API/builtins/integer.md)<a name="note_value"></a>
> Range: (0-119) or 120=Off or 121=Empty

### note_string : [`string`](../../API/builtins/string.md)<a name="note_string"></a>
> Range: (\'C-0\'-\'G-9\') or \'OFF\' or \'---\'

### instrument_value : [`integer`](../../API/builtins/integer.md)<a name="instrument_value"></a>
> Range: (0-254), 255==Empty

### instrument_string : [`string`](../../API/builtins/string.md)<a name="instrument_string"></a>
> Range: (\'00\'-\'FE\') or \'..\'

### volume_value : [`integer`](../../API/builtins/integer.md)<a name="volume_value"></a>
> Range: (0-127) or 255==Empty when column value is <= 0x80 or is 0xFF,
> i.e. to specify a volume value.
> 
> Range: (0-65535) in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2,
> when column value is > 0x80, i.e. to specify an effect.

### volume_string : [`string`](../../API/builtins/string.md)<a name="volume_string"></a>
> Range(\'00\'-\'ZF\') or \'..\'

### panning_value : [`integer`](../../API/builtins/integer.md)<a name="panning_value"></a>
> Range: (0-127) or 255==Empty when column value is <= 0x80 or is 0xFF,
> i.e. to specify a pan value.
> 
> Range: (0-65535) in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2,
> when column value is > 0x80, i.e. to specify an effect.

### panning_string : [`string`](../../API/builtins/string.md)<a name="panning_string"></a>
> Range: (\'00'-\'ZF\') or \'..\'

### delay_value : [`integer`](../../API/builtins/integer.md)<a name="delay_value"></a>
> Range: (0-255)

### delay_string : [`string`](../../API/builtins/string.md)<a name="delay_string"></a>
> Range: (\'00'-\'FF\') or \'..\'

### effect_number_value : [`integer`](../../API/builtins/integer.md)<a name="effect_number_value"></a>
> Range: (0-65535) in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2

### effect_number_string : [`string`](../../API/builtins/string.md)<a name="effect_number_string"></a>
> Range: (\'00\'-\'ZZ\')

### effect_amount_value : [`integer`](../../API/builtins/integer.md)<a name="effect_amount_value"></a>
> Range: (0-255)

### effect_amount_string : [`string`](../../API/builtins/string.md)<a name="effect_amount_string"></a>
> Range: (\'00\' - \'FF\')

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Clear the note column.
### copy_from([*self*](../../API/builtins/self.md), other : [`renoise.NoteColumn`](../../API/renoise/renoise.NoteColumn.md))<a name="copy_from"></a>
> Copy the column's content from another column.  

