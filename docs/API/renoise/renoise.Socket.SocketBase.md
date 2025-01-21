# renoise.Socket.SocketBase<a name="renoise.Socket.SocketBase"></a>  
> SocketBase is the base class for socket clients and servers. All
> SocketBase properties and functions are available for servers and clients.  

<!-- toc -->
  

---  
## Properties
### is_open : [`boolean`](../../API/builtins/boolean.md)<a name="is_open"></a>
> **READ-ONLY** Returns true when the socket object is valid and connected.
> Sockets can manually be closed (see socket:close()). Client sockets can also
> actively be closed/refused by the server. In this case the client:receive()
> calls will fail and return an error.

### local_address : [`string`](../../API/builtins/string.md)<a name="local_address"></a>
> **READ-ONLY** The socket's resolved local address (for example "127.0.0.1"
> when a socket is bound to "localhost")

### local_port : [`integer`](../../API/builtins/integer.md)<a name="local_port"></a>
> **READ-ONLY** The socket's local port number, as specified when instantiated.

  

---  
## Functions
### close([*self*](../../API/builtins/self.md))<a name="close"></a>
> Closes the socket connection and releases all resources. This will make
> the socket useless, so any properties, calls to the socket will result in
> errors. Can be useful to explicitly release a connection without waiting for
> the dead object to be garbage collected, or if you want to actively refuse a
> connection.  

