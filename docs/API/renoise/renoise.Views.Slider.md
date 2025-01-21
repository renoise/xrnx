# renoise.Views.Slider<a name="renoise.Views.Slider"></a>  
> A slider with arrow buttons, which shows and allows editing of values in a
> custom range. A slider can be horizontal or vertical; will flip its
> orientation according to the set width and height. By default horizontal.
> ```text
>  +---+---------------+
>  |<|>| --------[]    |
>  +---+---------------+
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

### steps : [`SliderStepAmounts`](#SliderStepAmounts)<a name="steps"></a>
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)

### default : [`SliderDefaultValue`](#SliderDefaultValue)<a name="default"></a>
> The default value that will be re-applied on double-click

### value : [`SliderNumberValue`](#SliderNumberValue)<a name="value"></a>
> The current value of the view

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
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction))<a name="add_notifier"></a>
> Add value change notifier
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`NumberValueNotifierFunction`](#NumberValueNotifierFunction))<a name="remove_notifier"></a>
> Remove value change notifier
### add_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="add_child"></a>
> Add a new child view to this view.
### remove_child([*self*](../../API/builtins/self.md), child : [`renoise.Views.View`](../../API/renoise/renoise.Views.View.md))<a name="remove_child"></a>
> Remove a child view from this view.  



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
  
### SliderStepAmounts<a name="SliderStepAmounts"></a>
{ 1 : [`number`](../../API/builtins/number.md), 2 : [`number`](../../API/builtins/number.md) }  
> A table containing two numbers representing the step amounts for incrementing
> and decrementing by clicking the <> buttons.
> The first value is the small step (applied on left clicks)
> second value is the big step (applied on right clicks)  
  
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
  

