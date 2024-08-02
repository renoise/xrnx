# renoise.Views.XYPad  
A slider like pad which allows for controlling two values at once. By default
it freely moves the XY values, but it can also be configured to snap back to
a predefined value when releasing the mouse button.

All values, notifiers, current value or min/max properties will act just
like a slider or a rotary's properties, but nstead of a single number, a
table with the fields `{x = xvalue, y = yvalue}` is expected, returned.
```text
 +-------+
 |    o  |
 |   +   |
 |       |
 +-------+
```  

---  
## Properties
### active : [`ControlActive`](#ControlActive) {#active}
Instead of making a control invisible, you can also make it inactive.
Deactivated controls will still be shown, and will still show their
currently assigned values, but will not allow changes. Most controls will
display as "grayed out" to visualize the deactivated state.

### height : [`ViewDimension`](#ViewDimension) {#height}
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.

### max : [`XYPadMaxValues`](#XYPadMaxValues) {#max}
A table of allowed maximum values for each axis
* Default: {x: 1.0, y: 1.0}

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString) {#midi_mapping}
When set, the control will be highlighted when Renoise's MIDI mapping dialog
is open. When clicked, it selects the specified string as a MIDI mapping
target action. This target acton can either be one of the globally available
mappings in Renoise, or those that were created by the tool itself.
Target strings are not verified. When they point to nothing, the mapped MIDI
message will do nothing and no error is fired.

### min : [`XYPadMinValues`](#XYPadMinValues) {#min}
A table of allowed minimum values for each axis
* Default: {x: 0.0, y: 0.0}

### snapback : [`XYPadSnapbackValues`](#XYPadSnapbackValues)[`?`](../../API/builtins/nil.md) {#snapback}
A table of snapback values for each axis
When snapback is enabled, the pad will revert its values to the specified
snapback values as soon as the mouse button is released in the pad.
When disabled, releasing the mouse button will not change the value.
You can disable snapback at runtime by setting it to nil or an empty table.

### tooltip : [`ViewTooltip`](#ViewTooltip) {#tooltip}
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)

### value : [`XYPadValues`](#XYPadValues) {#value}
A table of the XYPad's current values on each axis

### views : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)`[]` {#views}
**READ-ONLY** Empty for all controls, for layout views this contains the
layout child views in the order they got added

### visible : [`ViewVisibility`](#ViewVisibility) {#visible}
Set visible to false to hide a view (make it invisible without removing
it). Please note that view.visible will also return false when any of its
parents are invisible (when its implicitly invisible).
* Default: true

### width : [`ViewDimension`](#ViewDimension) {#width}
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.

  

---  
## Functions
### `add_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#add_child}
Add a new child view to this view.
### `add_notifier`([*self*](../../API/builtins/self.md), notifier : [`XYValueNotifierFunction`](#XYValueNotifierFunction)) {#add_notifier}
Add value change notifier
### `remove_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
Remove a child view from this view.
### `remove_notifier`([*self*](../../API/builtins/self.md), notifier : [`XYValueNotifierFunction`](#XYValueNotifierFunction)) {#remove_notifier}
Remove value change notifier  



---  
## Aliases  
# alias ControlActive {#ControlActive}
[`boolean`](../../API/builtins/boolean.md)  
Instead of making a control invisible, you can also make it inactive.
Deactivated controls will still be shown, and will still show their
currently assigned values, but will not allow changes. Most controls will
display as "grayed out" to visualize the deactivated state.  
  
# alias ControlMidiMappingString {#ControlMidiMappingString}
[`string`](../../API/builtins/string.md)  
When set, the control will be highlighted when Renoise's MIDI mapping dialog
is open. When clicked, it selects the specified string as a MIDI mapping
target action. This target acton can either be one of the globally available
mappings in Renoise, or those that were created by the tool itself.
Target strings are not verified. When they point to nothing, the mapped MIDI
message will do nothing and no error is fired.  
  
# alias ViewDimension {#ViewDimension}
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.  
  
# alias ViewTooltip {#ViewTooltip}
[`string`](../../API/builtins/string.md)  
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)  
  
# alias ViewVisibility {#ViewVisibility}
[`boolean`](../../API/builtins/boolean.md)  
Set visible to false to hide a view (make it invisible without removing
it). Please note that view.visible will also return false when any of its
parents are invisible (when its implicitly invisible).
* Default: true  
  
# alias XYPadMaxValues {#XYPadMaxValues}
{ x : [`SliderMaxValue`](#SliderMaxValue), y : [`SliderMaxValue`](#SliderMaxValue) }  
A table of allowed maximum values for each axis
* Default: {x: 1.0, y: 1.0}  
  
# alias XYPadMinValues {#XYPadMinValues}
{ x : [`SliderMinValue`](#SliderMinValue), y : [`SliderMinValue`](#SliderMinValue) }  
A table of allowed minimum values for each axis
* Default: {x: 0.0, y: 0.0}  
  
# alias XYPadSnapbackValues {#XYPadSnapbackValues}
{ x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md) }  
A table of snapback values for each axis
When snapback is enabled, the pad will revert its values to the specified
snapback values as soon as the mouse button is released in the pad.
When disabled, releasing the mouse button will not change the value.
You can disable snapback at runtime by setting it to nil or an empty table.  
  
# alias XYPadValues {#XYPadValues}
{ x : [`SliderNumberValue`](#SliderNumberValue), y : [`SliderNumberValue`](#SliderNumberValue) }  
A table of the XYPad's current values on each axis  
  
# alias XYValueNotifierFunction {#XYValueNotifierFunction}
(value : [`XYPadValues`](#XYPadValues))  
  
  

