# renoise.Document.ObservableList<a name="renoise.Document.ObservableList"></a>  
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).  

<!-- toc -->
  

---  
## Functions
### size([*self*](../../API/builtins/self.md))<a name="size"></a>
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the number of entries of the list.
### has_notifier([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction))<a name="has_notifier"></a>
> Checks if the given function, method was already registered as notifier.
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction))<a name="add_notifier"></a>
> Register a function or method as a notifier, which will be called as soon as
> the observable lists layout changed. The passed notifier can either be a function
> or a table with a function and some context (an "object") -> method.
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction) | [`ListNotifierMemberContext`](#ListNotifierMemberContext))<a name="remove_notifier"></a>
> Unregister a previously registered list notifier. When only passing an object,
> all notifier functions that match the given object will be removed.
> This will not fire errors when no methods for the given object are attached.
> Trying to unregister a function or method which wasn't registered, will resolve
> into an error.  



---  
## Aliases  
### ListElementAdded<a name="ListElementAdded"></a>
{ index : [`integer`](../../API/builtins/integer.md), type : `"insert"` }  
  
  
### ListElementChange<a name="ListElementChange"></a>
[`ListElementAdded`](#ListElementAdded) | [`ListElementRemoved`](#ListElementRemoved) | [`ListElementsSwapped`](#ListElementsSwapped)  
  
  
### ListElementRemoved<a name="ListElementRemoved"></a>
{ index : [`integer`](../../API/builtins/integer.md), type : `"removed"` }  
  
  
### ListElementsSwapped<a name="ListElementsSwapped"></a>
{ index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md), type : `"swapped"` }  
  
  
### ListNotifierFunction<a name="ListNotifierFunction"></a>
(change : [`ListElementChange`](#ListElementChange))  
  
  
### ListNotifierMemberContext<a name="ListNotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  

