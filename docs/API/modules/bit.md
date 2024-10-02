# bit  
> Integer, Bit Operations, provided by <http://bitop.luajit.org/>
> 
>  [Documentation](http://bitop.luajit.org/api.html)  

<!-- toc -->
  

---  
## Functions
### tobit(x : [`integer`](../../API/builtins/integer.md)) {#tobit}
`->`[`integer`](../../API/builtins/integer.md)  

> Normalizes a number to the numeric range for bit operations and returns it.
> This function is usually not needed since all bit operations already normalize
> all of their input arguments. Check the operational semantics for details.
### tohex(x : [`integer`](../../API/builtins/integer.md), n : [`integer`](../../API/builtins/integer.md)[`?`](../../API/builtins/nil.md)) {#tohex}
> Converts its first argument to a hex string. The number of hex digits is
> given by the absolute value of the optional second argument. Positive numbers
> between 1 and 8 generate lowercase hex digits. Negative numbers generate
> uppercase hex digits. Only the least-significant 4*|n| bits are used. The
> default is to generate 8 lowercase hex digits.
### bnot(x : [`integer`](../../API/builtins/integer.md)) {#bnot}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the bitwise **not** of its argument.
### band(x1 : [`integer`](../../API/builtins/integer.md), ...[`integer`](../../API/builtins/integer.md)) {#band}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the bitwise and of all of its arguments. Note that more than two
> arguments are allowed.
### bor(x1 : [`integer`](../../API/builtins/integer.md), ...[`integer`](../../API/builtins/integer.md)) {#bor}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the bitwise or of all of its arguments. Note that more than two
> arguments are allowed.
### xor(x1 : [`integer`](../../API/builtins/integer.md), ...[`integer`](../../API/builtins/integer.md)) {#xor}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the bitwise xor of all of its arguments. Note that more than two
> arguments are allowed.
### lshift(x : [`integer`](../../API/builtins/integer.md), n : [`integer`](../../API/builtins/integer.md)) {#lshift}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the bitwise logical left-shift of its first argument by the number of
> bits given by the second argument.
> 
> Logical shifts treat the first argument as an unsigned number and shift in
> 0-bits. Arithmetic right-shift treats the most-significant bit as a sign bit
> and replicates it. Only the lower 5 bits of the shift count are used (reduces
> to the range [0..31]).
### rshift(x : [`integer`](../../API/builtins/integer.md), n : [`integer`](../../API/builtins/integer.md)) {#rshift}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the bitwise logical right-shift of its first argument by the number of
> bits given by the second argument.
> 
> Logical shifts treat the first argument as an unsigned number and shift in
> 0-bits. Arithmetic right-shift treats the most-significant bit as a sign bit
> and replicates it. Only the lower 5 bits of the shift count are used (reduces
> to the range [0..31]).
### arshift(x : [`integer`](../../API/builtins/integer.md), n : [`integer`](../../API/builtins/integer.md)) {#arshift}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns the bitwise arithmetic right-shift of its first argument by the
> number of bits given by the second argument.
> 
> Logical shifts treat the first argument as an unsigned number and shift in
> 0-bits. Arithmetic right-shift treats the most-significant bit as a sign bit
> and replicates it. Only the lower 5 bits of the shift count are used (reduces
> to the range [0..31]).
### rol(x : [`integer`](../../API/builtins/integer.md), n : [`integer`](../../API/builtins/integer.md)) {#rol}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns bitwise left rotation of its first argument by the number of bits
> given by the second argument. Bits shifted out on one side are shifted back
> in on the other side.
> 
> Only the lower 5 bits of the rotate count are used (reduces to the range
> [0..31]).
### ror(x : [`integer`](../../API/builtins/integer.md), n : [`integer`](../../API/builtins/integer.md)) {#ror}
`->`[`integer`](../../API/builtins/integer.md)  

> Returns bitwise right rotation of its first argument by the number of bits
> given by the second argument. Bits shifted out on one side are shifted back
> in on the other side.
> 
> Only the lower 5 bits of the rotate count are used (reduces to the range
> [0..31]).
### bswap(x : [`integer`](../../API/builtins/integer.md)) {#bswap}
`->`[`integer`](../../API/builtins/integer.md)  

> Swaps the bytes of its argument and returns it. This can be used to convert
> little-endian 32 bit numbers to big-endian 32 bit numbers or vice versa.  

