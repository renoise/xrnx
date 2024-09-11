# renoise.Document.ObservableList  
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).  

<!-- toc -->
  

---  
## Functions
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction)) {#add_notifier}
> Register a function or method as a notifier, which will be called as soon as
> the observable lists layout changed. The passed notifier can either be a function
> or a table with a function and some context (an "object") -> method.
### has_notifier([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction)) {#has_notifier}
> Checks if the given function, method was already registered as notifier.
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction) | [`ListNotifierMemberContext`](#ListNotifierMemberContext)) {#remove_notifier}
> Unregister a previously registered list notifier. When only passing an object,
> all notifier functions that match the given object will be removed.
> This will not fire errors when no methods for the given object are attached.
> Trying to unregister a function or method which wasn't registered, will resolve
> into an error.
### size([*self*](../../API/builtins/self.md)) {#size}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the number of entries of the list.  



---  
## Local Aliases  
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
  
  

