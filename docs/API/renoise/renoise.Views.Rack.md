# renoise.Views.Rack<a name="renoise.Views.Rack"></a>  
> A Rack has no content on its own. It only stacks child views. Either
> vertically (ViewBuilder.column) or horizontally (ViewBuilder.row). It allows
> you to create view layouts.  

<!-- toc -->
  

---  
## Properties
### margin : [`RackMargin`](#RackMargin)<a name="margin"></a>
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)

### spacing : [`RackSpacing`](#RackSpacing)<a name="spacing"></a>
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)

### style : [`ViewBackgroundStyle`](#ViewBackgroundStyle)<a name="style"></a>
> Setup a background style for the view. 

### uniform : [`RackUniformity`](#RackUniformity)<a name="uniform"></a>
> When set to true, all child views in the rack are automatically resized to
> the max size of all child views (width in ViewBuilder.column, height in
> ViewBuilder.row). This can be useful to automatically align all sub
> columns/panels to the same size. Resizing is done automatically, as soon
> as a child view size changes or new children are added.
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
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> Remove a child view from this view.  



---  
## Aliases  
### RackMargin<a name="RackMargin"></a>
[`integer`](../../API/builtins/integer.md)  
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)  
  
### RackSpacing<a name="RackSpacing"></a>
[`integer`](../../API/builtins/integer.md)  
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)  
  
### RackUniformity<a name="RackUniformity"></a>
[`boolean`](../../API/builtins/boolean.md)  
> When set to true, all child views in the rack are automatically resized to
> the max size of all child views (width in ViewBuilder.column, height in
> ViewBuilder.row). This can be useful to automatically align all sub
> columns/panels to the same size. Resizing is done automatically, as soon
> as a child view size changes or new children are added.
> * Default: false  
  
### ViewBackgroundStyle<a name="ViewBackgroundStyle"></a>
`"body"` | `"border"` | `"group"` | `"invisible"` | `"panel"` | `"plain"`  
> ```lua
> -- Setup a background style for the view. 
> ViewBackgroundStyle:
>     | "invisible" -- no background (Default)
>     | "plain" -- undecorated, single coloured background
>     | "border" -- same as plain, but with a bold nested border
>     | "body" -- main "background" style, as used in dialog backgrounds
>     | "panel" -- alternative "background" style, beveled
>     | "group" -- background for "nested" groups within body
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
  

