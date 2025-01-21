# renoise.Document.ObservableBooleanList<a name="renoise.Document.ObservableBooleanList"></a>  
> A observable list of boolean values.  

<!-- toc -->
  

---  
## Functions
### to_string([*self*](../../API/builtins/self.md))<a name="to_string"></a>
`->`[`string`](../../API/builtins/string.md)  

> Serialize an object to a string.
### from_string([*self*](../../API/builtins/self.md), string : [`any`](../../API/builtins/any.md))<a name="from_string"></a>
`->`[`string`](../../API/builtins/string.md)  

> Assign the object's value from a string - when possible. Errors are
> silently ignored.
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
### property([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="property"></a>
`->`[`renoise.Document.ObservableBoolean`](../../API/renoise/renoise.Document.ObservableBoolean.md)[`?`](../../API/builtins/nil.md)  

> List item access by index. returns nil for non existing items.
### find([*self*](../../API/builtins/self.md), start_pos : [`integer`](../../API/builtins/integer.md), value : [`boolean`](../../API/builtins/boolean.md))<a name="find"></a>
`->`[`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)  

> Find a value in the list by comparing the list values with the passed
> value. The first successful match is returned. When no match is found, nil
> is returned.
### insert([*self*](../../API/builtins/self.md), pos : [`integer`](../../API/builtins/integer.md), value : [`boolean`](../../API/builtins/boolean.md))<a name="insert"></a>
`->`[`renoise.Document.ObservableBoolean`](../../API/renoise/renoise.Document.ObservableBoolean.md)  

> Insert a new item to the end of the list when no position is specified, or
> at the specified position. Returns the newly created and inserted Observable.
### remove([*self*](../../API/builtins/self.md), pos : [`integer`](../../API/builtins/integer.md))<a name="remove"></a>
> Removes an item (or the last one if no index is specified) from the list.
### swap([*self*](../../API/builtins/self.md), pos1 : [`integer`](../../API/builtins/integer.md), pos2 : [`integer`](../../API/builtins/integer.md))<a name="swap"></a>
> Swaps the positions of two items without adding/removing the items.
> 
> With a series of swaps you can move the item from/to any position.  



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
  
  

