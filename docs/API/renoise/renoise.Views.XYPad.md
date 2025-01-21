# renoise.Views.XYPad<a name="renoise.Views.XYPad"></a>  
> A slider like pad which allows for controlling two values at once. By default
> it freely moves the XY values, but it can also be configured to snap back to
> a predefined value when releasing the mouse button.
> 
> All values, notifiers, current value or min/max properties will act just
> like a slider or a rotary's properties, but nstead of a single number, a
> table with the fields `{x = xvalue, y = yvalue}` is expected, returned.
> ```text
>  +-------+
>  |    o  |
>  |   +   |
>  |       |
>  +-------+
> ```  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### visible : [`ViewVisibility`](#ViewVisibility)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)<a name="width"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### height : [`ViewDimension`](#ViewDimension)<a name="height"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)<a name="tooltip"></a>
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### views : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]<a name="views"></a>
> **READ-ONLY** Empty for all controls, for layout views this contains the
> layout child views in the order they got added

### min : [`XYPadMinValues`](#XYPadMinValues)<a name="min"></a>
> A table of allowed minimum values for each axis
> * Default: {x: 0.0, y: 0.0}

### max : [`XYPadMaxValues`](#XYPadMaxValues)<a name="max"></a>
> A table of allowed maximum values for each axis
> * Default: {x: 1.0, y: 1.0}

### value : [`XYPadValues`](#XYPadValues)<a name="value"></a>
> A table of the XYPad's current values on each axis

### snapback : [`XYPadSnapbackValues`](#XYPadSnapbackValues)[`?`](../../API/builtins/nil.md)<a name="snapback"></a>
> A table of snapback values for each axis
> When snapback is enabled, the pad will revert its values to the specified
> snapback values as soon as the mouse button is released in the pad.
> When disabled, releasing the mouse button will not change the value.
> You can disable snapback at runtime by setting it to nil or an empty table.

  

---  
## Functions
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> Remove a child view from this view.
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`XYValueNotifierFunction`](#XYValueNotifierFunction))<a name="add_notifier"></a>
> Add value change notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`XYValueNotifierFunction`](#XYValueNotifierFunction))<a name="remove_notifier"></a>
> Remove value change notifier  



---  
## Aliases  
### ControlActive<a name="ControlActive"></a>
[`boolean`](../../API/builtins/boolean.md)  
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.  
  
### ControlMidiMappingString<a name="ControlMidiMappingString"></a>
[`string`](../../API/builtins/string.md)  
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.  
  
### SliderMaxValue<a name="SliderMaxValue"></a>
[`number`](../../API/builtins/number.md)  
> The maximum value that can be set using the view
> * Default: 1.0  
  
### SliderMinValue<a name="SliderMinValue"></a>
[`number`](../../API/builtins/number.md)  
> The minimum value that can be set using the view
> * Default: 0  
  
### SliderNumberValue<a name="SliderNumberValue"></a>
[`number`](../../API/builtins/number.md)  
> The current value of the view  
  
### ViewDimension<a name="ViewDimension"></a>
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.  
  
### ViewTooltip<a name="ViewTooltip"></a>
[`string`](../../API/builtins/string.md)  
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)  
  
### ViewVisibility<a name="ViewVisibility"></a>
[`boolean`](../../API/builtins/boolean.md)  
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true  
  
### XYPadMaxValues<a name="XYPadMaxValues"></a>
{ x : [`SliderMaxValue`](#SliderMaxValue), y : [`SliderMaxValue`](#SliderMaxValue) }  
> A table of allowed maximum values for each axis
> * Default: {x: 1.0, y: 1.0}  
  
### XYPadMinValues<a name="XYPadMinValues"></a>
{ x : [`SliderMinValue`](#SliderMinValue), y : [`SliderMinValue`](#SliderMinValue) }  
> A table of allowed minimum values for each axis
> * Default: {x: 0.0, y: 0.0}  
  
### XYPadSnapbackValues<a name="XYPadSnapbackValues"></a>
{ x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md) }  
> A table of snapback values for each axis
> When snapback is enabled, the pad will revert its values to the specified
> snapback values as soon as the mouse button is released in the pad.
> When disabled, releasing the mouse button will not change the value.
> You can disable snapback at runtime by setting it to nil or an empty table.  
  
### XYPadValues<a name="XYPadValues"></a>
{ x : [`SliderNumberValue`](#SliderNumberValue), y : [`SliderNumberValue`](#SliderNumberValue) }  
> A table of the XYPad's current values on each axis  
  
### XYValueNotifierFunction<a name="XYValueNotifierFunction"></a>
(value : [`XYPadValues`](#XYPadValues))  
  
  

