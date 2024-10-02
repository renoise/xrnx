# renoise.EffectColumn  
> A single effect column in a pattern line.
> 
> Access effect column properties either by values (numbers) or by strings.
> The string representation uses exactly the same notation as you see
> them in Renoise's pattern or phrase editor.  

<!-- toc -->
  

---  
## Properties
### is_empty : [`boolean`](../../API/builtins/boolean.md) {#is_empty}
> **READ-ONLY** True, when all effect column properties are empty.

### is_selected : [`boolean`](../../API/builtins/boolean.md) {#is_selected}
> **READ-ONLY** True, when this column is selected in the pattern or phrase editor.

### number_value : [`integer`](../../API/builtins/integer.md) {#number_value}
> 0-65535 in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2

### number_string : [`string`](../../API/builtins/string.md) {#number_string}
> Range: ('00' - 'ZZ')

### amount_value : [`integer`](../../API/builtins/integer.md) {#amount_value}
> Range: (0 - 255)

### amount_string : [`string`](../../API/builtins/string.md) {#amount_string}
> Range: ('00' - 'FF')

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md)) {#clear}
> Clear the effect column.
### copy_from([*self*](../../API/builtins/self.md), other : [`renoise.EffectColumn`](../../API/renoise/renoise.EffectColumn.md)) {#copy_from}
> Copy the column's content from another column.  

