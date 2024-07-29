# renoise.Pattern  

---  
## Properties
### MAX_NUMBER_OF_LINES : [`integer`](/API/builtins/integer.md) {#MAX_NUMBER_OF_LINES}
Maximum number of lines that can be present in a pattern.

### is_empty : [`boolean`](/API/builtins/boolean.md) {#is_empty}
Quickly check if any track in a pattern has some non empty pattern lines.
This does not look at track automation.

### name : [`string`](/API/builtins/string.md) {#name}
Name of the pattern, as visible in the pattern sequencer.

### name_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#name_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### number_of_lines : [`integer`](/API/builtins/integer.md) {#number_of_lines}
Number of lines the pattern currently has. 64 by default. Max is
renoise.Pattern.MAX_NUMBER_OF_LINES, min is 1.

### number_of_lines_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#number_of_lines_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### tracks : [`renoise.PatternTrack`](/API/renoise/renoise.PatternTrack.md)`[]` {#tracks}
**READ-ONLY** Access to the pattern tracks. Each pattern has
#renoise.song().tracks amount of tracks.

  

---  
## Functions
### `add_line_edited_notifier`([*self*](/API/builtins/self.md), func : [`PatternLineChangeCallbackWithContext`](#PatternLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#add_line_edited_notifier}
### `add_line_notifier`([*self*](/API/builtins/self.md), func : [`PatternLineChangeCallbackWithContext`](#PatternLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#add_line_notifier}
### `clear`([*self*](/API/builtins/self.md)) {#clear}
Deletes all lines & automation.
### `copy_from`([*self*](/API/builtins/self.md), other : [`renoise.Pattern`](/API/renoise/renoise.Pattern.md)) {#copy_from}
Copy contents from other patterns, including automation, when possible.
### `has_line_edited_notifier`([*self*](/API/builtins/self.md), func : [`PatternLineChangeCallbackWithContext`](#PatternLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#has_line_edited_notifier}
`->`[`boolean`](/API/builtins/boolean.md)  

Same as `line_notifier`, but the notifier only fires when the user
added, changed or deleted a line with the computer or MIDI keyboard.
### `has_line_notifier`([*self*](/API/builtins/self.md), func : [`PatternLineChangeCallbackWithContext`](#PatternLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#has_line_notifier}
`->`[`boolean`](/API/builtins/boolean.md)  

Check/add/remove notifier functions or methods, which are called by Renoise
as soon as any of the pattern's lines have changed.
The notifiers are called as soon as a new line is added, an existing line
is cleared, or existing lines are somehow changed (notes, effects, anything)

A single argument is passed to the notifier function: "pos", a table with the
fields "pattern", "track" and "line", which defines where the change has
happened.
### example:
```lua
function my_pattern_line_notifier(pos)
  -- check pos.pattern, pos.track, pos.line (all are indices)
end
```
Please be gentle with these notifiers, don't do too much stuff in there.
Ideally just set a flag like "pattern_dirty" which then gets picked up by
an app_idle notifier: The danger here is that line change notifiers can
be called hundreds of times when, for example, simply clearing a pattern.

If you are only interested in changes that are made to the currently edited
pattern, dynamically attach and detach to the selected pattern's line
notifiers by listening to "renoise.song().selected_pattern_observable".
### `remove_line_edited_notifier`([*self*](/API/builtins/self.md), func : [`PatternLineChangeCallbackWithContext`](#PatternLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#remove_line_edited_notifier}
### `remove_line_notifier`([*self*](/API/builtins/self.md), func : [`PatternLineChangeCallbackWithContext`](#PatternLineChangeCallbackWithContext), obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md)) {#remove_line_notifier}
### `track`([*self*](/API/builtins/self.md), index : [`integer`](/API/builtins/integer.md)) {#track}
`->`[`renoise.PatternTrack`](/API/renoise/renoise.PatternTrack.md)  

Access to a single pattern track by index. Use properties 'tracks' to
iterate over all tracks and to query the track count.  



---  
## Structs  
# PatternLinePosition  
Line iterator position.  

---  
## Properties
### line : [`integer`](/API/builtins/integer.md) {#line}
### pattern : [`integer`](/API/builtins/integer.md) {#pattern}
### track : [`integer`](/API/builtins/integer.md) {#track}
  

  



---  
## Aliases  
# alias PatternLineChangeCallbackWithContext {#PatternLineChangeCallbackWithContext}
(obj : [`table`](/API/builtins/table.md) | [`userdata`](/API/builtins/userdata.md), pos : [`PatternLinePosition`](#patternlineposition))  
  
  

