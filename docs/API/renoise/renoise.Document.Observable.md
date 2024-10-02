# renoise.Document.Observable  
> Track changes to document properties or general states by attaching listener
> functions to it.  

<!-- toc -->
  

---  
## Functions
### has_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction)) {#has_notifier}
`->`[`boolean`](../../API/builtins/boolean.md)  

> Checks if the given function, method was already registered as notifier.
### add_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction)) {#add_notifier}
> Register a function or method as a notifier, which will be called as soon as
> the observable's value changed. The passed notifier can either be a function
> or a table with a function and some context (an "object") -> method.
> ### example:
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
### remove_notifier([*self*](../../API/builtins/self.md), notifier : [`NotifierFunction`](#NotifierFunction) | [`NotifierMemberContext`](#NotifierMemberContext)) {#remove_notifier}
> Unregister a previously registered notifier. When only passing an object,
> all notifier functions that match the given object will be removed.
> This will not fire errors when no methods for the given object are attached.
> Trying to unregister a function or method which wasn't registered, will resolve
> into an error.  



---  
## Local Aliases  
### NotifierFunction {#NotifierFunction}
fun()  
  
  
### NotifierMemberContext {#NotifierMemberContext}
[`table`](../../API/builtins/table.md) | [`userdata`](../../API/builtins/userdata.md)  
  
  

