# Installing tools

You can install any tool by dragging its folder (or a zip file with the `.xrnx` extension and the tool's contents) onto Renoise. You can also copy the folder manually into your Tools folder.

<!-- TODO list tool folder locations on each platform here -->

> Note: when creating a zip file you should only zip the **contents** of the folder, not the folder itself
<!-- If you can use a terminal, you can run the following commands to do this automatically. -->
<!-- TODO nicer zip command? -->

After you've installed a tool, it will be activated automatically. When in doubt, click the *Tools / Reload All Tools* to force a reload or use the debug hook below.

## Debug hook

You can define the following variable in your `main.lua` file to automatically reload your tool whenever you modify and save your files (and focus Renoise afterwards with alt-tab for example), it's especially useful if you are using an external editor.

```lua
_AUTO_RELOAD_DEBUG = true
```

You can also assign any function to this variable that runs some test or attaches to a [lua remote
debugger](http://lua-users.org/wiki/DebuggingLuaCode) for example.

```lua
_AUTO_RELOAD_DEBUG = function()
  renoise.app():show_message("Tool was reloaded!")
end
```

When editing scripts with the built-in editor in Renoise, tools will automatically reload as soon as you hit *Run Script* (even if you don't have this notifier set), but you nevertheless can use it to automatically invoke functions.

> Note: When reloading the script causes an error, the old, last running script instance will continue to run.

Changes in the actions menu may not be updated for new tools, unless you use *Tools / Reload All Tools*.