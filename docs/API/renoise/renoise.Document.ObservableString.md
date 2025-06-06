# renoise.Document.ObservableString<a name="renoise.Document.ObservableString"></a>  

<!-- toc -->
  

---  
## Properties
### value : [`string`](../../API/builtins/string.md)<a name="value"></a>
> Read/write access to the value of an Observable.

  

---  
## Functions
### has_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction))<a name="has_notifier"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Checks if the given function, method was already registered as notifier.
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction))<a name="add_notifier"></a>
> Register a function or method as a notifier, which will be called as soon as
> the observable's value changed. The passed notifier can either be a function
> or a table with a function and some context (an "object") -> method.
> #### examples:
> ```lua
> renoise.song().transport.bpm_observable:add_notifier(function()
>   print("BPM changed")
> end)
> 
> local my_context = { bpm_changes = 0, something_else = "bla" }
> renoise.song().transport.bpm_observable:add_notifier({
>   my_context,
>   function(context)
>     context.bpm_changes = context.bpm_changes + 1;
>     print(("#BPM changes: %s"):format(context.bpm_changes));
>   end
> })
> ```
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction) | [`NotifierMemberContext`](#NotifierMemberContext))<a name="remove_notifier"></a>
> Unregister a previously registered notifier. When only passing an object,
> all notifier functions that match the given object will be removed.
> This will not fire errors when no methods for the given object are attached.
> Trying to unregister a function or method which wasn't registered, will resolve
> into an error.
### to_string([*self*](../../API/builtins/self.md))<a name="to_string"></a>
`->`[`string`](../../API/builtins/string.md)  

> Serialize an object to a string.
### from_string([*self*](../../API/builtins/self.md), string : [`any`](../../API/builtins/any.md))<a name="from_string"></a>
`->`[`string`](../../API/builtins/string.md)  

> Assign the object's value from a string - when possible. Errors are
> silently ignored.  



---  
## Aliases  
### NotifierFunction<a name="NotifierFunction"></a>
fun()  
  
  
### NotifierMemberContext<a name="NotifierMemberContext"></a>
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  

