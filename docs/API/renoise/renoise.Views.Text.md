# renoise.Views.Text<a name="renoise.Views.Text"></a>  
> Shows a "static" text string. Static just means that its not linked, bound
> to some value and has no notifiers. The text can not be edited by the user.
> Nevertheless you can of course change the text at run-time with the "text"
> property.
> ```text
>   Text, Bla 1
> ```  

<!-- toc -->
  

---  
## Properties
### text : [`TextSingleLineString`](#TextSingleLineString)<a name="text"></a>
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""

### font : [`TextFontStyle`](#TextFontStyle)<a name="font"></a>
> The style that the text should be displayed with.

### style : [`TextStyle`](#TextStyle)<a name="style"></a>
> Get/set the color style the text should be displayed with.

### align : [`TextAlignment`](#TextAlignment)<a name="align"></a>
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

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
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> Remove a child view from this view.  



---  
## Aliases  
### TextAlignment<a name="TextAlignment"></a>
`"center"` | `"left"` | `"right"`  
> ```lua
> -- Setup the text's alignment. Applies only when the view's size is larger than
> -- the needed size to draw the text
> TextAlignment:
>     | "left" -- (Default)
>     | "right" -- aligned to the right
>     | "center" -- center text
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
  
### TextSingleLineString<a name="TextSingleLineString"></a>
[`string`](../../API/builtins/string.md)  
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""  
  
### TextStyle<a name="TextStyle"></a>
`"disabled"` | `"normal"` | `"strong"`  
> ```lua
> -- Get/set the color style the text should be displayed with.
> TextStyle:
>     | "normal" -- (Default)
>     | "strong" -- highlighted color
>     | "disabled" -- greyed out color
> ```  
  
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
  

