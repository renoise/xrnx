# io<a name="io"></a>  

<!-- toc -->
  

---  
## Functions
### exists(filename : [`string`](../../API/builtins/string.md))<a name="exists"></a>
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true when a file, folder or link at the given path and name exists
### stat(filename : [`string`](../../API/builtins/string.md))<a name="stat"></a>
`->`result : [`Stat`](#stat)[`?`](../../API/builtins/nil.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md), error_code : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)  

> Returns a table with status info about the file, folder or link at the given
> path and name, else nil the error and the error code is returned.
### chmod(filename : [`string`](../../API/builtins/string.md), mode : [`integer`](../../API/builtins/integer.md))<a name="chmod"></a>
`->`result : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md), error_code : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)  

> Change permissions of a file, folder or link. mode is a unix permission
> styled octal number (like 755 - WITHOUT a leading octal 0). Executable,
> group and others flags are ignored on windows and won't fire errors  



---  
## Structs  
# Stat<a name="Stat"></a>  
> return value for io.stat  

---  
## Properties
### dev : [`integer`](../../API/builtins/integer.md)<a name="dev"></a>
> device number of filesystem

### ino : [`integer`](../../API/builtins/integer.md)<a name="ino"></a>
> inode number

### mode : [`integer`](../../API/builtins/integer.md)<a name="mode"></a>
> unix styled file permissions

### type : `"file"` | `"directory"` | `"link"` | `"socket"` | `"named pipe"` | `"char device"` | `"block device"`<a name="type"></a>
### nlink : [`integer`](../../API/builtins/integer.md)<a name="nlink"></a>
> number of (hard) links to the file

### uid : [`integer`](../../API/builtins/integer.md)<a name="uid"></a>
> numeric user ID of file's owner

### gid : [`integer`](../../API/builtins/integer.md)<a name="gid"></a>
> numeric group ID of file's owner

### rdev : [`integer`](../../API/builtins/integer.md)<a name="rdev"></a>
> the device identifier (special files only)

### size : [`integer`](../../API/builtins/integer.md)<a name="size"></a>
> total size of file, in bytes

### atime : [`integer`](../../API/builtins/integer.md)<a name="atime"></a>
> last access time in seconds since the epoch

### mtime : [`integer`](../../API/builtins/integer.md)<a name="mtime"></a>
> last modify time in seconds since the epoch

### ctime : [`integer`](../../API/builtins/integer.md)<a name="ctime"></a>
> inode change time (NOT creation time!) in seconds

  

  

