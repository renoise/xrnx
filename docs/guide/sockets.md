# Sockets

The Renoise API allows you to create [network sockets](https://en.wikipedia.org/wiki/Network_socket). This can be used to communicate with other devices and applications via UDP and TCP, for example, to send or receive [OSC messages](./osc.md).

See the [`renoise.Socket`](../API/renoise/renoise.Socket.md) API for more details.

> [!NOTE]
> There is no built-in support for encrypted connections. Therefore, using protocols like HTTPS is not directly possible with the socket API in Renoise.

## HTTP GET Client

This example creates a TCP socket, connects to a web server, and sends a simple HTTP GET request.

```lua
-- Connection will give up after 2 seconds
local connection_timeout = 2000

local client, socket_error = renoise.Socket.create_client(
  "www.renoise.com", 80, renoise.Socket.PROTOCOL_TCP, connection_timeout)
   
if socket_error then 
  renoise.app():show_warning(socket_error)
  return
end

-- Request the root document
local succeeded, socket_error = 
  client:send("GET / HTTP/1.0\r\nHost: www.renoise.com\r\n\r\n")

if (socket_error) then 
  renoise.app():show_warning(socket_error)
  return
end

-- Loop until we get no more data from the server.
-- Note: A robust implementation should parse the HTTP header
-- and use the "Content-Length" to determine when to stop.
local receive_succeeded = false
local receive_content = ""

while (true) do
  -- Timeout for receiving data is 500ms
  local receive_timeout = 500
  
  local message, socket_error = 
    client:receive("*line", receive_timeout)
    
  if (message) then 
    receive_content = receive_content .. message .. "\n"
  else
    if (socket_error == "timeout" or 
        socket_error == "disconnected") 
    then
      -- Could retry on timeout, but we'll just stop in this example.
      receive_succeeded = true
      break
    else
      renoise.app():show_warning(
        "'socket receive' failed with the error: " .. socket_error)
      break
    end
  end
end
  
-- Close the connection if it was not already closed by the server
if (client and client.is_open) then
  client:close()
end

-- Show what we've got
if (receive_succeeded and #receive_content > 0) then
  renoise.app():show_prompt(
    "HTTP GET Response", 
    receive_content, 
    {"OK"}
  )
else
  renoise.app():show_prompt(
    "HTTP GET Response", 
    "Socket receive timeout or no content.", 
    {"OK"}
  ) 
end
```

## Echo UDP Server (using a table as notifier)

```lua
local server, socket_error = renoise.Socket.create_server(
  "localhost", 1025, renoise.Socket.PROTOCOL_UDP)
   
if socket_error then 
  renoise.app():show_warning(
     "Failed to start the echo server: " .. socket_error)
else
  server:run {
    ---@param socket_error string
    socket_error = function(socket_error)
      renoise.app():show_warning(socket_error)
    end,
    
    ---@param socket renoise.Socket.SocketClient
    socket_accepted = function(socket)
      print(("client %s:%d connected"):format(
        socket.peer_address, socket.peer_port))
    end,
  
    ---@param socket renoise.Socket.SocketClient
    ---@param message string
    socket_message = function(socket, message)
      print(("client %s:%d sent '%s'"):format(
        socket.peer_address, socket.peer_port,  message))
      -- Simply send the message back      
      socket:send(message)
    end    
  }
end
-- This server will run and echo messages as long as the script is active.
```

## Echo TCP Server (using a class as notifier)

This example allows any address to connect by not specifying an address in `create_server`.

```lua
class "EchoServer"
  function EchoServer:__init(port)
    -- Create a server socket
    local server, socket_error = renoise.Socket.create_server(
      "localhost", port, renoise.Socket.PROTOCOL_TCP)
     
    if socket_error then 
      renoise.app():show_warning(
        "Failed to start the echo server: " .. socket_error)
    else
      -- Start running
      self.server = server
      self.server:run(self)
    end
  end

  ---@param socket_error string
  function EchoServer:socket_error(socket_error)
    renoise.app():show_warning(socket_error)
  end
  
  ---@param socket renoise.Socket.SocketClient
  function EchoServer:socket_accepted(socket)
    print(("client %s:%d connected"):format(
      socket.peer_address, socket.peer_port))
  end

  ---@param message string
  ---@param socket renoise.Socket.SocketClient
  function EchoServer:socket_message(socket, message)
    print(("client %s:%d sent '%s'"):format(
      socket.peer_address, socket.peer_port,  message))
    -- Simply send the message back      
    socket:send(message)
  end
  
-- Create and run the echo server on port 1025
local echo_server = EchoServer(1025)

-- The server will run as long as the script is active or the
-- echo_server object is garbage collected.
```
