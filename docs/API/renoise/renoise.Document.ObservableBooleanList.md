# renoise.Document.ObservableBooleanList  
A observable list of boolean values.  

---  
## Functions
### `add_notifier`([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction)) {#add_notifier}
Register a function or method as a notifier, which will be called as soon as
the observable lists layout changed. The passed notifier can either be a function
or a table with a function and some context (an "object") -> method.
### `find`([*self*](../../API/builtins/self.md), start_pos : [`integer`](../../API/builtins/integer.md), value : [`boolean`](../../API/builtins/boolean.md)) {#find}
`->`[`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)  

Find a value in the list by comparing the list values with the passed
value. The first successful match is returned. When no match is found, nil
is returned.
### `from_string`([*self*](../../API/builtins/self.md), string : [`any`](../../API/builtins/any.md)) {#from_string}
`->`[`string`](../../API/builtins/string.md)  

Assign the object's value from a string - when possible. Errors are
silently ignored.
### `has_notifier`([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction)) {#has_notifier}
Checks if the given function, method was already registered as notifier.
### `insert`([*self*](../../API/builtins/self.md), pos : [`integer`](../../API/builtins/integer.md), value : [`boolean`](../../API/builtins/boolean.md)) {#insert}
`->`[`renoise.Document.ObservableBoolean`](../../API/renoise/renoise.Document.ObservableBoolean.md)  

Insert a new item to the end of the list when no position is specified, or
at the specified position. Returns the newly created and inserted Observable.
### `property`([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#property}
`->`[`renoise.Document.ObservableBoolean`](../../API/renoise/renoise.Document.ObservableBoolean.md)[`?`](../../API/builtins/nil.md)  

List item access by index. returns nil for non existing items.
### `remove`([*self*](../../API/builtins/self.md), pos : [`integer`](../../API/builtins/integer.md)) {#remove}
Removes an item (or the last one if no index is specified) from the list.
### `remove_notifier`([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction) | [`ListNotifierMemberContext`](#ListNotifierMemberContext)) {#remove_notifier}
Unregister a previously registered list notifier. When only passing an object,
all notifier functions that match the given object will be removed.
This will not fire errors when no methods for the given object are attached.
Trying to unregister a function or method which wasn't registered, will resolve
into an error.
### `size`([*self*](../../API/builtins/self.md)) {#size}
`->`[`integer`](../../API/builtins/integer.md)  

Returns the number of entries of the list.
### `swap`([*self*](../../API/builtins/self.md), pos1 : [`integer`](../../API/builtins/integer.md), pos2 : [`integer`](../../API/builtins/integer.md)) {#swap}
Swaps the positions of two items without adding/removing the items.

With a series of swaps you can move the item from/to any position.
### `to_string`([*self*](../../API/builtins/self.md)) {#to_string}
`->`[`string`](../../API/builtins/string.md)  

Serialize an object to a string.  



---  
## Aliases  
# alias ListElementAdded {#ListElementAdded}
{ index : [`integer`](../../API/builtins/integer.md), type : `"insert"` }  
  
  
# alias ListElementChange {#ListElementChange}
[`ListElementAdded`](#ListElementAdded) | [`ListElementRemoved`](#ListElementRemoved) | [`ListElementsSwapped`](#ListElementsSwapped)  
  
  
# alias ListElementRemoved {#ListElementRemoved}
{ index : [`integer`](../../API/builtins/integer.md), type : `"removed"` }  
  
  
# alias ListElementsSwapped {#ListElementsSwapped}
{ index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md), type : `"swapped"` }  
  
  
# alias ListNotifierFunction {#ListNotifierFunction}
(change : [`ListElementChange`](#ListElementChange))  
  
  
# alias ListNotifierMemberContext {#ListNotifierMemberContext}
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  

