# renoise.Views.ValueField  
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
### active : [`ControlActive`](#ControlActive) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### min : [`SliderMinValue`](#SliderMinValue) {#min}
> The minimum value that can be set using the view
> * Default: 0

### max : [`SliderMaxValue`](#SliderMaxValue) {#max}
> The maximum value that can be set using the view
> * Default: 1.0

### value : [`SliderNumberValue`](#SliderNumberValue) {#value}
> The current value of the view

### align : [`TextAlignment`](#TextAlignment) {#align}
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

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
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction)) {#add_notifier}
> Add value change notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction)) {#remove_notifier}
> Remove value change notifier
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#add_child}
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)) {#remove_child}
> Remove a child view from this view.  



---  
## Local Aliases  
### ControlActive {#ControlActive}
[`boolean`](../../API/builtins/boolean.md)  
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.  
  
### ControlMidiMappingString {#ControlMidiMappingString}
[`string`](../../API/builtins/string.md)  
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.  
  
### NumberValueNotifierFunction {#NumberValueNotifierFunction}
(value : [`number`](../../API/builtins/number.md))  
  
  
### SliderMaxValue {#SliderMaxValue}
[`number`](../../API/builtins/number.md)  
> The maximum value that can be set using the view
> * Default: 1.0  
  
### SliderMinValue {#SliderMinValue}
[`number`](../../API/builtins/number.md)  
> The minimum value that can be set using the view
> * Default: 0  
  
### SliderNumberValue {#SliderNumberValue}
[`number`](../../API/builtins/number.md)  
> The current value of the view  
  
### TextAlignment {#TextAlignment}
`"center"` | `"left"` | `"right"`  
> ```lua
> -- Setup the text's alignment. Applies only when the view's size is larger than
> -- the needed size to draw the text
> TextAlignment:
>     | "left" -- (Default)
>     | "right" -- aligned to the right
>     | "center" -- center text
> ```  
  
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
  

