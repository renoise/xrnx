# renoise.Views.Text  
Shows a "static" text string. Static just means that its not linked, bound
to some value and has no notifiers. The text can not be edited by the user.
Nevertheless you can of course change the text at run-time with the "text"
property.
```text
  Text, Bla 1
```  

---  
## Properties
### align : [`TextAlignment`](#TextAlignment) {#align}
Setup the text's alignment. Applies only when the view's size is larger than
the needed size to draw the text

### font : [`TextFontStyle`](#TextFontStyle) {#font}
The style that the text should be displayed with.

### height : [`ViewDimension`](#ViewDimension) {#height}
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.

### style : [`TextStyle`](#TextStyle) {#style}
Get/set the color style the text should be displayed with.

### text : [`TextSingleLineString`](#TextSingleLineString) {#text}
The text that should be displayed. Setting a new text will resize
the view in order to make the text fully visible (expanding only).
* Default: ""

### tooltip : [`ViewTooltip`](#ViewTooltip) {#tooltip}
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)

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
### `remove_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
Remove a child view from this view.  



---  
## Aliases  
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
  
# alias TextFontStyle {#TextFontStyle}
`"big"` | `"bold"` | `"italic"` | `"mono"` | `"normal"`  
```lua
-- The style that the text should be displayed with.
TextFontStyle:
    | "normal" -- (Default)
    | "big" -- big text
    | "bold" -- bold font
    | "italic" -- italic font
    | "mono" -- monospace font
```  
  
# alias TextSingleLineString {#TextSingleLineString}
[`string`](../../API/builtins/string.md)  
The text that should be displayed. Setting a new text will resize
the view in order to make the text fully visible (expanding only).
* Default: ""  
  
# alias TextStyle {#TextStyle}
`"disabled"` | `"normal"` | `"strong"`  
```lua
-- Get/set the color style the text should be displayed with.
TextStyle:
    | "normal" -- (Default)
    | "strong" -- highlighted color
    | "disabled" -- greyed out color
```  
  
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
  

