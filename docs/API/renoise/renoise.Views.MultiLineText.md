# renoise.Views.MultiLineText<a name="renoise.Views.MultiLineText"></a>  
> Shows multiple lines of text, auto-formatting and auto-wrapping paragraphs
> into lines. Size is not automatically set. As soon as the text no longer fits
> into the view, a vertical scroll bar will be shown.
> 
> by the user.
> ```text
>  +--------------+-+
>  | Text, Bla 1  |+|
>  | Text, Bla 2  | |
>  | Text, Bla 3  | |
>  | Text, Bla 4  |+|
>  +--------------+-+
> ```  

<!-- toc -->
  

---  
## Properties
### text : [`TextMultilineString`](#TextMultilineString)<a name="text"></a>
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.

### paragraphs : [`TextParagraphs`](#TextParagraphs)<a name="paragraphs"></a>
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []

### font : [`TextFontStyle`](#TextFontStyle)<a name="font"></a>
> The style that the text should be displayed with.

### style : [`TextBackgroundStyle`](#TextBackgroundStyle)<a name="style"></a>
> Default: "body"

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

  

---  
## Functions
### scroll_to_last_line([*self*](../../API/builtins/self.md))<a name="scroll_to_last_line"></a>
> When a scroll bar is visible (needed), scroll the text to show the last line.
### scroll_to_first_line([*self*](../../API/builtins/self.md))<a name="scroll_to_first_line"></a>
> When a scroll bar is visible, scroll the text to show the first line.
### add_line([*self*](../../API/builtins/self.md), text : [`string`](../../API/builtins/string.md))<a name="add_line"></a>
> Append text to the existing text. Newlines in the text will create new
> paragraphs, just like in the "text" property.
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Clear the whole text, same as multiline_text.text="".
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> Remove a child view from this view.  



---  
## Aliases  
### TextBackgroundStyle<a name="TextBackgroundStyle"></a>
`"body"` | `"border"` | `"strong"`  
> ```lua
> -- Setup the text view's background:
> TextBackgroundStyle:
>     | "body" -- simple text color with no background
>     | "strong" -- stronger text color with no background
>     | "border" -- text on a bordered background
> ```  
  
### TextFontStyle<a name="TextFontStyle"></a>
`"big"` | `"bold"` | `"italic"` | `"mono"` | `"normal"`  
> ```lua
> -- The style that the text should be displayed with.
> TextFontStyle:
>     | "normal" -- (Default)
>     | "big" -- big text
>     | "bold" -- bold font
>     | "italic" -- italic font
>     | "mono" -- monospace font
> ```  
  
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
  

