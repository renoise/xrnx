# OSC

The Renoise API allows you to create sockets and provides tools to send and receive Open Sound Control (OSC) data. This enables you to connect your tools to other OSC servers and clients, offering an alternative to MIDI for controlling and interacting with devices like a [monome](https://monome.org/docs/serialosc/osc).

See the [`renoise.Osc`](../API/renoise/renoise.Osc.md) and [`renoise.Socket`](../API/renoise/renoise.Socket.md) APIs for more details.

> [!NOTE]
> Using TCP instead of UDP as the socket protocol would likely require manual [SLIP encoding/decoding](https://en.wikipedia.org/wiki/Serial_Line_Internet_Protocol) of OSC message data. This is not handled automatically, so the examples below will only work with UDP servers/clients.

## OSC Server (Receiving OSC)

This example creates a UDP server that listens for OSC messages on port 8008.

```lua
-- Create some shortcuts
local OscMessage = renoise.Osc.Message
local OscBundle = renoise.Osc.Bundle

-- Open a socket connection to listen for messages
local server, socket_error = renoise.Socket.create_server(
  "localhost", 8008, renoise.Socket.PROTOCOL_UDP)
   
if (socket_error) then 
  renoise.app():show_warning(("Failed to start the " .. 
    "OSC server. Error: '%s'"):format(socket_error))
  return
end

server:run {
  socket_message = function(socket, data)
    -- Decode the binary data to an OSC message or bundle
    local message_or_bundle, osc_error = renoise.Osc.from_binary_data(data)
    
    -- Show what we've got
    if (message_or_bundle) then
      if (type(message_or_bundle) == "Message") then
        print(("Got OSC message: '%s'"):format(tostring(message_or_bundle)))

      elseif (type(message_or_bundle) == "Bundle") then
        print(("Got OSC bundle: '%s'"):format(tostring(message_or_bundle)))
      end
      
      -- Send a reply back to the client
      local reply_message = OscMessage("/renoise/reply", {
        { tag = "s", value = "Thank you for the message!" }
      })
      socket:send(reply_message:to_binary_data())
      
    else
      print(("Got invalid OSC data, or data which is not " .. 
        "OSC data at all. Error: '%s'"):format(osc_error))
    end
  end    
}

-- To shut down the server at any time, call:
-- server:close()
```

## OSC Client (Sending OSC)

This example creates a UDP client to send OSC messages to a server on port 8008.

```lua
-- Create some shortcuts
local OscMessage = renoise.Osc.Message
local OscBundle = renoise.Osc.Bundle

-- Create a client to send messages to the server
local client, socket_error = renoise.Socket.create_client(
  "localhost", 8008, renoise.Socket.PROTOCOL_UDP)
   
if (socket_error) then 
  renoise.app():show_warning(("Failed to start the " .. 
    "OSC client. Error: '%s'"):format(socket_error))
  return
end

-- Construct and send a simple message
client:send(
  OscMessage("/transport/start"):to_binary_data()
)

-- Construct and send a message with arguments
client:send(
  OscMessage("/transport/bpm", { 
    { tag = "f", value = 127.5 } 
  }):to_binary_data()
)

-- Construct and send a bundle of messages
local message1 = OscMessage("/some/message")
local message2 = OscMessage("/another/one", { 
  { tag = "b", value = "with some blob data" },
  { tag = "s", value = "and a string" } 
})

client:send(
  OscBundle(os.clock(), { message1, message2 }):to_binary_data()
)

-- Close the client when done
client:close()
```
