# Global<a name="Global"></a>  

<!-- toc -->
  

---  
## Functions
### tostring(pattern_line : [`renoise.PatternLine`](../../API/renoise/renoise.PatternLine.md))<a name="tostring"></a>
`->`[`string`](../../API/builtins/string.md)  

> Receives a value of any type and converts it to a string in a human-readable format.
> 
> If the metatable of `v` has a `__tostring` field, then `tostring` calls the corresponding value with `v` as argument, and uses the result of the call as its result. Otherwise, if the metatable of `v` has a `__name` field with a string value, `tostring` may use that string in its final result.
> 
> For complete control of how numbers are converted, use [string.format](http://www.lua.org/manual/5.4/manual.html#pdf-string.format).
> 
> 
> [View documents](http://www.lua.org/manual/5.4/manual.html#pdf-tostring)
### ripairs(table : <T:table>)<a name="ripairs"></a>
`->`fun(table: <V>[], i?: integer):integer, <V>, <T:table>, i : [`integer`](../../API/builtins/integer.md)  

> An iterator like ipairs, but in reverse order.
> #### examples:
> ```lua
> t = {"a", "b", "c"}
> for k,v in ripairs(t) do print(k, v) end -> "3 c, 2 b, 1 a"
> ```
### objinfo(object : [`userdata`](../../API/builtins/userdata.md))<a name="objinfo"></a>
`->`[`string`](../../API/builtins/string.md)[]  

> Return a string which lists properties and methods of class objects.
### oprint(object : [`userdata`](../../API/builtins/userdata.md))<a name="oprint"></a>
> Dumps properties and methods of class objects (like renoise.app()).
### rprint(value : [`any`](../../API/builtins/any.md))<a name="rprint"></a>
> Recursively dumps a table and all its members to the std out (console).
> This works for standard Lua types and class objects as well.
### class(name : [`string`](../../API/builtins/string.md))<a name="class"></a>
`->`[`function`](../../API/builtins/function.md)  

> Luabind "class" registration. Registers a global class object and returns a
> closure to optionally set the base class.
> 
> See also [Luabind class](https://luabind.sourceforge.net/docs.html#class_lua)
> 
> #### examples
> ```lua
> ---@class Animal
> -- Construct a new animal with the given name.
> ---@overload fun(string): Animal
> Animal = {}
> class 'Animal'
>   ---@param name string
>   function Animal:__init(name)
>     self.name = name
>     self.can_fly = nil
>   end
>   function Animal:show()
>     return ("I am a %s (%s) and I %s fly"):format(self.name, type(self),
>       (self.can_fly and "can fly" or "can not fly"))
>   end
> 
> -- Mammal class (inherits Animal functions and members)
> ---@class Mammal : Animal
> -- Construct a new mamal with the given name.
> ---@overload fun(string): Mammal
> Mammal = {}
> class 'Mammal' (Animal)
>   ---@param name string
>   function Mammal:__init(name)
>     Animal.__init(self, name)
>     self.can_fly = false
>   end
> 
> -- show() function and base member are available for Mammal too
> local mamal = Mammal("Cow")
> mamal:show()
> ```
### type(value : [`any`](../../API/builtins/any.md))<a name="type"></a>
`->`[`string`](../../API/builtins/string.md)  

> Returns the type of its only argument, coded as a string. The possible results of this function are `"nil"` (a string, not the value `nil`), `"number"`, `"string"`, `"boolean"`, `"table"`, `"function"`, `"thread"`, and `"userdata"`.
> 
> 
> [View documents](http://www.lua.org/manual/5.4/manual.html#pdf-type)
> 
> 
> ```lua
> type:
>     | "nil"
>     | "number"
>     | "string"
>     | "boolean"
>     | "table"
>     | "function"
>     | "thread"
>     | "userdata"
> ```
### rawequal(obj1 : [`any`](../../API/builtins/any.md), obj2 : [`any`](../../API/builtins/any.md))<a name="rawequal"></a>
> Checks whether v1 is equal to v2, without invoking the `__eq` metamethod.
> 
> [View documents](http://www.lua.org/manual/5.4/manual.html#pdf-rawequal)  

