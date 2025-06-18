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

### color : [`BitmapColor`](#BitmapColor)<a name="color"></a>
> When set, the bitmap will be drawn in the specified color and `mode` is set 
> to `custom_color`. Set `mode` to something else than `custom_color` or the
> `color` to `{0, 0, 0}` to enable a `plain` display mode.

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
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction))<a name="add_notifier"></a>
> Add mouse click notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction))<a name="remove_notifier"></a>
> Remove mouse click notifier
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
  

