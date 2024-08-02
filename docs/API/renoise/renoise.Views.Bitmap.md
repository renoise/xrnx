# renoise.Views.Bitmap  
Draws a bitmap, or a draws a bitmap which acts like a button (as soon as a
notifier is specified). The notifier is called when clicking the mouse
somewhere on the bitmap. When using a re-colorable style (see 'mode'), the
bitmap is automatically recolored to match the current theme's colors. Mouse
hover is also enabled when notifiers are present, to show that the bitmap can
be clicked.
```text
        *
       ***
    +   *
   / \
  +---+
  | O |  o
  +---+  |
 ||||||||||||
```  

---  
## Properties
### active : [`ControlActive`](#ControlActive) {#active}
Instead of making a control invisible, you can also make it inactive.
Deactivated controls will still be shown, and will still show their
currently assigned values, but will not allow changes. Most controls will
display as "grayed out" to visualize the deactivated state.

### bitmap : [`BitmapPath`](#BitmapPath) {#bitmap}
Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).

### height : [`ViewDimension`](#ViewDimension) {#height}
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString) {#midi_mapping}
When set, the control will be highlighted when Renoise's MIDI mapping dialog
is open. When clicked, it selects the specified string as a MIDI mapping
target action. This target acton can either be one of the globally available
mappings in Renoise, or those that were created by the tool itself.
Target strings are not verified. When they point to nothing, the mapped MIDI
message will do nothing and no error is fired.

### mode : [`BitmapMode`](#BitmapMode) {#mode}
Setup how the bitmap should be drawn, recolored. Available modes are:

### tooltip : [`ViewTooltip`](#ViewTooltip) {#tooltip}
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)

### views : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)`[]` {#views}
**READ-ONLY** Empty for all controls, for layout views this contains the
layout child views in the order they got added

### visible : [`ViewVisibility`](#ViewVisibility) {#visible}
Set visible to false to hide a view (make it invisible without removing
it). Please note that view.visible will also return false when any of its
parents are invisible (when its implicitly invisible).
* Default: true

### width : [`ViewDimension`](#ViewDimension) {#width}
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.

  

---  
## Functions
### `add_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#add_child}
Add a new child view to this view.
### `add_notifier`([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction)) {#add_notifier}
Add mouse click notifier
### `remove_child`([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
Remove a child view from this view.
### `remove_notifier`([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction)) {#remove_notifier}
Remove mouse click notifier  



---  
## Aliases  
# alias BitmapImagePath {#BitmapImagePath}
[`string`](../../API/builtins/string.md)  
You can load an image from your tool's directory,
or use one from Renoise's built-in icons.  
* For the built-in icons, use "Icons/ArrowRight.bmp"
* For custom images, use a path relative to your tool's root folder.

For example "Images/MyBitmap.bmp" will load the image from
"com.me.MyTool.xrnx/Images/MyBitmap.bmp".  
If your custom path matches a built-in icon's (like "Icons/ArrowRight.bmp"),
your image will be loaded instead of the one from Renoise.  

If you want to support high DPI UI scaling with your bitmaps like the built-in Icons,
include high resolution versions with their filenames ending with "@4x"  
The following rules will be used when loading bitmaps  
* When UI scaling is 100%, only the base bitmaps are used.
* When UI scaling is 125%, the base bitmaps are used, except if there is a `BitmapName@x1.25.bmp` variant.
* For all other UI scaling > 125% the "@4x" variants are used and downscaled as needed,
except when there is an exact match for the current UI scaling factor (e.g. `BitmapName@1.5x.bmp` for 150%)  
  
# alias BitmapMode {#BitmapMode}
`"body_color"` | `"button_color"` | `"main_color"` | `"plain"` | `"transparent"`  
```lua
-- Setup how the bitmap should be drawn, recolored. Available modes are:
BitmapMode:
    | "plain" -- bitmap is drawn as is, no recoloring is done (Default)
    | "transparent" -- same as plain, but black pixels will be fully transparent
    | "button_color" -- recolor the bitmap, using the theme's button color
    | "body_color" -- same as 'button_back' but with body text/back color
    | "main_color" -- same as 'button_back' but with main text/back colors
```  
  
# alias BitmapPath {#BitmapPath}
[`BitmapImagePath`](#BitmapImagePath)  
Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).  
  
# alias ControlActive {#ControlActive}
[`boolean`](../../API/builtins/boolean.md)  
Instead of making a control invisible, you can also make it inactive.
Deactivated controls will still be shown, and will still show their
currently assigned values, but will not allow changes. Most controls will
display as "grayed out" to visualize the deactivated state.  
  
# alias ControlMidiMappingString {#ControlMidiMappingString}
[`string`](../../API/builtins/string.md)  
When set, the control will be highlighted when Renoise's MIDI mapping dialog
is open. When clicked, it selects the specified string as a MIDI mapping
target action. This target acton can either be one of the globally available
mappings in Renoise, or those that were created by the tool itself.
Target strings are not verified. When they point to nothing, the mapped MIDI
message will do nothing and no error is fired.  
  
# alias NotifierFunction {#NotifierFunction}
fun()  
  
  
# alias ViewDimension {#ViewDimension}
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
The dimensions of a view has to be larger than 0.
For nested views you can also specify relative size
for example `vb:text { width = "80%"}`. The percentage values are
relative to the view's parent size and will automatically update on size changes.  
  
# alias ViewTooltip {#ViewTooltip}
[`string`](../../API/builtins/string.md)  
A tooltip text that should be shown for this view on mouse hover.
* Default: "" (no tip will be shown)  
  
# alias ViewVisibility {#ViewVisibility}
[`boolean`](../../API/builtins/boolean.md)  
Set visible to false to hide a view (make it invisible without removing
it). Please note that view.visible will also return false when any of its
parents are invisible (when its implicitly invisible).
* Default: true  
  

