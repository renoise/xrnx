# renoise.Socket  
> Interfaces for built-in socket support for Lua scripts in Renoise.
> 
> Right now UDP and TCP protocols are supported. The class interfaces for UDP
> and TCP sockets behave exactly the same. That is, they don't depend on the
> protocol, so both are easily interchangeable when needed.  

<!-- toc -->
  
## Constants
### Protocol {#Protocol}
> ```lua
> {
>     PROTOCOL_TCP: integer = 1,
>     PROTOCOL_UDP: integer = 2,
> }
> ```
  

---  
## Functions
### create_client(server_address : [`string`](../../API/builtins/string.md), server_port : [`integer`](../../API/builtins/integer.md), protocol : [`renoise.Socket.Protocol`](renoise.Socket.md#Protocol)[`?`](../../API/builtins/nil.md), timeout : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)) {#create_client}
`->`client : [`renoise.Socket.SocketClient`](../../API/renoise/renoise.Socket.SocketClient.md)[`?`](../../API/builtins/nil.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Create a connected UPD or TCP client.
> `protocol` can be `renoise.Socket.PROTOCOL_TCP` or
> `renoise.Socket.PROTOCOL_UDP` (by default TCP).
> `timeout` is the time in ms to wait until the connection is established
> (1000 ms by default). When instantiation and connection succeed, a valid client
> object is returned, otherwise "error" is set and the client object is nil
### create_server(server_address : [`string`](../../API/builtins/string.md), server_port : [`integer`](../../API/builtins/integer.md), protocol : [`renoise.Socket.Protocol`](renoise.Socket.md#Protocol)[`?`](../../API/builtins/nil.md)) {#create_server}
`->`[`renoise.Socket.SocketServer`](../../API/renoise/renoise.Socket.SocketServer.md)[`?`](../../API/builtins/nil.md), [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Creates a connected UPD or TCP server object. Use "localhost" to use your
> system's default network address. Protocol can be `renoise.Socket.PROTOCOL_TCP`
> or `renoise.Socket.PROTOCOL_UDP` (by default TCP).
> When instantiation and connection succeed, a valid server object is
> returned, otherwise "error" is set and the server object is nil.
> Using the create function with no server_address allows you to create a
> server which allows connections to any address (for example localhost
> and some IP)  

