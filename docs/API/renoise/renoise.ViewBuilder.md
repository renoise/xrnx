# renoise.ViewBuilder<a name="renoise.ViewBuilder"></a>  
> Class which is used to construct new views. All view properties can optionally
> be in-lined in a passed construction table:
> ```lua
> local vb = renoise.ViewBuilder() -- create a new ViewBuilder
> vb:button { text = "ButtonText" } -- is the same as
> my_button = vb:button(); my_button.text = "ButtonText"
> ```
> Besides the listed class properties, you can also specify the following
> "extra" properties in the passed table:
> 
> * id = "SomeString": Can be use to resolve the view later on, e.g.
>   `vb.views.SomeString` or `vb.views["SomeString"]`
> 
> * Nested child views: Add child views to the currently specified view.
> 
> #### examples:
> ```lua
> -- creates a column view with `margin = 1` and adds two text views to the column.
> vb:column {
>   margin = 1,
>   views = {
>     vb:text {
>       text = "Text1"
>     },
>     vb:text {
>       text = "Text1"
>     }
>   }
> }
> ```  

<!-- toc -->
  
## Constants

### DEFAULT_CONTROL_MARGIN : [`integer`](../../API/builtins/integer.md)<a name="DEFAULT_CONTROL_MARGIN"></a>
> The default margin for all control views

### DEFAULT_CONTROL_SPACING : [`integer`](../../API/builtins/integer.md)<a name="DEFAULT_CONTROL_SPACING"></a>
> The default spacing for all control views

### DEFAULT_CONTROL_HEIGHT : [`integer`](../../API/builtins/integer.md)<a name="DEFAULT_CONTROL_HEIGHT"></a>
> The default height for control views

### DEFAULT_MINI_CONTROL_HEIGHT : [`integer`](../../API/builtins/integer.md)<a name="DEFAULT_MINI_CONTROL_HEIGHT"></a>
> The default height for mini-sliders

### DEFAULT_DIALOG_MARGIN : [`integer`](../../API/builtins/integer.md)<a name="DEFAULT_DIALOG_MARGIN"></a>
> The default margin for dialogs

### DEFAULT_DIALOG_SPACING : [`integer`](../../API/builtins/integer.md)<a name="DEFAULT_DIALOG_SPACING"></a>
> The default spacing for dialogs

### DEFAULT_DIALOG_BUTTON_HEIGHT : [`integer`](../../API/builtins/integer.md)<a name="DEFAULT_DIALOG_BUTTON_HEIGHT"></a>
> The default height for buttons
  

---  
## Properties
### views : table<[`string`](../../API/builtins/string.md), [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)><a name="views"></a>
> Table of views, which got registered via the "id" property
> View id is the table key, the table's value is the view's object.
> 
> #### examples:
> ```lua
> vb:text { id="my_view", text="some_text"}
> vb.views.my_view.visible = false
> --or
> vb.views["my_view"].visible = false
> ```

  

---  
## Functions
### column([*self*](../../API/builtins/self.md), properties : [`RackViewProperties`](#rackviewproperties))<a name="column"></a>
> You can add nested child views when constructing a column or row
> by including them in the constructor table in the views property.
> 
> #### examples:
> ```lua
> vb:column {
>   margin = 1,
>   views = {
>     vb:text {
>       text = "Text1"
>     },
>     vb:text {
>       text = "Text2"
>     }
>   }
> }
> ```
### row([*self*](../../API/builtins/self.md), properties : [`RackViewProperties`](#rackviewproperties))<a name="row"></a>
> You can add nested child views when constructing a column or row
> by including them in the constructor table in the views property.
> 
> #### examples:
> ```lua
> vb:column {
>   margin = 1,
>   views = {
>     vb:text {
>       text = "Text1"
>     },
>     vb:text {
>       text = "Text2"
>     }
>   }
> }
> ```
### horizontal_aligner([*self*](../../API/builtins/self.md), properties : [`AlignerViewProperties`](#alignerviewproperties))<a name="horizontal_aligner"></a>
> You can add nested child views when constructing aligners by including them
> in the constructor table.
> 
> #### examples:
> ```lua
> vb:horizontal_aligner {
>    mode = "center",
>    views = {
>      vb:text {
>        text = "Text1"
>      },
>      vb:text {
>        text = "Text2"
>      }
>    }
> }
> ```
### vertical_aligner([*self*](../../API/builtins/self.md), properties : [`AlignerViewProperties`](#alignerviewproperties))<a name="vertical_aligner"></a>
> You can add nested child views when constructing aligners by including them
> in the constructor table.
> 
> #### examples:
> ```lua
> vb:horizontal_aligner {
>    mode = "center",
>    views = {
>      vb:text {
>        text = "Text1"
>      },
>      vb:text {
>        text = "Text2"
>      }
>    }
> }
> ```
### stack([*self*](../../API/builtins/self.md), properties : [`StackViewProperties`](#stackviewproperties)[`?`](../../API/builtins/nil.md))<a name="stack"></a>
`->`[`renoise.Views.Stack`](../../API/renoise/renoise.Views.Stack.md)  

> You can add nested child views when constructing stacks by including them
> in the constructor table. Use the view property `origin` to position them
> in the stack.
> 
> ```lua
> --Stack multiple views
> vb:stack {
>    views = {
>      vb:text {
>        origin = { 10, 10 },
>        text = "Text1"
>      },
>      vb:text {
>        origin = { 100, 20 },
>        text = "Text 2"
>      }
>    }
> }
> ```
> See: `renoise.Views.Stack`
### space([*self*](../../API/builtins/self.md), properties : [`ViewProperties`](#viewproperties))<a name="space"></a>
> You can create an empty space in layouts with a space.
> 
> #### examples:
> ```lua
> --Empty space in layouts
> vb:row {
>   views = {
>     vb:button {
>       text = "Some Button"
>     },
>     vb:space { -- extra spacing between buttons
>       width = 8
>     },
>     vb:button {
>       text = "Another Button"
>     },
>   }
> }
> ```
### canvas([*self*](../../API/builtins/self.md), properties : [`CanvasViewProperties`](#canvasviewproperties)[`?`](../../API/builtins/nil.md))<a name="canvas"></a>
`->`[`renoise.Views.Canvas`](../../API/renoise/renoise.Views.Canvas.md)  

> See: `renoise.Views.Canvas`
### text([*self*](../../API/builtins/self.md), properties : [`TextViewProperties`](#textviewproperties)[`?`](../../API/builtins/nil.md))<a name="text"></a>
`->`[`renoise.Views.Text`](../../API/renoise/renoise.Views.Text.md)  

> See: `renoise.Views.Text`
### multiline_text([*self*](../../API/builtins/self.md), properties : [`MultilineTextViewProperties`](#multilinetextviewproperties)[`?`](../../API/builtins/nil.md))<a name="multiline_text"></a>
`->`[`renoise.Views.MultiLineText`](../../API/renoise/renoise.Views.MultiLineText.md)  

> See: `renoise.Views.MultiLineText`
### textfield([*self*](../../API/builtins/self.md), properties : [`TextFieldProperties`](#textfieldproperties)[`?`](../../API/builtins/nil.md))<a name="textfield"></a>
`->`[`renoise.Views.TextField`](../../API/renoise/renoise.Views.TextField.md)  

> See: `renoise.Views.TextField`
### multiline_textfield([*self*](../../API/builtins/self.md), properties : [`MultilineTextFieldProperties`](#multilinetextfieldproperties)[`?`](../../API/builtins/nil.md))<a name="multiline_textfield"></a>
`->`[`renoise.Views.MultiLineTextField`](../../API/renoise/renoise.Views.MultiLineTextField.md)  

> See: `renoise.Views.MultiLineTextField`
### link([*self*](../../API/builtins/self.md), properties : [`TextLinkViewProperties`](#textlinkviewproperties)[`?`](../../API/builtins/nil.md))<a name="link"></a>
`->`[`renoise.Views.TextLink`](../../API/renoise/renoise.Views.TextLink.md)  

> See: `renoise.Views.TextLink`
### bitmap([*self*](../../API/builtins/self.md), properties : [`BitmapViewProperties`](#bitmapviewproperties)[`?`](../../API/builtins/nil.md))<a name="bitmap"></a>
`->`[`renoise.Views.Bitmap`](../../API/renoise/renoise.Views.Bitmap.md)  

> See: `renoise.Views.Bitmap`
### button([*self*](../../API/builtins/self.md), properties : [`ButtonProperties`](#buttonproperties)[`?`](../../API/builtins/nil.md))<a name="button"></a>
`->`[`renoise.Views.Button`](../../API/renoise/renoise.Views.Button.md)  

> See: `renoise.Views.Button`
### checkbox([*self*](../../API/builtins/self.md), properties : [`CheckBoxProperties`](#checkboxproperties)[`?`](../../API/builtins/nil.md))<a name="checkbox"></a>
`->`[`renoise.Views.CheckBox`](../../API/renoise/renoise.Views.CheckBox.md)  

> See: `renoise.Views.CheckBox`
### switch([*self*](../../API/builtins/self.md), properties : [`ButtonSwitchProperties`](#buttonswitchproperties)[`?`](../../API/builtins/nil.md))<a name="switch"></a>
`->`[`renoise.Views.Switch`](../../API/renoise/renoise.Views.Switch.md)  

> See: `renoise.Views.Switch`
### popup([*self*](../../API/builtins/self.md), properties : [`PopUpMenuProperties`](#popupmenuproperties)[`?`](../../API/builtins/nil.md))<a name="popup"></a>
`->`[`renoise.Views.Popup`](../../API/renoise/renoise.Views.Popup.md)  

> See: `renoise.Views.Popup`
### chooser([*self*](../../API/builtins/self.md), properties : [`ChooserProperties`](#chooserproperties)[`?`](../../API/builtins/nil.md))<a name="chooser"></a>
`->`[`renoise.Views.Chooser`](../../API/renoise/renoise.Views.Chooser.md)  

> See: `renoise.Views.Chooser`
### valuebox([*self*](../../API/builtins/self.md), properties : [`ValueBoxProperties`](#valueboxproperties)[`?`](../../API/builtins/nil.md))<a name="valuebox"></a>
`->`[`renoise.Views.ValueBox`](../../API/renoise/renoise.Views.ValueBox.md)  

> See: `renoise.Views.ValueBox`
### value([*self*](../../API/builtins/self.md), properties : [`ValueViewProperties`](#valueviewproperties)[`?`](../../API/builtins/nil.md))<a name="value"></a>
`->`[`renoise.Views.Value`](../../API/renoise/renoise.Views.Value.md)  

> See: `renoise.Views.Value`
### valuefield([*self*](../../API/builtins/self.md), properties : [`ValueFieldProperties`](#valuefieldproperties)[`?`](../../API/builtins/nil.md))<a name="valuefield"></a>
`->`[`renoise.Views.ValueField`](../../API/renoise/renoise.Views.ValueField.md)  

> See: `renoise.Views.ValueField`
### scrollbar([*self*](../../API/builtins/self.md), properties : [`ScrollBarProperties`](#scrollbarproperties)[`?`](../../API/builtins/nil.md))<a name="scrollbar"></a>
`->`[`renoise.Views.ScrollBar`](../../API/renoise/renoise.Views.ScrollBar.md)  

> See: `renoise.Views.ScrollBar`
### slider([*self*](../../API/builtins/self.md), properties : [`SliderProperties`](#sliderproperties)[`?`](../../API/builtins/nil.md))<a name="slider"></a>
`->`[`renoise.Views.Slider`](../../API/renoise/renoise.Views.Slider.md)  

> See: `renoise.Views.Slider`
### minislider([*self*](../../API/builtins/self.md), properties : [`MiniSliderProperties`](#minisliderproperties)[`?`](../../API/builtins/nil.md))<a name="minislider"></a>
`->`[`renoise.Views.MiniSlider`](../../API/renoise/renoise.Views.MiniSlider.md)  

> See: `renoise.Views.MiniSlider`
### rotary([*self*](../../API/builtins/self.md), properties : [`RotaryEncoderProperties`](#rotaryencoderproperties)[`?`](../../API/builtins/nil.md))<a name="rotary"></a>
`->`[`renoise.Views.RotaryEncoder`](../../API/renoise/renoise.Views.RotaryEncoder.md)  

> See: `renoise.Views.RotaryEncoder`
### xypad([*self*](../../API/builtins/self.md), properties : [`XYPadProperties`](#xypadproperties)[`?`](../../API/builtins/nil.md))<a name="xypad"></a>
`->`[`renoise.Views.XYPad`](../../API/renoise/renoise.Views.XYPad.md)  

> See: `renoise.Views.XYPad`  



---  
## Structs  
# AlignerViewProperties<a name="AlignerViewProperties"></a>  

---  
## Properties
### margin : [`RackMargin`](#RackMargin)[`?`](../../API/builtins/nil.md)<a name="margin"></a>
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)

### spacing : [`RackSpacing`](#RackSpacing)[`?`](../../API/builtins/nil.md)<a name="spacing"></a>
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)

### mode : [`AlignerMode`](#AlignerMode)[`?`](../../API/builtins/nil.md)<a name="mode"></a>
> * Default: "left" (for horizontal_aligner) "top" (for vertical_aligner)

### background : [`ViewBackgroundStyle`](#ViewBackgroundStyle)[`?`](../../API/builtins/nil.md)<a name="background"></a>
> Setup a background style for the view. 

### mouse_handler : [`MouseHandler`](#MouseHandler)[`?`](../../API/builtins/nil.md)<a name="mouse_handler"></a>
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.

### mouse_events : [`MouseEventTypes`](#MouseEventTypes)[`?`](../../API/builtins/nil.md)<a name="mouse_events"></a>
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.

### views : [`AlignerChildViews`](#AlignerChildViews)[`?`](../../API/builtins/nil.md)<a name="views"></a>
> The aligner view's initial child views.
> Views can later on also be added and removed dynamically after construction via 
> `aligner:add_view(child)` and `aligner:remove_view(child)`

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### AlignerChildViews<a name="AlignerChildViews"></a>
[`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]  
> The aligner view's initial child views.
> Views can later on also be added and removed dynamically after construction via 
> `aligner:add_view(child)` and `aligner:remove_view(child)`  
  
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
  
### MouseEventButton<a name="MouseEventButton"></a>
`"left"` | `"middle"` | `"right"`  
> ```lua
> -- Mouse button of a `MouseEvent` of type "up"|"down"|"double"|"drag".
> MouseEventButton:
>     | "left"
>     | "right"
>     | "middle"
> ```  
  
### MouseEventType<a name="MouseEventType"></a>
`"double"` | `"down"` | `"drag"` | `"enter"` | `"exit"` | `"move"` | `"up"` | `"wheel"`  
> ```lua
> -- Event type of a `MouseEvent`.
> MouseEventType:
>     | "enter"
>     | "exit"
>     | "move"
>     | "down"
>     | "up"
>     | "double"
>     | "drag"
>     | "wheel"
> ```  
  
### MouseEventTypes<a name="MouseEventTypes"></a>
[`MouseEventType`](#MouseEventType)[]  
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.  
  
### MouseEventWheelDirection<a name="MouseEventWheelDirection"></a>
`"down"` | `"left"` | `"right"` | `"up"`  
> ```lua
> -- Mouse wheel direction in a `MouseEvent` of type "wheel".
> MouseEventWheelDirection:
>     | "up"
>     | "down"
>     | "left"
>     | "right"
> ```  
  
### MouseHandler<a name="MouseHandler"></a>
[`MouseHandlerNotifierFunction`](#MouseHandlerNotifierFunction) | [`MouseHandlerNotifierMethod1`](#MouseHandlerNotifierMethod1) | [`MouseHandlerNotifierMethod2`](#MouseHandlerNotifierMethod2)  
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.  
  
### MouseHandlerNotifierFunction<a name="MouseHandlerNotifierFunction"></a>
(event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMemberFunction<a name="MouseHandlerNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMethod1<a name="MouseHandlerNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction) }  
  
  
### MouseHandlerNotifierMethod2<a name="MouseHandlerNotifierMethod2"></a>
{ 1 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### RackMargin<a name="RackMargin"></a>
[`integer`](../../API/builtins/integer.md)  
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)  
  
### RackSpacing<a name="RackSpacing"></a>
[`integer`](../../API/builtins/integer.md)  
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# BitmapViewProperties<a name="BitmapViewProperties"></a>  

---  
## Properties
### mode : [`BitmapMode`](#BitmapMode)[`?`](../../API/builtins/nil.md)<a name="mode"></a>
> Setup how the bitmap should be drawn, recolored. Available modes are:

### color : [`BitmapColor`](#BitmapColor)[`?`](../../API/builtins/nil.md)<a name="color"></a>
> When set, the bitmap will be drawn in the specified color and `mode` is set 
> to `custom_color`. Set `mode` to something else than `custom_color` or the
> `color` to `{0, 0, 0}` to enable a `plain` display mode.

### bitmap : [`BitmapPath`](#BitmapPath)[`?`](../../API/builtins/nil.md)<a name="bitmap"></a>
> Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).

### notifier : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> A click notifier

### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### BitmapColor<a name="BitmapColor"></a>
[`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor)  
> ```lua
> -- When set, the bitmap will be drawn in the specified color and `mode` is set 
> -- to `custom_color`. Set `mode` to something else than `custom_color` or the
> -- `color` to `{0, 0, 0}` to enable a `plain` display mode.
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- The application theme's colors
> BitmapColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  
  
### BitmapImagePath<a name="BitmapImagePath"></a>
[`string`](../../API/builtins/string.md)  
> You can load an image from your tool's directory,
> or use one from Renoise's built-in icons.  
> * For the built-in icons, use "Icons/ArrowRight.bmp"
> * For custom images, use a path relative to your tool's root folder.
> 
> For example "Images/MyBitmap.bmp" will load the image from
> "com.me.MyTool.xrnx/Images/MyBitmap.bmp".  
> If your custom path matches a built-in icon's (like "Icons/ArrowRight.bmp"),
> your image will be loaded instead of the one from Renoise.  
> 
> If you want to support high DPI UI scaling with your bitmaps like the 
> built-in Icons, include high resolution versions with their filenames ending
> with "@4x"  
> The following rules will be used when loading bitmaps  
> * When UI scaling is 100%, only the base bitmaps are used.
> * When UI scaling is 125%, the base bitmaps are used, except if there is a
> ` BitmapName@x1.25.bmp` variant.
> * For all other UI scaling > 125% the "@4x" variants are used and
>   downscaled as needed, except when there is an exact match for the current
>   UI scaling factor (e.g. `BitmapName@1.5x.bmp` for 150%)  
  
### BitmapMode<a name="BitmapMode"></a>
`"body_color"` | `"button_color"` | `"custom_color"` | `"main_color"` | `"plain"` | `"transparent"`  
> ```lua
> -- Setup how the bitmap should be drawn, recolored. Available modes are:
> BitmapMode:
>     | "plain" -- bitmap is drawn as is, no recoloring is done (Default)
>     | "transparent" -- same as plain, but black pixels will be fully transparent
>     | "button_color" -- recolor the bitmap, using the theme's button color
>     | "body_color" -- same as 'button_back' but with body text/back color
>     | "main_color" -- same as 'button_back' but with main text/back colors
>     | "custom_color" -- Recolor the bitmap using a custom color set by the `color'
> ```  
  
### BitmapPath<a name="BitmapPath"></a>
[`BitmapImagePath`](#BitmapImagePath)  
> Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).  
  
### ButtonNotifier<a name="ButtonNotifier"></a>
[`NotifierFunction`](#NotifierFunction) | [`NotifierMethod1`](#NotifierMethod1) | [`NotifierMethod2`](#NotifierMethod2)  
> A click notifier  
  
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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NotifierMemberFunction<a name="NotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext))  
  
  
### NotifierMethod1<a name="NotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NotifierMemberFunction`](#NotifierMemberFunction) }  
  
  
### NotifierMethod2<a name="NotifierMethod2"></a>
{ 1 : [`NotifierMemberFunction`](#NotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  
### ThemeColor<a name="ThemeColor"></a>
`"alternate_main_back"` | `"alternate_main_font"` | `"automation_grid"` | `"automation_line_edge"` | `"automation_line_fill"` | `"automation_marker_diamond"` | `"automation_marker_pair"` | `"automation_marker_play"` | `"automation_marker_single"` | `"automation_point"` | `"body_back"` | `"body_font"` | `"button_back"` | `"button_font"` | `"button_highlight_font"` | `"default_color_01"` | `"default_color_02"` | `"default_color_03"` | `"default_color_04"` | `"default_color_05"` | `"default_color_06"` | `"default_color_07"` | `"default_color_08"` | `"default_color_09"` | `"default_color_10"` | `"default_color_11"` | `"default_color_12"` | `"default_color_13"` | `"default_color_14"` | `"default_color_15"` | `"default_color_16"` | `"folder"` | `"main_back"` | `"main_font"` | `"midi_mapping_back"` | `"midi_mapping_font"` | `"pattern_centerbar_back"` | `"pattern_centerbar_back_standby"` | `"pattern_centerbar_font"` | `"pattern_centerbar_font_standby"` | `"pattern_default_back"` | `"pattern_default_font"` | `"pattern_default_font_delay"` | `"pattern_default_font_dspfx"` | `"pattern_default_font_global"` | `"pattern_default_font_other"` | `"pattern_default_font_panning"` | `"pattern_default_font_pitch"` | `"pattern_default_font_unused"` | `"pattern_default_font_volume"` | `"pattern_highlighted_back"` | `"pattern_highlighted_font"` | `"pattern_highlighted_font_delay"` | `"pattern_highlighted_font_dspfx"` | `"pattern_highlighted_font_global"` | `"pattern_highlighted_font_other"` | `"pattern_highlighted_font_panning"` | `"pattern_highlighted_font_pitch"` | `"pattern_highlighted_font_unused"` | `"pattern_highlighted_font_volume"` | `"pattern_mute_state"` | `"pattern_playposition_back"` | `"pattern_playposition_font"` | `"pattern_selection"` | `"pattern_standby_selection"` | `"scrollbar"` | `"selected_button_back"` | `"selected_button_font"` | `"selection_back"` | `"selection_font"` | `"slider"` | `"standby_selection_back"` | `"standby_selection_font"` | `"strong_body_font"` | `"tooltip_back"` | `"tooltip_font"` | `"valuebox_back"` | `"valuebox_font"` | `"valuebox_font_icons"` | `"vumeter_back_clipped"` | `"vumeter_back_normal"` | `"vumeter_meter"` | `"vumeter_meter_high"` | `"vumeter_meter_low"` | `"vumeter_meter_middle"` | `"vumeter_peak"`  
> ```lua
> -- The application theme's colors
> ThemeColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# ButtonProperties<a name="ButtonProperties"></a>  

---  
## Properties
### text : [`ButtonLabel`](#ButtonLabel)[`?`](../../API/builtins/nil.md)<a name="text"></a>
> The text label of the button
> * Default: ""

### bitmap : [`ButtonBitmapPath`](#ButtonBitmapPath)[`?`](../../API/builtins/nil.md)<a name="bitmap"></a>
> If set, existing text is removed and the loaded image is displayed instead.
> Supported bitmap file formats are ".bmp", ".png" and ".tiff".
> Colors in bitmaps will be overridden by the button's theme color, using black
> as the transparent color for BMPs and TIFFS, and the alpha channel for PNGs.
> All other colors are mapped to the theme color according to their grey value,
> so plain white is the target theme color, and all other colors blend into the
> button's background color of the theme.

### align : [`ButtonAlignment`](#ButtonAlignment)[`?`](../../API/builtins/nil.md)<a name="align"></a>
> Setup the buttons text's or bitmap's alignment within the button.

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md)<a name="font"></a>
> The style that the text should be displayed with.

### color : [`ButtonColor`](#ButtonColor)[`?`](../../API/builtins/nil.md)<a name="color"></a>
> When set, the unpressed button's background will be drawn in the specified color.
> A text color is automatically selected unless explicitly set, to make sure its
> always visible.
> Set color {0,0,0} to enable the theme colors for the button again.

### secondary_color : [`ButtonColor`](#ButtonColor)[`?`](../../API/builtins/nil.md)<a name="secondary_color"></a>
> When set, the unpressed button's background will be drawn in the specified color.
> A text color is automatically selected unless explicitly set, to make sure its
> always visible.
> Set color {0,0,0} to enable the theme colors for the button again.

### style : [`ButtonStyle`](#ButtonStyle)[`?`](../../API/builtins/nil.md)<a name="style"></a>
> Get/set the style a button should be displayed with.

### notifier : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> A click notifier

### pressed : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md)<a name="pressed"></a>
> A click notifier

### released : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md)<a name="released"></a>
> A click notifier

### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### BitmapImagePath<a name="BitmapImagePath"></a>
[`string`](../../API/builtins/string.md)  
> You can load an image from your tool's directory,
> or use one from Renoise's built-in icons.  
> * For the built-in icons, use "Icons/ArrowRight.bmp"
> * For custom images, use a path relative to your tool's root folder.
> 
> For example "Images/MyBitmap.bmp" will load the image from
> "com.me.MyTool.xrnx/Images/MyBitmap.bmp".  
> If your custom path matches a built-in icon's (like "Icons/ArrowRight.bmp"),
> your image will be loaded instead of the one from Renoise.  
> 
> If you want to support high DPI UI scaling with your bitmaps like the 
> built-in Icons, include high resolution versions with their filenames ending
> with "@4x"  
> The following rules will be used when loading bitmaps  
> * When UI scaling is 100%, only the base bitmaps are used.
> * When UI scaling is 125%, the base bitmaps are used, except if there is a
> ` BitmapName@x1.25.bmp` variant.
> * For all other UI scaling > 125% the "@4x" variants are used and
>   downscaled as needed, except when there is an exact match for the current
>   UI scaling factor (e.g. `BitmapName@1.5x.bmp` for 150%)  
  
### ButtonAlignment<a name="ButtonAlignment"></a>
`"center"` | `"left"` | `"right"`  
> ```lua
> -- Setup the buttons text's or bitmap's alignment within the button.
> ButtonAlignment:
>     | "left" -- aligned to the left
>     | "right" -- aligned to the right
>     | "center" -- center (default)
> ```  
  
### ButtonBitmapPath<a name="ButtonBitmapPath"></a>
[`BitmapImagePath`](#BitmapImagePath)  
> If set, existing text is removed and the loaded image is displayed instead.
> Supported bitmap file formats are ".bmp", ".png" and ".tiff".
> Colors in bitmaps will be overridden by the button's theme color, using black
> as the transparent color for BMPs and TIFFS, and the alpha channel for PNGs.
> All other colors are mapped to the theme color according to their grey value,
> so plain white is the target theme color, and all other colors blend into the
> button's background color of the theme.  
  
### ButtonColor<a name="ButtonColor"></a>
[`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor)  
> ```lua
> -- When set, the unpressed button's background will be drawn in the specified color.
> -- A text color is automatically selected unless explicitly set, to make sure its
> -- always visible.
> -- Set color {0,0,0} to enable the theme colors for the button again.
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- The application theme's colors
> ButtonColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  
  
### ButtonLabel<a name="ButtonLabel"></a>
[`string`](../../API/builtins/string.md)  
> The text label of the button
> * Default: ""  
  
### ButtonNotifier<a name="ButtonNotifier"></a>
[`NotifierFunction`](#NotifierFunction) | [`NotifierMethod1`](#NotifierMethod1) | [`NotifierMethod2`](#NotifierMethod2)  
> A click notifier  
  
### ButtonStyle<a name="ButtonStyle"></a>
`"normal"` | `"rounded"` | `"rounded_bottom"` | `"rounded_left"` | `"rounded_right"` | `"rounded_top"`  
> ```lua
> -- Get/set the style a button should be displayed with.
> ButtonStyle:
>     | "normal" -- (Default)
>     | "rounded" -- rounded corners on all sides
>     | "rounded_left" -- rounded left side
>     | "rounded_right" -- rounded right side
>     | "rounded_top" -- rounded left side
>     | "rounded_bottom" -- rounded right side
> ```  
  
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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NotifierMemberFunction<a name="NotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext))  
  
  
### NotifierMethod1<a name="NotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NotifierMemberFunction`](#NotifierMemberFunction) }  
  
  
### NotifierMethod2<a name="NotifierMethod2"></a>
{ 1 : [`NotifierMemberFunction`](#NotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  
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
  
### ThemeColor<a name="ThemeColor"></a>
`"alternate_main_back"` | `"alternate_main_font"` | `"automation_grid"` | `"automation_line_edge"` | `"automation_line_fill"` | `"automation_marker_diamond"` | `"automation_marker_pair"` | `"automation_marker_play"` | `"automation_marker_single"` | `"automation_point"` | `"body_back"` | `"body_font"` | `"button_back"` | `"button_font"` | `"button_highlight_font"` | `"default_color_01"` | `"default_color_02"` | `"default_color_03"` | `"default_color_04"` | `"default_color_05"` | `"default_color_06"` | `"default_color_07"` | `"default_color_08"` | `"default_color_09"` | `"default_color_10"` | `"default_color_11"` | `"default_color_12"` | `"default_color_13"` | `"default_color_14"` | `"default_color_15"` | `"default_color_16"` | `"folder"` | `"main_back"` | `"main_font"` | `"midi_mapping_back"` | `"midi_mapping_font"` | `"pattern_centerbar_back"` | `"pattern_centerbar_back_standby"` | `"pattern_centerbar_font"` | `"pattern_centerbar_font_standby"` | `"pattern_default_back"` | `"pattern_default_font"` | `"pattern_default_font_delay"` | `"pattern_default_font_dspfx"` | `"pattern_default_font_global"` | `"pattern_default_font_other"` | `"pattern_default_font_panning"` | `"pattern_default_font_pitch"` | `"pattern_default_font_unused"` | `"pattern_default_font_volume"` | `"pattern_highlighted_back"` | `"pattern_highlighted_font"` | `"pattern_highlighted_font_delay"` | `"pattern_highlighted_font_dspfx"` | `"pattern_highlighted_font_global"` | `"pattern_highlighted_font_other"` | `"pattern_highlighted_font_panning"` | `"pattern_highlighted_font_pitch"` | `"pattern_highlighted_font_unused"` | `"pattern_highlighted_font_volume"` | `"pattern_mute_state"` | `"pattern_playposition_back"` | `"pattern_playposition_font"` | `"pattern_selection"` | `"pattern_standby_selection"` | `"scrollbar"` | `"selected_button_back"` | `"selected_button_font"` | `"selection_back"` | `"selection_font"` | `"slider"` | `"standby_selection_back"` | `"standby_selection_font"` | `"strong_body_font"` | `"tooltip_back"` | `"tooltip_font"` | `"valuebox_back"` | `"valuebox_font"` | `"valuebox_font_icons"` | `"vumeter_back_clipped"` | `"vumeter_back_normal"` | `"vumeter_meter"` | `"vumeter_meter_high"` | `"vumeter_meter_low"` | `"vumeter_meter_middle"` | `"vumeter_peak"`  
> ```lua
> -- The application theme's colors
> ThemeColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# ButtonSwitchProperties<a name="ButtonSwitchProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SelectedItem`](#SelectedItem)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The currently selected item's index

### notifier : [`IntegerNotifier`](#IntegerNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a notifier that will be called whenever a new item is picked

### items : [`ItemLabels`](#ItemLabels)[`?`](../../API/builtins/nil.md)<a name="items"></a>
> A list of buttons labels to show in order. Must have more than one item.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### IntegerNotifier<a name="IntegerNotifier"></a>
[`IntegerValueNotifierFunction`](#IntegerValueNotifierFunction) | [`IntegerValueNotifierMethod1`](#IntegerValueNotifierMethod1) | [`IntegerValueNotifierMethod2`](#IntegerValueNotifierMethod2)  
> Set up a notifier that will be called whenever a new item is picked  
  
### IntegerValueNotifierFunction<a name="IntegerValueNotifierFunction"></a>
(value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMemberFunction<a name="IntegerValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMethod1<a name="IntegerValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction) }  
  
  
### IntegerValueNotifierMethod2<a name="IntegerValueNotifierMethod2"></a>
{ 1 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### ItemLabels<a name="ItemLabels"></a>
[`string`](../../API/builtins/string.md)[]  
> A list of buttons labels to show in order. Must have more than one item.  
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### SelectedItem<a name="SelectedItem"></a>
[`integer`](../../API/builtins/integer.md)  
> The currently selected item's index  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# CanvasViewProperties<a name="CanvasViewProperties"></a>  

---  
## Properties
### mode : [`CanvasMode`](#CanvasMode)[`?`](../../API/builtins/nil.md)<a name="mode"></a>
> How to draw the canvas context to screen: "transparent" draws with alpha from
> the canvas, "plain" ignores alpha values, which usually is a lot faster to draw.
> Use "plain" to speed up drawing background alike canvas views which cover the
> entire view area. Default: "transparent"

### render : [`CanvasRenderFunction`](#CanvasRenderFunction)[`?`](../../API/builtins/nil.md)<a name="render"></a>
> Rendering callback for a canvas.
> 
> To update the canvas, use the canvas view's `update` function.
> This will will schedule a new drawing as soon as the backend is ready to draw.
> Always draw a complete image here, as the canvas will be completely empty in
> each new render call.
> 
> **UI scaling**: the canvas context by default is set up, so that the global UI
> scaling gets applied. So all positions in the canvas context by default use
> **view sizes** and not pixels. If you want to draw in a raw pixel resolution
> reset the canvas transformation via `context.set_transform(1.0, 0.0, 0.0, 1.0, 0.0, 0.0)`
> To query the actual canvas size in pixels, use the context's `size` property.

### mouse_handler : [`MouseHandler`](#MouseHandler)[`?`](../../API/builtins/nil.md)<a name="mouse_handler"></a>
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.

### mouse_events : [`MouseEventTypes`](#MouseEventTypes)[`?`](../../API/builtins/nil.md)<a name="mouse_events"></a>
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.

### views : [`CanvasChildViews`](#CanvasChildViews)[`?`](../../API/builtins/nil.md)<a name="views"></a>
> The canvas view's optional child views.
> Views can later on also be added and removed dynamically after construction via
> `stack:add_view(child)` and `stack:remove_view(child)`

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### CanvasChildViews<a name="CanvasChildViews"></a>
[`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]  
> The canvas view's optional child views.
> Views can later on also be added and removed dynamically after construction via
> `stack:add_view(child)` and `stack:remove_view(child)`  
  
### CanvasMode<a name="CanvasMode"></a>
`"plain"` | `"transparent"`  
> ```lua
> -- How to draw the canvas context to screen: "transparent" draws with alpha from
> -- the canvas, "plain" ignores alpha values, which usually is a lot faster to draw.
> -- Use "plain" to speed up drawing background alike canvas views which cover the
> -- entire view area. Default: "transparent"
> CanvasMode:
>     | "plain"
>     | "transparent"
> ```  
  
### CanvasRenderFunction<a name="CanvasRenderFunction"></a>
(context : [`renoise.Views.Canvas.Context`](../../API/renoise/renoise.Views.Canvas.Context.md))  
> Rendering callback for a canvas.
> 
> To update the canvas, use the canvas view's `update` function.
> This will will schedule a new drawing as soon as the backend is ready to draw.
> Always draw a complete image here, as the canvas will be completely empty in
> each new render call.
> 
> **UI scaling**: the canvas context by default is set up, so that the global UI
> scaling gets applied. So all positions in the canvas context by default use
> **view sizes** and not pixels. If you want to draw in a raw pixel resolution
> reset the canvas transformation via `context.set_transform(1.0, 0.0, 0.0, 1.0, 0.0, 0.0)`
> To query the actual canvas size in pixels, use the context's `size` property.  
  
### MouseEventButton<a name="MouseEventButton"></a>
`"left"` | `"middle"` | `"right"`  
> ```lua
> -- Mouse button of a `MouseEvent` of type "up"|"down"|"double"|"drag".
> MouseEventButton:
>     | "left"
>     | "right"
>     | "middle"
> ```  
  
### MouseEventType<a name="MouseEventType"></a>
`"double"` | `"down"` | `"drag"` | `"enter"` | `"exit"` | `"move"` | `"up"` | `"wheel"`  
> ```lua
> -- Event type of a `MouseEvent`.
> MouseEventType:
>     | "enter"
>     | "exit"
>     | "move"
>     | "down"
>     | "up"
>     | "double"
>     | "drag"
>     | "wheel"
> ```  
  
### MouseEventTypes<a name="MouseEventTypes"></a>
[`MouseEventType`](#MouseEventType)[]  
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.  
  
### MouseEventWheelDirection<a name="MouseEventWheelDirection"></a>
`"down"` | `"left"` | `"right"` | `"up"`  
> ```lua
> -- Mouse wheel direction in a `MouseEvent` of type "wheel".
> MouseEventWheelDirection:
>     | "up"
>     | "down"
>     | "left"
>     | "right"
> ```  
  
### MouseHandler<a name="MouseHandler"></a>
[`MouseHandlerNotifierFunction`](#MouseHandlerNotifierFunction) | [`MouseHandlerNotifierMethod1`](#MouseHandlerNotifierMethod1) | [`MouseHandlerNotifierMethod2`](#MouseHandlerNotifierMethod2)  
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.  
  
### MouseHandlerNotifierFunction<a name="MouseHandlerNotifierFunction"></a>
(event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMemberFunction<a name="MouseHandlerNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMethod1<a name="MouseHandlerNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction) }  
  
  
### MouseHandlerNotifierMethod2<a name="MouseHandlerNotifierMethod2"></a>
{ 1 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### RGBAColor<a name="RGBAColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md), 4 : [`integer`](../../API/builtins/integer.md) }  
> A table of 4 bytes (ranging from 0 to 255)
> representing the red, green, blue, alpha channels of a color.
> {0xFF, 0xFF, 0xFF, 0xFF} is white
> {165, 73, 35, 0x80} is the red from the Renoise logo, half opaque.  
  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  
### ThemeColor<a name="ThemeColor"></a>
`"alternate_main_back"` | `"alternate_main_font"` | `"automation_grid"` | `"automation_line_edge"` | `"automation_line_fill"` | `"automation_marker_diamond"` | `"automation_marker_pair"` | `"automation_marker_play"` | `"automation_marker_single"` | `"automation_point"` | `"body_back"` | `"body_font"` | `"button_back"` | `"button_font"` | `"button_highlight_font"` | `"default_color_01"` | `"default_color_02"` | `"default_color_03"` | `"default_color_04"` | `"default_color_05"` | `"default_color_06"` | `"default_color_07"` | `"default_color_08"` | `"default_color_09"` | `"default_color_10"` | `"default_color_11"` | `"default_color_12"` | `"default_color_13"` | `"default_color_14"` | `"default_color_15"` | `"default_color_16"` | `"folder"` | `"main_back"` | `"main_font"` | `"midi_mapping_back"` | `"midi_mapping_font"` | `"pattern_centerbar_back"` | `"pattern_centerbar_back_standby"` | `"pattern_centerbar_font"` | `"pattern_centerbar_font_standby"` | `"pattern_default_back"` | `"pattern_default_font"` | `"pattern_default_font_delay"` | `"pattern_default_font_dspfx"` | `"pattern_default_font_global"` | `"pattern_default_font_other"` | `"pattern_default_font_panning"` | `"pattern_default_font_pitch"` | `"pattern_default_font_unused"` | `"pattern_default_font_volume"` | `"pattern_highlighted_back"` | `"pattern_highlighted_font"` | `"pattern_highlighted_font_delay"` | `"pattern_highlighted_font_dspfx"` | `"pattern_highlighted_font_global"` | `"pattern_highlighted_font_other"` | `"pattern_highlighted_font_panning"` | `"pattern_highlighted_font_pitch"` | `"pattern_highlighted_font_unused"` | `"pattern_highlighted_font_volume"` | `"pattern_mute_state"` | `"pattern_playposition_back"` | `"pattern_playposition_font"` | `"pattern_selection"` | `"pattern_standby_selection"` | `"scrollbar"` | `"selected_button_back"` | `"selected_button_font"` | `"selection_back"` | `"selection_font"` | `"slider"` | `"standby_selection_back"` | `"standby_selection_font"` | `"strong_body_font"` | `"tooltip_back"` | `"tooltip_font"` | `"valuebox_back"` | `"valuebox_font"` | `"valuebox_font_icons"` | `"vumeter_back_clipped"` | `"vumeter_back_normal"` | `"vumeter_meter"` | `"vumeter_meter_high"` | `"vumeter_meter_low"` | `"vumeter_meter_middle"` | `"vumeter_peak"`  
> ```lua
> -- The application theme's colors
> ThemeColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# CheckBoxProperties<a name="CheckBoxProperties"></a>  

---  
## Properties
### bind : [`ViewBooleanObservable`](#ViewBooleanObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableBoolean object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`CheckBoxBoolean`](#CheckBoxBoolean)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The current state of the checkbox, expressed as boolean.
> * Default: false

### notifier : [`CheckBoxBooleanNotifier`](#CheckBoxBooleanNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> A notifier for when the checkbox is toggled

### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### BooleanValueNotifierFunction<a name="BooleanValueNotifierFunction"></a>
(value : [`boolean`](../../API/builtins/boolean.md))  
  
  
### BooleanValueNotifierMemberFunction<a name="BooleanValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`boolean`](../../API/builtins/boolean.md))  
  
  
### BooleanValueNotifierMethod1<a name="BooleanValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`BooleanValueNotifierMemberFunction`](#BooleanValueNotifierMemberFunction) }  
  
  
### BooleanValueNotifierMethod2<a name="BooleanValueNotifierMethod2"></a>
{ 1 : [`BooleanValueNotifierMemberFunction`](#BooleanValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### CheckBoxBoolean<a name="CheckBoxBoolean"></a>
[`boolean`](../../API/builtins/boolean.md)  
> The current state of the checkbox, expressed as boolean.
> * Default: false  
  
### CheckBoxBooleanNotifier<a name="CheckBoxBooleanNotifier"></a>
[`BooleanValueNotifierFunction`](#BooleanValueNotifierFunction) | [`BooleanValueNotifierMethod1`](#BooleanValueNotifierMethod1) | [`BooleanValueNotifierMethod2`](#BooleanValueNotifierMethod2)  
> A notifier for when the checkbox is toggled  
  
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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### ViewBooleanObservable<a name="ViewBooleanObservable"></a>
[`renoise.Document.ObservableBoolean`](../../API/renoise/renoise.Document.ObservableBoolean.md)  
> Bind the view's value to a renoise.Document.ObservableBoolean object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# ChooserProperties<a name="ChooserProperties"></a>  

---  
## Properties
### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SelectedItem`](#SelectedItem)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The currently selected item's index

### notifier : [`IntegerNotifier`](#IntegerNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a notifier that will be called whenever a new item is picked

### items : [`ItemLabels`](#ItemLabels)[`?`](../../API/builtins/nil.md)<a name="items"></a>
> A list of buttons labels to show in order. Must have more than one item.

### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### IntegerNotifier<a name="IntegerNotifier"></a>
[`IntegerValueNotifierFunction`](#IntegerValueNotifierFunction) | [`IntegerValueNotifierMethod1`](#IntegerValueNotifierMethod1) | [`IntegerValueNotifierMethod2`](#IntegerValueNotifierMethod2)  
> Set up a notifier that will be called whenever a new item is picked  
  
### IntegerValueNotifierFunction<a name="IntegerValueNotifierFunction"></a>
(value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMemberFunction<a name="IntegerValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMethod1<a name="IntegerValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction) }  
  
  
### IntegerValueNotifierMethod2<a name="IntegerValueNotifierMethod2"></a>
{ 1 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### ItemLabels<a name="ItemLabels"></a>
[`string`](../../API/builtins/string.md)[]  
> A list of buttons labels to show in order. Must have more than one item.  
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### SelectedItem<a name="SelectedItem"></a>
[`integer`](../../API/builtins/integer.md)  
> The currently selected item's index  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# MiniSliderProperties<a name="MiniSliderProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The current value of the view

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a value notifier that will be called whenever the value changes

### polarity : [`SliderPolarity`](#SliderPolarity)[`?`](../../API/builtins/nil.md)<a name="polarity"></a>
> Value polarity of the control. Bipolar controls show the value from the
> center to left and right or up and down and typically controls a range
> around zero, e.g. -1 to 1. Unipolar controls show the value from left to
> right or bottom to top.
> * Default: "unipolar" 

### min : [`SliderMinValue`](#SliderMinValue)[`?`](../../API/builtins/nil.md)<a name="min"></a>
> The minimum value that can be set using the view
> * Default: 0

### max : [`SliderMaxValue`](#SliderMaxValue)[`?`](../../API/builtins/nil.md)<a name="max"></a>
> The maximum value that can be set using the view
> * Default: 1.0

### default : [`SliderDefaultValue`](#SliderDefaultValue)[`?`](../../API/builtins/nil.md)<a name="default"></a>
> The default value that will be re-applied on double-click

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NumberValueNotifier<a name="NumberValueNotifier"></a>
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction<a name="NumberValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1<a name="NumberValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2<a name="NumberValueNotifierMethod2"></a>
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### SliderDefaultValue<a name="SliderDefaultValue"></a>
[`number`](../../API/builtins/number.md)  
> The default value that will be re-applied on double-click  
  
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
  
### SliderPolarity<a name="SliderPolarity"></a>
`"bipolar"` | `"unipolar"`  
> ```lua
> -- Value polarity of the control. Bipolar controls show the value from the
> -- center to left and right or up and down and typically controls a range
> -- around zero, e.g. -1 to 1. Unipolar controls show the value from left to
> -- right or bottom to top.
> -- * Default: "unipolar" 
> SliderPolarity:
>     | "unipolar"
>     | "bipolar"
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# MouseEvent<a name="MouseEvent"></a>  
> Mouse event as passed to a layout view's "mouse_handler" function.  

---  
## Properties
### type : [`MouseEventType`](#MouseEventType)<a name="type"></a>
> Mouse event type. Only enabled types are passed to the handler.

### button : [`MouseEventButton`](#MouseEventButton)[`?`](../../API/builtins/nil.md)<a name="button"></a>
> For "up"|"down"|"double"|"drag" events, the mouse button which got pressed,
> nil for all other events.

### direction : [`MouseEventWheelDirection`](#MouseEventWheelDirection)[`?`](../../API/builtins/nil.md)<a name="direction"></a>
> For "wheel" events, the wheel's direction, nil for all other events.

### position : { x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md) }<a name="position"></a>
> Mouse cursor position in relative coordinates to the layout.

### modifier_flags : { alt : [`boolean`](../../API/builtins/boolean.md), control : [`boolean`](../../API/builtins/boolean.md), meta : [`boolean`](../../API/builtins/boolean.md), shift : [`boolean`](../../API/builtins/boolean.md) }<a name="modifier_flags"></a>
> Currently pressed (held down) keyboard modifier buttons.

### button_flags : { left : [`boolean`](../../API/builtins/boolean.md), middle : [`boolean`](../../API/builtins/boolean.md), right : [`boolean`](../../API/builtins/boolean.md) }<a name="button_flags"></a>
> Currently pressed (held down) mouse buttons.

### hover_views : { id : [`string`](../../API/builtins/string.md), view : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md) }[]<a name="hover_views"></a>
> List of sub views and possible layout subview's subviews, that are located below
> the mouse cursor. In other words: all views that are located below the mouse cursor.
> The list is orderd by containing the top-most visible view first, so you usually will
> need to check the first table entry only.
> 
> NB: Only views that got created with the same view builder instance as the layout,
> and only subviews with valid viewbuilder "id"s will show up here!

  



---  
## Aliases  
### MouseEventButton<a name="MouseEventButton"></a>
`"left"` | `"middle"` | `"right"`  
> ```lua
> -- Mouse button of a `MouseEvent` of type "up"|"down"|"double"|"drag".
> MouseEventButton:
>     | "left"
>     | "right"
>     | "middle"
> ```  
  
### MouseEventType<a name="MouseEventType"></a>
`"double"` | `"down"` | `"drag"` | `"enter"` | `"exit"` | `"move"` | `"up"` | `"wheel"`  
> ```lua
> -- Event type of a `MouseEvent`.
> MouseEventType:
>     | "enter"
>     | "exit"
>     | "move"
>     | "down"
>     | "up"
>     | "double"
>     | "drag"
>     | "wheel"
> ```  
  
### MouseEventWheelDirection<a name="MouseEventWheelDirection"></a>
`"down"` | `"left"` | `"right"` | `"up"`  
> ```lua
> -- Mouse wheel direction in a `MouseEvent` of type "wheel".
> MouseEventWheelDirection:
>     | "up"
>     | "down"
>     | "left"
>     | "right"
> ```  
  

  
# MultilineTextFieldProperties<a name="MultilineTextFieldProperties"></a>  

---  
## Properties
### bind : [`ViewStringListObservable`](#ViewStringListObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableStringList object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### active : [`TextActive`](#TextActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true

### value : [`TextMultilineString`](#TextMultilineString)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.

### notifier : [`StringChangeNotifier`](#StringChangeNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a notifier for text changes

### text : [`TextValueAlias`](#TextValueAlias)[`?`](../../API/builtins/nil.md)<a name="text"></a>
> Exactly the same as "value"; provided for consistency.
> * Default: ""

### paragraphs : [`TextParagraphs`](#TextParagraphs)[`?`](../../API/builtins/nil.md)<a name="paragraphs"></a>
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md)<a name="font"></a>
> The style that the text should be displayed with.

### style : [`TextBackgroundStyle`](#TextBackgroundStyle)[`?`](../../API/builtins/nil.md)<a name="style"></a>
> Setup the text view's background:

### edit_mode : [`TextEditMode`](#TextEditMode)[`?`](../../API/builtins/nil.md)<a name="edit_mode"></a>
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### ListElementAdded<a name="ListElementAdded"></a>
{ index : [`integer`](../../API/builtins/integer.md), type : `"insert"` }  
  
  
### ListElementChange<a name="ListElementChange"></a>
[`ListElementAdded`](#ListElementAdded) | [`ListElementRemoved`](#ListElementRemoved) | [`ListElementsSwapped`](#ListElementsSwapped)  
  
  
### ListElementRemoved<a name="ListElementRemoved"></a>
{ index : [`integer`](../../API/builtins/integer.md), type : `"removed"` }  
  
  
### ListElementsSwapped<a name="ListElementsSwapped"></a>
{ index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md), type : `"swapped"` }  
  
  
### ListNotifierFunction<a name="ListNotifierFunction"></a>
(change : [`ListElementChange`](#ListElementChange))  
  
  
### ListNotifierMemberContext<a name="ListNotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### StringChangeNotifier<a name="StringChangeNotifier"></a>
[`StringValueNotifierFunction`](#StringValueNotifierFunction) | [`StringValueNotifierMethod1`](#StringValueNotifierMethod1) | [`StringValueNotifierMethod2`](#StringValueNotifierMethod2)  
> Set up a notifier for text changes  
  
### StringValueNotifierFunction<a name="StringValueNotifierFunction"></a>
(value : [`string`](../../API/builtins/string.md))  
  
  
### StringValueNotifierMemberFunction<a name="StringValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`string`](../../API/builtins/string.md))  
  
  
### StringValueNotifierMethod1<a name="StringValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`StringValueNotifierMemberFunction`](#StringValueNotifierMemberFunction) }  
  
  
### StringValueNotifierMethod2<a name="StringValueNotifierMethod2"></a>
{ 1 : [`StringValueNotifierMemberFunction`](#StringValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  
### ViewStringListObservable<a name="ViewStringListObservable"></a>
[`renoise.Document.ObservableStringList`](../../API/renoise/renoise.Document.ObservableStringList.md)  
> Bind the view's value to a renoise.Document.ObservableStringList object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# MultilineTextViewProperties<a name="MultilineTextViewProperties"></a>  

---  
## Properties
### text : [`TextMultilineString`](#TextMultilineString)[`?`](../../API/builtins/nil.md)<a name="text"></a>
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.

### paragraphs : [`TextParagraphs`](#TextParagraphs)[`?`](../../API/builtins/nil.md)<a name="paragraphs"></a>
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md)<a name="font"></a>
> The style that the text should be displayed with.

### style : [`TextBackgroundStyle`](#TextBackgroundStyle)[`?`](../../API/builtins/nil.md)<a name="style"></a>
> Setup the text view's background:

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# PopUpMenuProperties<a name="PopUpMenuProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SelectedItem`](#SelectedItem)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The currently selected item's index

### notifier : [`IntegerNotifier`](#IntegerNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a notifier that will be called whenever a new item is picked

### items : [`PopupItemLabels`](#PopupItemLabels)[`?`](../../API/builtins/nil.md)<a name="items"></a>
> A list of buttons labels to show in order
> The list can be empty, then "None" is displayed and the value won't change.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### IntegerNotifier<a name="IntegerNotifier"></a>
[`IntegerValueNotifierFunction`](#IntegerValueNotifierFunction) | [`IntegerValueNotifierMethod1`](#IntegerValueNotifierMethod1) | [`IntegerValueNotifierMethod2`](#IntegerValueNotifierMethod2)  
> Set up a notifier that will be called whenever a new item is picked  
  
### IntegerValueNotifierFunction<a name="IntegerValueNotifierFunction"></a>
(value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMemberFunction<a name="IntegerValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMethod1<a name="IntegerValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction) }  
  
  
### IntegerValueNotifierMethod2<a name="IntegerValueNotifierMethod2"></a>
{ 1 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### PopupItemLabels<a name="PopupItemLabels"></a>
[`string`](../../API/builtins/string.md)[]  
> A list of buttons labels to show in order
> The list can be empty, then "None" is displayed and the value won't change.  
  
### SelectedItem<a name="SelectedItem"></a>
[`integer`](../../API/builtins/integer.md)  
> The currently selected item's index  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# RackViewProperties<a name="RackViewProperties"></a>  

---  
## Properties
### margin : [`RackMargin`](#RackMargin)[`?`](../../API/builtins/nil.md)<a name="margin"></a>
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)

### spacing : [`RackSpacing`](#RackSpacing)[`?`](../../API/builtins/nil.md)<a name="spacing"></a>
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)

### background : [`ViewBackgroundStyle`](#ViewBackgroundStyle)[`?`](../../API/builtins/nil.md)<a name="background"></a>
> Setup a background style for the view. 

### uniform : [`RackUniformity`](#RackUniformity)[`?`](../../API/builtins/nil.md)<a name="uniform"></a>
> When set to true, all child views in the rack are automatically resized to
> the max size of all child views (width in ViewBuilder.column, height in
> ViewBuilder.row). This can be useful to automatically align all sub
> columns/panels to the same size. Resizing is done automatically, as soon
> as a child view size changes or new children are added.
> * Default: false

### mouse_handler : [`MouseHandler`](#MouseHandler)[`?`](../../API/builtins/nil.md)<a name="mouse_handler"></a>
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.

### mouse_events : [`MouseEventTypes`](#MouseEventTypes)[`?`](../../API/builtins/nil.md)<a name="mouse_events"></a>
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.

### views : [`RackChildViews`](#RackChildViews)[`?`](../../API/builtins/nil.md)<a name="views"></a>
> The rack view's initial child views.
> Views can later on also be added and removed dynamically after construction via
> `rack:add_view(child)` and `rack:remove_view(child)`

### style : [`ViewBackgroundStyle`](#ViewBackgroundStyle)[`?`](../../API/builtins/nil.md)<a name="style"></a>
> **Deprecated** Use `background` instead.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### MouseEventButton<a name="MouseEventButton"></a>
`"left"` | `"middle"` | `"right"`  
> ```lua
> -- Mouse button of a `MouseEvent` of type "up"|"down"|"double"|"drag".
> MouseEventButton:
>     | "left"
>     | "right"
>     | "middle"
> ```  
  
### MouseEventType<a name="MouseEventType"></a>
`"double"` | `"down"` | `"drag"` | `"enter"` | `"exit"` | `"move"` | `"up"` | `"wheel"`  
> ```lua
> -- Event type of a `MouseEvent`.
> MouseEventType:
>     | "enter"
>     | "exit"
>     | "move"
>     | "down"
>     | "up"
>     | "double"
>     | "drag"
>     | "wheel"
> ```  
  
### MouseEventTypes<a name="MouseEventTypes"></a>
[`MouseEventType`](#MouseEventType)[]  
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.  
  
### MouseEventWheelDirection<a name="MouseEventWheelDirection"></a>
`"down"` | `"left"` | `"right"` | `"up"`  
> ```lua
> -- Mouse wheel direction in a `MouseEvent` of type "wheel".
> MouseEventWheelDirection:
>     | "up"
>     | "down"
>     | "left"
>     | "right"
> ```  
  
### MouseHandler<a name="MouseHandler"></a>
[`MouseHandlerNotifierFunction`](#MouseHandlerNotifierFunction) | [`MouseHandlerNotifierMethod1`](#MouseHandlerNotifierMethod1) | [`MouseHandlerNotifierMethod2`](#MouseHandlerNotifierMethod2)  
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.  
  
### MouseHandlerNotifierFunction<a name="MouseHandlerNotifierFunction"></a>
(event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMemberFunction<a name="MouseHandlerNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMethod1<a name="MouseHandlerNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction) }  
  
  
### MouseHandlerNotifierMethod2<a name="MouseHandlerNotifierMethod2"></a>
{ 1 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### RackChildViews<a name="RackChildViews"></a>
[`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]  
> The rack view's initial child views.
> Views can later on also be added and removed dynamically after construction via
> `rack:add_view(child)` and `rack:remove_view(child)`  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# RotaryEncoderProperties<a name="RotaryEncoderProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The current value of the view

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a value notifier that will be called whenever the value changes

### polarity : [`SliderPolarity`](#SliderPolarity)[`?`](../../API/builtins/nil.md)<a name="polarity"></a>
> Value polarity of the control. Bipolar controls show the value from the
> center to left and right or up and down and typically controls a range
> around zero, e.g. -1 to 1. Unipolar controls show the value from left to
> right or bottom to top.
> * Default: "unipolar" 

### min : [`SliderMinValue`](#SliderMinValue)[`?`](../../API/builtins/nil.md)<a name="min"></a>
> The minimum value that can be set using the view
> * Default: 0

### max : [`SliderMaxValue`](#SliderMaxValue)[`?`](../../API/builtins/nil.md)<a name="max"></a>
> The maximum value that can be set using the view
> * Default: 1.0

### default : [`SliderDefaultValue`](#SliderDefaultValue)[`?`](../../API/builtins/nil.md)<a name="default"></a>
> The default value that will be re-applied on double-click

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NumberValueNotifier<a name="NumberValueNotifier"></a>
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction<a name="NumberValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1<a name="NumberValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2<a name="NumberValueNotifierMethod2"></a>
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### SliderDefaultValue<a name="SliderDefaultValue"></a>
[`number`](../../API/builtins/number.md)  
> The default value that will be re-applied on double-click  
  
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
  
### SliderPolarity<a name="SliderPolarity"></a>
`"bipolar"` | `"unipolar"`  
> ```lua
> -- Value polarity of the control. Bipolar controls show the value from the
> -- center to left and right or up and down and typically controls a range
> -- around zero, e.g. -1 to 1. Unipolar controls show the value from left to
> -- right or bottom to top.
> -- * Default: "unipolar" 
> SliderPolarity:
>     | "unipolar"
>     | "bipolar"
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# ScrollBarProperties<a name="ScrollBarProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`ScrollbarValue`](#ScrollbarValue)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> Default 0. Offset value in range `min to max - pagestep`.

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a value notifier that will be called whenever the value changes

### min : [`ScrollbarMin`](#ScrollbarMin)[`?`](../../API/builtins/nil.md)<a name="min"></a>
> Default 0. Minimum offset value.

### max : [`ScrollbarMax`](#ScrollbarMax)[`?`](../../API/builtins/nil.md)<a name="max"></a>
> Default 100. Maximum offset value.

### step : [`ScrollbarStep`](#ScrollbarStep)[`?`](../../API/builtins/nil.md)<a name="step"></a>
> Default 1. Amount the mouse-wheel or additional +/- buttons in the scroll bar
> move the scrollable area.

### pagestep : [`ScrollbarPagestep`](#ScrollbarPagestep)[`?`](../../API/builtins/nil.md)<a name="pagestep"></a>
> Default 100. Size of the currently visible area.

### background : [`ViewBackgroundStyle`](#ViewBackgroundStyle)[`?`](../../API/builtins/nil.md)<a name="background"></a>
> Setup a background style for the view. 

### autohide : [`ScrollbarAutoHide`](#ScrollbarAutoHide)[`?`](../../API/builtins/nil.md)<a name="autohide"></a>
> Default: false. When true, view gets automatically hidden when no scrolling is needed

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NumberValueNotifier<a name="NumberValueNotifier"></a>
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction<a name="NumberValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1<a name="NumberValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2<a name="NumberValueNotifierMethod2"></a>
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### ScrollbarAutoHide<a name="ScrollbarAutoHide"></a>
[`boolean`](../../API/builtins/boolean.md)  
> Default: false. When true, view gets automatically hidden when no scrolling is needed  
  
### ScrollbarMax<a name="ScrollbarMax"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 100. Maximum offset value.  
  
### ScrollbarMin<a name="ScrollbarMin"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 0. Minimum offset value.  
  
### ScrollbarPagestep<a name="ScrollbarPagestep"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 100. Size of the currently visible area.  
  
### ScrollbarStep<a name="ScrollbarStep"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 1. Amount the mouse-wheel or additional +/- buttons in the scroll bar
> move the scrollable area.  
  
### ScrollbarValue<a name="ScrollbarValue"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 0. Offset value in range `min to max - pagestep`.  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# SliderProperties<a name="SliderProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The current value of the view

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a value notifier that will be called whenever the value changes

### polarity : [`SliderPolarity`](#SliderPolarity)[`?`](../../API/builtins/nil.md)<a name="polarity"></a>
> Value polarity of the control. Bipolar controls show the value from the
> center to left and right or up and down and typically controls a range
> around zero, e.g. -1 to 1. Unipolar controls show the value from left to
> right or bottom to top.
> * Default: "unipolar" 

### min : [`SliderMinValue`](#SliderMinValue)[`?`](../../API/builtins/nil.md)<a name="min"></a>
> The minimum value that can be set using the view
> * Default: 0

### max : [`SliderMaxValue`](#SliderMaxValue)[`?`](../../API/builtins/nil.md)<a name="max"></a>
> The maximum value that can be set using the view
> * Default: 1.0

### steps : [`SliderStepAmounts`](#SliderStepAmounts)[`?`](../../API/builtins/nil.md)<a name="steps"></a>
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)

### default : [`SliderDefaultValue`](#SliderDefaultValue)[`?`](../../API/builtins/nil.md)<a name="default"></a>
> The default value that will be re-applied on double-click

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NumberValueNotifier<a name="NumberValueNotifier"></a>
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction<a name="NumberValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1<a name="NumberValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2<a name="NumberValueNotifierMethod2"></a>
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### SliderDefaultValue<a name="SliderDefaultValue"></a>
[`number`](../../API/builtins/number.md)  
> The default value that will be re-applied on double-click  
  
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
  
### SliderPolarity<a name="SliderPolarity"></a>
`"bipolar"` | `"unipolar"`  
> ```lua
> -- Value polarity of the control. Bipolar controls show the value from the
> -- center to left and right or up and down and typically controls a range
> -- around zero, e.g. -1 to 1. Unipolar controls show the value from left to
> -- right or bottom to top.
> -- * Default: "unipolar" 
> SliderPolarity:
>     | "unipolar"
>     | "bipolar"
> ```  
  
### SliderStepAmounts<a name="SliderStepAmounts"></a>
{ 1 : [`number`](../../API/builtins/number.md), 2 : [`number`](../../API/builtins/number.md) }  
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# StackViewProperties<a name="StackViewProperties"></a>  

---  
## Properties
### autosize : [`StackAutoSize`](#StackAutoSize)[`?`](../../API/builtins/nil.md)<a name="autosize"></a>
> When set to true, the width and height of the stack will be automatically
> calculated and updated from the stack's child views, to ensure all views fit
> into the stack.
> When disabled, the width and height must be set manually.
> * Default: true

### background : [`ViewBackgroundStyle`](#ViewBackgroundStyle)[`?`](../../API/builtins/nil.md)<a name="background"></a>
> Setup a background style for the view. 

### mouse_handler : [`MouseHandler`](#MouseHandler)[`?`](../../API/builtins/nil.md)<a name="mouse_handler"></a>
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.

### mouse_events : [`MouseEventTypes`](#MouseEventTypes)[`?`](../../API/builtins/nil.md)<a name="mouse_events"></a>
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.

### views : [`StackChildViews`](#StackChildViews)[`?`](../../API/builtins/nil.md)<a name="views"></a>
> The stack view's optional child views.
> Views can later on also be added and removed dynamically after construction via
> `stack:add_view(child)` and `stack:remove_view(child)`

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### MouseEventButton<a name="MouseEventButton"></a>
`"left"` | `"middle"` | `"right"`  
> ```lua
> -- Mouse button of a `MouseEvent` of type "up"|"down"|"double"|"drag".
> MouseEventButton:
>     | "left"
>     | "right"
>     | "middle"
> ```  
  
### MouseEventType<a name="MouseEventType"></a>
`"double"` | `"down"` | `"drag"` | `"enter"` | `"exit"` | `"move"` | `"up"` | `"wheel"`  
> ```lua
> -- Event type of a `MouseEvent`.
> MouseEventType:
>     | "enter"
>     | "exit"
>     | "move"
>     | "down"
>     | "up"
>     | "double"
>     | "drag"
>     | "wheel"
> ```  
  
### MouseEventTypes<a name="MouseEventTypes"></a>
[`MouseEventType`](#MouseEventType)[]  
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.  
  
### MouseEventWheelDirection<a name="MouseEventWheelDirection"></a>
`"down"` | `"left"` | `"right"` | `"up"`  
> ```lua
> -- Mouse wheel direction in a `MouseEvent` of type "wheel".
> MouseEventWheelDirection:
>     | "up"
>     | "down"
>     | "left"
>     | "right"
> ```  
  
### MouseHandler<a name="MouseHandler"></a>
[`MouseHandlerNotifierFunction`](#MouseHandlerNotifierFunction) | [`MouseHandlerNotifierMethod1`](#MouseHandlerNotifierMethod1) | [`MouseHandlerNotifierMethod2`](#MouseHandlerNotifierMethod2)  
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.  
  
### MouseHandlerNotifierFunction<a name="MouseHandlerNotifierFunction"></a>
(event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMemberFunction<a name="MouseHandlerNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMethod1<a name="MouseHandlerNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction) }  
  
  
### MouseHandlerNotifierMethod2<a name="MouseHandlerNotifierMethod2"></a>
{ 1 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### StackAutoSize<a name="StackAutoSize"></a>
[`boolean`](../../API/builtins/boolean.md)  
> When set to true, the width and height of the stack will be automatically
> calculated and updated from the stack's child views, to ensure all views fit
> into the stack.
> When disabled, the width and height must be set manually.
> * Default: true  
  
### StackChildViews<a name="StackChildViews"></a>
[`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]  
> The stack view's optional child views.
> Views can later on also be added and removed dynamically after construction via
> `stack:add_view(child)` and `stack:remove_view(child)`  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# TextFieldProperties<a name="TextFieldProperties"></a>  

---  
## Properties
### bind : [`ViewStringObservable`](#ViewStringObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableString object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### active : [`TextActive`](#TextActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true

### value : [`TextValue`](#TextValue)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The currently shown text. The text will not be updated when editing,
> rather only after editing is complete (return is pressed, or focus is lost).
> * Default: ""

### notifier : [`StringChangeNotifier`](#StringChangeNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a notifier for text changes

### text : [`TextValueAlias`](#TextValueAlias)[`?`](../../API/builtins/nil.md)<a name="text"></a>
> Exactly the same as "value"; provided for consistency.
> * Default: ""

### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md)<a name="align"></a>
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### edit_mode : [`TextEditMode`](#TextEditMode)[`?`](../../API/builtins/nil.md)<a name="edit_mode"></a>
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### StringChangeNotifier<a name="StringChangeNotifier"></a>
[`StringValueNotifierFunction`](#StringValueNotifierFunction) | [`StringValueNotifierMethod1`](#StringValueNotifierMethod1) | [`StringValueNotifierMethod2`](#StringValueNotifierMethod2)  
> Set up a notifier for text changes  
  
### StringValueNotifierFunction<a name="StringValueNotifierFunction"></a>
(value : [`string`](../../API/builtins/string.md))  
  
  
### StringValueNotifierMemberFunction<a name="StringValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`string`](../../API/builtins/string.md))  
  
  
### StringValueNotifierMethod1<a name="StringValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`StringValueNotifierMemberFunction`](#StringValueNotifierMemberFunction) }  
  
  
### StringValueNotifierMethod2<a name="StringValueNotifierMethod2"></a>
{ 1 : [`StringValueNotifierMemberFunction`](#StringValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  
### ViewStringObservable<a name="ViewStringObservable"></a>
[`renoise.Document.ObservableString`](../../API/renoise/renoise.Document.ObservableString.md)  
> Bind the view's value to a renoise.Document.ObservableString object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# TextLinkViewProperties<a name="TextLinkViewProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### notifier : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> A click notifier

### pressed : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md)<a name="pressed"></a>
> A click notifier

### released : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md)<a name="released"></a>
> A click notifier

### text : [`TextSingleLineString`](#TextSingleLineString)[`?`](../../API/builtins/nil.md)<a name="text"></a>
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md)<a name="font"></a>
> The style that the text should be displayed with.

### style : [`TextStyle`](#TextStyle)[`?`](../../API/builtins/nil.md)<a name="style"></a>
> Get/set the color style the text should be displayed with.

### color : [`TextColor`](#TextColor)[`?`](../../API/builtins/nil.md)<a name="color"></a>
> When set, the text will be drawn in the specified color.
> Set style to something else than "custom" or color to `{0, 0, 0}`
> to enable the default theme color for the text again.

### orientation : [`TextOrientation`](#TextOrientation)[`?`](../../API/builtins/nil.md)<a name="orientation"></a>
> Setup the texts's orientation (writing direction).

### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md)<a name="align"></a>
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### ButtonNotifier<a name="ButtonNotifier"></a>
[`NotifierFunction`](#NotifierFunction) | [`NotifierMethod1`](#NotifierMethod1) | [`NotifierMethod2`](#NotifierMethod2)  
> A click notifier  
  
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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NotifierMemberFunction<a name="NotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext))  
  
  
### NotifierMethod1<a name="NotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NotifierMemberFunction`](#NotifierMemberFunction) }  
  
  
### NotifierMethod2<a name="NotifierMethod2"></a>
{ 1 : [`NotifierMemberFunction`](#NotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  
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
  
### TextColor<a name="TextColor"></a>
[`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor)  
> ```lua
> -- When set, the text will be drawn in the specified color.
> -- Set style to something else than "custom" or color to `{0, 0, 0}`
> -- to enable the default theme color for the text again.
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- The application theme's colors
> TextColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  
  
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
  
### TextOrientation<a name="TextOrientation"></a>
`"horizontal"` | `"horizontal-rl"` | `"vertical"` | `"vertical-tb"`  
> ```lua
> -- Setup the texts's orientation (writing direction).
> TextOrientation:
>     | "horizontal" -- Draw from left to right (Default)
>     | "horizontal-rl" -- Draw from right to left
>     | "vertical" -- Draw from bottom to top
>     | "vertical-tb" -- Draw from top to bottom
> ```  
  
### TextSingleLineString<a name="TextSingleLineString"></a>
[`string`](../../API/builtins/string.md)  
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""  
  
### TextStyle<a name="TextStyle"></a>
`"custom"` | `"disabled"` | `"normal"` | `"strong"`  
> ```lua
> -- Get/set the color style the text should be displayed with.
> TextStyle:
>     | "normal" -- (Default)
>     | "strong" -- highlighted color
>     | "disabled" -- greyed out color
>     | "custom" -- custom color
> ```  
  
### ThemeColor<a name="ThemeColor"></a>
`"alternate_main_back"` | `"alternate_main_font"` | `"automation_grid"` | `"automation_line_edge"` | `"automation_line_fill"` | `"automation_marker_diamond"` | `"automation_marker_pair"` | `"automation_marker_play"` | `"automation_marker_single"` | `"automation_point"` | `"body_back"` | `"body_font"` | `"button_back"` | `"button_font"` | `"button_highlight_font"` | `"default_color_01"` | `"default_color_02"` | `"default_color_03"` | `"default_color_04"` | `"default_color_05"` | `"default_color_06"` | `"default_color_07"` | `"default_color_08"` | `"default_color_09"` | `"default_color_10"` | `"default_color_11"` | `"default_color_12"` | `"default_color_13"` | `"default_color_14"` | `"default_color_15"` | `"default_color_16"` | `"folder"` | `"main_back"` | `"main_font"` | `"midi_mapping_back"` | `"midi_mapping_font"` | `"pattern_centerbar_back"` | `"pattern_centerbar_back_standby"` | `"pattern_centerbar_font"` | `"pattern_centerbar_font_standby"` | `"pattern_default_back"` | `"pattern_default_font"` | `"pattern_default_font_delay"` | `"pattern_default_font_dspfx"` | `"pattern_default_font_global"` | `"pattern_default_font_other"` | `"pattern_default_font_panning"` | `"pattern_default_font_pitch"` | `"pattern_default_font_unused"` | `"pattern_default_font_volume"` | `"pattern_highlighted_back"` | `"pattern_highlighted_font"` | `"pattern_highlighted_font_delay"` | `"pattern_highlighted_font_dspfx"` | `"pattern_highlighted_font_global"` | `"pattern_highlighted_font_other"` | `"pattern_highlighted_font_panning"` | `"pattern_highlighted_font_pitch"` | `"pattern_highlighted_font_unused"` | `"pattern_highlighted_font_volume"` | `"pattern_mute_state"` | `"pattern_playposition_back"` | `"pattern_playposition_font"` | `"pattern_selection"` | `"pattern_standby_selection"` | `"scrollbar"` | `"selected_button_back"` | `"selected_button_font"` | `"selection_back"` | `"selection_font"` | `"slider"` | `"standby_selection_back"` | `"standby_selection_font"` | `"strong_body_font"` | `"tooltip_back"` | `"tooltip_font"` | `"valuebox_back"` | `"valuebox_font"` | `"valuebox_font_icons"` | `"vumeter_back_clipped"` | `"vumeter_back_normal"` | `"vumeter_meter"` | `"vumeter_meter_high"` | `"vumeter_meter_low"` | `"vumeter_meter_middle"` | `"vumeter_peak"`  
> ```lua
> -- The application theme's colors
> ThemeColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# TextViewProperties<a name="TextViewProperties"></a>  

---  
## Properties
### text : [`TextSingleLineString`](#TextSingleLineString)[`?`](../../API/builtins/nil.md)<a name="text"></a>
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md)<a name="font"></a>
> The style that the text should be displayed with.

### style : [`TextStyle`](#TextStyle)[`?`](../../API/builtins/nil.md)<a name="style"></a>
> Get/set the color style the text should be displayed with.

### color : [`TextColor`](#TextColor)[`?`](../../API/builtins/nil.md)<a name="color"></a>
> When set, the text will be drawn in the specified color.
> Set style to something else than "custom" or color to `{0, 0, 0}`
> to enable the default theme color for the text again.

### orientation : [`TextOrientation`](#TextOrientation)[`?`](../../API/builtins/nil.md)<a name="orientation"></a>
> Setup the texts's orientation (writing direction).

### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md)<a name="align"></a>
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  
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
  
### TextColor<a name="TextColor"></a>
[`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor)  
> ```lua
> -- When set, the text will be drawn in the specified color.
> -- Set style to something else than "custom" or color to `{0, 0, 0}`
> -- to enable the default theme color for the text again.
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- The application theme's colors
> TextColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  
  
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
  
### TextOrientation<a name="TextOrientation"></a>
`"horizontal"` | `"horizontal-rl"` | `"vertical"` | `"vertical-tb"`  
> ```lua
> -- Setup the texts's orientation (writing direction).
> TextOrientation:
>     | "horizontal" -- Draw from left to right (Default)
>     | "horizontal-rl" -- Draw from right to left
>     | "vertical" -- Draw from bottom to top
>     | "vertical-tb" -- Draw from top to bottom
> ```  
  
### TextSingleLineString<a name="TextSingleLineString"></a>
[`string`](../../API/builtins/string.md)  
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""  
  
### TextStyle<a name="TextStyle"></a>
`"custom"` | `"disabled"` | `"normal"` | `"strong"`  
> ```lua
> -- Get/set the color style the text should be displayed with.
> TextStyle:
>     | "normal" -- (Default)
>     | "strong" -- highlighted color
>     | "disabled" -- greyed out color
>     | "custom" -- custom color
> ```  
  
### ThemeColor<a name="ThemeColor"></a>
`"alternate_main_back"` | `"alternate_main_font"` | `"automation_grid"` | `"automation_line_edge"` | `"automation_line_fill"` | `"automation_marker_diamond"` | `"automation_marker_pair"` | `"automation_marker_play"` | `"automation_marker_single"` | `"automation_point"` | `"body_back"` | `"body_font"` | `"button_back"` | `"button_font"` | `"button_highlight_font"` | `"default_color_01"` | `"default_color_02"` | `"default_color_03"` | `"default_color_04"` | `"default_color_05"` | `"default_color_06"` | `"default_color_07"` | `"default_color_08"` | `"default_color_09"` | `"default_color_10"` | `"default_color_11"` | `"default_color_12"` | `"default_color_13"` | `"default_color_14"` | `"default_color_15"` | `"default_color_16"` | `"folder"` | `"main_back"` | `"main_font"` | `"midi_mapping_back"` | `"midi_mapping_font"` | `"pattern_centerbar_back"` | `"pattern_centerbar_back_standby"` | `"pattern_centerbar_font"` | `"pattern_centerbar_font_standby"` | `"pattern_default_back"` | `"pattern_default_font"` | `"pattern_default_font_delay"` | `"pattern_default_font_dspfx"` | `"pattern_default_font_global"` | `"pattern_default_font_other"` | `"pattern_default_font_panning"` | `"pattern_default_font_pitch"` | `"pattern_default_font_unused"` | `"pattern_default_font_volume"` | `"pattern_highlighted_back"` | `"pattern_highlighted_font"` | `"pattern_highlighted_font_delay"` | `"pattern_highlighted_font_dspfx"` | `"pattern_highlighted_font_global"` | `"pattern_highlighted_font_other"` | `"pattern_highlighted_font_panning"` | `"pattern_highlighted_font_pitch"` | `"pattern_highlighted_font_unused"` | `"pattern_highlighted_font_volume"` | `"pattern_mute_state"` | `"pattern_playposition_back"` | `"pattern_playposition_font"` | `"pattern_selection"` | `"pattern_standby_selection"` | `"scrollbar"` | `"selected_button_back"` | `"selected_button_font"` | `"selection_back"` | `"selection_font"` | `"slider"` | `"standby_selection_back"` | `"standby_selection_font"` | `"strong_body_font"` | `"tooltip_back"` | `"tooltip_font"` | `"valuebox_back"` | `"valuebox_font"` | `"valuebox_font_icons"` | `"vumeter_back_clipped"` | `"vumeter_back_normal"` | `"vumeter_meter"` | `"vumeter_meter_high"` | `"vumeter_meter_low"` | `"vumeter_meter_middle"` | `"vumeter_peak"`  
> ```lua
> -- The application theme's colors
> ThemeColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# ValueBoxProperties<a name="ValueBoxProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The current value of the view

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a value notifier that will be called whenever the value changes

### min : [`ValueBoxMinValue`](#ValueBoxMinValue)[`?`](../../API/builtins/nil.md)<a name="min"></a>
> The minimum value that can be set using the view
> * Default: 0

### max : [`ValueBoxMaxValue`](#ValueBoxMaxValue)[`?`](../../API/builtins/nil.md)<a name="max"></a>
> The maximum value that can be set using the view
> * Default: 100

### steps : [`SliderStepAmounts`](#SliderStepAmounts)[`?`](../../API/builtins/nil.md)<a name="steps"></a>
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)

### tostring : [`PairedShowNumberAsString`](#PairedShowNumberAsString)[`?`](../../API/builtins/nil.md)<a name="tostring"></a>
> Make sure to also set `tonumber` if you set this.

### tonumber : [`PairedParseStringAsNumber`](#PairedParseStringAsNumber)[`?`](../../API/builtins/nil.md)<a name="tonumber"></a>
> Make sure to also set `tostring` if you set this.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NumberValueNotifier<a name="NumberValueNotifier"></a>
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction<a name="NumberValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1<a name="NumberValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2<a name="NumberValueNotifierMethod2"></a>
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### PairedParseStringAsNumber<a name="PairedParseStringAsNumber"></a>
(value : [`string`](../../API/builtins/string.md)) `->` [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)  
> Make sure to also set `tostring` if you set this.  
  
### PairedShowNumberAsString<a name="PairedShowNumberAsString"></a>
[`ShowNumberAsString`](#ShowNumberAsString)  
> Make sure to also set `tonumber` if you set this.  
  
### ShowNumberAsString<a name="ShowNumberAsString"></a>
(value : [`number`](../../API/builtins/number.md)) `->` [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  
> Set a custom rule on how a number value should be displayed.
> Useful for showing units like decibel or note values etc.
> If none are set, a default string/number conversion is done, which
> simply shows the number with 3 digits after the decimal point.
> Note: When the callback fails with an error, it will be disabled to avoid
> a flood of error messages.  
  
### SliderNumberValue<a name="SliderNumberValue"></a>
[`number`](../../API/builtins/number.md)  
> The current value of the view  
  
### SliderStepAmounts<a name="SliderStepAmounts"></a>
{ 1 : [`number`](../../API/builtins/number.md), 2 : [`number`](../../API/builtins/number.md) }  
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)  
  
### ValueBoxMaxValue<a name="ValueBoxMaxValue"></a>
[`number`](../../API/builtins/number.md)  
> The maximum value that can be set using the view
> * Default: 100  
  
### ValueBoxMinValue<a name="ValueBoxMinValue"></a>
[`number`](../../API/builtins/number.md)  
> The minimum value that can be set using the view
> * Default: 0  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# ValueFieldProperties<a name="ValueFieldProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The current value of the view

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a value notifier that will be called whenever the value changes

### min : [`SliderMinValue`](#SliderMinValue)[`?`](../../API/builtins/nil.md)<a name="min"></a>
> The minimum value that can be set using the view
> * Default: 0

### max : [`SliderMaxValue`](#SliderMaxValue)[`?`](../../API/builtins/nil.md)<a name="max"></a>
> The maximum value that can be set using the view
> * Default: 1.0

### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md)<a name="align"></a>
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### tostring : [`PairedShowNumberAsString`](#PairedShowNumberAsString)[`?`](../../API/builtins/nil.md)<a name="tostring"></a>
> Make sure to also set `tonumber` if you set this.

### tonumber : [`PairedParseStringAsNumber`](#PairedParseStringAsNumber)[`?`](../../API/builtins/nil.md)<a name="tonumber"></a>
> Make sure to also set `tostring` if you set this.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NumberValueNotifier<a name="NumberValueNotifier"></a>
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction<a name="NumberValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1<a name="NumberValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2<a name="NumberValueNotifierMethod2"></a>
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### PairedParseStringAsNumber<a name="PairedParseStringAsNumber"></a>
(value : [`string`](../../API/builtins/string.md)) `->` [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)  
> Make sure to also set `tostring` if you set this.  
  
### PairedShowNumberAsString<a name="PairedShowNumberAsString"></a>
[`ShowNumberAsString`](#ShowNumberAsString)  
> Make sure to also set `tonumber` if you set this.  
  
### ShowNumberAsString<a name="ShowNumberAsString"></a>
(value : [`number`](../../API/builtins/number.md)) `->` [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  
> Set a custom rule on how a number value should be displayed.
> Useful for showing units like decibel or note values etc.
> If none are set, a default string/number conversion is done, which
> simply shows the number with 3 digits after the decimal point.
> Note: When the callback fails with an error, it will be disabled to avoid
> a flood of error messages.  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# ValueViewProperties<a name="ValueViewProperties"></a>  

---  
## Properties
### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> The current value of the view

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a value notifier that will be called whenever the value changes

### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md)<a name="align"></a>
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md)<a name="font"></a>
> The style that the text should be displayed with.

### tostring : [`ShowNumberAsString`](#ShowNumberAsString)[`?`](../../API/builtins/nil.md)<a name="tostring"></a>
> Set a custom rule on how a number value should be displayed.
> Useful for showing units like decibel or note values etc.
> If none are set, a default string/number conversion is done, which
> simply shows the number with 3 digits after the decimal point.
> Note: When the callback fails with an error, it will be disabled to avoid
> a flood of error messages.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NumberValueNotifier<a name="NumberValueNotifier"></a>
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction<a name="NumberValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1<a name="NumberValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2<a name="NumberValueNotifierMethod2"></a>
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### ShowNumberAsString<a name="ShowNumberAsString"></a>
(value : [`number`](../../API/builtins/number.md)) `->` [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  
> Set a custom rule on how a number value should be displayed.
> Useful for showing units like decibel or note values etc.
> If none are set, a default string/number conversion is done, which
> simply shows the number with 3 digits after the decimal point.
> Note: When the callback fails with an error, it will be disabled to avoid
> a flood of error messages.  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  

  
# ViewProperties<a name="ViewProperties"></a>  
>  Base for all View constructor tables in the viewbuilder.  

---  
## Properties
### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

  



---  
## Aliases  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  

  
# XYPadProperties<a name="XYPadProperties"></a>  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md)<a name="active"></a>
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md)<a name="midi_mapping"></a>
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md)<a name="id"></a>
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md)<a name="visible"></a>
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### origin : [`ViewOrigin`](#ViewOrigin)[`?`](../../API/builtins/nil.md)<a name="origin"></a>
> The position of a view within its parent view.
> Only the `stack` layouts allows to freely position child views. Other
> layout views will automatically set the origin, but the origin
> then still can be read in for example mouse handlers.

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="width"></a>
> **Deprecated.** Use property `size` instead.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md)<a name="height"></a>
> **Deprecated.** Use property `size` instead.

### size : [`ViewSize`](#ViewSize)[`?`](../../API/builtins/nil.md)<a name="size"></a>
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size, for example 
> `vb:text { size = { width = "80%", height = 20}}`. 
> The percentage values are relative to the view's parent size and will 
> automatically update when the parent view's size changes.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md)<a name="tooltip"></a>
> A ViewTooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### cursor : [`ViewCursorShape`](#ViewCursorShape)[`?`](../../API/builtins/nil.md)<a name="cursor"></a>
> The cursor cursor for this view which apears on mouse hover.
> Using a "none" shape will use use underlying view's cursor or the default cursor.

### bind : [`XYPadObservables`](#XYPadObservables)[`?`](../../API/builtins/nil.md)<a name="bind"></a>
> Bind the view's value to a pair of renoise.Document.ObservableNumber objects.
> Automatically keep both values in sync.
> Will change the Observables' values as soon as the view's value changes,
> and change the view's values as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.
> Just like in the other XYPad properties, a table with the fields X and Y
> is expected here and not a single value. So you have to bind two
> ObservableNumber object to the pad.

### value : [`XYPadValues`](#XYPadValues)[`?`](../../API/builtins/nil.md)<a name="value"></a>
> A table of the XYPad's current values on each axis

### snapback : [`XYPadSnapbackValues`](#XYPadSnapbackValues)[`?`](../../API/builtins/nil.md)<a name="snapback"></a>
> A table of snapback values for each axis
> When snapback is enabled, the pad will revert its values to the specified
> snapback values as soon as the mouse button is released in the pad.
> When disabled, releasing the mouse button will not change the value.
> You can disable snapback at runtime by setting it to nil or an empty table.

### notifier : [`XYValueNotifier`](#XYValueNotifier)[`?`](../../API/builtins/nil.md)<a name="notifier"></a>
> Set up a value notifier function that will be used whenever the pad's values change

### min : [`XYPadMinValues`](#XYPadMinValues)[`?`](../../API/builtins/nil.md)<a name="min"></a>
> A table of allowed minimum values for each axis
> * Default: {x: 0.0, y: 0.0}

### max : [`XYPadMaxValues`](#XYPadMaxValues)[`?`](../../API/builtins/nil.md)<a name="max"></a>
> A table of allowed maximum values for each axis
> * Default: {x: 1.0, y: 1.0}

  



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
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
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
  
### XYPadMaxValues<a name="XYPadMaxValues"></a>
{ x : [`SliderMaxValue`](#SliderMaxValue), y : [`SliderMaxValue`](#SliderMaxValue) }  
> A table of allowed maximum values for each axis
> * Default: {x: 1.0, y: 1.0}  
  
### XYPadMinValues<a name="XYPadMinValues"></a>
{ x : [`SliderMinValue`](#SliderMinValue), y : [`SliderMinValue`](#SliderMinValue) }  
> A table of allowed minimum values for each axis
> * Default: {x: 0.0, y: 0.0}  
  
### XYPadObservables<a name="XYPadObservables"></a>
{ x : [`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md), y : [`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md) }  
> Bind the view's value to a pair of renoise.Document.ObservableNumber objects.
> Automatically keep both values in sync.
> Will change the Observables' values as soon as the view's value changes,
> and change the view's values as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.
> Just like in the other XYPad properties, a table with the fields X and Y
> is expected here and not a single value. So you have to bind two
> ObservableNumber object to the pad.  
  
### XYPadSnapbackValues<a name="XYPadSnapbackValues"></a>
{ x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md) }  
> A table of snapback values for each axis
> When snapback is enabled, the pad will revert its values to the specified
> snapback values as soon as the mouse button is released in the pad.
> When disabled, releasing the mouse button will not change the value.
> You can disable snapback at runtime by setting it to nil or an empty table.  
  
### XYPadValues<a name="XYPadValues"></a>
{ x : [`SliderNumberValue`](#SliderNumberValue), y : [`SliderNumberValue`](#SliderNumberValue) }  
> A table of the XYPad's current values on each axis  
  
### XYValueNotifier<a name="XYValueNotifier"></a>
[`XYValueNotifierFunction`](#XYValueNotifierFunction) | [`XYValueNotifierMethod1`](#XYValueNotifierMethod1) | [`XYValueNotifierMethod2`](#XYValueNotifierMethod2)  
> Set up a value notifier function that will be used whenever the pad's values change  
  
### XYValueNotifierFunction<a name="XYValueNotifierFunction"></a>
(value : [`XYPadValues`](#XYPadValues))  
  
  
### XYValueNotifierMemberFunction<a name="XYValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`XYPadValues`](#XYPadValues))  
  
  
### XYValueNotifierMethod1<a name="XYValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`XYValueNotifierMemberFunction`](#XYValueNotifierMemberFunction) }  
  
  
### XYValueNotifierMethod2<a name="XYValueNotifierMethod2"></a>
{ 1 : [`XYValueNotifierMemberFunction`](#XYValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  

  



---  
## Aliases  
### AlignerChildViews<a name="AlignerChildViews"></a>
[`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]  
> The aligner view's initial child views.
> Views can later on also be added and removed dynamically after construction via 
> `aligner:add_view(child)` and `aligner:remove_view(child)`  
  
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
  
### BitmapColor<a name="BitmapColor"></a>
[`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor)  
> ```lua
> -- When set, the bitmap will be drawn in the specified color and `mode` is set 
> -- to `custom_color`. Set `mode` to something else than `custom_color` or the
> -- `color` to `{0, 0, 0}` to enable a `plain` display mode.
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- The application theme's colors
> BitmapColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  
  
### BitmapImagePath<a name="BitmapImagePath"></a>
[`string`](../../API/builtins/string.md)  
> You can load an image from your tool's directory,
> or use one from Renoise's built-in icons.  
> * For the built-in icons, use "Icons/ArrowRight.bmp"
> * For custom images, use a path relative to your tool's root folder.
> 
> For example "Images/MyBitmap.bmp" will load the image from
> "com.me.MyTool.xrnx/Images/MyBitmap.bmp".  
> If your custom path matches a built-in icon's (like "Icons/ArrowRight.bmp"),
> your image will be loaded instead of the one from Renoise.  
> 
> If you want to support high DPI UI scaling with your bitmaps like the 
> built-in Icons, include high resolution versions with their filenames ending
> with "@4x"  
> The following rules will be used when loading bitmaps  
> * When UI scaling is 100%, only the base bitmaps are used.
> * When UI scaling is 125%, the base bitmaps are used, except if there is a
> ` BitmapName@x1.25.bmp` variant.
> * For all other UI scaling > 125% the "@4x" variants are used and
>   downscaled as needed, except when there is an exact match for the current
>   UI scaling factor (e.g. `BitmapName@1.5x.bmp` for 150%)  
  
### BitmapMode<a name="BitmapMode"></a>
`"body_color"` | `"button_color"` | `"custom_color"` | `"main_color"` | `"plain"` | `"transparent"`  
> ```lua
> -- Setup how the bitmap should be drawn, recolored. Available modes are:
> BitmapMode:
>     | "plain" -- bitmap is drawn as is, no recoloring is done (Default)
>     | "transparent" -- same as plain, but black pixels will be fully transparent
>     | "button_color" -- recolor the bitmap, using the theme's button color
>     | "body_color" -- same as 'button_back' but with body text/back color
>     | "main_color" -- same as 'button_back' but with main text/back colors
>     | "custom_color" -- Recolor the bitmap using a custom color set by the `color'
> ```  
  
### BitmapPath<a name="BitmapPath"></a>
[`BitmapImagePath`](#BitmapImagePath)  
> Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).  
  
### BooleanValueNotifierFunction<a name="BooleanValueNotifierFunction"></a>
(value : [`boolean`](../../API/builtins/boolean.md))  
  
  
### BooleanValueNotifierMemberFunction<a name="BooleanValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`boolean`](../../API/builtins/boolean.md))  
  
  
### BooleanValueNotifierMethod1<a name="BooleanValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`BooleanValueNotifierMemberFunction`](#BooleanValueNotifierMemberFunction) }  
  
  
### BooleanValueNotifierMethod2<a name="BooleanValueNotifierMethod2"></a>
{ 1 : [`BooleanValueNotifierMemberFunction`](#BooleanValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### ButtonAlignment<a name="ButtonAlignment"></a>
`"center"` | `"left"` | `"right"`  
> ```lua
> -- Setup the buttons text's or bitmap's alignment within the button.
> ButtonAlignment:
>     | "left" -- aligned to the left
>     | "right" -- aligned to the right
>     | "center" -- center (default)
> ```  
  
### ButtonBitmapPath<a name="ButtonBitmapPath"></a>
[`BitmapImagePath`](#BitmapImagePath)  
> If set, existing text is removed and the loaded image is displayed instead.
> Supported bitmap file formats are ".bmp", ".png" and ".tiff".
> Colors in bitmaps will be overridden by the button's theme color, using black
> as the transparent color for BMPs and TIFFS, and the alpha channel for PNGs.
> All other colors are mapped to the theme color according to their grey value,
> so plain white is the target theme color, and all other colors blend into the
> button's background color of the theme.  
  
### ButtonColor<a name="ButtonColor"></a>
[`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor)  
> ```lua
> -- When set, the unpressed button's background will be drawn in the specified color.
> -- A text color is automatically selected unless explicitly set, to make sure its
> -- always visible.
> -- Set color {0,0,0} to enable the theme colors for the button again.
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- The application theme's colors
> ButtonColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  
  
### ButtonLabel<a name="ButtonLabel"></a>
[`string`](../../API/builtins/string.md)  
> The text label of the button
> * Default: ""  
  
### ButtonNotifier<a name="ButtonNotifier"></a>
[`NotifierFunction`](#NotifierFunction) | [`NotifierMethod1`](#NotifierMethod1) | [`NotifierMethod2`](#NotifierMethod2)  
> A click notifier  
  
### ButtonStyle<a name="ButtonStyle"></a>
`"normal"` | `"rounded"` | `"rounded_bottom"` | `"rounded_left"` | `"rounded_right"` | `"rounded_top"`  
> ```lua
> -- Get/set the style a button should be displayed with.
> ButtonStyle:
>     | "normal" -- (Default)
>     | "rounded" -- rounded corners on all sides
>     | "rounded_left" -- rounded left side
>     | "rounded_right" -- rounded right side
>     | "rounded_top" -- rounded left side
>     | "rounded_bottom" -- rounded right side
> ```  
  
### CanvasChildViews<a name="CanvasChildViews"></a>
[`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]  
> The canvas view's optional child views.
> Views can later on also be added and removed dynamically after construction via
> `stack:add_view(child)` and `stack:remove_view(child)`  
  
### CanvasMode<a name="CanvasMode"></a>
`"plain"` | `"transparent"`  
> ```lua
> -- How to draw the canvas context to screen: "transparent" draws with alpha from
> -- the canvas, "plain" ignores alpha values, which usually is a lot faster to draw.
> -- Use "plain" to speed up drawing background alike canvas views which cover the
> -- entire view area. Default: "transparent"
> CanvasMode:
>     | "plain"
>     | "transparent"
> ```  
  
### CanvasRenderFunction<a name="CanvasRenderFunction"></a>
(context : [`renoise.Views.Canvas.Context`](../../API/renoise/renoise.Views.Canvas.Context.md))  
> Rendering callback for a canvas.
> 
> To update the canvas, use the canvas view's `update` function.
> This will will schedule a new drawing as soon as the backend is ready to draw.
> Always draw a complete image here, as the canvas will be completely empty in
> each new render call.
> 
> **UI scaling**: the canvas context by default is set up, so that the global UI
> scaling gets applied. So all positions in the canvas context by default use
> **view sizes** and not pixels. If you want to draw in a raw pixel resolution
> reset the canvas transformation via `context.set_transform(1.0, 0.0, 0.0, 1.0, 0.0, 0.0)`
> To query the actual canvas size in pixels, use the context's `size` property.  
  
### CheckBoxBoolean<a name="CheckBoxBoolean"></a>
[`boolean`](../../API/builtins/boolean.md)  
> The current state of the checkbox, expressed as boolean.
> * Default: false  
  
### CheckBoxBooleanNotifier<a name="CheckBoxBooleanNotifier"></a>
[`BooleanValueNotifierFunction`](#BooleanValueNotifierFunction) | [`BooleanValueNotifierMethod1`](#BooleanValueNotifierMethod1) | [`BooleanValueNotifierMethod2`](#BooleanValueNotifierMethod2)  
> A notifier for when the checkbox is toggled  
  
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
  
### IntegerNotifier<a name="IntegerNotifier"></a>
[`IntegerValueNotifierFunction`](#IntegerValueNotifierFunction) | [`IntegerValueNotifierMethod1`](#IntegerValueNotifierMethod1) | [`IntegerValueNotifierMethod2`](#IntegerValueNotifierMethod2)  
> Set up a notifier that will be called whenever a new item is picked  
  
### IntegerValueNotifierFunction<a name="IntegerValueNotifierFunction"></a>
(value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMemberFunction<a name="IntegerValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMethod1<a name="IntegerValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction) }  
  
  
### IntegerValueNotifierMethod2<a name="IntegerValueNotifierMethod2"></a>
{ 1 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### ItemLabels<a name="ItemLabels"></a>
[`string`](../../API/builtins/string.md)[]  
> A list of buttons labels to show in order. Must have more than one item.  
  
### ListElementAdded<a name="ListElementAdded"></a>
{ index : [`integer`](../../API/builtins/integer.md), type : `"insert"` }  
  
  
### ListElementChange<a name="ListElementChange"></a>
[`ListElementAdded`](#ListElementAdded) | [`ListElementRemoved`](#ListElementRemoved) | [`ListElementsSwapped`](#ListElementsSwapped)  
  
  
### ListElementRemoved<a name="ListElementRemoved"></a>
{ index : [`integer`](../../API/builtins/integer.md), type : `"removed"` }  
  
  
### ListElementsSwapped<a name="ListElementsSwapped"></a>
{ index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md), type : `"swapped"` }  
  
  
### ListNotifierFunction<a name="ListNotifierFunction"></a>
(change : [`ListElementChange`](#ListElementChange))  
  
  
### ListNotifierMemberContext<a name="ListNotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### MouseEventButton<a name="MouseEventButton"></a>
`"left"` | `"middle"` | `"right"`  
> ```lua
> -- Mouse button of a `MouseEvent` of type "up"|"down"|"double"|"drag".
> MouseEventButton:
>     | "left"
>     | "right"
>     | "middle"
> ```  
  
### MouseEventType<a name="MouseEventType"></a>
`"double"` | `"down"` | `"drag"` | `"enter"` | `"exit"` | `"move"` | `"up"` | `"wheel"`  
> ```lua
> -- Event type of a `MouseEvent`.
> MouseEventType:
>     | "enter"
>     | "exit"
>     | "move"
>     | "down"
>     | "up"
>     | "double"
>     | "drag"
>     | "wheel"
> ```  
  
### MouseEventTypes<a name="MouseEventTypes"></a>
[`MouseEventType`](#MouseEventType)[]  
> The mouse event types that should be passed to your `mouse_handler` function.
> By default: `{ "down", "up", "double" }`
> Avoid adding event types that you don't use, especially "move" events as they do
> create quite some overhead. Also note that when enabling "drag", sub view controls
> can no longer handle drag events, even when you pass back the event in the handler,
> so only enable it when you want to completely override mouse drag behavior of
> *all* your content views.  
  
### MouseEventWheelDirection<a name="MouseEventWheelDirection"></a>
`"down"` | `"left"` | `"right"` | `"up"`  
> ```lua
> -- Mouse wheel direction in a `MouseEvent` of type "wheel".
> MouseEventWheelDirection:
>     | "up"
>     | "down"
>     | "left"
>     | "right"
> ```  
  
### MouseHandler<a name="MouseHandler"></a>
[`MouseHandlerNotifierFunction`](#MouseHandlerNotifierFunction) | [`MouseHandlerNotifierMethod1`](#MouseHandlerNotifierMethod1) | [`MouseHandlerNotifierMethod2`](#MouseHandlerNotifierMethod2)  
> Optional mouse event handler for a view. return nil when the event got handled
> to stop propagating the event. return the event instance, as passed, to pass it
> to the next view in the view hirarchy.  
  
### MouseHandlerNotifierFunction<a name="MouseHandlerNotifierFunction"></a>
(event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMemberFunction<a name="MouseHandlerNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), event : [`MouseEvent`](#mouseevent)) `->` [`MouseEvent`](#mouseevent)[`?`](../../API/builtins/nil.md)  
  
  
### MouseHandlerNotifierMethod1<a name="MouseHandlerNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction) }  
  
  
### MouseHandlerNotifierMethod2<a name="MouseHandlerNotifierMethod2"></a>
{ 1 : [`MouseHandlerNotifierMemberFunction`](#MouseHandlerNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NotifierMemberFunction<a name="NotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext))  
  
  
### NotifierMethod1<a name="NotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NotifierMemberFunction`](#NotifierMemberFunction) }  
  
  
### NotifierMethod2<a name="NotifierMethod2"></a>
{ 1 : [`NotifierMemberFunction`](#NotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### NumberValueNotifier<a name="NumberValueNotifier"></a>
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction<a name="NumberValueNotifierFunction"></a>
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction<a name="NumberValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1<a name="NumberValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2<a name="NumberValueNotifierMethod2"></a>
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### PairedParseStringAsNumber<a name="PairedParseStringAsNumber"></a>
(value : [`string`](../../API/builtins/string.md)) `->` [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)  
> Make sure to also set `tostring` if you set this.  
  
### PairedShowNumberAsString<a name="PairedShowNumberAsString"></a>
[`ShowNumberAsString`](#ShowNumberAsString)  
> Make sure to also set `tonumber` if you set this.  
  
### PopupItemLabels<a name="PopupItemLabels"></a>
[`string`](../../API/builtins/string.md)[]  
> A list of buttons labels to show in order
> The list can be empty, then "None" is displayed and the value won't change.  
  
### RGBAColor<a name="RGBAColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md), 4 : [`integer`](../../API/builtins/integer.md) }  
> A table of 4 bytes (ranging from 0 to 255)
> representing the red, green, blue, alpha channels of a color.
> {0xFF, 0xFF, 0xFF, 0xFF} is white
> {165, 73, 35, 0x80} is the red from the Renoise logo, half opaque.  
  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  
### RackChildViews<a name="RackChildViews"></a>
[`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]  
> The rack view's initial child views.
> Views can later on also be added and removed dynamically after construction via
> `rack:add_view(child)` and `rack:remove_view(child)`  
  
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
  
### ScrollbarAutoHide<a name="ScrollbarAutoHide"></a>
[`boolean`](../../API/builtins/boolean.md)  
> Default: false. When true, view gets automatically hidden when no scrolling is needed  
  
### ScrollbarMax<a name="ScrollbarMax"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 100. Maximum offset value.  
  
### ScrollbarMin<a name="ScrollbarMin"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 0. Minimum offset value.  
  
### ScrollbarPagestep<a name="ScrollbarPagestep"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 100. Size of the currently visible area.  
  
### ScrollbarStep<a name="ScrollbarStep"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 1. Amount the mouse-wheel or additional +/- buttons in the scroll bar
> move the scrollable area.  
  
### ScrollbarValue<a name="ScrollbarValue"></a>
[`integer`](../../API/builtins/integer.md)  
> Default 0. Offset value in range `min to max - pagestep`.  
  
### SelectedItem<a name="SelectedItem"></a>
[`integer`](../../API/builtins/integer.md)  
> The currently selected item's index  
  
### ShowNumberAsString<a name="ShowNumberAsString"></a>
(value : [`number`](../../API/builtins/number.md)) `->` [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  
> Set a custom rule on how a number value should be displayed.
> Useful for showing units like decibel or note values etc.
> If none are set, a default string/number conversion is done, which
> simply shows the number with 3 digits after the decimal point.
> Note: When the callback fails with an error, it will be disabled to avoid
> a flood of error messages.  
  
### SliderDefaultValue<a name="SliderDefaultValue"></a>
[`number`](../../API/builtins/number.md)  
> The default value that will be re-applied on double-click  
  
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
  
### SliderPolarity<a name="SliderPolarity"></a>
`"bipolar"` | `"unipolar"`  
> ```lua
> -- Value polarity of the control. Bipolar controls show the value from the
> -- center to left and right or up and down and typically controls a range
> -- around zero, e.g. -1 to 1. Unipolar controls show the value from left to
> -- right or bottom to top.
> -- * Default: "unipolar" 
> SliderPolarity:
>     | "unipolar"
>     | "bipolar"
> ```  
  
### SliderStepAmounts<a name="SliderStepAmounts"></a>
{ 1 : [`number`](../../API/builtins/number.md), 2 : [`number`](../../API/builtins/number.md) }  
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)  
  
### StackAutoSize<a name="StackAutoSize"></a>
[`boolean`](../../API/builtins/boolean.md)  
> When set to true, the width and height of the stack will be automatically
> calculated and updated from the stack's child views, to ensure all views fit
> into the stack.
> When disabled, the width and height must be set manually.
> * Default: true  
  
### StackChildViews<a name="StackChildViews"></a>
[`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)[]  
> The stack view's optional child views.
> Views can later on also be added and removed dynamically after construction via
> `stack:add_view(child)` and `stack:remove_view(child)`  
  
### StringChangeNotifier<a name="StringChangeNotifier"></a>
[`StringValueNotifierFunction`](#StringValueNotifierFunction) | [`StringValueNotifierMethod1`](#StringValueNotifierMethod1) | [`StringValueNotifierMethod2`](#StringValueNotifierMethod2)  
> Set up a notifier for text changes  
  
### StringValueNotifierFunction<a name="StringValueNotifierFunction"></a>
(value : [`string`](../../API/builtins/string.md))  
  
  
### StringValueNotifierMemberFunction<a name="StringValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`string`](../../API/builtins/string.md))  
  
  
### StringValueNotifierMethod1<a name="StringValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`StringValueNotifierMemberFunction`](#StringValueNotifierMemberFunction) }  
  
  
### StringValueNotifierMethod2<a name="StringValueNotifierMethod2"></a>
{ 1 : [`StringValueNotifierMemberFunction`](#StringValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
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
  
### TextBackgroundStyle<a name="TextBackgroundStyle"></a>
`"body"` | `"border"` | `"strong"`  
> ```lua
> -- Setup the text view's background:
> TextBackgroundStyle:
>     | "body" -- simple text color with no background
>     | "strong" -- stronger text color with no background
>     | "border" -- text on a bordered background
> ```  
  
### TextColor<a name="TextColor"></a>
[`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor)  
> ```lua
> -- When set, the text will be drawn in the specified color.
> -- Set style to something else than "custom" or color to `{0, 0, 0}`
> -- to enable the default theme color for the text again.
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- The application theme's colors
> TextColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
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
  
### TextMultilineString<a name="TextMultilineString"></a>
[`string`](../../API/builtins/string.md)  
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.  
  
### TextOrientation<a name="TextOrientation"></a>
`"horizontal"` | `"horizontal-rl"` | `"vertical"` | `"vertical-tb"`  
> ```lua
> -- Setup the texts's orientation (writing direction).
> TextOrientation:
>     | "horizontal" -- Draw from left to right (Default)
>     | "horizontal-rl" -- Draw from right to left
>     | "vertical" -- Draw from bottom to top
>     | "vertical-tb" -- Draw from top to bottom
> ```  
  
### TextParagraphs<a name="TextParagraphs"></a>
[`string`](../../API/builtins/string.md)[]  
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []  
  
### TextSingleLineString<a name="TextSingleLineString"></a>
[`string`](../../API/builtins/string.md)  
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""  
  
### TextStyle<a name="TextStyle"></a>
`"custom"` | `"disabled"` | `"normal"` | `"strong"`  
> ```lua
> -- Get/set the color style the text should be displayed with.
> TextStyle:
>     | "normal" -- (Default)
>     | "strong" -- highlighted color
>     | "disabled" -- greyed out color
>     | "custom" -- custom color
> ```  
  
### TextValue<a name="TextValue"></a>
[`string`](../../API/builtins/string.md)  
> The currently shown text. The text will not be updated when editing,
> rather only after editing is complete (return is pressed, or focus is lost).
> * Default: ""  
  
### TextValueAlias<a name="TextValueAlias"></a>
[`string`](../../API/builtins/string.md)  
> Exactly the same as "value"; provided for consistency.
> * Default: ""  
  
### ThemeColor<a name="ThemeColor"></a>
`"alternate_main_back"` | `"alternate_main_font"` | `"automation_grid"` | `"automation_line_edge"` | `"automation_line_fill"` | `"automation_marker_diamond"` | `"automation_marker_pair"` | `"automation_marker_play"` | `"automation_marker_single"` | `"automation_point"` | `"body_back"` | `"body_font"` | `"button_back"` | `"button_font"` | `"button_highlight_font"` | `"default_color_01"` | `"default_color_02"` | `"default_color_03"` | `"default_color_04"` | `"default_color_05"` | `"default_color_06"` | `"default_color_07"` | `"default_color_08"` | `"default_color_09"` | `"default_color_10"` | `"default_color_11"` | `"default_color_12"` | `"default_color_13"` | `"default_color_14"` | `"default_color_15"` | `"default_color_16"` | `"folder"` | `"main_back"` | `"main_font"` | `"midi_mapping_back"` | `"midi_mapping_font"` | `"pattern_centerbar_back"` | `"pattern_centerbar_back_standby"` | `"pattern_centerbar_font"` | `"pattern_centerbar_font_standby"` | `"pattern_default_back"` | `"pattern_default_font"` | `"pattern_default_font_delay"` | `"pattern_default_font_dspfx"` | `"pattern_default_font_global"` | `"pattern_default_font_other"` | `"pattern_default_font_panning"` | `"pattern_default_font_pitch"` | `"pattern_default_font_unused"` | `"pattern_default_font_volume"` | `"pattern_highlighted_back"` | `"pattern_highlighted_font"` | `"pattern_highlighted_font_delay"` | `"pattern_highlighted_font_dspfx"` | `"pattern_highlighted_font_global"` | `"pattern_highlighted_font_other"` | `"pattern_highlighted_font_panning"` | `"pattern_highlighted_font_pitch"` | `"pattern_highlighted_font_unused"` | `"pattern_highlighted_font_volume"` | `"pattern_mute_state"` | `"pattern_playposition_back"` | `"pattern_playposition_font"` | `"pattern_selection"` | `"pattern_standby_selection"` | `"scrollbar"` | `"selected_button_back"` | `"selected_button_font"` | `"selection_back"` | `"selection_font"` | `"slider"` | `"standby_selection_back"` | `"standby_selection_font"` | `"strong_body_font"` | `"tooltip_back"` | `"tooltip_font"` | `"valuebox_back"` | `"valuebox_font"` | `"valuebox_font_icons"` | `"vumeter_back_clipped"` | `"vumeter_back_normal"` | `"vumeter_meter"` | `"vumeter_meter_high"` | `"vumeter_meter_low"` | `"vumeter_meter_middle"` | `"vumeter_peak"`  
> ```lua
> -- The application theme's colors
> ThemeColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  
  
### ValueBoxMaxValue<a name="ValueBoxMaxValue"></a>
[`number`](../../API/builtins/number.md)  
> The maximum value that can be set using the view
> * Default: 100  
  
### ValueBoxMinValue<a name="ValueBoxMinValue"></a>
[`number`](../../API/builtins/number.md)  
> The minimum value that can be set using the view
> * Default: 0  
  
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
  
### ViewBooleanObservable<a name="ViewBooleanObservable"></a>
[`renoise.Document.ObservableBoolean`](../../API/renoise/renoise.Document.ObservableBoolean.md)  
> Bind the view's value to a renoise.Document.ObservableBoolean object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  
### ViewId<a name="ViewId"></a>
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable<a name="ViewNumberObservable"></a>
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  
### ViewStringListObservable<a name="ViewStringListObservable"></a>
[`renoise.Document.ObservableStringList`](../../API/renoise/renoise.Document.ObservableStringList.md)  
> Bind the view's value to a renoise.Document.ObservableStringList object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
### ViewStringObservable<a name="ViewStringObservable"></a>
[`renoise.Document.ObservableString`](../../API/renoise/renoise.Document.ObservableString.md)  
> Bind the view's value to a renoise.Document.ObservableString object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  
### XYPadMaxValues<a name="XYPadMaxValues"></a>
{ x : [`SliderMaxValue`](#SliderMaxValue), y : [`SliderMaxValue`](#SliderMaxValue) }  
> A table of allowed maximum values for each axis
> * Default: {x: 1.0, y: 1.0}  
  
### XYPadMinValues<a name="XYPadMinValues"></a>
{ x : [`SliderMinValue`](#SliderMinValue), y : [`SliderMinValue`](#SliderMinValue) }  
> A table of allowed minimum values for each axis
> * Default: {x: 0.0, y: 0.0}  
  
### XYPadObservables<a name="XYPadObservables"></a>
{ x : [`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md), y : [`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md) }  
> Bind the view's value to a pair of renoise.Document.ObservableNumber objects.
> Automatically keep both values in sync.
> Will change the Observables' values as soon as the view's value changes,
> and change the view's values as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.
> Just like in the other XYPad properties, a table with the fields X and Y
> is expected here and not a single value. So you have to bind two
> ObservableNumber object to the pad.  
  
### XYPadSnapbackValues<a name="XYPadSnapbackValues"></a>
{ x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md) }  
> A table of snapback values for each axis
> When snapback is enabled, the pad will revert its values to the specified
> snapback values as soon as the mouse button is released in the pad.
> When disabled, releasing the mouse button will not change the value.
> You can disable snapback at runtime by setting it to nil or an empty table.  
  
### XYPadValues<a name="XYPadValues"></a>
{ x : [`SliderNumberValue`](#SliderNumberValue), y : [`SliderNumberValue`](#SliderNumberValue) }  
> A table of the XYPad's current values on each axis  
  
### XYValueNotifier<a name="XYValueNotifier"></a>
[`XYValueNotifierFunction`](#XYValueNotifierFunction) | [`XYValueNotifierMethod1`](#XYValueNotifierMethod1) | [`XYValueNotifierMethod2`](#XYValueNotifierMethod2)  
> Set up a value notifier function that will be used whenever the pad's values change  
  
### XYValueNotifierFunction<a name="XYValueNotifierFunction"></a>
(value : [`XYPadValues`](#XYPadValues))  
  
  
### XYValueNotifierMemberFunction<a name="XYValueNotifierMemberFunction"></a>
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`XYPadValues`](#XYPadValues))  
  
  
### XYValueNotifierMethod1<a name="XYValueNotifierMethod1"></a>
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`XYValueNotifierMemberFunction`](#XYValueNotifierMemberFunction) }  
  
  
### XYValueNotifierMethod2<a name="XYValueNotifierMethod2"></a>
{ 1 : [`XYValueNotifierMemberFunction`](#XYValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  

