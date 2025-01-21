# os<a name="os"></a>  

<!-- toc -->
  

---  
## Functions
### `platform()`<a name="platform"></a>
`->``"LINUX"` | `"MACINTOSH"` | `"WINDOWS"`  

> Returns the platform the script is running on:
> 
> ```lua
> return #1:
>     | "WINDOWS"
>     | "MACINTOSH"
>     | "LINUX"
> ```
### `currentdir()`<a name="currentdir"></a>
`->`path : [`string`](../../API/builtins/string.md)  

> Returns the current working dir. Will always be the scripts directory
> when executing a script from a file
### dirnames(path : [`any`](../../API/builtins/any.md))<a name="dirnames"></a>
`->`paths : [`string`](../../API/builtins/string.md)[]  

> Returns a list of directory names (names, not full paths) for the given
> parent directory. Passed directory must be valid, or an error will be thrown.
### filenames(path : [`string`](../../API/builtins/string.md), file_extensions : [`string`](../../API/builtins/string.md)[][`?`](../../API/builtins/nil.md))<a name="filenames"></a>
`->`paths : [`string`](../../API/builtins/string.md)[]  

> Returns a list file names (names, not full paths) for the given
> parent directory. Second optional argument is a list of file extensions that
> should be searched for, like {"*.wav", "*.txt"}. By default all files are
> matched. The passed directory must be valid, or an error will be thrown.
### mkdir(path : [`string`](../../API/builtins/string.md))<a name="mkdir"></a>
`->`[`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md), [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Creates a new directory. mkdir can only create one new sub directory at the
> same time. If you need to create more than one sub dir, call mkdir multiple
> times. Returns true if the operation was successful; in case of error, it
> returns nil plus an error string.
### move(src : [`string`](../../API/builtins/string.md), dest : [`string`](../../API/builtins/string.md))<a name="move"></a>
`->`[`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md), [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Moves a file or a directory from path 'src' to 'dest'. Unlike 'os.rename'
> this also supports moving a file from one file system to another one. Returns
> true if the operation was successful; in case of error, it returns nil plus
> an error string.
### tmpname(extension : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md))<a name="tmpname"></a>
`->`[`string`](../../API/builtins/string.md)  

> Returns a string with a file name that can be used for a temporary file.
> 
> [View documents](http://www.lua.org/manual/5.4/manual.html#pdf-os.tmpname)
### `clock()`<a name="clock"></a>
`->`[`number`](../../API/builtins/number.md)  

> Returns an approximation of the amount in seconds of CPU time used by the program.
> 
> [View documents](http://www.lua.org/manual/5.4/manual.html#pdf-os.clock)
### `exit()`<a name="exit"></a>
> Calls the ISO C function `exit` to terminate the host program.
> 
> [View documents](http://www.lua.org/manual/5.4/manual.html#pdf-os.exit)  

