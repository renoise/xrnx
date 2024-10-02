# renoise.Socket.SocketClient  
> A SocketClient can connect to other socket servers and send and receive data
> from them on request. Connections to a server can not change, they are
> specified when constructing a client. You can not reconnect a client; create
> a new client instance instead.
> 
> Socket clients in Renoise do block with timeouts to receive messages, and
> assume that you only expect a response from a server after having sent
> something to it (i.e.: GET HTTP).
> To constantly poll a connection to a server, for example in idle timers,
> specify a timeout of 0 in "receive(message, 0)". This will only check if there
> are any pending messages from the server and read them. If there are no pending
> messages it will not block or timeout.  

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

### peer_address : [`string`](../../API/builtins/string.md) {#peer_address}
> **READ-ONLY** Address of the socket's peer, the socket address this client
> is connected to.

### peer_port : [`integer`](../../API/builtins/integer.md) {#peer_port}
> **READ-ONLY** Port of the socket's peer, the socket this client is
> connected to.

  

---  
## Functions
### close([*self*](../../API/builtins/self.md)) {#close}
> Closes the socket connection and releases all resources. This will make
> the socket useless, so any properties, calls to the socket will result in
> errors. Can be useful to explicitly release a connection without waiting for
> the dead object to be garbage collected, or if you want to actively refuse a
> connection.
### send([*self*](../../API/builtins/self.md), message : [`string`](../../API/builtins/string.md)) {#send}
`->`success : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Send a message string (or OSC messages or bundles) to the connected server.
> When sending fails, "success" return value will be false and "error_message"
> is set, describing the error in a human readable format.
> NB: when using TCP instead of UDP as protocol for OSC messages, !no! SLIP
> encoding and no size prefixing of the passed OSC data will be done here.
> So, when necessary, do this manually by your own please.
### receive([*self*](../../API/builtins/self.md), mode : [`SocketReceiveMode`](#SocketReceiveMode), timeout_ms : [`number`](../../API/builtins/number.md)) {#receive}
`->`success : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Receive a message string from the the connected server with the given
> timeout in milliseconds. Mode can be one of "*line", "*all" or a number > 0,
> like Lua's io.read. \param timeout can be 0, which is useful for
> receive("*all"). This will only check and read pending data from the
> sockets queue.
> 
> + mode "*line": Will receive new data from the server or flush pending data
>   that makes up a "line": a string that ends with a newline. remaining data
>   is kept buffered for upcoming receive calls and any kind of newlines
>   are supported. The returned line will not contain the newline characters.
> 
> + mode "*all": Reads all pending data from the peer socket and also flushes
>   internal buffers from previous receive line/byte calls (when present).
>   This will NOT read the entire requested content, but only the current
>   buffer that is queued for the local socket from the peer. To read an
>   entire HTTP page or file you may have to call receive("*all") multiple
>   times until you got all you expect to get.
> 
> + mode "number > 0": Tries reading \param NumberOfBytes of data from the
>   peer. Note that the timeout may be applied more than once, if more than
>   one socket read is needed to receive the requested block.
> 
> When receiving fails or times-out, the returned message will be nil and
> error_message is set. The error message is "timeout" on timeouts,
> "disconnected" when the server actively refused/disconnected your client.
> Any other errors are system dependent, and should only be used for display
> purposes.
> 
> Once you get an error from receive, and this error is not a "timeout", the
> socket will already be closed and thus must be recreated in order to retry
> communication with the server. Any attempt to use a closed socket will
> fire a runtime error.
> 
> ```lua
> mode:
>     | "*line"
>     | "*all"
> ```  



---  
## Local Aliases  
### SocketReceiveMode {#SocketReceiveMode}
[`integer`](../../API/builtins/integer.md) | `"*all"` | `"*line"`  
> ```lua
> SocketReceiveMode:
>     | "*line"
>     | "*all"
> ```  
  

