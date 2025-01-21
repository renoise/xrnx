# renoise.EffectColumn<a name="renoise.EffectColumn"></a>  
> A single effect column in a pattern line.
> 
> Access effect column properties either by values (numbers) or by strings.
> The string representation uses exactly the same notation as you see
> them in Renoise's pattern or phrase editor.  

<!-- toc -->
  

---  
## Properties
### is_empty : [`boolean`](../../API/builtins/boolean.md)<a name="is_empty"></a>
> **READ-ONLY** True, when all effect column properties are empty.

### is_selected : [`boolean`](../../API/builtins/boolean.md)<a name="is_selected"></a>
> **READ-ONLY** True, when this column is selected in the pattern or phrase editor.

### number_value : [`integer`](../../API/builtins/integer.md)<a name="number_value"></a>
> 0-65535 in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2

### number_string : [`string`](../../API/builtins/string.md)<a name="number_string"></a>
> Range: ('00' - 'ZZ')

### amount_value : [`integer`](../../API/builtins/integer.md)<a name="amount_value"></a>
> Range: (0 - 255)

### amount_string : [`string`](../../API/builtins/string.md)<a name="amount_string"></a>
> Range: ('00' - 'FF')

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Clear the effect column.
### copy_from([*self*](../../API/builtins/self.md), other : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md))<a name="copy_from"></a>
> Copy the column's content from another column.  

