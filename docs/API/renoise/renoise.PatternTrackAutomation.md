# renoise.PatternTrackAutomation  
Graphical automation of a device parameter within a pattern track.

General remarks: Automation "time" is specified in lines + optional 1/256
line fraction for the sub line grid. The sub line grid has 256 units per
line. All times are internally quantized to this sub line grid.
For example a time of 1.5 means: line 1 with a note column delay of 128  
## Constants
### Playmode {#Playmode}
```lua
{
    PLAYMODE_POINTS: integer = 1,
    PLAYMODE_LINES: integer = 2,
    PLAYMODE_CURVES: integer = 3,
}
```
  

---  
## Properties
### dest_device : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md) {#dest_device}
Destination device. Can in some rare circumstances be nil, i.e. when
a device or track is about to be deleted.

### dest_parameter : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#dest_parameter}
Destination device's parameter. Can in some rare circumstances be nil,
i.e. when a device or track is about to be deleted.

### length : [`integer`](../../API/builtins/integer.md) {#length}
Range: (1 - NUM_LINES_IN_PATTERN)

### playmode : [`renoise.PatternTrackAutomation.Playmode`](renoise.PatternTrackAutomation.md#Playmode) {#playmode}
play-mode (interpolation mode).

### playmode_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#playmode_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### points : [`EnvelopePoint`](#envelopepoint)`[]` {#points}
Get all points of the automation. When setting a new list of points,
items may be unsorted by time, but there may not be multiple points
for the same time. Returns a copy of the list, so changing
`points[1].value` will not do anything. Instead, change them via
`points = { modified_points }`.

### points_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#points_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### selection_end : [`integer`](../../API/builtins/integer.md) {#selection_end}
Range: (1  -  automation.length + 1)

### selection_end_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#selection_end_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### selection_range : [`integer`](../../API/builtins/integer.md)`[]` {#selection_range}
Get or set selection range. when setting an empty table, the existing
selection, if any, will be cleared.
array of two numbers [] OR Range: (1  -  automation.length + 1)

### selection_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#selection_range_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### selection_start : [`integer`](../../API/builtins/integer.md) {#selection_start}
Range: (1 - automation.length + 1)

### selection_start_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#selection_start_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `add_point_at`([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md), value : [`number`](../../API/builtins/number.md), scaling : [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)) {#add_point_at}
Insert a new point, or change an existing one, if a point in
time already exists.
### `clear`([*self*](../../API/builtins/self.md)) {#clear}
Removes all points from the automation. Will not delete the automation
from tracks[]:automation, instead the resulting automation will not do
anything at all.
### `clear_range`([*self*](../../API/builtins/self.md), from_time : [`integer`](../../API/builtins/integer.md), to_time : [`integer`](../../API/builtins/integer.md)) {#clear_range}
Remove all existing points in the given [from, to) time range from the
automation.
### `copy_from`([*self*](../../API/builtins/self.md), other : [`renoise.PatternTrackAutomation`](../../API/renoise/renoise.PatternTrackAutomation.md)) {#copy_from}
Copy all points and playback settings from another track automation.
### `has_point_at`([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md)) {#has_point_at}
`->`[`boolean`](../../API/builtins/boolean.md)  

Test if a point exists at the given time
### `remove_point_at`([*self*](../../API/builtins/self.md), time : [`integer`](../../API/builtins/integer.md)) {#remove_point_at}
Removes a point at the given time. Point must exist.  



---  
## Structs  
# EnvelopePoint  
Single point within a pattern track automation envelope.  

---  
## Properties
### scaling : [`number`](../../API/builtins/number.md) {#scaling}
Automation point scaling. Used in 'lines' playback mode only - 0.0 is linear.

### time : [`integer`](../../API/builtins/integer.md) {#time}
Automation point's time in pattern lines in Range: (1 - NUM_LINES_IN_PATTERN).

### value : [`number`](../../API/builtins/number.md) {#value}
Automation point value in Range: (0 - 1.0)

  

  

