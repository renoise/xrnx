# renoise.ScriptingTool.MidiMessage  
MIDI message as passed to the `invoke` callback in tool midi_mappings.  

---  
## Properties
### boolean_value : [`boolean`](/API/builtins/boolean.md)[`?`](/API/builtins/nil.md) {#boolean_value}
valid [true OR false] when `is_switch()` returns true, else undefined

### int_value : [`integer`](/API/builtins/integer.md)[`?`](/API/builtins/nil.md) {#int_value}
Range: (0S - 127) for abs values, Range: (-63 - 63) for relative values
valid when `is_rel_value()` or `is_abs_value()` returns true, else undefined

  

---  
## Functions
### `is_abs_value`([*self*](/API/builtins/self.md)) {#is_abs_value}
`->`[`boolean`](/API/builtins/boolean.md)  

check if the int_value property is valid
### `is_rel_value`([*self*](/API/builtins/self.md)) {#is_rel_value}
`->`[`boolean`](/API/builtins/boolean.md)  

check if the int_value property is valid
### `is_switch`([*self*](/API/builtins/self.md)) {#is_switch}
check if the boolean_value property is valid
### `is_trigger`([*self*](/API/builtins/self.md)) {#is_trigger}
returns if action should be invoked  

