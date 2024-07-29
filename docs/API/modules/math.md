# math  

---  
## Functions
### `db2fader`(min_dB : [`number`](/API/builtins/number.md), max_dB : [`number`](/API/builtins/number.md), dB_to_convert : [`number`](/API/builtins/number.md)) {#db2fader}
`->`[`number`](/API/builtins/number.md)  

Converts a dB value to a normalized linear fader value between 0-1 within
the given dB range.
### example:
```lua
print(math.db2fader(-96, 0, 1)) --> 0
print(math.db2fader(-48, 6, 0)) --> 0.73879611492157
```
### `db2lin`(n : [`number`](/API/builtins/number.md)) {#db2lin}
`->`[`number`](/API/builtins/number.md)  

Converts a dB value to a linear value.
### example:
```lua
print(math.db2lin(math.infdb)) --> 0
print(math.db2lin(6.0)) --> 1.9952623149689
```
### `fader2db`(min_dB : [`number`](/API/builtins/number.md), max_dB : [`number`](/API/builtins/number.md), fader_value : [`number`](/API/builtins/number.md)) {#fader2db}
`->`[`number`](/API/builtins/number.md)  

Converts a normalized linear mixer fader value to a db value within
the given dB range.
### example:
```lua
print(math.fader2db(-96, 0, 1)) --> 0
print(math.fader2db(-96, 0, 0)) --> -96
```
### `lin2db`(n : [`number`](/API/builtins/number.md)) {#lin2db}
`->`[`number`](/API/builtins/number.md)  

Converts a linear value to a db value. db values will be clipped to
math.infdb.
### example:
```lua
print(math.lin2db(1.0)) --> 0
print(math.lin2db(0.0)) --> -200 (math.infdb)
```  

