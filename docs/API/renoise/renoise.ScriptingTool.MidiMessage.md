# renoise.ScriptingTool.MidiMessage<a name="renoise.ScriptingTool.MidiMessage"></a>  
> MIDI message as passed to the `invoke` callback in tool midi_mappings.  

<!-- toc -->
  

---  
## Properties
### int_value : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)<a name="int_value"></a>
> Range: (0S - 127) for abs values, Range: (-63 - 63) for relative values
> valid when `is_rel_value()` or `is_abs_value()` returns true, else undefined

### boolean_value : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md)<a name="boolean_value"></a>
> valid [true OR false] when `is_switch()` returns true, else undefined

  

---  
## Functions
### is_trigger([*self*](../../API/builtins/self.md))<a name="is_trigger"></a>
> returns if action should be invoked
### is_switch([*self*](../../API/builtins/self.md))<a name="is_switch"></a>
> check if the boolean_value property is valid
### is_rel_value([*self*](../../API/builtins/self.md))<a name="is_rel_value"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> check if the int_value property is valid
### is_abs_value([*self*](../../API/builtins/self.md))<a name="is_abs_value"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> check if the int_value property is valid  

