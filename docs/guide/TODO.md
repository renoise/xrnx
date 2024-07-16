# TODO

# The Song

explain how the song is structured and provide some snippets to change things

# Patterns and Phrases

describe how to access the columns in patterns and phrases, mention iterators for performance

# Keybindings

show how keybindings work, explain scopes

```
keybindings: Register key bindings somewhere in Renoise's existing
set of bindings.

The Lua table passed to add_keybinding is defined as:

* Required fields:
  + ["name"] = The scope, name and category of the key binding.
  + ["invoke"] = A function that is called as soon as the mapped key is
      pressed. The callback has one argument: "repeated", indicating
      if its a virtual key repeat.
The key binding's 'name' must have 3 parts, separated by ":" e.g.
[scope:topic_name:binding_name]

* 'scope' is where the shortcut will be applied, just like those
  in the categories list for the keyboard assignment preference pane.
* 'topic_name' is useful when grouping entries in the key assignment pane.
  Use "tool" if you can't come up with something meaningful.
* 'binding_name' is the name of the binding.

Currently available scopes are:
> "Global", "Automation", "Disk Browser", "Instrument Box", "Mixer",
> "Pattern Editor", "Pattern Matrix", "Pattern Sequencer", "Sample Editor"
> "Track DSPs Chain"

Using an unavailable scope will not fire an error, instead it will render the
binding useless. It will be listed and mappable, but never be invoked.

There's no way to define default keyboard shortcuts for your entries. Users
manually have to bind them in the keyboard prefs pane. As soon as they do,
they'll get saved just like any other key binding in Renoise.

```

# Menus

explain how to create menu items and folders and their scopes

```

menu_entries: Insert a new menu entry somewhere in Renoise's existing
context menus or the global app menu. Insertion can be done during
script initialization, but can also be done dynamically later on.

The Lua table passed to 'add_menu_entry' is defined as:

* Required fields:
  + ["name"] = Name and 'path' of the entry as shown in the global menus or
      context menus to the user
  + ["invoke"] = A function that is called as soon as the entry is clicked

* Optional fields:
  + ["active"] = A function that should return true or false. When returning
      false, the action will not be invoked and will be "greyed out" in
      menus. This function is always called before "invoke", and every time
      prior to a menu becoming visible.
  + ["selected"] = A function that should return true or false. When
      returning true, the entry will be marked as "this is a selected option"

Positioning entries:

You can place your entries in any context menu or any window menu in Renoise.
To do so, use one of the specified categories in its name:

+ "Window Menu" -- Renoise icon menu in the window caption on Windows/Linux
+ "Main Menu" (:File", ":Edit", ":View", ":Tools" or ":Help") -- Main menu
+ "Scripting Menu" (:File",  or ":Tools") -- Scripting Editor & Terminal
+ "Disk Browser Directories"
+ "Disk Browser Files"
+ "Instrument Box"
+ "Pattern Sequencer"
+ "Pattern Editor"
+ "Pattern Matrix"
+ "Pattern Matrix Header"
+ "Phrase Editor"
+ "Phrase Mappings"
+ "Phrase Grid"
+ "Sample Navigator"
+ "Sample Editor"
+ "Sample Editor Ruler"
+ "Sample Editor Slice Markers"
+ "Sample List"
+ "Sample Mappings"
+ "Sample FX Mixer"
+ "Sample Modulation Matrix"
+ "Mixer"
+ "Track Automation"
+ "Track Automation List"
+ "DSP Chain"
+ "DSP Chain List"
+ "DSP Device"
+ "DSP Device Header"
+ "DSP Device Automation"
+ "Modulation Set"
+ "Modulation Set List"

Separating entries:

To divide entries into groups (separate entries with a line), prepend one or
more dashes to the name, like "--- Main Menu:Tools:My Tool Group Starts Here"
```


# Views

overview of the view API

```
-- Currently there are two ways to to create custom views:
--
-- Shows a modal dialog with a title, custom content and custom button labels:
renoise.app():show_custom_prompt(
  title, content_view, {button_labels} [, key_handler_func, key_handler_options])
  -> [pressed button]

-- _(and)_ Shows a non modal dialog, a floating tool window, with custom
-- content:
renoise.app():show_custom_dialog(
  title, content_view [, key_handler_func, key_handler_options])
  -> [dialog object]

-- key_handler_func is optional. When defined, it should point to a function
-- with the signature noted below. "key" is a table with the fields:
-- > key = {  
-- >   name,      -- name of the key, like 'esc' or 'a' - always valid  
-- >   modifiers, -- modifier states. 'shift + control' - always valid  
-- >   character, -- character representation of the key or nil  
-- >   note,      -- virtual keyboard piano key value (starting from 0) or nil  
-- >   state,     -- optional (see below) - is the key getting pressed or released?
-- >   repeated,  -- optional (see below) - true when the key is soft repeated (held down)
-- > }
-- 
-- The "repeated" field will not be present when 'send_key_repeat' in the key 
-- handler options is set to false. The "state" field only is present when the
-- 'send_key_release' in the key handler options is set to true. So by default only 
-- key presses are send to the key handler.
--
-- key_handler_options is an optional table with the fields:
-- > options = { 
-- >   send_key_repeat=true OR false   -- by default true
-- >   send_key_release=true OR false  -- by default false
-- > }
-- >
-- Returned "dialog" is a reference to the dialog the keyhandler is running on.
--
--     function my_keyhandler_func(dialog, key) end
--
-- When no key handler is specified, the Escape key is used to close the dialog.
-- For prompts, the first character of the button labels is used to invoke
-- the corresponding button.
-- 
-- When returning the passed key from the key-handler function, the
-- key will be passed back to Renoise's key event chain, in order to allow
-- processing global Renoise key-bindings from your dialog. This will not work
-- for modal dialogs. This also only applies to global shortcuts in Renoise,
-- because your dialog will steal the focus from all other Renoise views such as
-- the Pattern Editor, etc.
```

# MIDI

```

The Renoise MIDI API allows you to access any installed MIDI input or output
device. You can also access unused MIDI in/outputs via Renoise's MIDI Remote,
Sync settings, and so on; as set up in the preferences.

-------- Error Handling

When accessing a new device, not used by Renoise nor by your or other scripts,
Renoise will try to open that device's driver. If something goes wrong an error
will be shown to the user. Something like ("MIDI Device Foo failed to open
(error)"). In contrast, none of the MIDI API functions will fail. In other
words, if a "real" device fails to open this is not your problem, but the user's
problem. This is also the reason why none of the MIDI API functions return error
codes.

All other types of logic errors, such as sending MIDI to a manually closed
device, sending bogus messages and so on, will be fired as typical Lua runtime
errors.


-------- Examples
```
```lua
--[[============================================================================
Midi.lua
============================================================================]]--

error("do not run this file. read and copy/paste from it only...")


-- midi input listener (function callback)

local inputs = renoise.Midi.available_input_devices()
local midi_device = nil

if not table.is_empty(inputs) then
  local device_name = inputs[1]
  
  local function midi_callback(message)
    assert(#message == 3)
    assert(message[1] >= 0 and message[1] <= 0xff)
    assert(message[2] >= 0 and message[2] <= 0xff)    
    assert(message[3] >= 0 and message[3] <= 0xff)
    
    print(("%s: got MIDI %X %X %X"):format(device_name, 
      message[1], message[2], message[3]))
  end

  -- note: sysex callback would be a optional 2nd arg...
  midi_device = renoise.Midi.create_input_device(
    device_name, midi_callback)
  
  -- stop dumping with 'midi_device:close()' ...
end


-------------------------------------------------------------------------------
-- midi input and sysex listener (class callbacks)

class "MidiDumper"
  function MidiDumper:__init(device_name)
    self.device_name = device_name
  end
  
  function MidiDumper:start()
    self.device = renoise.Midi.create_input_device(
      self.device_name, 
      { self, MidiDumper.midi_callback }, 
      { MidiDumper.sysex_callback, self }
    )
  end
  
  function MidiDumper:stop()
    if self.device then 
      self.device:close()
      self.device = nil
    end
  end
  
  function MidiDumper:midi_callback(message)
    print(("%s: MidiDumper got MIDI %X %X %X"):format(
      self.device_name, message[1], message[2], message[3]))
  end

  function MidiDumper:sysex_callback(message)
    print(("%s: MidiDumper got SYSEX with %d bytes"):format(
      self.device_name, #message))
  end
  
  
local inputs = renoise.Midi.available_input_devices()

if not table.is_empty(inputs) then
  local device_name = inputs[1]
  
  -- should be global to avoid premature garbage collection when
  -- going out of scope.
  midi_dumper = MidiDumper(device_name)
  
  -- will dump till midi_dumper:stop() is called or the MidiDumber object 
  -- is garbage collected ...
  midi_dumper:start()  
  
end


-------------------------------------------------------------------------------
-- midi output 

local outputs = renoise.Midi.available_output_devices()

if not table.is_empty(outputs) then
  local device_name = outputs[1]
  midi_device = renoise.Midi.create_output_device(device_name)
  
  -- note on
  midi_device:send {0x90, 0x10, 0x7F}
  -- sysex (MMC start)
  midi_device:send {0xF0, 0x7F, 0x00, 0x06, 0x02, 0xF7}
 
  -- no longer need the device...
  midi_device:close()  
end

```

# OSC

```lua
--[[============================================================================
Osc.lua
============================================================================]]--

error("do not run this file. read and copy/paste from it only...")

-- create some handy shortcuts
local OscMessage = renoise.Osc.Message
local OscBundle = renoise.Osc.Bundle

-- NB: when using TCP instead of UDP as socket protocol, manual SLIP en/decoding
-- of OSC message data would be required too. This is left out here, so the examples 
-- below only work with UDP servers/clients.

-------------------------------------------------------------------------------
---- Osc server (receive Osc from one or more clients)

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


-------------------------------------------------------------------------------
-- Osc client & message construction (send Osc to a server)

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


# Samples

guide to generate and modify samples and instruments

```lua
--[[============================================================================
SampleBuffer.lua
============================================================================]]--

error("do not run this file. read and copy/paste from it only...")


-- modify the selected sample

local sample_buffer = renoise.song().selected_sample.sample_buffer

-- check if sample data is preset at all first
if (sample_buffer.has_sample_data) then

  -- before touching any sample, let renoise create undo data, when necessary
  sample_buffer:prepare_sample_data_changes()
  
  -- modify sample data in the selection (defaults to the whole sample)
  for channel = 1, sample_buffer.number_of_channels do
    for frame = sample_buffer.selection_start, sample_buffer.selection_end do
      local value = sample_buffer:sample_data(channel, frame)
      value = -value -- do something with the value
      sample_buffer:set_sample_data(channel, frame, value)
    end
  end

  -- let renoise update sample overviews and caches. apply bit depth 
  -- quantization. create undo/redo data if needed...
  sample_buffer:finalize_sample_data_changes()

else
  renoise.app():show_warning("No sample preset...")
end


-------------------------------------------------------------------------------
-- generate a new sample

local selected_sample = renoise.song().selected_sample
local sample_buffer = selected_sample.sample_buffer

-- create new or overwrite sample data for our sound:
local sample_rate = 44100
local num_channels = 1
local bit_depth = 32
local num_frames = sample_rate / 2

local allocation_succeeded = sample_buffer:create_sample_data(
  sample_rate, bit_depth, num_channels, num_frames)
  
-- check for allocation failures
if (not allocation_succeeded) then
  renoise.app():show_error("Out of memory. Failed to allocate sample data")
  return
end

-- let renoise know we are about to change the sample buffer
sample_buffer:prepare_sample_data_changes()
  
-- fill in the sample data with an amazing zapp sound
for channel = 1,num_channels do
  for frame = 1,num_frames do
    local sample_value = math.sin(num_frames / frame)
    sample_buffer:set_sample_data(channel, frame, sample_value)
  end
end

-- let renoise update sample overviews and caches. apply bit depth 
-- quantization. finalize data for undo/redo, when needed...
sample_buffer:finalize_sample_data_changes()

-- setup a pingpong loop for our new sample
selected_sample.loop_mode = renoise.Sample.LOOP_MODE_PING_PONG
selected_sample.loop_start = 1
selected_sample.loop_end = num_frames


```


# Differences to standard Lua


# Classes

```lua

Renoises lua API has a simple OO support inbuilt -> class "MyClass". All 
Renoise API objects use such classes.

See http://www.rasterbar.com/products/luabind/docs.html#defining-classes-in-lua
for more technical info and below for some simple examples

Something to keep in mind:

* constructor "function MyClass:__init(args)" must be defined for each class, 
  or the class can't be used to instantiate objects
  
* class defs are always global, so even locally defined classes will be 
  registered globally...

--]]


-------------------------------------------------------------------------------

-- abstract class

class 'Animal'
  function Animal:__init(name)
    self.name = name
    self.can_fly = nil
  end  

  function Animal:__tostring()
    assert(self.can_fly ~= nil, "I don't know if I can fly or not")
    
    return ("I am a %s (%s) and I %s fly"):format(self.name, type(self), 
      (self.can_fly and "can fly" or "can not fly"))
  end


-- derived classes

-- MAMMAL
class 'Mammal' (Animal)
  function Mammal:__init(str)
    Animal.__init(self, str)
    self.can_fly = false
  end

-- BIRD
class 'Bird' (Animal)
  function Bird:__init(str)
    Animal.__init(self, str)
    self.can_fly = true
  end

-- FISH
class 'Fish' (Animal)
  function Fish:__init(str)
    Animal.__init(self, str)
    self.can_fly = false
  end


-- run

local farm = table.create()

farm:insert(Mammal("cow"))
farm:insert(Bird("sparrow"))
farm:insert(Fish("bass"))

print(("type(Mammal('cow')) -> %s"):format(type(Mammal("cow"))))
print(("type(Mammal) -> %s"):format(type(Mammal)))

for _,animal in pairs(farm) do
  print(animal)
end


-------------------------------------------------------------------------------
-- Class operators

-- You can overload most operators in Lua for your classes. You do this by 
-- simply declaring a member function with the same name as an operator 
-- (the name of the metamethods in Lua).

--[[ The operators you can overload are:

* __add
* __sub
* __mul
* __div
* __pow
* __lt
* __le
* __eq
* __call
* __unm
* __tostring
* __len

--]]

-- "__tostring" isn't really an operator, but it's the metamethod that is 
-- called by the standard library's tostring() function. 

```

# Formula docs

describe writing formulas?

# Debugging

introduce some debuggers?

<!--
If tracing/debugging in the console with print, oprint and rprint isn't enough,
you can try attaching a command-line based debugger to your scripts. Have a look
at the Debugging document for more information and a small tutorial.
-->