# renoise.Views.TextField<a name="renoise.Views.TextField"></a>  
> Shows a text string that can be clicked and edited by the user.
> ```text
>  +----------------+
>  | Editable Te|xt |
>  +----------------+
> ```  

<!-- toc -->
  

---  
## Properties
### active : [`TextActive`](#TextActive)<a name="active"></a>
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true

### value : [`TextValue`](#TextValue)<a name="value"></a>
> The currently shown text. The text will not be updated when editing,
> rather only after editing is complete (return is pressed, or focus is lost).
> * Default: ""

### text : [`TextValueAlias`](#TextValueAlias)<a name="text"></a>
> Exactly the same as "value"; provided for consistency.
> * Default: ""

### align : [`TextAlignment`](#TextAlignment)<a name="align"></a>
> Only used when not editing.

### edit_mode : [`TextEditMode`](#TextEditMode)<a name="edit_mode"></a>
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false

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
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`StringValueNotifierFunction`](#StringValueNotifierFunction))<a name="add_notifier"></a>
> Add value change (text change) notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`StringValueNotifierFunction`](#StringValueNotifierFunction))<a name="remove_notifier"></a>
> Remove value change (text change) notifier
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> Remove a child view from this view.  



---  
## Aliases  
### StringValueNotifierFunction<a name="StringValueNotifierFunction"></a>
(value : [`string`](../../API/builtins/string.md))  
  
  
### TextActive<a name="TextActive"></a>
[`boolean`](../../API/builtins/boolean.md)  
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true  
  
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
  
### TextEditMode<a name="TextEditMode"></a>
[`boolean`](../../API/builtins/boolean.md)  
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false  
  
### TextValue<a name="TextValue"></a>
[`string`](../../API/builtins/string.md)  
> The currently shown text. The text will not be updated when editing,
> rather only after editing is complete (return is pressed, or focus is lost).
> * Default: ""  
  
### TextValueAlias<a name="TextValueAlias"></a>
[`string`](../../API/builtins/string.md)  
> Exactly the same as "value"; provided for consistency.
> * Default: ""  
  
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
  

