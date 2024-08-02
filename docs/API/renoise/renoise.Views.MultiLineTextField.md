# renoise.Views.MultiLineTextField  
Shows multiple text lines of text, auto-wrapping paragraphs into lines. The
text can be edited by the user.
```text
 +--------------------------+-+
 | Editable Te|xt.          |+|
 |                          | |
 | With multiple paragraphs | |
 | and auto-wrapping        |+|
 +--------------------------+-+
```  

---  
## Properties
### active : [`TextActive`](#TextActive) {#active}
When false, text is displayed but can not be entered/modified by the user.
* Default: true

### edit_mode : [`TextEditMode`](#TextEditMode) {#edit_mode}
True when the text field is focused. setting it at run-time programmatically
will focus the text field or remove the focus (focus the dialog) accordingly.
* Default: false

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
Default: "border"

### text : [`TextValueAlias`](#TextValueAlias) {#text}
Exactly the same as "value"; provided for consistency.
* Default: ""

### tooltip : [`ViewTooltip`](#ViewTooltip) {#tooltip}
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)

### value : [`TextMultilineString`](#TextMultilineString) {#value}
The text that should be displayed.
Newlines (Windows, Mac or Unix styled) in the text can be used to create
paragraphs.

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
Append a new text to the existing text. Newline characters in the string will
create new paragraphs, otherwise a single paragraph is appended.
### `add_notifier`([*self*](../../API/builtins/self.md), notifier : [`StringValueNotifierFunction`](#StringValueNotifierFunction)) {#add_notifier}
Add value change (text change) notifier
### `clear`([*self*](../../API/builtins/self.md)) {#clear}
Clear the whole text.
### `remove_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
Remove a child view from this view.
### `remove_notifier`([*self*](../../API/builtins/self.md), notifier : [`StringValueNotifierFunction`](#StringValueNotifierFunction)) {#remove_notifier}
Remove value change (text change) notifier
### `scroll_to_first_line`([*self*](../../API/builtins/self.md)) {#scroll_to_first_line}
When a scroll bar is visible, scroll the text to show the first line.
### `scroll_to_last_line`([*self*](../../API/builtins/self.md)) {#scroll_to_last_line}
When a scroll bar is visible, scroll the text to show the last line.  



---  
## Aliases  
# alias StringValueNotifierFunction {#StringValueNotifierFunction}
(value : [`string`](../../API/builtins/string.md))  
  
  
# alias TextActive {#TextActive}
[`boolean`](../../API/builtins/boolean.md)  
When false, text is displayed but can not be entered/modified by the user.
* Default: true  
  
# alias TextBackgroundStyle {#TextBackgroundStyle}
`"body"` | `"border"` | `"strong"`  
```lua
-- Setup the text view's background:
TextBackgroundStyle:
    | "body" -- simple text color with no background
    | "strong" -- stronger text color with no background
    | "border" -- text on a bordered background
```  
  
# alias TextEditMode {#TextEditMode}
[`boolean`](../../API/builtins/boolean.md)  
True when the text field is focused. setting it at run-time programmatically
will focus the text field or remove the focus (focus the dialog) accordingly.
* Default: false  
  
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
  

