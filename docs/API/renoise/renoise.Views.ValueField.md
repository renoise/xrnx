# renoise.Views.ValueField<a name="renoise.Views.ValueField"></a>  
> A text view, which shows a string representation of a number and allows
> custom "number to string" conversion. The value's text can be edited by the
> user.
> ```lua
>  +---+-------+
>  | 12.1 dB   |
>  +---+-------+
> ```  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### min : [`SliderMinValue`](#SliderMinValue)<a name="min"></a>
> The minimum value that can be set using the view
> * Default: 0

### max : [`SliderMaxValue`](#SliderMaxValue)<a name="max"></a>
> The maximum value that can be set using the view
> * Default: 1.0

### value : [`SliderNumberValue`](#SliderNumberValue)<a name="value"></a>
> The current value of the view

### align : [`TextAlignment`](#TextAlignment)<a name="align"></a>
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

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
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction))<a name="add_notifier"></a>
> Add value change notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction))<a name="remove_notifier"></a>
> Remove value change notifier
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
### ControlActive<a name="ControlActive"></a>
[`boolean`](../../API/builtins/boolean.md)  
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.  
  
### ControlMidiMappingString<a name="ControlMidiMappingString"></a>
[`string`](../../API/builtins/string.md)  
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### SliderMaxValue<a name="SliderMaxValue"></a>
[`number`](../../API/builtins/number.md)  
> The maximum value that can be set using the view
> * Default: 1.0  
  
### SliderMinValue<a name="SliderMinValue"></a>
[`number`](../../API/builtins/number.md)  
> The minimum value that can be set using the view
> * Default: 0  
  
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
  

