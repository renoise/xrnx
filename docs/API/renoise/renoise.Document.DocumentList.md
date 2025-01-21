# renoise.Document.DocumentList<a name="renoise.Document.DocumentList"></a>  
> A document list is a document sub component which may contain other document
> nodes in an observable list.
> 
> ### example:
> ```lua
> -- our goal here is to have a document that contains a list of documents
> -- which can loaded as preferences for our tool
> --
> -- define a class model for our complex type for document items in the list
> -- so that Renoise knows how to load it later our entries will have
> renoise.Document.create("Entry") {
>   name = renoise.Document.ObservableString(),
>   path = renoise.Document.ObservableString(),
> }
> 
> -- create new entry instances with the given data
> function create_entry(name, path)
>   local entry = renoise.Document.instantiate("Entry")
>   entry.name.value = name
>   entry.path.value = path
>   return entry
> end
> 
> -- define a class model for our preferences which is using a list of entries
> renoise.Document.create("MyPreferences") {
>   list = renoise.Document.DocumentList()
> }
> 
> -- assign a fresh instance of our main document as preferences
> local preferences = renoise.Document.instantiate("MyPreferences")
> renoise.tool().preferences = preferences
> 
> -- insert elements into the list using :insert(index, element)
> -- we call our helper to create an instance of Entry
> preferences.list:insert(1, create_entry("some name", "some/path"))
> 
> -- access entries by using :property(index)
> print(preferences.list:property(1).name)
> 
> -- get the size of the list (you can use :size() as well)
> print(#preferences.list)
> 
> -- loop over the list to print all entries
> for i = 1, #preferences.list do
>   local entry = preferences.list:property(i)
>   print(i)
>   print(entry.name)
>   print(entry.path)
> end
> 
> -- try reloading your tool to see the list get bigger
> ```  

<!-- toc -->
  

---  
## Functions
### size([*self*](../../API/builtins/self.md))<a name="size"></a>
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the number of entries of the list.
### property([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="property"></a>
`->`[`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md)[`?`](../../API/builtins/nil.md)  

> List item access by index. returns nil for non existing items.
### find([*self*](../../API/builtins/self.md), start_pos : [`integer`](../../API/builtins/integer.md), value : [`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md))<a name="find"></a>
`->`[`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)  

> Find a value in the list by comparing the list values with the passed
> value. The first successful match is returned. When no match is found, nil
> is returned.
### insert([*self*](../../API/builtins/self.md), pos : [`integer`](../../API/builtins/integer.md), value : [`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md))<a name="insert"></a>
`->`[`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md)  

> Insert a new item to the end of the list when no position is specified, or
> at the specified position. Returns the newly created and inserted Observable.
### remove([*self*](../../API/builtins/self.md), pos : [`integer`](../../API/builtins/integer.md))<a name="remove"></a>
> Removes an item (or the last one if no index is specified) from the list.
### swap([*self*](../../API/builtins/self.md), pos1 : [`integer`](../../API/builtins/integer.md), pos2 : [`integer`](../../API/builtins/integer.md))<a name="swap"></a>
> Swaps the positions of two items without adding/removing the items.
> 
> With a series of swaps you can move the item from/to any position.
### has_notifier([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction))<a name="has_notifier"></a>
> Checks if the given function, method was already registered as notifier.
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`ListNotifierFunction`](#ListNotifierFunction))<a name="add_notifier"></a>
> Register a function or method as a notifier, which will be called as soon as
> the document lists layout changed. The passed notifier can either be a function
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
  
  

