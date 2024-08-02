# renoise.Views.Switch  
A set of horizontally aligned buttons, where only one button can be enabled
at the same time. Select one of multiple choices, indices.
```text
 +-----------+------------+----------+
 | Button A  | +Button+B+ | Button C |
 +-----------+------------+----------+
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

### items : [`ItemLabels`](#ItemLabels) {#items}
A list of buttons labels to show in order. Must have more than one item.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString) {#midi_mapping}
When set, the control will be highlighted when Renoise's MIDI mapping dialog
is open. When clicked, it selects the specified string as a MIDI mapping
target action. This target acton can either be one of the globally available
mappings in Renoise, or those that were created by the tool itself.
Target strings are not verified. When they point to nothing, the mapped MIDI
message will do nothing and no error is fired.

### tooltip : [`ViewTooltip`](#ViewTooltip) {#tooltip}
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)

### value : [`SelectedItem`](#SelectedItem) {#value}
The currently selected item's index

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
### `add_notifier`([*self*](../../API/builtins/self.md), notifier : [`IntegerValueNotifierFunction`](#IntegerValueNotifierFunction)) {#add_notifier}
Add index change notifier
### `remove_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
Remove a child view from this view.
### `remove_notifier`([*self*](../../API/builtins/self.md), notifier : [`IntegerValueNotifierFunction`](#IntegerValueNotifierFunction)) {#remove_notifier}
Remove index change notifier  



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
  
# alias IntegerValueNotifierFunction {#IntegerValueNotifierFunction}
(value : [`integer`](../../API/builtins/integer.md))  
  
  
# alias ItemLabels {#ItemLabels}
[`string`](../../API/builtins/string.md)`[]`  
A list of buttons labels to show in order. Must have more than one item.  
  
# alias SelectedItem {#SelectedItem}
[`integer`](../../API/builtins/integer.md)  
The currently selected item's index  
  
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
  

