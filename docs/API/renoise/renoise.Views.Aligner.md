# renoise.Views.Aligner  
> Just like a Rack, the Aligner shows no content on its own. It just aligns
> child views vertically or horizontally. As soon as children are added, the
> Aligner will expand itself to make sure that all children are visible
> (including spacing & margins).
> To make use of modes like "center", you manually have to setup a size that
> is bigger than the sum of the child sizes.  

<!-- toc -->
  

---  
## Properties
### margin : [`RackMargin`](#RackMargin) {#margin}
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)

### spacing : [`RackSpacing`](#RackSpacing) {#spacing}
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)

### mode : [`AlignerMode`](#AlignerMode) {#mode}
> * Default: "left" (for horizontal_aligner) "top" (for vertical_aligner)

### visible : [`ViewVisibility`](#ViewVisibility) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### height : [`ViewDimension`](#ViewDimension) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### views : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[] {#views}
> **READ-ONLY** Empty for all controls, for layout views this contains the
> layout child views in the order they got added

  

---  
## Functions
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#add_child}
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
> Remove a child view from this view.  



---  
## Local Aliases  
### AlignerMode {#AlignerMode}
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
  
### RackMargin {#RackMargin}
[`integer`](../../API/builtins/integer.md)  
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)  
  
### RackSpacing {#RackSpacing}
[`integer`](../../API/builtins/integer.md)  
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)  
  
### ViewDimension {#ViewDimension}
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.  
  
### ViewTooltip {#ViewTooltip}
[`string`](../../API/builtins/string.md)  
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)  
  
### ViewVisibility {#ViewVisibility}
[`boolean`](../../API/builtins/boolean.md)  
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true  
  

