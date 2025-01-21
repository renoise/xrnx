# renoise.PatternTrack<a name="renoise.PatternTrack"></a>  

<!-- toc -->
  

---  
## Properties
### is_alias : [`boolean`](../../API/builtins/boolean.md)<a name="is_alias"></a>
> **READ-ONLY**

### alias_pattern_index : [`integer`](../../API/builtins/integer.md)<a name="alias_pattern_index"></a>
> index or 0 when no alias is present

### alias_pattern_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="alias_pattern_index_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### color : [`RGBColor`](#RGBColor)[`?`](../../API/builtins/nil.md)<a name="color"></a>
> slot color of the pattern in the matrix, nil when no slot color is set

### color_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="color_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_empty : [`boolean`](../../API/builtins/boolean.md)<a name="is_empty"></a>
> Returns true when all the track lines are empty. Does not look at automation.

### is_empty_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="is_empty_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### lines : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)[]<a name="lines"></a>
> **READ-ONLY** Get all lines in range [1, number_of_lines_in_pattern].
> Use `renoise.Pattern:add/remove_line_notifier` for change notifications.

### automation : [`renoise.PatternTrackAutomation`](../../API/renoise/renoise.PatternTrackAutomation.md)[]<a name="automation"></a>
> Automation.

### automation_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="automation_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md))<a name="clear"></a>
> Deletes all lines & automation.
### copy_from([*self*](../../API/builtins/self.md), other : [`renoise.PatternTrack`](../../API/renoise/renoise.PatternTrack.md))<a name="copy_from"></a>
> Copy contents from other pattern tracks, including automation when possible.
### line([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="line"></a>
`->`[`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)  

> Access to a single line by index. Line must be in Range: (1 - MAX_NUMBER_OF_LINES).
> This is a !lot! more efficient than calling the property: lines[index] to
> randomly access lines.
### lines_in_range([*self*](../../API/builtins/self.md), index_from : [`integer`](../../API/builtins/integer.md), index_to : [`integer`](../../API/builtins/integer.md))<a name="lines_in_range"></a>
`->`[`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)[]  

> Get a specific line range. Index must be Range: (1 - Pattern.MAX_NUMBER_OF_LINES)
### find_automation([*self*](../../API/builtins/self.md), parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md))<a name="find_automation"></a>
`->`[`renoise.PatternTrackAutomation`](../../API/renoise/renoise.PatternTrackAutomation.md)[`?`](../../API/builtins/nil.md)  

> Returns the automation for the given device parameter or nil when there is
> none.
### create_automation([*self*](../../API/builtins/self.md), parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md))<a name="create_automation"></a>
`->`[`renoise.PatternTrackAutomation`](../../API/renoise/renoise.PatternTrackAutomation.md)  

> Creates a new automation for the given device parameter.
> Fires an error when an automation for the given parameter already exists.
> Returns the newly created automation. Passed parameter must be automatable,
> which can be tested with 'parameter.is_automatable'.
### delete_automation([*self*](../../API/builtins/self.md), parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md))<a name="delete_automation"></a>
> Remove an existing automation the given device parameter. Automation
> must exist.  



---  
## Aliases  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  

