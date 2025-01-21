# renoise.Views.Value<a name="renoise.Views.Value"></a>  
> A static text view. Shows a string representation of a number and
> allows custom "number to string" conversion.
> ```text
>  +---+-------+
>  | 12.1 dB   |
>  +---+-------+
> ```  

<!-- toc -->
  

---  
## Properties
### value : [`SliderNumberValue`](#SliderNumberValue)<a name="value"></a>
> The current value of the view

### font : [`TextFontStyle`](#TextFontStyle)<a name="font"></a>
> The style that the text should be displayed with.

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
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction))<a name="add_notifier"></a>
> Add value change notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction))<a name="remove_notifier"></a>
> Remove value change notifier
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> Remove a child view from this view.  



---  
## Aliases  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### SliderNumberValue<a name="SliderNumberValue"></a>
[`number`](../../API/builtins/number.md)  
> The current value of the view  
  
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
  

