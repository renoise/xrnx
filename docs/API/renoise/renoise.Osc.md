# renoise.Osc  
> OSC (Open Sound Control) support for Lua scripts in Renoise.  

<!-- toc -->
  

---  
## Functions
### Bundle(time : [`integer`](../../API/builtins/integer.md), arguments : [`renoise.Osc.Message`](../../API/renoise/renoise.Osc.Message.md) | [`renoise.Osc.Message`](../../API/renoise/renoise.Osc.Message.md)[]) {#Bundle}
`->`[`renoise.Osc.Bundle`](../../API/renoise/renoise.Osc.Bundle.md)  

> Create a new bundle by specifying a time-tag and one or more messages.
> If you do not know what to do with the time-tag, use `os.clock()`,
> which simply means "now". Messages must be renoise.Osc.Message objects.
> Nested bundles (bundles in bundles) are right now not supported.
### Message(pattern : [`string`](../../API/builtins/string.md), arguments : [`OscValue`](#oscvalue)[][`?`](../../API/builtins/nil.md)) {#Message}
`->`[`renoise.Osc.Message`](../../API/renoise/renoise.Osc.Message.md)  

> Create a new OSC message with the given pattern and optional arguments.
### from_binary_data(binary_data : [`string`](../../API/builtins/string.md)) {#from_binary_data}
`->`[`renoise.Osc.Bundle`](../../API/renoise/renoise.Osc.Bundle.md) | [`renoise.Osc.Message`](../../API/renoise/renoise.Osc.Message.md)[`?`](../../API/builtins/nil.md), [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> De-packetizing raw (socket) data to OSC messages or bundles:
> Converts the binary data to an OSC message or bundle. If the data does not
> look like an OSC message, or the message contains errors, nil is returned
> as first argument and the second return value will contain the error.
> If de-packetizing was successful, either a renoise.Osc.Bundle or Message
> object is returned. Bundles may contain multiple messages or nested bundles.  



---  
## Local Structs  
# OscValue  
> `tag` is a standard OSC type tag. `value` is the arguments value expressed
> by a Lua type. The value must be convertible to the specified tag, which
> means, you cannot for example specify an "i" (integer) as type and then pass
> a string as the value. Use a number value instead. Not all tags require a
> value, like the T,F boolean tags. Then a `value` field should not be
> specified. For more info, see: http://opensoundcontrol.org/spec-1_0  

<!-- toc -->
  

---  
## Properties
### tag : [`OscTag`](#OscTag) {#tag}
### value : [`boolean`](../../API/builtins/boolean.md) | [`string`](../../API/builtins/string.md) | [`number`](../../API/builtins/number.md) {#value}
  

  



---  
## Local Aliases  
### OscTag {#OscTag}
`"F"` | `"I"` | `"N"` | `"S"` | `"T"` | `"b"` | `"c"` | `"d"` | `"f"` | `"h"` | `"i"` | `"m"` | `"r"` | `"s"` | `"t"`  
> ```lua
> OscTag:
>     | "i" -- int32
>     | "f" -- float32
>     | "s" -- OSC-string
>     | "b" -- OSC-blob (raw string)
>     | "h" -- 64 bit big-endian two's complement integer
>     | "t" -- OSC-timetag
>     | "d" -- 64 bit ("double") IEEE 754 floating point number
>     | "S" -- Alternate type represented as an OSC-string
>     | "c" -- An ascii character, sent as 32 bits
>     | "r" -- 32 bit RGBA color
>     | "m" -- 4 byte MIDI message. Bytes from MSB to LSB are: port id, status byte, data1, data2
>     | "T" -- True. No value needs to be specified.
>     | "F" -- False. No value needs to be specified.
>     | "N" -- Nil. No value needs to be specified.
>     | "I" -- Infinitum. No value needs to be specified.
> ```  
  

