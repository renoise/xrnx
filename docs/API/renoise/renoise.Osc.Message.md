# renoise.Osc.Message<a name="renoise.Osc.Message"></a>  

<!-- toc -->
  

---  
## Properties
### pattern : [`string`](../../API/builtins/string.md)<a name="pattern"></a>
> **READ-ONLY** The message pattern (e.g. "/renoise/transport/start")

### arguments : [`OscValue`](#oscvalue)[]<a name="arguments"></a>
> **READ-ONLY** Table of `{tag="X", value=SomeValue}` that represents the
> message arguments. See `renoise.Osc.Message.create` for more info.

### binary_data : [`string`](../../API/builtins/string.md)<a name="binary_data"></a>
> **READ-ONLY** Raw binary representation of the message, as needed when e.g.
> sending the message over the network through sockets.

  



---  
## Structs  
# OscValue<a name="OscValue"></a>  
> `tag` is a standard OSC type tag. `value` is the arguments value expressed
> by a Lua type. The value must be convertible to the specified tag, which
> means, you cannot for example specify an "i" (integer) as type and then pass
> a string as the value. Use a number value instead. Not all tags require a
> value, like the T,F boolean tags. Then a `value` field should not be
> specified. For more info, see: http://opensoundcontrol.org/spec-1_0  

---  
## Properties
### tag : [`OscTag`](#OscTag)<a name="tag"></a>
### value : [`boolean`](../../API/builtins/boolean.md) | [`string`](../../API/builtins/string.md) | [`number`](../../API/builtins/number.md)<a name="value"></a>
  



---  
## Aliases  
### OscTag<a name="OscTag"></a>
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
  

  



---  
## Aliases  
### OscTag<a name="OscTag"></a>
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
  

