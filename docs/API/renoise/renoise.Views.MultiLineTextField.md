# renoise.Views.MultiLineTextField<a name="renoise.Views.MultiLineTextField"></a>  
> Shows multiple text lines of text, auto-wrapping paragraphs into lines. The
> text can be edited by the user.
> ```text
>  +--------------------------+-+
>  | Editable Te|xt.          |+|
>  |                          | |
>  | With multiple paragraphs | |
>  | and auto-wrapping        |+|
>  +--------------------------+-+
> ```  

<!-- toc -->
  

---  
## Properties
### active : [`TextActive`](#TextActive)<a name="active"></a>
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true

### value : [`TextMultilineString`](#TextMultilineString)<a name="value"></a>
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.

### text : [`TextValueAlias`](#TextValueAlias)<a name="text"></a>
> Exactly the same as "value"; provided for consistency.
> * Default: ""

### selected_text : [`TextMultilineSelectedString`](#TextMultilineSelectedString)<a name="selected_text"></a>
> **READ-ONLY** The currently selected text, if any.
> Newlines (Windows, Mac or Unix styled) will use the unix newline format.

### paragraphs : [`TextParagraphs`](#TextParagraphs)<a name="paragraphs"></a>
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []

### font : [`TextFontStyle`](#TextFontStyle)<a name="font"></a>
> The style that the text should be displayed with.

### style : [`TextBackgroundStyle`](#TextBackgroundStyle)<a name="style"></a>
> Default: "border"

### edit_mode : [`TextEditMode`](#TextEditMode)<a name="edit_mode"></a>
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false

### visible : [`ViewVisibility`](#ViewVisibility)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

### views : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]<a name="views"></a>
> **READ-ONLY** Empty for all controls, for layout views this contains the
> layout child views in the order they got added

  

---  
## Functions
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`StringValueNotifierFunction`](#StringValueNotifierFunction))<a name="add_notifier"></a>
> Add value change (text change) notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`StringValueNotifierFunction`](#StringValueNotifierFunction))<a name="remove_notifier"></a>
> Remove value change (text change) notifier
### scroll_to_last_line([*self*](../../API/builtins/self.md))<a name="scroll_to_last_line"></a>
> When a scroll bar is visible, scroll the text to show the last line.
### scroll_to_first_line([*self*](../../API/builtins/self.md))<a name="scroll_to_first_line"></a>
> When a scroll bar is visible, scroll the text to show the first line.
### add_line([*self*](../../API/builtins/self.md), text : [`string`](../../API/builtins/string.md))<a name="add_line"></a>
> Append a new text to the existing text. Newline characters in the string will
> create new paragraphs, otherwise a single paragraph is appended.
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Clear the whole text.
### add_view([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_view"></a>
> Add a new child view to this view.
### remove_view([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_view"></a>
> Remove a child view from this view.
### swap_views([*self*](../../API/builtins/self.md), child1 : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md), child2 : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="swap_views"></a>
> Swap position of two child views in this view. With a series of swaps views
> can be moved to any position in the parent.
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> **Deprecated.** Use `add_view` instead
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> **Deprecated.** Use `remove_view` instead
### swap_childs([*self*](../../API/builtins/self.md), child1 : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md), child2 : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="swap_childs"></a>
> **Deprecated.** Use `swap_views` instead  



---  
## Aliases  
### StringValueNotifierFunction<a name="StringValueNotifierFunction"></a>
(value : [`string`](../../API/builtins/string.md))  
  
  
### TextActive<a name="TextActive"></a>
[`boolean`](../../API/builtins/boolean.md)  
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true  
  
### TextBackgroundStyle<a name="TextBackgroundStyle"></a>
`"body"` | `"border"` | `"strong"`  
> ```lua
> -- Setup the text view's background:
> TextBackgroundStyle:
>     | "body" -- simple text color with no background
>     | "strong" -- stronger text color with no background
>     | "border" -- text on a bordered background
> ```  
  
### TextEditMode<a name="TextEditMode"></a>
[`boolean`](../../API/builtins/boolean.md)  
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false  
  
### TextFontStyle<a name="TextFontStyle"></a>
`"big"` | `"bold"` | `"code"` | `"italic"` | `"mono"` | `"normal"`  
> ```lua
> -- The style that the text should be displayed with.
> TextFontStyle:
>     | "normal" -- (Default)
>     | "big" -- big text
>     | "bold" -- bold font
>     | "italic" -- italic font
>     | "mono" -- monospace font
>     | "code" -- monospace code font
> ```  
  
### TextMultilineSelectedString<a name="TextMultilineSelectedString"></a>
[`string`](../../API/builtins/string.md)  
> **READ-ONLY** The currently selected text, if any.
> Newlines (Windows, Mac or Unix styled) will use the unix newline format.  
  
### TextMultilineString<a name="TextMultilineString"></a>
[`string`](../../API/builtins/string.md)  
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.  
  
### TextParagraphs<a name="TextParagraphs"></a>
[`string`](../../API/builtins/string.md)[]  
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []  
  
### TextValueAlias<a name="TextValueAlias"></a>
[`string`](../../API/builtins/string.md)  
> Exactly the same as "value"; provided for consistency.
> * Default: ""  
  
### ViewCursorShape<a name="ViewCursorShape"></a>
`"busy"` | `"change_value"` | `"crosshair"` | `"default"` | `"drag"` | `"drop"` | `"edit_text"` | `"empty"` | `"erase"` | `"extend_bottom"` | `"extend_bottom_alias"` | `"extend_left"` | `"extend_left_alias"` | `"extend_right"` | `"extend_right_alias"` | `"extend_top"` | `"extend_top_alias"` | `"marker"` | `"move"` | `"nodrop"` | `"none"` | `"pencil"` | `"play"` | `"resize_edge_diagonal_left"` | `"resize_edge_diagonal_right"` | `"resize_edge_horizontal"` | `"resize_edge_vertical"` | `"resize_horizontal"` | `"resize_vertical"` | `"zoom"` | `"zoom_horizontal"` | `"zoom_vertical"`  
> ```lua
> -- The cursor cursor for this view which apears on mouse hover.
> -- Using a "none" shape will use use underlying view's cursor or the default cursor.
> ViewCursorShape:
>     | "none"
>     | "empty"
>     | "default"
>     | "change_value"
>     | "edit_text"
>     | "pencil"
>     | "marker"
>     | "crosshair"
>     | "move"
>     | "erase"
>     | "play"
>     | "drag"
>     | "drop"
>     | "nodrop"
>     | "busy"
>     | "resize_vertical"
>     | "resize_horizontal"
>     | "resize_edge_vertical"
>     | "resize_edge_horizontal"
>     | "resize_edge_diagonal_left"
>     | "resize_edge_diagonal_right"
>     | "extend_left"
>     | "extend_right"
>     | "extend_top"
>     | "extend_bottom"
>     | "extend_left_alias"
>     | "extend_right_alias"
>     | "extend_top_alias"
>     | "extend_bottom_alias"
>     | "zoom_vertical"
>     | "zoom_horizontal"
>     | "zoom"
> ```  
  
### ViewDimension<a name="ViewDimension"></a>
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.  
  
### ViewOrigin<a name="ViewOrigin"></a>
{ 1 : [`ViewPosition`](#ViewPosition), 2 : [`ViewPosition`](#ViewPosition) } | { x : [`ViewPosition`](#ViewPosition), y : [`ViewPosition`](#ViewPosition) }  
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.  
  
### ViewPosition<a name="ViewPosition"></a>
[`integer`](../../API/builtins/integer.md)  
> Horizontal (x) or Vertical (y) position of a view within its parent view.  
  
### ViewSize<a name="ViewSize"></a>
{ 1 : [`ViewDimension`](#ViewDimension), 2 : [`ViewDimension`](#ViewDimension) } | { height : [`ViewDimension`](#ViewDimension), width : [`ViewDimension`](#ViewDimension) }  
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.  
  
### ViewTooltip<a name="ViewTooltip"></a>
[`string`](../../API/builtins/string.md)  
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)  
  
### ViewVisibility<a name="ViewVisibility"></a>
[`boolean`](../../API/builtins/boolean.md)  
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true  
  

