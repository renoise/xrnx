# renoise.Views.Aligner<a name="renoise.Views.Aligner"></a>  
> Just like a Rack, the Aligner shows no content on its own. It just aligns
> child views vertically or horizontally. As soon as children are added, the
> Aligner will expand itself to make sure that all children are visible
> (including spacing & margins).
> To make use of modes like "center", you manually have to setup a size that
> is bigger than the sum of the child sizes.  

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

### mode : [`AlignerMode`](#AlignerMode)<a name="mode"></a>
> * Default: "left" (for horizontal_aligner) "top" (for vertical_aligner)

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
### AlignerMode<a name="AlignerMode"></a>
`"bottom"` | `"center"` | `"distribute"` | `"justify"` | `"left"` | `"right"` | `"top"`  
> ```lua
> -- * Default: "left" (for horizontal_aligner) "top" (for vertical_aligner)
> AlignerMode:
>     | "left" -- align from left to right (for horizontal_aligner only)
>     | "right" -- align from right to left (for horizontal_aligner only)
>     | "top" -- align from top to bottom (for vertical_aligner only)
>     | "bottom" -- align from bottom to top (for vertical_aligner only)
>     | "center" -- center all views
>     | "justify" -- keep outer views at the borders, distribute the rest
>     | "distribute" -- equally distributes views over the aligners width/height
> ```  
  
### RackMargin<a name="RackMargin"></a>
[`integer`](../../API/builtins/integer.md)  
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)  
  
### RackSpacing<a name="RackSpacing"></a>
[`integer`](../../API/builtins/integer.md)  
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)  
  
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
  

