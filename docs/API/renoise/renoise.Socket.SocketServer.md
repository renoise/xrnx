# renoise.Socket.SocketServer  
> A SocketServer handles one or more clients in the background, interacts
> only with callbacks from connected clients. This background polling can be
> start and stop on request.
> 
> The socket server interface in Renoise is asynchronous (callback based), which
> means server calls never block or wait, but are served in the background.
> As soon a connection is established or messages arrive, a set of specified
> callbacks are invoked to respond to messages.  

<!-- toc -->
  

---  
## Properties
### is_open : [`boolean`](../../API/builtins/boolean.md) {#is_open}
> **READ-ONLY** Returns true when the socket object is valid and connected.
> Sockets can manually be closed (see socket:close()). Client sockets can also
> actively be closed/refused by the server. In this case the client:receive()
> calls will fail and return an error.

### local_address : [`string`](../../API/builtins/string.md) {#local_address}
> **READ-ONLY** The socket's resolved local address (for example "127.0.0.1"
> when a socket is bound to "localhost")

### local_port : [`integer`](../../API/builtins/integer.md) {#local_port}
> **READ-ONLY** The socket's local port number, as specified when instantiated.

### is_running : [`boolean`](../../API/builtins/boolean.md) {#is_running}
> **READ-ONLY** true while the server is running, else false.

  

---  
## Functions
### close([*self*](../../API/builtins/self.md)) {#close}
> Closes the socket connection and releases all resources. This will make
> the socket useless, so any properties, calls to the socket will result in
> errors. Can be useful to explicitly release a connection without waiting for
> the dead object to be garbage collected, or if you want to actively refuse a
> connection.
### run([*self*](../../API/builtins/self.md), notifier_table : [`NotifierClass`](#notifierclass) | [`NotifierTable`](#notifiertable)) {#run}
> Start running the server by specifying a class or table which defines the
> callback functions for the server.
### stop([*self*](../../API/builtins/self.md)) {#stop}
> Stop a running server.
### wait([*self*](../../API/builtins/self.md), timeout : [`number`](../../API/builtins/number.md)) {#wait}
> Suspends the calling thread by the given timeout, and calls the server's
> callback methods as soon as something has happened in the server while
> waiting. Should be avoided whenever possible.  



---  
## Local Structs  
# NotifierClass  
> Custom notifier class for `renoise.Socket.SocketServer:run`.
> Note: You must pass an instance of a class, like server_socket:run(MyNotifier())
> 
> All callback properties are optional. So you can, for example, skip specifying
> "socket_accepted" if you have no use for this.
> 
> #### examples:
> ```lua
> class "MyNotifier"
> function MyNotifier:__init()
>   -- could pass a server ref or something else here, or simply do nothing
> end
> function MyNotifier:socket_error(error_message)
>   -- do something with the error message
> end
> function MyNotifier:socket_accepted(socket)
>   -- FOR TCP CONNECTIONS ONLY: do something with socket
> end
> function MyNotifier:socket_message(socket, message)
>   -- do something with socket and message
> end
> ```  

<!-- toc -->
  

---  
## Properties
### socket_error : (self : [`any`](../../API/builtins/any.md), error_message : [`string`](../../API/builtins/string.md))[`?`](../../API/builtins/nil.md) {#socket_error}
### socket_accepted : (self : [`any`](../../API/builtins/any.md), socket : [`renoise.Socket.SocketClient`](../../API/renoise/renoise.Socket.SocketClient.md))[`?`](../../API/builtins/nil.md) {#socket_accepted}
### socket_message : (self : [`any`](../../API/builtins/any.md), socket : [`renoise.Socket.SocketClient`](../../API/renoise/renoise.Socket.SocketClient.md), message : [`string`](../../API/builtins/string.md))[`?`](../../API/builtins/nil.md) {#socket_message}
  

  
# NotifierTable  
> Notifier table for `renoise.Socket.SocketServer:run`.
> 
> All callback properties are optional. So you can, for example, skip specifying
> "socket_accepted" if you have no use for this.
> 
> #### examples:
> ```lua
> {
>   socket_error = function(error_message)
>     -- do something with the error message
>   end,
>   socket_accepted = function(client)
>     -- FOR TCP CONNECTIONS ONLY: do something with client
>   end,
>   socket_message = function(client, message)
>     -- do something with client and message
>   end
> }
> ```  

<!-- toc -->
  

---  
## Properties
### socket_error : (error_message : [`string`](../../API/builtins/string.md))[`?`](../../API/builtins/nil.md) {#socket_error}
> An error happened in the servers background thread.

### socket_accepted : (client : [`renoise.Socket.SocketClient`](../../API/renoise/renoise.Socket.SocketClient.md))[`?`](../../API/builtins/nil.md) {#socket_accepted}
> FOR TCP CONNECTIONS ONLY: called as soon as a new client
> connected to your server. The passed socket is a ready to use socket
> object, representing a connection to the new socket.

### socket_message : (client : [`renoise.Socket.SocketClient`](../../API/renoise/renoise.Socket.SocketClient.md), message : [`string`](../../API/builtins/string.md))[`?`](../../API/builtins/nil.md) {#socket_message}
> A message was received from a client: The passed socket is a ready
> to use connection for TCP connections. For UDP, a "dummy" socket is
> passed, which can only be used to query the peer address and port
> -> socket.port and socket.address

  

  

