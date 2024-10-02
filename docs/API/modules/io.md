# io  

<!-- toc -->
  

---  
## Functions
### exists(filename : [`string`](../../API/builtins/string.md)) {#exists}
`->`[`boolean`](../../API/builtins/boolean.md)  

> Returns true when a file, folder or link at the given path and name exists
### stat(filename : [`string`](../../API/builtins/string.md)) {#stat}
`->`result : [`Stat`](#stat)[`?`](../../API/builtins/nil.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md), error_code : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)  

> Returns a table with status info about the file, folder or link at the given
> path and name, else nil the error and the error code is returned.
### chmod(filename : [`string`](../../API/builtins/string.md), mode : [`integer`](../../API/builtins/integer.md)) {#chmod}
`->`result : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md), error_code : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)  

> Change permissions of a file, folder or link. mode is a unix permission
> styled octal number (like 755 - WITHOUT a leading octal 0). Executable,
> group and others flags are ignored on windows and won't fire errors  



---  
## Local Structs  
# Stat  
> return value for io.stat  

<!-- toc -->
  

---  
## Properties
### dev : [`integer`](../../API/builtins/integer.md) {#dev}
> device number of filesystem

### ino : [`integer`](../../API/builtins/integer.md) {#ino}
> inode number

### mode : [`integer`](../../API/builtins/integer.md) {#mode}
> unix styled file permissions

### type : `"file"` | `"directory"` | `"link"` | `"socket"` | `"named pipe"` | `"char device"` | `"block device"` {#type}
### nlink : [`integer`](../../API/builtins/integer.md) {#nlink}
> number of (hard) links to the file

### uid : [`integer`](../../API/builtins/integer.md) {#uid}
> numeric user ID of file's owner

### gid : [`integer`](../../API/builtins/integer.md) {#gid}
> numeric group ID of file's owner

### rdev : [`integer`](../../API/builtins/integer.md) {#rdev}
> the device identifier (special files only)

### size : [`integer`](../../API/builtins/integer.md) {#size}
> total size of file, in bytes

### atime : [`integer`](../../API/builtins/integer.md) {#atime}
> last access time in seconds since the epoch

### mtime : [`integer`](../../API/builtins/integer.md) {#mtime}
> last modify time in seconds since the epoch

### ctime : [`integer`](../../API/builtins/integer.md) {#ctime}
> inode change time (NOT creation time!) in seconds

  

  

