# renoise.Views.TextField  
Shows a text string that can be clicked and edited by the user.
```text
 +----------------+
 | Editable Te|xt |
 +----------------+
```  

---  
## Properties
### active : [`TextActive`](#TextActive) {#active}
When false, text is displayed but can not be entered/modified by the user.
* Default: true

### align : [`TextAlignment`](#TextAlignment) {#align}
Only used when not editing.

### edit_mode : [`TextEditMode`](#TextEditMode) {#edit_mode}
True when the text field is focused. setting it at run-time programmatically
will focus the text field or remove the focus (focus the dialog) accordingly.
* Default: false

### height : [`ViewDimension`](#ViewDimension) {#height}
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.

### text : [`TextValueAlias`](#TextValueAlias) {#text}
Exactly the same as "value"; provided for consistency.
* Default: ""

### tooltip : [`ViewTooltip`](#ViewTooltip) {#tooltip}
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)

### value : [`TextValue`](#TextValue) {#value}
The currently shown text. The text will not be updated when editing,
rather only after editing is complete (return is pressed, or focus is lost).
* Default: ""

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
### `add_notifier`([*self*](../../API/builtins/self.md), notifier : [`StringValueNotifierFunction`](#StringValueNotifierFunction)) {#add_notifier}
Add value change (text change) notifier
### `remove_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
Remove a child view from this view.
### `remove_notifier`([*self*](../../API/builtins/self.md), notifier : [`StringValueNotifierFunction`](#StringValueNotifierFunction)) {#remove_notifier}
Remove value change (text change) notifier  



---  
## Aliases  
# alias StringValueNotifierFunction {#StringValueNotifierFunction}
(value : [`string`](../../API/builtins/string.md))  
  
  
# alias TextActive {#TextActive}
[`boolean`](../../API/builtins/boolean.md)  
When false, text is displayed but can not be entered/modified by the user.
* Default: true  
  
# alias TextAlignment {#TextAlignment}
`"center"` | `"left"` | `"right"`  
```lua
-- Setup the text's alignment. Applies only when the view's size is larger than
-- the needed size to draw the text
TextAlignment:
    | "left" -- (Default)
    | "right" -- aligned to the right
    | "center" -- center text
```  
  
# alias TextEditMode {#TextEditMode}
[`boolean`](../../API/builtins/boolean.md)  
True when the text field is focused. setting it at run-time programmatically
will focus the text field or remove the focus (focus the dialog) accordingly.
* Default: false  
  
# alias TextValue {#TextValue}
[`string`](../../API/builtins/string.md)  
The currently shown text. The text will not be updated when editing,
rather only after editing is complete (return is pressed, or focus is lost).
* Default: ""  
  
# alias TextValueAlias {#TextValueAlias}
[`string`](../../API/builtins/string.md)  
Exactly the same as "value"; provided for consistency.
* Default: ""  
  
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
  

