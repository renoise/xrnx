# renoise.PatternTrack  

<!-- toc -->
  

---  
## Properties
### is_alias : [`boolean`](../../API/builtins/boolean.md) {#is_alias}
> **READ-ONLY**

### alias_pattern_index : [`integer`](../../API/builtins/integer.md) {#alias_pattern_index}
> index or 0 when no alias is present

### alias_pattern_index_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#alias_pattern_index_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### color : [`RGBColor`](#RGBColor)[`?`](../../API/builtins/nil.md) {#color}
> slot color of the pattern in the matrix, nil when no slot color is set

### color_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#color_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### is_empty : [`boolean`](../../API/builtins/boolean.md) {#is_empty}
> Returns true when all the track lines are empty. Does not look at automation.

### is_empty_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#is_empty_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### lines : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)[] {#lines}
> **READ-ONLY** Get all lines in range [1, number_of_lines_in_pattern].
> Use `renoise.Pattern:add/remove_line_notifier` for change notifications.

### automation : [`renoise.PatternTrackAutomation`](../../API/renoise/renoise.PatternTrackAutomation.md)[] {#automation}
> Automation.

### automation_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#automation_observable}
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

  

---  
## Functions
### clear([*self*](../../API/builtins/self.md)) {#clear}
> Deletes all lines & automation.
### copy_from([*self*](../../API/builtins/self.md), other : [`renoise.PatternTrack`](../../API/renoise/renoise.PatternTrack.md)) {#copy_from}
> Copy contents from other pattern tracks, including automation when possible.
### line([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#line}
`->`[`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)  

> Access to a single line by index. Line must be in Range: (1 - MAX_NUMBER_OF_LINES).
> This is a !lot! more efficient than calling the property: lines[index] to
> randomly access lines.
### lines_in_range([*self*](../../API/builtins/self.md), index_from : [`integer`](../../API/builtins/integer.md), index_to : [`integer`](../../API/builtins/integer.md)) {#lines_in_range}
`->`[`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md)[]  

> Get a specific line range. Index must be Range: (1 - Pattern.MAX_NUMBER_OF_LINES)
### find_automation([*self*](../../API/builtins/self.md), parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)) {#find_automation}
`->`[`renoise.PatternTrackAutomation`](../../API/renoise/renoise.PatternTrackAutomation.md)[`?`](../../API/builtins/nil.md)  

> Returns the automation for the given device parameter or nil when there is
> none.
### create_automation([*self*](../../API/builtins/self.md), parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)) {#create_automation}
`->`[`renoise.PatternTrackAutomation`](../../API/renoise/renoise.PatternTrackAutomation.md)  

> Creates a new automation for the given device parameter.
> Fires an error when an automation for the given parameter already exists.
> Returns the newly created automation. Passed parameter must be automatable,
> which can be tested with 'parameter.is_automatable'.
### delete_automation([*self*](../../API/builtins/self.md), parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)) {#delete_automation}
> Remove an existing automation the given device parameter. Automation
> must exist.  



---  
## Local Aliases  
### RGBColor {#RGBColor}
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  

