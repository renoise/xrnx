# Setting up your development environment

By default Renoise has all scripting utilities hidden to keep it simple for users who don't wish to mess around with code. If you want to write scripts, the first thing you have to do is to enable the hidden development tools.

* For a quick test you can launch the Renoise executable with the `--scripting-dev` argument
* To have this mode enabled by default, you'll have to edit your `Config.xml` file inside Renoise's preferences folder. Search for the `<ShowScriptingDevelopmentTools>` property and set it to `true`.
<!-- TODO consider exposing this setting in the Renoise GUI -->

Once scripting is enabled, you'll have the following entries inside the *Tools* menu on the top bar.

* *Scripting Terminal & Editor* - This will open the debugging console used to test things and see your tool's output
* *Reload All Tools* - This will force a reload of all installed and running tools. It can be useful when adding new tools by hand or when changing them.

## Lua

Tools in Renoise are written using the [Lua programming language](https://www.lua.org/). Lua is a dynamic language with a friendly syntax and good performance. While Renoise itself is written in C++, it has an [API](https://en.wikipedia.org/wiki/API) layer that exposes all sorts of aspects of the tracker so that tools can implement new functionality without the dangers of crashing Renoise itself or having to worry about low level programming challenges.

> Teaching you programming is out of the scope of this guide but you can check out the book [Programming in Lua](https://www.lua.org/pil/contents.html) to get a complete overview of the language. That said, you will probably be able to pick up a lot of things just by reading through this guide and checking out the examples. If you are the kind of person who learns best by doing stuff, getting straight into tinkering might be right up your alley.

### Language Server

Luckily Lua has a language server called [LuaLS](https://github.com/LuaLS/lua-language-server) which - when paired with the [definitions for the Renoise API](https://github.com/renoise/definitions/) - can help you write code by providing useful hints about functions and variables, autocompletion and code diagnostics. You can even annotate your own code to keep things more explicit and well documented. While you can absolutely write Lua and create tools without any of this, we highly recommend setting it up.

If you are using [VSCode](https://code.visualstudio.com/) you will have to do three things

* Install the [Lua extension by sumneko](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
* Download the [Renoise API definitions from Github](https://github.com/renoise/definitions/) <!-- TODO direct link to download? people with git knowledge will know how to clone, no need to explain here -->
* Configure VSCode so that LuaLS knows where to find the definition files. For this you will have to either put this into your [workspace's settings](https://code.visualstudio.com/docs/editor/workspaces#_singlefolder-workspace-settings) in your project folder (as `.vscode/settings.json`), or the global *User Settings JSON* file. Make sure to fill the paths below according to where you've extracted the previously downloaded definitions.

```json
{
    "Lua.workspace.library": [ "PATH/TO/RENOISE_DEFINITION_FOLDER" ],
    "Lua.runtime.plugin": "PATH/TO/RENOISE_DEFINITION_FOLDER/plugin.lua"
}
```

> For configuring other editors, you can check out the [official docs about installation](https://luals.github.io/#install)
