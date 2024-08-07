# Debugging 

## Scripting Terminal

By default, all `print`s from all tools are redirected to the Renoise Scripting Terminal. So the easiest way to debug a tool is to add debug prints to your tool.

Since the prints are redirected only when the terminal is open, it doesn't hurt to keep them in distributed tools, but the prints do create some overhead, so remove them if that's relevant - before releasing your tool.

In addition to the standard Lua `print`, the Renoise APi offers two other print functions that can help with debugging:
- `oprint(some_object)` prints all methods/properties of API objects (or your own class objects), e.g. `oprint(renoise.song())`. 
- `rprint(some_table)` prints tables recursively, which is handy for printing the layout of the renoise module/class, e.g. `rprint(renoise)`


## Autoreloading Tools

When working with Renoise's Scripting Editor, saving a script will
automatically reload the tool that belongs to the file. This way you can simply
change your files and immediately see/test the changes.
When changing any files that are part of the "Libraries" folder, all scripts
will get reloaded.

When working with an external text editor, you can enable the following debug
option somewhere in the tool's main.lua file:
```lua
_AUTO_RELOAD_DEBUG = function()
    -- do tests like showing a dialog, prompts whatever, or simply do nothing
end
```

As soon as you save your script outside of Renoise, and then focus Renoise again
(alt-tab to Renoise, for example), your script will instantly get reloaded and
the notifier is called.

If you don't need a notifier to be called each time the script reloads, you
can also simply set _AUTO_RELOAD_DEBUG to true:
```lua
_AUTO_RELOAD_DEBUG = true
```

## Remote Debugging

If printing isn't enough, there is also remote debugging support built into Renoise via Remdebug. 

Remdebug is a command line based remote debugger for Lua that comes with Renoise.

### Prerequisites

To use the debugger you will need:

* Renoise's "remdebug" module, which can be found in "Scripts/Libraries/remdebug"
  (no installation required - included in Renoise)

* Lua support on your system's command-line with the Lua "socket" module
  See http://w3.impa.br/~diego/software/luasocket/


### Overview

The debugger will be controlled via a command-line Lua interpreter, outside
of Renoise via the remdebug/controller.lua script. To start a local debug
session from within Renoise you can use the function `debug.start()`:

```lua
-- Opens a debugger controller in a new terminal/cmd window and
-- attaches the debugger to this script. Immediately breaks execution.
debug.start()
```

You can add this anywhere in any script that runs in Renoise. This will
work in a tool's main.lua main() body, just like a local function that you
include. It also works in the TestPad.lua script that is used in Renoise's
Scripting Editor.


### Step By Step Guide

Let's debug the following small test script, paste into
RENOISE_PREFERENCES/Scripts/TestPad.lua:

```lua
debug.start()

local function sum(a, b)
    return a + b
end

local c = sum(1, 2)
print(c)

debug.stop()
```

* Launch Renoise's scripting editor, open "TestPad.lua", and hit the "Execute"
  button to run the script.

  If Lua is correctly installed on your system, and remdebug was found, Renoise
  should be frozen now, with a terminal window opened showing something like:
```bash
> "Lua Remote Debugger"
> "Paused at file RENOISE_PREFERENCES_FOLDER/Scripts/TestPad.lua line 5"
>
> 1    debug.start()
> 2
> 3    local function sum(a, b)
> 4      return a + b
> 5*** end
> 6
> 7    local c = sum(1, 2)
> 8    print(c)
> 9
> 10   debug.stop()
>
>>
```

* To step through the code, you can use the "s" and "n" commands in the terminal.
  Let's do so by entering "s" (Return) until we've reached line 8. Anything you
  type into the debugger, which is not a debugger command, will get evaluated in
  your running script as an expression. So let's try this by entering: `c=99`

* Then step over the line by entering "n" (Return) to evaluate the "print(c)"
  on line 9 in the script. You should see a "99" dumped out. To watch the value
  again, enter for example a `print(c)`. You should again see a "99" dumped out.

You can also set break and watchpoints in the debugger. Type 'help' in the
terminal to get more info about this. Those who are familiar with gdb on the
command-line may be able to quickly get up to speed when using the most common
shortcuts (c,b,q, and so on...).

Please note that although "debug.stop()" is not necessary (you can
simply quit the controller at any time to exit), its recommended and will
be more comfortable when running a session over and over again.


### Remote and Lua Editor debugging

Renoise's remdebug is fully compatible with the original remdebug controller
from the kepler project. This means you can, in theory, also use debugger GUIs
that use the original remdebug, like Lua Eclipse or SciTE for Lua.

However, this is often a PITA to setup and configure, and might not be
worth the trouble. Try at your own risk...

The debugger can also be used to remote debug scripts, scripts running on other
computers. To do so, use remdebug.engine.start/stop instead of "debug".
debug.start/stop is just a shortcut to remdebug.session.start/stop.

"remdebug.engine.start" will only attach the debugger to your script and break
execution. You then have to run the debugger controller manually on another
computer. To do so, launch the remdebug.controller.lua file manually in a
terminal:

* First we start the debugger controller. To do so, open a command-line on your
  system and invoke the remdebug/controller.lua script. You should see
  something like:
```bash
lua RENOISE_RESOURCE_FOLDER/Scripts/Libraries/remdebug/controller.lua
"Lua Remote Debugger"
"Run the program you wish to debug with 'remdebug.engine.start()' now"
```

* Now you can connect to this controller by running a script with
  `remdebug.engine.start()`, configured to find the controller on another
  machine (or the same one.)
```lua
require "remdebug.engine"
-- default config is "localhost" on port 8171
remdebug.engine.configure { host = "some_host", port = 1234 }
remdebug.engine.start()
```