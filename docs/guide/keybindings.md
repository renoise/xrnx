# Keybindings

Tools can add custom key bindings somewhere in Renoise's existing set of bindings, which will be activated and 
mapped by the user just as any other key binding in Renoise.

Keybindings can be global (applied everywhere in the GUI) or can be local to a specific part of the GUI, like the Pattern Editor.

Please note: there's no way to define default keyboard shortcuts for your entries. Users manually have to bind them in the keyboard prefs pane. As soon as they do, they'll get saved just like any other key binding in Renoise.

To do so, we are using the tool's [add_keybinding](../API/renoise/renoise.ScriptingTool.md#add_keybinding) function.

### Example

```lua
renoise.tool():add_keybinding {
  name = "Global:Tools:Example Script Shortcut",
  invoke = function(repeated)
    if (not repeated) then -- we ignore soft repeated keys here
      renoise.app():show_prompt(
        "Congrats!",
        "You've pressed a magic keyboard combo "..
        "which was defined by a scripting tool.",
        {"OK?"}
      )
    end
  end
}
```

### Scopes

The scope, name and category of the key binding use the form: 
`$scope:$topic_name:$binding_name`:

* `scope` is where the shortcut will be applied, just like those
in the categories list for the keyboard assignment preference pane.
Your key binding will only fire, when the scope is currently focused,
except it's the global scope one.
Using an unavailable scope will not fire an error, instead it will render
the binding useless. It will be listed and mappable, but never be invoked.

* `topic_name` is useful when grouping entries in the key assignment pane.
Use "tool" if you can't come up with something meaningful.

* `binding_name` is the name of the binding.

Currently available scopes are:

See API Docs for [KeybindingEntry](../API/renoise/renoise.ScriptingTool.md#toolkeybindingentry).

### Separating entries

To divide entries into groups (separate entries with a line), prepend one or more dashes to the name, like 

```lua
"--- Main Menu:Tools:My Tool Group Starts Here"
```