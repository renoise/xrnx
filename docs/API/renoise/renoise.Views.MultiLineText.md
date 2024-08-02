# renoise.Views.MultiLineText  
Shows multiple lines of text, auto-formatting and auto-wrapping paragraphs
into lines. Size is not automatically set. As soon as the text no longer fits
into the view, a vertical scroll bar will be shown.

by the user.
```text
 +--------------+-+
 | Text, Bla 1  |+|
 | Text, Bla 2  | |
 | Text, Bla 3  | |
 | Text, Bla 4  |+|
 +--------------+-+
```  

---  
## Properties
### font : [`TextFontStyle`](#TextFontStyle) {#font}
The style that the text should be displayed with.

### height : [`ViewDimension`](#ViewDimension) {#height}
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.

### paragraphs : [`TextParagraphs`](#TextParagraphs) {#paragraphs}
A table of text lines to be used instead of specifying a single text
line with newline characters like "text"
* Default: []

### style : [`TextBackgroundStyle`](#TextBackgroundStyle) {#style}
Default: "body"

### text : [`TextMultilineString`](#TextMultilineString) {#text}
The text that should be displayed.
Newlines (Windows, Mac or Unix styled) in the text can be used to create
paragraphs.

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
### `add_line`([*self*](../../API/builtins/self.md), text : [`string`](../../API/builtins/string.md)) {#add_line}
Append text to the existing text. Newlines in the text will create new
paragraphs, just like in the "text" property.
### `clear`([*self*](../../API/builtins/self.md)) {#clear}
Clear the whole text, same as multiline_text.text="".
### `remove_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
Remove a child view from this view.
### `scroll_to_first_line`([*self*](../../API/builtins/self.md)) {#scroll_to_first_line}
When a scroll bar is visible, scroll the text to show the first line.
### `scroll_to_last_line`([*self*](../../API/builtins/self.md)) {#scroll_to_last_line}
When a scroll bar is visible (needed), scroll the text to show the last line.  



---  
## Aliases  
# alias TextBackgroundStyle {#TextBackgroundStyle}
`"body"` | `"border"` | `"strong"`  
```lua
-- Setup the text view's background:
TextBackgroundStyle:
    | "body" -- simple text color with no background
    | "strong" -- stronger text color with no background
    | "border" -- text on a bordered background
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
  
# alias TextMultilineString {#TextMultilineString}
[`string`](../../API/builtins/string.md)  
The text that should be displayed.
Newlines (Windows, Mac or Unix styled) in the text can be used to create
paragraphs.  
  
# alias TextParagraphs {#TextParagraphs}
[`string`](../../API/builtins/string.md)`[]`  
A table of text lines to be used instead of specifying a single text
line with newline characters like "text"
* Default: []  
  
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
  

