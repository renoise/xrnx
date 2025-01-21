# table<a name="table"></a>  

<!-- toc -->
  

---  
## Functions
### create(t : [`table`](../../API/builtins/table.md)[`?`](../../API/builtins/nil.md))<a name="create"></a>
`->`[`table`](../../API/builtins/table.md) | tablelib  

> Create a new, or convert an exiting table to an object that uses the global
> 'table.XXX' functions as methods, just like strings in Lua do.
> #### examples:
> ```lua
> t = table.create(); t:insert("a"); rprint(t) -> [1] = a;
> t = table.create{1,2,3}; print(t:concat("|")); -> "1|2|3";
> ```
### is_empty(t : [`table`](../../API/builtins/table.md))<a name="is_empty"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true when the table is empty, else false and will also work
> for non indexed tables
> #### examples:
> ```lua
> t = {};          print(table.is_empty(t)); -> true;
> t = {66};        print(table.is_empty(t)); -> false;
> t = {["a"] = 1}; print(table.is_empty(t)); -> false;
### count(t : [`table`](../../API/builtins/table.md))<a name="count"></a>
> Count the number of items of a table, also works for non index
> based tables (using pairs).
> #### examples:
> ```lua
> t = {["a"]=1, ["b"]=1}; print(table.count(t)) --> 2
> ```
### find(t : [`table`](../../API/builtins/table.md), value : [`any`](../../API/builtins/any.md), start_index : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md))<a name="find"></a>
`->`key_or_nil : [`string`](../../API/builtins/string.md) | [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)  

> Find first match of *value* in the given table, starting from element
> number *start_index*.<br>
> Returns the first *key* that matches the value or nil
> #### examples:
> ```lua
> t = {"a", "b"}; table.find(t, "a") --> 1
> t = {a=1, b=2}; table.find(t, 2) --> "b"
> t = {"a", "b", "a"}; table.find(t, "a", 2) --> "3"
> t = {"a", "b"}; table.find(t, "c") --> nil
> ```
### keys(t : [`table`](../../API/builtins/table.md))<a name="keys"></a>
`->`[`table`](../../API/builtins/table.md)  

> Return an indexed table of all keys that are used in the table.
> #### examples:
> ```lua
> t = {a="aa", b="bb"}; rprint(table.keys(t)); --> "a", "b"
> t = {"a", "b"};       rprint(table.keys(t)); --> 1, 2
> ```
### values(t : [`table`](../../API/builtins/table.md))<a name="values"></a>
`->`[`table`](../../API/builtins/table.md)  

> Return an indexed table of all values that are used in the table
> #### examples:
> ```lua
>  t = {a="aa", b="bb"}; rprint(table.values(t)); --> "aa", "bb"
>  t = {"a", "b"};       rprint(table.values(t)); --> "a", "b"
> ```
### copy(t : [`table`](../../API/builtins/table.md))<a name="copy"></a>
`->`[`table`](../../API/builtins/table.md)  

> Copy the metatable and all first level elements of the given table into a
> new table. Use table.rcopy to do a recursive copy of all elements
### rcopy(t : [`table`](../../API/builtins/table.md))<a name="rcopy"></a>
`->`[`table`](../../API/builtins/table.md)  

> Deeply copy the metatable and all elements of the given table recursively
> into a new table - create a clone with unique references.
### clear(t : [`table`](../../API/builtins/table.md))<a name="clear"></a>
> Recursively clears and removes all table elements.  

