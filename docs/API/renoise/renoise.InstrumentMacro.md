# renoise.InstrumentMacro  

---  
## Properties
### mappings : [`renoise.InstrumentMacroMapping`](/API/renoise/renoise.InstrumentMacroMapping.md)`[]` {#mappings}
**READ-ONLY** Macro mappings, target parameters

### mappings_observable : [`renoise.Document.ObservableList`](/API/renoise/renoise.Document.ObservableList.md) {#mappings_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### name : [`string`](/API/builtins/string.md) {#name}
Macro name as visible in the GUI when mappings are presents.

### name_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#name_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### value : [`number`](/API/builtins/number.md) {#value}
Range: (0 - 1)

### value_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#value_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### value_string : [`string`](/API/builtins/string.md) {#value_string}
Range: (0 - 100)

### value_string_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#value_string_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `mapping`([*self*](/API/builtins/self.md), index : [`integer`](/API/builtins/integer.md)) {#mapping}
`->`[`renoise.InstrumentMacroMapping`](/API/renoise/renoise.InstrumentMacroMapping.md)  

Access to a single attached parameter mapping by index. Use property
'mappings' to query mapping count.  

