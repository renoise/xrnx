# renoise.InstrumentMacro<a name="renoise.InstrumentMacro"></a>  

<!-- toc -->
  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> Macro name as visible in the GUI when mappings are presents.

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### value : [`number`](../../API/builtins/number.md)<a name="value"></a>
> Range: (0 - 1)

### value_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="value_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### value_string : [`string`](../../API/builtins/string.md)<a name="value_string"></a>
> Range: (0 - 100)

### value_string_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="value_string_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### mappings : [`renoise.InstrumentMacroMapping`](../../API/renoise/renoise.InstrumentMacroMapping.md)[]<a name="mappings"></a>
> **READ-ONLY** Macro mappings, target parameters

### mappings_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="mappings_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

  

---  
## Functions
### mapping([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="mapping"></a>
`->`[`renoise.InstrumentMacroMapping`](../../API/renoise/renoise.InstrumentMacroMapping.md)  

> Access to a single attached parameter mapping by index. Use property
> 'mappings' to query mapping count.  

