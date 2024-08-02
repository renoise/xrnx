# renoise.Views.ValueBox  
A box with arrow buttons and a text field that can be edited by the user.
Allows showing and editing natural numbers in a custom range.
```text
 +---+-------+
 |<|>|  12   |
 +---+-------+
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

### max : [`ValueBoxMaxValue`](#ValueBoxMaxValue) {#max}
The maximum value that can be set using the view
* Default: 100

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString) {#midi_mapping}
When set, the control will be highlighted when Renoise's MIDI mapping dialog
is open. When clicked, it selects the specified string as a MIDI mapping
target action. This target acton can either be one of the globally available
mappings in Renoise, or those that were created by the tool itself.
Target strings are not verified. When they point to nothing, the mapped MIDI
message will do nothing and no error is fired.

### min : [`ValueBoxMinValue`](#ValueBoxMinValue) {#min}
The minimum value that can be set using the view
* Default: 0

### steps : [`SliderStepAmounts`](#SliderStepAmounts) {#steps}
A table containing two numbers representing the step amounts for incrementing
and decrementing by clicking the <> buttons.
The first value is the small step (applied on left clicks)
second value is the big step (applied on right clicks)

### tooltip : [`ViewTooltip`](#ViewTooltip) {#tooltip}
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)

### value : [`SliderNumberValue`](#SliderNumberValue) {#value}
The current value of the view

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
### `add_notifier`([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction)) {#add_notifier}
Add value change notifier
### `remove_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
Remove a child view from this view.
### `remove_notifier`([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction)) {#remove_notifier}
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
  
# alias NumberValueNotifierFunction {#NumberValueNotifierFunction}
(value : [`number`](../../API/builtins/number.md))  
  
  
# alias SliderNumberValue {#SliderNumberValue}
[`number`](../../API/builtins/number.md)  
The current value of the view  
  
# alias SliderStepAmounts {#SliderStepAmounts}
{ 1 : [`number`](../../API/builtins/number.md), 2 : [`number`](../../API/builtins/number.md) }  
A table containing two numbers representing the step amounts for incrementing
and decrementing by clicking the <> buttons.
The first value is the small step (applied on left clicks)
second value is the big step (applied on right clicks)  
  
# alias ValueBoxMaxValue {#ValueBoxMaxValue}
[`number`](../../API/builtins/number.md)  
The maximum value that can be set using the view
* Default: 100  
  
# alias ValueBoxMinValue {#ValueBoxMinValue}
[`number`](../../API/builtins/number.md)  
The minimum value that can be set using the view
* Default: 0  
  
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
  

