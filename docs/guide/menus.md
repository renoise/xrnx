# Menu Entries

You can add new menu entries into any existing context menus or the global menu in Renoise. 

To do so, we are using the tool's [add_menu_entry](../API/renoise/renoise.ScriptingTool.md#add_menu_entry) function.

### Example

```lua
renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:My Tool:Show Message...",
  invoke = function()
  renoise.app():show_prompt(
        "Congrats!",
        "You've pressed then 'Show Message...' menu entry from the tools menu, "..
        "which was defined by a scripting tool.",
        {"OK?"}
      )
  end
}
```

### Avilable Menus 

You can place your entries in any context menu or any window menu in Renoise. To do so, use one of the specified categories in its name.

See API Docs for [ToolMenuEntry](../API/renoise/renoise.ScriptingTool.md#toolmenuentry) for more info.

### Separating Entries 

To divide entries into groups (separate entries with a line), prepend one or more dashes to the name, like

```lua
"--- Main Menu:Tools:My Tool Group Starts Here"
```

### Entry Sub Groups 

To move entries into a menu sub groups, use a common path for them, like 

```lua
"Main Menu:Tools:My Tool Group:First Entry"
"Main Menu:Tools:My Tool Group:Second Entry"
"Main Menu:Tools:My Tool Group:Third Entry"
```


