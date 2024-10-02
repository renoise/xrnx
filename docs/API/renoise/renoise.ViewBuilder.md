# renoise.ViewBuilder  
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
>  ### example:
> ```lua
> vb:column {
>   margin = 1,
>   vb:text {
>     text = "Text1"
>   },
>   vb:text {
>     text = "Text1"
>   }
> }
> ```
> Creates a column view with `margin = 1` and adds two text views to the column.
> 
> Table of views, which got registered via the "id" property
> View id is the table key, the table's value is the view's object.
> 
> ### example
> ```lua
> vb:text { id="my_view", text="some_text"}
> vb.views.my_view.visible = false
> --or
> vb.views["my_view"].visible = false
> ```  

<!-- toc -->
  
## Constants

### DEFAULT_CONTROL_HEIGHT : [`integer`](../../API/builtins/integer.md) {#DEFAULT_CONTROL_HEIGHT}
> The default height for control views

### DEFAULT_CONTROL_MARGIN : [`integer`](../../API/builtins/integer.md) {#DEFAULT_CONTROL_MARGIN}
> The default margin for all control views

### DEFAULT_CONTROL_SPACING : [`integer`](../../API/builtins/integer.md) {#DEFAULT_CONTROL_SPACING}
> The default spacing for all control views

### DEFAULT_DIALOG_BUTTON_HEIGHT : [`integer`](../../API/builtins/integer.md) {#DEFAULT_DIALOG_BUTTON_HEIGHT}
> The default height for buttons

### DEFAULT_DIALOG_MARGIN : [`integer`](../../API/builtins/integer.md) {#DEFAULT_DIALOG_MARGIN}
> The default margin for dialogs

### DEFAULT_DIALOG_SPACING : [`integer`](../../API/builtins/integer.md) {#DEFAULT_DIALOG_SPACING}
> The default spacing for dialogs

### DEFAULT_MINI_CONTROL_HEIGHT : [`integer`](../../API/builtins/integer.md) {#DEFAULT_MINI_CONTROL_HEIGHT}
> The default height for mini-sliders
  

---  
## Properties
### views : table<[`string`](../../API/builtins/string.md), [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md)> {#views}
  

---  
## Functions
### bitmap([*self*](../../API/builtins/self.md), properties : [`BitmapViewProperties`](#bitmapviewproperties)[`?`](../../API/builtins/nil.md)) {#bitmap}
`->`[`renoise.Views.Bitmap`](../../API/renoise/renoise.Views.Bitmap.md)  

> See: [renoise.Views.Bitmap](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/bitmap.lua#63#10)
### button([*self*](../../API/builtins/self.md), properties : [`ButtonProperties`](#buttonproperties)[`?`](../../API/builtins/nil.md)) {#button}
`->`[`renoise.Views.Button`](../../API/renoise/renoise.Views.Button.md)  

> See: [renoise.Views.Button](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/button.lua#40#10)
### checkbox([*self*](../../API/builtins/self.md), properties : [`CheckBoxProperties`](#checkboxproperties)[`?`](../../API/builtins/nil.md)) {#checkbox}
`->`[`renoise.Views.CheckBox`](../../API/renoise/renoise.Views.CheckBox.md)  

> See: [renoise.Views.CheckBox](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/checkbox.lua#28#10)
### chooser([*self*](../../API/builtins/self.md), properties : [`ChooserProperties`](#chooserproperties)[`?`](../../API/builtins/nil.md)) {#chooser}
`->`[`renoise.Views.Chooser`](../../API/renoise/renoise.Views.Chooser.md)  

> See: [renoise.Views.Chooser](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/chooser.lua#19#10)
### column([*self*](../../API/builtins/self.md), properties : [`RackViewProperties`](#rackviewproperties)) {#column}
> You can add nested child views when constructing a column or row
> by including them in the constructor table in the views property.
> 
> ### example:
> ```lua
> vb:column {
>   margin = 1,
>   vb:text {
>     text = "Text1"
>   },
>   vb:text {
>     text = "Text2"
>   }
> }
> ```
### horizontal_aligner([*self*](../../API/builtins/self.md), properties : [`AlignerViewProperties`](#alignerviewproperties)) {#horizontal_aligner}
> You can add nested child views when constructing aligners by including them
> in the constructor table.
> 
> ### example:
> ```lua
> vb:horizontal_aligner {
>    mode = "center",
>    vb:text {
>      text = "Text1"
>    },
>    vb:text {
>      text = "Text2"
>    }
> }
> ```
### minislider([*self*](../../API/builtins/self.md), properties : [`MiniSliderProperties`](#minisliderproperties)[`?`](../../API/builtins/nil.md)) {#minislider}
`->`[`renoise.Views.MiniSlider`](../../API/renoise/renoise.Views.MiniSlider.md)  

> See: [renoise.Views.MiniSlider](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/minislider.lua#18#10)
### multiline_text([*self*](../../API/builtins/self.md), properties : [`MultilineTextViewProperties`](#multilinetextviewproperties)[`?`](../../API/builtins/nil.md)) {#multiline_text}
`->`[`renoise.Views.MultiLineText`](../../API/renoise/renoise.Views.MultiLineText.md)  

> See: [renoise.Views.MultiLineText](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/multiline_text.lua#44#10)
### multiline_textfield([*self*](../../API/builtins/self.md), properties : [`MultilineTextFieldProperties`](#multilinetextfieldproperties)[`?`](../../API/builtins/nil.md)) {#multiline_textfield}
`->`[`renoise.Views.MultiLineTextField`](../../API/renoise/renoise.Views.MultiLineTextField.md)  

> See: [renoise.Views.MultiLineTextField](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/multiline_textfield.lua#22#10)
### popup([*self*](../../API/builtins/self.md), properties : [`PopUpMenuProperties`](#popupmenuproperties)[`?`](../../API/builtins/nil.md)) {#popup}
`->`[`renoise.Views.Popup`](../../API/renoise/renoise.Views.Popup.md)  

> See: [renoise.Views.Popup](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/popup.lua#25#10)
### rotary([*self*](../../API/builtins/self.md), properties : [`RotaryEncoderProperties`](#rotaryencoderproperties)[`?`](../../API/builtins/nil.md)) {#rotary}
`->`[`renoise.Views.RotaryEncoder`](../../API/renoise/renoise.Views.RotaryEncoder.md)  

> See: [renoise.Views.RotaryEncoder](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/rotary.lua#23#10)
### row([*self*](../../API/builtins/self.md), properties : [`RackViewProperties`](#rackviewproperties)) {#row}
> You can add nested child views when constructing a column or row
> by including them in the constructor table in the views property.
> 
> ### example:
> ```lua
> vb:column {
>   margin = 1,
>   vb:text {
>     text = "Text1"
>   },
>   vb:text {
>     text = "Text2"
>   }
> }
> ```
### slider([*self*](../../API/builtins/self.md), properties : [`SliderProperties`](#sliderproperties)[`?`](../../API/builtins/nil.md)) {#slider}
`->`[`renoise.Views.Slider`](../../API/renoise/renoise.Views.Slider.md)  

> See: [renoise.Views.Slider](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/slider.lua#42#10)
### space([*self*](../../API/builtins/self.md), properties : [`ViewProperties`](#viewproperties)) {#space}
> You can create an empty space in layouts with a space.
> 
> ### example:
> ```lua
> --Empty space in layouts
> vb:row {
>   vb:button {
>     text = "Some Button"
>   },
>   vb:space { -- extra spacing between buttons
>     width = 8
>   },
>   vb:button {
>     text = "Another Button"
>   },
> }
> ```
### switch([*self*](../../API/builtins/self.md), properties : [`ButtonSwitchProperties`](#buttonswitchproperties)[`?`](../../API/builtins/nil.md)) {#switch}
`->`[`renoise.Views.Switch`](../../API/renoise/renoise.Views.Switch.md)  

> See: [renoise.Views.Switch](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/switch.lua#30#10)
### text([*self*](../../API/builtins/self.md), properties : [`TextViewProperties`](#textviewproperties)[`?`](../../API/builtins/nil.md)) {#text}
`->`[`renoise.Views.Text`](../../API/renoise/renoise.Views.Text.md)  

> See: [renoise.Views.Text](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/text.lua#48#10)
### textfield([*self*](../../API/builtins/self.md), properties : [`TextFieldProperties`](#textfieldproperties)[`?`](../../API/builtins/nil.md)) {#textfield}
`->`[`renoise.Views.TextField`](../../API/renoise/renoise.Views.TextField.md)  

> See: [renoise.Views.TextField](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/textfield.lua#41#10)
### value([*self*](../../API/builtins/self.md), properties : [`ValueViewProperties`](#valueviewproperties)[`?`](../../API/builtins/nil.md)) {#value}
`->`[`renoise.Views.Value`](../../API/renoise/renoise.Views.Value.md)  

> See: [renoise.Views.Value](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/value.lua#20#10)
### valuebox([*self*](../../API/builtins/self.md), properties : [`ValueBoxProperties`](#valueboxproperties)[`?`](../../API/builtins/nil.md)) {#valuebox}
`->`[`renoise.Views.ValueBox`](../../API/renoise/renoise.Views.ValueBox.md)  

> See: [renoise.Views.ValueBox](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/valuebox.lua#51#10)
### valuefield([*self*](../../API/builtins/self.md), properties : [`ValueFieldProperties`](#valuefieldproperties)[`?`](../../API/builtins/nil.md)) {#valuefield}
`->`[`renoise.Views.ValueField`](../../API/renoise/renoise.Views.ValueField.md)  

> See: [renoise.Views.ValueField](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/valuefield.lua#20#10)
### vertical_aligner([*self*](../../API/builtins/self.md), properties : [`AlignerViewProperties`](#alignerviewproperties)) {#vertical_aligner}
> You can add nested child views when constructing aligners by including them
> in the constructor table.
> 
> ### example:
> ```lua
> vb:horizontal_aligner {
>    mode = "center",
>    vb:text {
>      text = "Text1"
>    },
>    vb:text {
>      text = "Text2"
>    }
> }
> ```
### xypad([*self*](../../API/builtins/self.md), properties : [`XYPadProperties`](#xypadproperties)[`?`](../../API/builtins/nil.md)) {#xypad}
`->`[`renoise.Views.XYPad`](../../API/renoise/renoise.Views.XYPad.md)  

> See: [renoise.Views.XYPad](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/views/xypad.lua#64#10)  



---  
## Local Structs  
# AlignerViewProperties  

<!-- toc -->
  

---  
## Properties
### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### margin : [`RackMargin`](#RackMargin)[`?`](../../API/builtins/nil.md) {#margin}
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)

### mode : [`AlignerMode`](#AlignerMode)[`?`](../../API/builtins/nil.md) {#mode}
> * Default: "left" (for horizontal_aligner) "top" (for vertical_aligner)

### spacing : [`RackSpacing`](#RackSpacing)[`?`](../../API/builtins/nil.md) {#spacing}
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# BitmapViewProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bitmap : [`BitmapPath`](#BitmapPath)[`?`](../../API/builtins/nil.md) {#bitmap}
> Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### mode : [`BitmapMode`](#BitmapMode)[`?`](../../API/builtins/nil.md) {#mode}
> Setup how the bitmap should be drawn, recolored. Available modes are:

### notifier : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> A click notifier

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# ButtonProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bitmap : [`ButtonBitmapPath`](#ButtonBitmapPath)[`?`](../../API/builtins/nil.md) {#bitmap}
> If set, existing text is removed and the loaded image is displayed instead.
> Supported bitmap file formats are ".bmp", ".png" and ".tiff".
> Colors in bitmaps will be overridden by the button's theme color, using black
> as the transparent color for BMPs and TIFFS, and the alpha channel for PNGs.
> All other colors are mapped to the theme color according to their grey value,
> so plain white is the target theme color, and all other colors blend into the
> button's background color of the theme.

### color : [`ButtonColor`](#ButtonColor)[`?`](../../API/builtins/nil.md) {#color}
> When set, the unpressed button's background will be drawn in the specified color.
> A text color is automatically selected unless explicitly set, to make sure it's
> always visible.
> Set color {0,0,0} to enable the theme colors for the button again.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### notifier : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> A click notifier

### pressed : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md) {#pressed}
> A click notifier

### released : [`ButtonNotifier`](#ButtonNotifier)[`?`](../../API/builtins/nil.md) {#released}
> A click notifier

### text : [`ButtonLabel`](#ButtonLabel)[`?`](../../API/builtins/nil.md) {#text}
> The text label of the button
> * Default: ""

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# ButtonSwitchProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### items : [`ItemLabels`](#ItemLabels)[`?`](../../API/builtins/nil.md) {#items}
> A list of buttons labels to show in order. Must have more than one item.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### notifier : [`IntegerNotifier`](#IntegerNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a notifier that will be called whenever a new item is picked

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`SelectedItem`](#SelectedItem)[`?`](../../API/builtins/nil.md) {#value}
> The currently selected item's index

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# CheckBoxProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`ViewBooleanObservable`](#ViewBooleanObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableBoolean object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### notifier : [`CheckBoxBooleanNotifier`](#CheckBoxBooleanNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> A notifier for when the checkbox is toggled

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`CheckBoxBoolean`](#CheckBoxBoolean)[`?`](../../API/builtins/nil.md) {#value}
> The current state of the checkbox, expressed as boolean.
> * Default: false

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# ChooserProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### items : [`ItemLabels`](#ItemLabels)[`?`](../../API/builtins/nil.md) {#items}
> A list of buttons labels to show in order. Must have more than one item.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### notifier : [`IntegerNotifier`](#IntegerNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a notifier that will be called whenever a new item is picked

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`SelectedItem`](#SelectedItem)[`?`](../../API/builtins/nil.md) {#value}
> The currently selected item's index

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# MiniSliderProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### default : [`SliderDefaultValue`](#SliderDefaultValue)[`?`](../../API/builtins/nil.md) {#default}
> The default value that will be re-applied on double-click

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### max : [`SliderMaxValue`](#SliderMaxValue)[`?`](../../API/builtins/nil.md) {#max}
> The maximum value that can be set using the view
> * Default: 1.0

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### min : [`SliderMinValue`](#SliderMinValue)[`?`](../../API/builtins/nil.md) {#min}
> The minimum value that can be set using the view
> * Default: 0

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a value notifier that will be called whenever the value changes

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md) {#value}
> The current value of the view

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# MultilineTextFieldProperties  

<!-- toc -->
  

---  
## Properties
### active : [`TextActive`](#TextActive)[`?`](../../API/builtins/nil.md) {#active}
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true

### bind : [`ViewStringListObservable`](#ViewStringListObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableStringList object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### edit_mode : [`TextEditMode`](#TextEditMode)[`?`](../../API/builtins/nil.md) {#edit_mode}
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md) {#font}
> The style that the text should be displayed with.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### notifier : [`StringChangeNotifier`](#StringChangeNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a notifier for text changes

### paragraphs : [`TextParagraphs`](#TextParagraphs)[`?`](../../API/builtins/nil.md) {#paragraphs}
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []

### style : [`TextBackgroundStyle`](#TextBackgroundStyle)[`?`](../../API/builtins/nil.md) {#style}
> Setup the text view's background:

### text : [`TextValueAlias`](#TextValueAlias)[`?`](../../API/builtins/nil.md) {#text}
> Exactly the same as "value"; provided for consistency.
> * Default: ""

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`TextMultilineString`](#TextMultilineString)[`?`](../../API/builtins/nil.md) {#value}
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# MultilineTextViewProperties  

<!-- toc -->
  

---  
## Properties
### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md) {#font}
> The style that the text should be displayed with.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### paragraphs : [`TextParagraphs`](#TextParagraphs)[`?`](../../API/builtins/nil.md) {#paragraphs}
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []

### style : [`TextBackgroundStyle`](#TextBackgroundStyle)[`?`](../../API/builtins/nil.md) {#style}
> Setup the text view's background:

### text : [`TextMultilineString`](#TextMultilineString)[`?`](../../API/builtins/nil.md) {#text}
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# PopUpMenuProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### items : [`PopupItemLabels`](#PopupItemLabels)[`?`](../../API/builtins/nil.md) {#items}
> A list of buttons labels to show in order
> The list can be empty, then "None" is displayed and the value won't change.

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### notifier : [`IntegerNotifier`](#IntegerNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a notifier that will be called whenever a new item is picked

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`SelectedItem`](#SelectedItem)[`?`](../../API/builtins/nil.md) {#value}
> The currently selected item's index

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# RackViewProperties  

<!-- toc -->
  

---  
## Properties
### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### margin : [`RackMargin`](#RackMargin)[`?`](../../API/builtins/nil.md) {#margin}
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)

### spacing : [`RackSpacing`](#RackSpacing)[`?`](../../API/builtins/nil.md) {#spacing}
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)

### style : [`ViewBackgroundStyle`](#ViewBackgroundStyle)[`?`](../../API/builtins/nil.md) {#style}
> Setup a background style for the view. 

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### uniform : [`RackUniformity`](#RackUniformity)[`?`](../../API/builtins/nil.md) {#uniform}
> When set to true, all child views in the rack are automatically resized to
> the max size of all child views (width in ViewBuilder.column, height in
> ViewBuilder.row). This can be useful to automatically align all sub
> columns/panels to the same size. Resizing is done automatically, as soon
> as a child view size changes or new children are added.
> * Default: false

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# RotaryEncoderProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### default : [`SliderDefaultValue`](#SliderDefaultValue)[`?`](../../API/builtins/nil.md) {#default}
> The default value that will be re-applied on double-click

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### max : [`SliderMaxValue`](#SliderMaxValue)[`?`](../../API/builtins/nil.md) {#max}
> The maximum value that can be set using the view
> * Default: 1.0

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### min : [`SliderMinValue`](#SliderMinValue)[`?`](../../API/builtins/nil.md) {#min}
> The minimum value that can be set using the view
> * Default: 0

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a value notifier that will be called whenever the value changes

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md) {#value}
> The current value of the view

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# SliderProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### default : [`SliderDefaultValue`](#SliderDefaultValue)[`?`](../../API/builtins/nil.md) {#default}
> The default value that will be re-applied on double-click

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### max : [`SliderMaxValue`](#SliderMaxValue)[`?`](../../API/builtins/nil.md) {#max}
> The maximum value that can be set using the view
> * Default: 1.0

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### min : [`SliderMinValue`](#SliderMinValue)[`?`](../../API/builtins/nil.md) {#min}
> The minimum value that can be set using the view
> * Default: 0

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a value notifier that will be called whenever the value changes

### steps : [`SliderStepAmounts`](#SliderStepAmounts)[`?`](../../API/builtins/nil.md) {#steps}
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md) {#value}
> The current value of the view

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# TextFieldProperties  

<!-- toc -->
  

---  
## Properties
### active : [`TextActive`](#TextActive)[`?`](../../API/builtins/nil.md) {#active}
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true

### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md) {#align}
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### bind : [`ViewStringObservable`](#ViewStringObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableString object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### edit_mode : [`TextEditMode`](#TextEditMode)[`?`](../../API/builtins/nil.md) {#edit_mode}
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### notifier : [`StringChangeNotifier`](#StringChangeNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a notifier for text changes

### text : [`TextValueAlias`](#TextValueAlias)[`?`](../../API/builtins/nil.md) {#text}
> Exactly the same as "value"; provided for consistency.
> * Default: ""

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`TextValue`](#TextValue)[`?`](../../API/builtins/nil.md) {#value}
> The currently shown text. The text will not be updated when editing,
> rather only after editing is complete (return is pressed, or focus is lost).
> * Default: ""

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# TextViewProperties  

<!-- toc -->
  

---  
## Properties
### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md) {#align}
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md) {#font}
> The style that the text should be displayed with.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### style : [`TextStyle`](#TextStyle)[`?`](../../API/builtins/nil.md) {#style}
> Get/set the color style the text should be displayed with.

### text : [`TextSingleLineString`](#TextSingleLineString)[`?`](../../API/builtins/nil.md) {#text}
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# ValueBoxProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### max : [`ValueBoxMaxValue`](#ValueBoxMaxValue)[`?`](../../API/builtins/nil.md) {#max}
> The maximum value that can be set using the view
> * Default: 100

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### min : [`ValueBoxMinValue`](#ValueBoxMinValue)[`?`](../../API/builtins/nil.md) {#min}
> The minimum value that can be set using the view
> * Default: 0

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a value notifier that will be called whenever the value changes

### steps : [`SliderStepAmounts`](#SliderStepAmounts)[`?`](../../API/builtins/nil.md) {#steps}
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)

### tonumber : [`PairedParseStringAsNumber`](#PairedParseStringAsNumber)[`?`](../../API/builtins/nil.md) {#tonumber}
> Make sure to also set `tostring` if you set this.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### tostring : [`PairedShowNumberAsString`](#PairedShowNumberAsString)[`?`](../../API/builtins/nil.md) {#tostring}
> Make sure to also set `tonumber` if you set this.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md) {#value}
> The current value of the view

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# ValueFieldProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md) {#align}
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### max : [`SliderMaxValue`](#SliderMaxValue)[`?`](../../API/builtins/nil.md) {#max}
> The maximum value that can be set using the view
> * Default: 1.0

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### min : [`SliderMinValue`](#SliderMinValue)[`?`](../../API/builtins/nil.md) {#min}
> The minimum value that can be set using the view
> * Default: 0

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a value notifier that will be called whenever the value changes

### tonumber : [`PairedParseStringAsNumber`](#PairedParseStringAsNumber)[`?`](../../API/builtins/nil.md) {#tonumber}
> Make sure to also set `tostring` if you set this.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### tostring : [`PairedShowNumberAsString`](#PairedShowNumberAsString)[`?`](../../API/builtins/nil.md) {#tostring}
> Make sure to also set `tonumber` if you set this.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md) {#value}
> The current value of the view

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# ValueViewProperties  

<!-- toc -->
  

---  
## Properties
### align : [`TextAlignment`](#TextAlignment)[`?`](../../API/builtins/nil.md) {#align}
> Setup the text's alignment. Applies only when the view's size is larger than
> the needed size to draw the text

### bind : [`ViewNumberObservable`](#ViewNumberObservable)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.

### font : [`TextFontStyle`](#TextFontStyle)[`?`](../../API/builtins/nil.md) {#font}
> The style that the text should be displayed with.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### notifier : [`NumberValueNotifier`](#NumberValueNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a value notifier that will be called whenever the value changes

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### tostring : [`ShowNumberAsString`](#ShowNumberAsString)[`?`](../../API/builtins/nil.md) {#tostring}
> Set a custom rule on how a number value should be displayed.
> Useful for showing units like decibel or note values etc.
> If none are set, a default string/number conversion is done, which
> simply shows the number with 3 digits after the decimal point.
> Note: When the callback fails with an error, it will be disabled to avoid
> a flood of error messages.

### value : [`SliderNumberValue`](#SliderNumberValue)[`?`](../../API/builtins/nil.md) {#value}
> The current value of the view

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# ViewProperties  
>  Base for all View constructor tables in the viewbuilder.  

<!-- toc -->
  

---  
## Properties
### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  
# XYPadProperties  

<!-- toc -->
  

---  
## Properties
### active : [`ControlActive`](#ControlActive)[`?`](../../API/builtins/nil.md) {#active}
> Instead of making a control invisible, you can also make it inactive.
> Deactivated controls will still be shown, and will still show their
> currently assigned values, but will not allow changes. Most controls will
> display as "grayed out" to visualize the deactivated state.

### bind : [`XYPadObservables`](#XYPadObservables)[`?`](../../API/builtins/nil.md) {#bind}
> Bind the view's value to a pair of renoise.Document.ObservableNumber objects.
> Automatically keep both values in sync.
> Will change the Observables' values as soon as the view's value changes,
> and change the view's values as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.
> Just like in the other XYPad properties, a table with the fields X and Y
> is expected here and not a single value. So you have to bind two
> ObservableNumber object to the pad.

### height : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#height}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

### id : [`ViewId`](#ViewId)[`?`](../../API/builtins/nil.md) {#id}
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance. 

### max : [`XYPadMaxValues`](#XYPadMaxValues)[`?`](../../API/builtins/nil.md) {#max}
> A table of allowed maximum values for each axis
> * Default: {x: 1.0, y: 1.0}

### midi_mapping : [`ControlMidiMappingString`](#ControlMidiMappingString)[`?`](../../API/builtins/nil.md) {#midi_mapping}
> When set, the control will be highlighted when Renoise's MIDI mapping dialog
> is open. When clicked, it selects the specified string as a MIDI mapping
> target action. This target acton can either be one of the globally available
> mappings in Renoise, or those that were created by the tool itself.
> Target strings are not verified. When they point to nothing, the mapped MIDI
> message will do nothing and no error is fired.

### min : [`XYPadMinValues`](#XYPadMinValues)[`?`](../../API/builtins/nil.md) {#min}
> A table of allowed minimum values for each axis
> * Default: {x: 0.0, y: 0.0}

### notifier : [`XYValueNotifier`](#XYValueNotifier)[`?`](../../API/builtins/nil.md) {#notifier}
> Set up a value notifier function that will be used whenever the pad's values change

### snapback : [`XYPadSnapbackValues`](#XYPadSnapbackValues)[`?`](../../API/builtins/nil.md) {#snapback}
> A table of snapback values for each axis
> When snapback is enabled, the pad will revert its values to the specified
> snapback values as soon as the mouse button is released in the pad.
> When disabled, releasing the mouse button will not change the value.
> You can disable snapback at runtime by setting it to nil or an empty table.

### tooltip : [`ViewTooltip`](#ViewTooltip)[`?`](../../API/builtins/nil.md) {#tooltip}
> A tooltip text that should be shown for this view on mouse hover.
> * Default: "" (no tip will be shown)

### value : [`XYPadValues`](#XYPadValues)[`?`](../../API/builtins/nil.md) {#value}
> A table of the XYPad's current values on each axis

### visible : [`ViewVisibility`](#ViewVisibility)[`?`](../../API/builtins/nil.md) {#visible}
> Set visible to false to hide a view (make it invisible without removing
> it). Please note that view.visible will also return false when any of its
> parents are invisible (when its implicitly invisible).
> * Default: true

### width : [`ViewDimension`](#ViewDimension)[`?`](../../API/builtins/nil.md) {#width}
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.

  

  



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
  
### BitmapImagePath {#BitmapImagePath}
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
  
### BitmapMode {#BitmapMode}
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
  
### BitmapPath {#BitmapPath}
[`BitmapImagePath`](#BitmapImagePath)  
> Supported bitmap file formats are *.bmp, *.png or *.tif (no transparency).  
  
### BooleanValueNotifierFunction {#BooleanValueNotifierFunction}
(value : [`boolean`](../../API/builtins/boolean.md))  
  
  
### BooleanValueNotifierMemberFunction {#BooleanValueNotifierMemberFunction}
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`boolean`](../../API/builtins/boolean.md))  
  
  
### BooleanValueNotifierMethod1 {#BooleanValueNotifierMethod1}
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`BooleanValueNotifierMemberFunction`](#BooleanValueNotifierMemberFunction) }  
  
  
### BooleanValueNotifierMethod2 {#BooleanValueNotifierMethod2}
{ 1 : [`BooleanValueNotifierMemberFunction`](#BooleanValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### ButtonBitmapPath {#ButtonBitmapPath}
[`BitmapImagePath`](#BitmapImagePath)  
> If set, existing text is removed and the loaded image is displayed instead.
> Supported bitmap file formats are ".bmp", ".png" and ".tiff".
> Colors in bitmaps will be overridden by the button's theme color, using black
> as the transparent color for BMPs and TIFFS, and the alpha channel for PNGs.
> All other colors are mapped to the theme color according to their grey value,
> so plain white is the target theme color, and all other colors blend into the
> button's background color of the theme.  
  
### ButtonColor {#ButtonColor}
[`RGBColor`](#RGBColor)  
> When set, the unpressed button's background will be drawn in the specified color.
> A text color is automatically selected unless explicitly set, to make sure it's
> always visible.
> Set color {0,0,0} to enable the theme colors for the button again.  
  
### ButtonLabel {#ButtonLabel}
[`string`](../../API/builtins/string.md)  
> The text label of the button
> * Default: ""  
  
### ButtonNotifier {#ButtonNotifier}
[`NotifierFunction`](#NotifierFunction) | [`NotifierMethod1`](#NotifierMethod1) | [`NotifierMethod2`](#NotifierMethod2)  
> A click notifier  
  
### CheckBoxBoolean {#CheckBoxBoolean}
[`boolean`](../../API/builtins/boolean.md)  
> The current state of the checkbox, expressed as boolean.
> * Default: false  
  
### CheckBoxBooleanNotifier {#CheckBoxBooleanNotifier}
[`BooleanValueNotifierFunction`](#BooleanValueNotifierFunction) | [`BooleanValueNotifierMethod1`](#BooleanValueNotifierMethod1) | [`BooleanValueNotifierMethod2`](#BooleanValueNotifierMethod2)  
> A notifier for when the checkbox is toggled  
  
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
  
### IntegerNotifier {#IntegerNotifier}
[`IntegerValueNotifierFunction`](#IntegerValueNotifierFunction) | [`IntegerValueNotifierMethod1`](#IntegerValueNotifierMethod1) | [`IntegerValueNotifierMethod2`](#IntegerValueNotifierMethod2)  
> Set up a notifier that will be called whenever a new item is picked  
  
### IntegerValueNotifierFunction {#IntegerValueNotifierFunction}
(value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMemberFunction {#IntegerValueNotifierMemberFunction}
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`integer`](../../API/builtins/integer.md))  
  
  
### IntegerValueNotifierMethod1 {#IntegerValueNotifierMethod1}
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction) }  
  
  
### IntegerValueNotifierMethod2 {#IntegerValueNotifierMethod2}
{ 1 : [`IntegerValueNotifierMemberFunction`](#IntegerValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### ItemLabels {#ItemLabels}
[`string`](../../API/builtins/string.md)[]  
> A list of buttons labels to show in order. Must have more than one item.  
  
### ListElementAdded {#ListElementAdded}
{ index : [`integer`](../../API/builtins/integer.md), type : `"insert"` }  
  
  
### ListElementChange {#ListElementChange}
[`ListElementAdded`](#ListElementAdded) | [`ListElementRemoved`](#ListElementRemoved) | [`ListElementsSwapped`](#ListElementsSwapped)  
  
  
### ListElementRemoved {#ListElementRemoved}
{ index : [`integer`](../../API/builtins/integer.md), type : `"removed"` }  
  
  
### ListElementsSwapped {#ListElementsSwapped}
{ index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md), type : `"swapped"` }  
  
  
### ListNotifierFunction {#ListNotifierFunction}
(change : [`ListElementChange`](#ListElementChange))  
  
  
### ListNotifierMemberContext {#ListNotifierMemberContext}
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NotifierFunction {#NotifierFunction}
fun()  
  
  
### NotifierMemberContext {#NotifierMemberContext}
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  
### NotifierMemberFunction {#NotifierMemberFunction}
(self : [`NotifierMemberContext`](#NotifierMemberContext))  
  
  
### NotifierMethod1 {#NotifierMethod1}
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NotifierMemberFunction`](#NotifierMemberFunction) }  
  
  
### NotifierMethod2 {#NotifierMethod2}
{ 1 : [`NotifierMemberFunction`](#NotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### NumberValueNotifier {#NumberValueNotifier}
[`NumberValueNotifierFunction`](#NumberValueNotifierFunction) | [`NumberValueNotifierMethod1`](#NumberValueNotifierMethod1) | [`NumberValueNotifierMethod2`](#NumberValueNotifierMethod2)  
> Set up a value notifier that will be called whenever the value changes  
  
### NumberValueNotifierFunction {#NumberValueNotifierFunction}
(value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMemberFunction {#NumberValueNotifierMemberFunction}
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`number`](../../API/builtins/number.md))  
  
  
### NumberValueNotifierMethod1 {#NumberValueNotifierMethod1}
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction) }  
  
  
### NumberValueNotifierMethod2 {#NumberValueNotifierMethod2}
{ 1 : [`NumberValueNotifierMemberFunction`](#NumberValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### PairedParseStringAsNumber {#PairedParseStringAsNumber}
(value : [`string`](../../API/builtins/string.md)) `->` [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)  
> Make sure to also set `tostring` if you set this.  
  
### PairedShowNumberAsString {#PairedShowNumberAsString}
[`ShowNumberAsString`](#ShowNumberAsString)  
> Make sure to also set `tonumber` if you set this.  
  
### PopupItemLabels {#PopupItemLabels}
[`string`](../../API/builtins/string.md)[]  
> A list of buttons labels to show in order
> The list can be empty, then "None" is displayed and the value won't change.  
  
### RGBColor {#RGBColor}
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  
### RackMargin {#RackMargin}
[`integer`](../../API/builtins/integer.md)  
> Set the "borders" of a rack (left, right, top and bottom inclusively)
> *  Default: 0 (no borders)  
  
### RackSpacing {#RackSpacing}
[`integer`](../../API/builtins/integer.md)  
> Set the amount stacked child views are separated by (horizontally in
> rows, vertically in columns).
> *  Default: 0 (no spacing)  
  
### RackUniformity {#RackUniformity}
[`boolean`](../../API/builtins/boolean.md)  
> When set to true, all child views in the rack are automatically resized to
> the max size of all child views (width in ViewBuilder.column, height in
> ViewBuilder.row). This can be useful to automatically align all sub
> columns/panels to the same size. Resizing is done automatically, as soon
> as a child view size changes or new children are added.
> * Default: false  
  
### SelectedItem {#SelectedItem}
[`integer`](../../API/builtins/integer.md)  
> The currently selected item's index  
  
### ShowNumberAsString {#ShowNumberAsString}
(value : [`number`](../../API/builtins/number.md)) `->` [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  
> Set a custom rule on how a number value should be displayed.
> Useful for showing units like decibel or note values etc.
> If none are set, a default string/number conversion is done, which
> simply shows the number with 3 digits after the decimal point.
> Note: When the callback fails with an error, it will be disabled to avoid
> a flood of error messages.  
  
### SliderDefaultValue {#SliderDefaultValue}
[`number`](../../API/builtins/number.md)  
> The default value that will be re-applied on double-click  
  
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
  
### SliderStepAmounts {#SliderStepAmounts}
{ 1 : [`number`](../../API/builtins/number.md), 2 : [`number`](../../API/builtins/number.md) }  
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)  
  
### StringChangeNotifier {#StringChangeNotifier}
[`StringValueNotifierFunction`](#StringValueNotifierFunction) | [`StringValueNotifierMethod1`](#StringValueNotifierMethod1) | [`StringValueNotifierMethod2`](#StringValueNotifierMethod2)  
> Set up a notifier for text changes  
  
### StringValueNotifierFunction {#StringValueNotifierFunction}
(value : [`string`](../../API/builtins/string.md))  
  
  
### StringValueNotifierMemberFunction {#StringValueNotifierMemberFunction}
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`string`](../../API/builtins/string.md))  
  
  
### StringValueNotifierMethod1 {#StringValueNotifierMethod1}
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`StringValueNotifierMemberFunction`](#StringValueNotifierMemberFunction) }  
  
  
### StringValueNotifierMethod2 {#StringValueNotifierMethod2}
{ 1 : [`StringValueNotifierMemberFunction`](#StringValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  
### TextActive {#TextActive}
[`boolean`](../../API/builtins/boolean.md)  
> When false, text is displayed but can not be entered/modified by the user.
> * Default: true  
  
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
  
### TextBackgroundStyle {#TextBackgroundStyle}
`"body"` | `"border"` | `"strong"`  
> ```lua
> -- Setup the text view's background:
> TextBackgroundStyle:
>     | "body" -- simple text color with no background
>     | "strong" -- stronger text color with no background
>     | "border" -- text on a bordered background
> ```  
  
### TextEditMode {#TextEditMode}
[`boolean`](../../API/builtins/boolean.md)  
> True when the text field is focused. setting it at run-time programmatically
> will focus the text field or remove the focus (focus the dialog) accordingly.
> * Default: false  
  
### TextFontStyle {#TextFontStyle}
`"big"` | `"bold"` | `"italic"` | `"mono"` | `"normal"`  
> ```lua
> -- The style that the text should be displayed with.
> TextFontStyle:
>     | "normal" -- (Default)
>     | "big" -- big text
>     | "bold" -- bold font
>     | "italic" -- italic font
>     | "mono" -- monospace font
> ```  
  
### TextMultilineString {#TextMultilineString}
[`string`](../../API/builtins/string.md)  
> The text that should be displayed.
> Newlines (Windows, Mac or Unix styled) in the text can be used to create
> paragraphs.  
  
### TextParagraphs {#TextParagraphs}
[`string`](../../API/builtins/string.md)[]  
> A table of text lines to be used instead of specifying a single text
> line with newline characters like "text"
> * Default: []  
  
### TextSingleLineString {#TextSingleLineString}
[`string`](../../API/builtins/string.md)  
> The text that should be displayed. Setting a new text will resize
> the view in order to make the text fully visible (expanding only).
> * Default: ""  
  
### TextStyle {#TextStyle}
`"disabled"` | `"normal"` | `"strong"`  
> ```lua
> -- Get/set the color style the text should be displayed with.
> TextStyle:
>     | "normal" -- (Default)
>     | "strong" -- highlighted color
>     | "disabled" -- greyed out color
> ```  
  
### TextValue {#TextValue}
[`string`](../../API/builtins/string.md)  
> The currently shown text. The text will not be updated when editing,
> rather only after editing is complete (return is pressed, or focus is lost).
> * Default: ""  
  
### TextValueAlias {#TextValueAlias}
[`string`](../../API/builtins/string.md)  
> Exactly the same as "value"; provided for consistency.
> * Default: ""  
  
### ValueBoxMaxValue {#ValueBoxMaxValue}
[`number`](../../API/builtins/number.md)  
> The maximum value that can be set using the view
> * Default: 100  
  
### ValueBoxMinValue {#ValueBoxMinValue}
[`number`](../../API/builtins/number.md)  
> The minimum value that can be set using the view
> * Default: 0  
  
### ViewBackgroundStyle {#ViewBackgroundStyle}
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
  
### ViewBooleanObservable {#ViewBooleanObservable}
[`renoise.Document.ObservableBoolean`](../../API/renoise/renoise.Document.ObservableBoolean.md)  
> Bind the view's value to a renoise.Document.ObservableBoolean object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
### ViewDimension {#ViewDimension}
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
> The dimensions of a view has to be larger than 0.
> For nested views you can also specify relative size
> for example `vb:text { width = "80%"}`. The percentage values are
> relative to the view's parent size and will automatically update on size changes.  
  
### ViewId {#ViewId}
[`string`](../../API/builtins/string.md)  
> Unique identifier to resolve the view later on in the viewbuilder, 
> e.g. `vb.views.SomeString` or `vb.views["Some String"]`
> View ids must be unique within a single view builder instance.   
  
### ViewNumberObservable {#ViewNumberObservable}
[`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md)  
> Bind the view's value to a renoise.Document.ObservableNumber object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
### ViewStringListObservable {#ViewStringListObservable}
[`renoise.Document.ObservableStringList`](../../API/renoise/renoise.Document.ObservableStringList.md)  
> Bind the view's value to a renoise.Document.ObservableStringList object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
### ViewStringObservable {#ViewStringObservable}
[`renoise.Document.ObservableString`](../../API/renoise/renoise.Document.ObservableString.md)  
> Bind the view's value to a renoise.Document.ObservableString object.
> Automatically keep them in sync.
> The view will change the Observable value as soon as its value changes
> and change the view's value as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.  
  
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
  
### XYPadMaxValues {#XYPadMaxValues}
{ x : [`SliderMaxValue`](#SliderMaxValue), y : [`SliderMaxValue`](#SliderMaxValue) }  
> A table of allowed maximum values for each axis
> * Default: {x: 1.0, y: 1.0}  
  
### XYPadMinValues {#XYPadMinValues}
{ x : [`SliderMinValue`](#SliderMinValue), y : [`SliderMinValue`](#SliderMinValue) }  
> A table of allowed minimum values for each axis
> * Default: {x: 0.0, y: 0.0}  
  
### XYPadObservables {#XYPadObservables}
{ x : [`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md), y : [`renoise.Document.ObservableNumber`](../../API/renoise/renoise.Document.ObservableNumber.md) }  
> Bind the view's value to a pair of renoise.Document.ObservableNumber objects.
> Automatically keep both values in sync.
> Will change the Observables' values as soon as the view's value changes,
> and change the view's values as soon as the Observable's value changes.
> Notifiers can be added to either the view or the Observable object.
> Just like in the other XYPad properties, a table with the fields X and Y
> is expected here and not a single value. So you have to bind two
> ObservableNumber object to the pad.  
  
### XYPadSnapbackValues {#XYPadSnapbackValues}
{ x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md) }  
> A table of snapback values for each axis
> When snapback is enabled, the pad will revert its values to the specified
> snapback values as soon as the mouse button is released in the pad.
> When disabled, releasing the mouse button will not change the value.
> You can disable snapback at runtime by setting it to nil or an empty table.  
  
### XYPadValues {#XYPadValues}
{ x : [`SliderNumberValue`](#SliderNumberValue), y : [`SliderNumberValue`](#SliderNumberValue) }  
> A table of the XYPad's current values on each axis  
  
### XYValueNotifier {#XYValueNotifier}
[`XYValueNotifierFunction`](#XYValueNotifierFunction) | [`XYValueNotifierMethod1`](#XYValueNotifierMethod1) | [`XYValueNotifierMethod2`](#XYValueNotifierMethod2)  
> Set up a value notifier function that will be used whenever the pad's values change  
  
### XYValueNotifierFunction {#XYValueNotifierFunction}
(value : [`XYPadValues`](#XYPadValues))  
  
  
### XYValueNotifierMemberFunction {#XYValueNotifierMemberFunction}
(self : [`NotifierMemberContext`](#NotifierMemberContext), value : [`XYPadValues`](#XYPadValues))  
  
  
### XYValueNotifierMethod1 {#XYValueNotifierMethod1}
{ 1 : [`NotifierMemberContext`](#NotifierMemberContext), 2 : [`XYValueNotifierMemberFunction`](#XYValueNotifierMemberFunction) }  
  
  
### XYValueNotifierMethod2 {#XYValueNotifierMethod2}
{ 1 : [`XYValueNotifierMemberFunction`](#XYValueNotifierMemberFunction), 2 : [`NotifierMemberContext`](#NotifierMemberContext) }  
  
  

