# renoise.Views.Bitmap<a name="renoise.Views.Bitmap"></a>  
> Draws a bitmap, or a draws a bitmap which acts like a button (as soon as a
> notifier is specified). The notifier is called when clicking the mouse
> somewhere on the bitmap. When using a re-colorable style (see 'mode'), the
> bitmap is automatically recolored to match the current theme's colors. Mouse
> hover is also enabled when notifiers are present, to show that the bitmap can
> be clicked.
> ```text
>         *
>        ***
>     +   *
>    / \
>   +---+
>   | O |  o
>   +---+  |
>  ||||||||||||
> ```  

<!-- toc -->
  

---  
## Properties
### mode : [`BitmapMode`](#BitmapMode)<a name="mode"></a>
> Setup how the bitmap should be drawn, recolored. Available modes are:

### bitmap : [`BitmapPath`](#BitmapPath)<a name="bitmap"></a>
> Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).

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
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction))<a name="add_notifier"></a>
> Add mouse click notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction))<a name="remove_notifier"></a>
> Remove mouse click notifier
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> Remove a child view from this view.  



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
> If you want to support high DPI UI scaling with your bitmaps like the built-in Icons,
> include high resolution versions with their filenames ending with "@4x"  
> The following rules will be used when loading bitmaps  
> * When UI scaling is 100%, only the base bitmaps are used.
> * When UI scaling is 125%, the base bitmaps are used, except if there is a `BitmapName@x1.25.bmp` variant.
> * For all other UI scaling > 125% the "@4x" variants are used and downscaled as needed,
> except when there is an exact match for the current UI scaling factor (e.g. `BitmapName@1.5x.bmp` for 150%)  
  
### BitmapMode<a name="BitmapMode"></a>
`"body_color"` | `"button_color"` | `"main_color"` | `"plain"` | `"transparent"`  
> ```lua
> -- Setup how the bitmap should be drawn, recolored. Available modes are:
> BitmapMode:
>     | "plain" -- bitmap is drawn as is, no recoloring is done (Default)
>     | "transparent" -- same as plain, but black pixels will be fully transparent
>     | "button_color" -- recolor the bitmap, using the theme's button color
>     | "body_color" -- same as 'button_back' but with body text/back color
>     | "main_color" -- same as 'button_back' but with main text/back colors
> ```  
  
### BitmapPath<a name="BitmapPath"></a>
[`BitmapImagePath`](#BitmapImagePath)  
> Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).  
  
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
  

