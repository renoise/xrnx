# Menu Entries

You can add new menu entries into any existing context menu or the main application menu in Renoise.

To do so, use the tool's [`add_menu_entry`](../API/renoise/renoise.ScriptingTool.md#add_menu_entry) function.

### Example

```lua
renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:My Tool:Show Message...",
  invoke = function()
    renoise.app():show_prompt(
      "Congrats!",
      "You've pressed the 'Show Message...' menu entry from the tools menu, " ..
      "which was defined by a scripting tool.",
      {"OK?"}
    )
  end
}
```

### Available Menus

You can place your entries in any context menu or window menu in Renoise. To do so, specify the target menu category in the `name` property.

For a complete list of available menu locations, see the API documentation for [`ToolMenuEntry`](../API/renoise/renoise.ScriptingTool.md#toolmenuentry).

### Separating Entries

To divide entries into groups with a separating line, prepend one or more dashes to the `name`, like so:

```lua
name = "--- Main Menu:Tools:My Tool Group Starts Here"
```

### Entry Sub-Groups

To group entries into a sub-menu, use a common path for them in the `name` property:

```lua
"Main Menu:Tools:My Tool Group:First Entry"
"Main Menu:Tools:My Tool Group:Second Entry"
"Main Menu:Tools:My Tool Group:Third Entry"
```
