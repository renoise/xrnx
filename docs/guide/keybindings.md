# Keybindings

Tools can add custom key bindings to Renoise's existing set of key commands. These new bindings can be activated and mapped by the user just like any other key binding in Renoise.

Keybindings can be global (applied everywhere in the GUI) or local to a specific part of the GUI, like the Pattern Editor.

> [!NOTE]
> There is no way to define default keyboard shortcuts for your entries. Users must manually bind them in the keyboard preferences pane. As soon as they do, the bindings are saved just like any other key binding in Renoise.

To add a key binding, use the tool's [`add_keybinding`](../API/renoise/renoise.ScriptingTool.md#add_keybinding) function.

### Example

```lua
renoise.tool():add_keybinding {
  name = "Global:Tools:Example Script Shortcut",
  invoke = function(repeated)
    -- we ignore soft repeated keys here
    if (not repeated) then
      renoise.app():show_prompt(
        "Congrats!",
        "You've pressed a magic keyboard combo " ..
        "which was defined by a scripting tool.",
        {"OK?"}
      )
    end
  end
}
```

### Scopes

The scope, topic, and name of the key binding are defined in the `name` property, using the format: `$scope:$topic_name:$binding_name`.

*   `scope`: This is where the shortcut will be applied, corresponding to the categories in the keyboard assignment preference pane. Your key binding will only fire when its scope is focused, unless it's the `Global` scope. Using an unavailable scope will not cause an error, but it will render the binding useless—it will be listed and mappable, but never invoked.

*   `topic_name`: This is used for grouping entries in the key assignment pane. Use "Tools" if you can't come up with something more specific.

*   `binding_name`: This is the display name of the binding.

For a list of available scopes, see the API documentation for [`ToolKeybindingEntry`](../API/renoise/renoise.ScriptingTool.md#toolkeybindingentry).

### Separating entries

To divide entries into groups with a separating line, prepend one or more dashes to the `name`, like so:

```lua
name = "--- Main Menu:Tools:My Tool Group Starts Here"
```
