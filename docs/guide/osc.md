# Osc

The Renoise API allows you to create web sockets and provides tools to receive and send OSC data. This allows you to connect your tools to other OSC servers and send OSC data to existing clients.

In general, this can be used as an alternative to MIDI, e.g. to connect to OSC-enabled devices such as [monome](https://monome.org/docs/serialosc/osc).

Note: Using TCP instead of UDP as the socket protocol would likely also require manual [SLIP encoding/decoding](https://en.wikipedia.org/wiki/Serial_Line_Internet_Protocol) of OSC message data. This is omitted here, so the examples below will only work with UDP servers/clients.

## Osc Server (receive Osc from one or more Clients)

```lua
-- create some shortcuts
local OscMessage = renoise.Osc.Message
local OscBundle = renoise.Osc.Bundle

-- open a socket connection to the server
local server, socket_error = renoise.Socket.create_server(
  "localhost", 8008, renoise.Socket.PROTOCOL_UDP)
   
if (socket_error) then 
  renoise.app():show_warning(("Failed to start the " .. 
    "OSC server. Error: '%s'"):format(socket_error))
  return
end

server:run {
  socket_message = function(socket, data)
    -- decode the data to Osc
    local message_or_bundle, osc_error = renoise.Osc.from_binary_data(data)
    
    -- show what we've got
    if (message_or_bundle) then
      if (type(message_or_bundle) == "Message") then
        print(("Got OSC message: '%s'"):format(tostring(message_or_bundle)))

      elseif (type(message_or_bundle) == "Bundle") then
        print(("Got OSC bundle: '%s'"):format(tostring(message_or_bundle)))
      
      else
        -- never will get in here
      end
      
    else
      print(("Got invalid OSC data, or data which is not " .. 
        "OSC data at all. Error: '%s'"):format(osc_error))
    end
    
    socket:send(("%s:%d: Thank you so much for the OSC message. " ..
      "Here's one in return:"):format(socket.peer_address, socket.peer_port))
      
    -- open a socket connection to the client
    local client, socket_error = renoise.Socket.create_client(
      socket.peer_address, socket.peer_port, renoise.Socket.PROTOCOL_UDP)
  
    if (not socket_error) then 
      client:send(OscMessage("/flowers"))
    end
  end    
}

-- shut off the server at any time with:
-- server:close()
```


## Osc Client & Message Construction (send Osc to a Server)

```lua
-- create some shortcuts
local OscMessage = renoise.Osc.Message
local OscBundle = renoise.Osc.Bundle

-- open a socket connection to the server
local client, socket_error = renoise.Socket.create_client(
  "localhost", 8008, renoise.Socket.PROTOCOL_UDP)
   
if (socket_error) then 
  renoise.app():show_warning(("Failed to start the " .. 
    "OSC client. Error: '%s'"):format(socket_error))
  return
end

-- construct and send messages
client:send(
  OscMessage("/someone/transport/start")
)

client:send(
  OscMessage("/someone/transport/bpm", { 
    {tag="f", value=127.5} 
  })
)

-- construct and send bundles
client:send(
  OscBundle(os.clock(), OscMessage("/someone/transport/start"))
)

local message1 = OscMessage("/some/message")

local message2 = OscMessage("/another/one", { 
  {tag="b", value="with some blob data"},
  {tag="s", value="and a string"} 
})

client:send(
  OscBundle(os.clock(), {message1, message2})
)
```