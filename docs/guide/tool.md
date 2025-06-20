# Renoise Tool

The `renoise.tool()` function is the entry point for interacting with your tool's own context. It returns a [`renoise.ScriptingTool`](../API/renoise/renoise.ScriptingTool.md) object, which allows you to integrate your tool with Renoise by adding menu entries, keybindings, and MIDI mappings. It also provides ways to handle application-wide events, manage timers, define preferences, and much more.

## Menu Entries

You can add new menu entries into any existing context menu or the main application menu in Renoise.

To do so, use the tool's [`renoise.tool():add_menu_entry`](../API/renoise/renoise.ScriptingTool.md#add_menu_entry) function.

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

## Keybindings

Tools can add custom key bindings to Renoise's existing set of key commands. These new bindings can be activated and mapped by the user just like any other key binding in Renoise.

Keybindings can be global (applied everywhere in the GUI) or local to a specific part of the GUI, like the Pattern Editor.

> [!NOTE]
> There is no way to define default keyboard shortcuts for your entries. Users must manually bind them in the keyboard preferences pane. As soon as they do, the bindings are saved just like any other key binding in Renoise.

To add a key binding, use the tool's [`renoise.tool():add_keybinding`](../API/renoise/renoise.ScriptingTool.md#add_keybinding) function.

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
        {"OK"}
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

## Custom GUIs

You can create custom dialogs and tool windows for your tools using the [`renoise.ViewBuilder`](../API/renoise/renoise.ViewBuilder.md) and [`renoise.Application`](../API/renoise/renoise.Application.md).

### Modal and Non-Modal Dialogs

There are two main ways to show a custom view:

```lua
-- Shows a modal dialog with a title, custom content, and custom button labels.
-- It blocks interaction with the main window until closed.
renoise.app():show_custom_prompt(
  title, content_view, {button_labels} [, key_handler_func, key_handler_options])
  -> [pressed_button_index]
```

See the API docs for [`renoise.app():show_custom_prompt`](../API/renoise/renoise.Application.md#show_custom_prompt) for more info.

```lua
-- Shows a non-modal dialog (a floating tool window) with custom content.
renoise.app():show_custom_dialog(
  title, content_view [, key_handler_func, key_handler_options])
  -> [dialog_object]
```

See the API docs for [`renoise.app():show_custom_dialog`](../API/renoise/renoise.Application.md#show_custom_dialog) for more info.

The optional `key_handler_func` allows you to capture keyboard events in the dialog. See the API docs for [`KeyHandler`](../API/renoise/renoise.Application.md#key_handler) for details.

### Creating Views with ViewBuilder

Widgets are created with the [`renoise.ViewBuilder`](../API/renoise/renoise.ViewBuilder.md) class.

#### Hello World

```lua
-- We start by instantiating a view builder object.
local vb = renoise.ViewBuilder()

-- We will use a "column" view to stack other views vertically.
-- A column can:
-- 1. Show a background style.
-- 2. Stack child views vertically (vb:column) or horizontally (vb:row).
-- 3. Align child views using margins and spacing.

local dialog_title = "Hello World"
local dialog_buttons = { "OK" }

-- Fetch some constants to make the dialog look like Renoise's native views.
local DEFAULT_MARGIN = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN

-- Start with a 'column' view to stack other views vertically.
local dialog_content = vb:column {
  -- Set a margin around our main content.
  margin = DEFAULT_MARGIN,
  views = {
    -- Create another column to group our text with a different background.
    vb:column {
      -- A background style that is usually used for "groups".
      style = "group",
      -- Add some margin inside the group to make it look nice.
      margin = DEFAULT_MARGIN,
      views = {
        -- Finally, add the text to the inner column.
        vb:text {
          text = "from the Renoise Scripting API\n" ..
                 "in a vb:column with a background."
        },
      }
    }
  }
}

-- Show the custom content in a prompt.
renoise.app():show_custom_prompt(
  dialog_title, dialog_content, dialog_buttons)
```

#### Dynamic Content

GUIs are usually dynamic. To interact with widgets after they are created, you need a way to reference them. Here's how this works with the ViewBuilder API.

```lua
local vb = renoise.ViewBuilder()

-- You can build views step-by-step instead of nesting them all at once.
-- This can be clearer for complex layouts.

-- This step-by-step approach:
local my_column_view = vb:column{}
my_column_view.margin = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
my_column_view.style = "group"

local my_text_view = vb:text{}
my_text_view.text = "My text"
my_column_view:add_child(my_text_view)

-- ...is equivalent to this nested approach:
local my_column_view_nested = vb:column {
  margin = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN,
  style = "group",
  views = {
    vb:text {
      text = "My text"
    }
  }
}

-- The nested notation has a problem: you can't easily get references to your
-- views later (e.g., to hide them or change their text). This is what view
-- builder "id"s are for.

-- Let's build a simple view that dynamically reacts to a button press.

local DEFAULT_DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
local DEFAULT_CONTROL_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING

local dialog_title = "ViewBuilder IDs"
local dialog_buttons = {"OK"}

local dialog_content = vb:column {
  margin = DEFAULT_DIALOG_MARGIN,
  spacing = DEFAULT_CONTROL_SPACING,
  views = {
    vb:text {
      id = "my_text", -- We give the view a unique id here.
      text = "Do what you see"
    },
    vb:button {
      text = "Hit Me!",
      tooltip = "Hit this button to change the text above.",
      notifier = function()
        -- Here we resolve the id to get a reference to the text view.
        local my_text_view = vb.views.my_text
        my_text_view.text = "Button was hit."
      end
    }
  }
}

-- We are doing two things here:
-- 1. We create a vb:text view and give it a unique `id`. This id can be
--    used at any time to access this view via `vb.views.my_text`.
-- 2. We add a `vb:button` control with a `notifier` function. The notifier
--    is called as soon as the button is pressed.

-- Please note that ids are unique per ViewBuilder object. You can create
-- multiple ViewBuilder instances (e.g., one for each component) to manage
-- different sets of ids.

renoise.app():show_custom_prompt(
  dialog_title, dialog_content, dialog_buttons)
```

#### More Examples

See the `com.renoise.ExampleToolGui.xrnx` tool for more examples. This tool can be read as its own little guide and provides many more in-depth examples.

The example tools can be downloaded as part of the XRNX Starter Pack from the [official repository's releases page](https://github.com/renoise/xrnx/releases).

## MIDI Mappings

You can extend Renoise's default MIDI mapping set or add custom MIDI mappings for your tool using [`renoise.tool():add_midi_mapping`](../API/renoise/renoise.ScriptingTool.md#add_midi_mapping).

A tool's MIDI mapping can be used just like regular mappings: by manually binding it in the MIDI mapping dialog, or by assigning it to a custom GUI control via the `midi_mapping` property.

```lua
renoise.tool():add_midi_mapping {
  name = "My Tool:Control Something",
  invoke = function(message)
    -- message is a renoise.ScriptingTool.MidiMessage
    if message.is_trigger then
      renoise.app():show_status("MIDI trigger received!")
    end
    if message.is_abs_value then
      local value = message.int_value
      renoise.app():show_status("MIDI value received: " .. value)
    end
  end
}
```

The `name` property follows the format `$topic_name:$optional_sub_topic_name:$mapping_name` to organize mappings in the list. The `invoke` function receives a `MidiMessage` object that describes the incoming MIDI data.

## File Import Hooks

You can add support for new filetypes in Renoise using [`renoise.tool():add_file_import_hook`](../API/renoise/renoise.ScriptingTool.md#add_file_import_hook). Registered file types will appear in Renoise's disk browser and can be loaded via drag-and-drop.

```lua
renoise.tool():add_file_import_hook {
  category = "sample",
  extensions = {"txt"},
  invoke = function(file_name)
    -- This is a dummy example. A real implementation would
    -- parse the file and create sample data.
    local file = io.open(file_name, "r")
    if not file then return false end
    local content = file:read("*a")
    file:close()
    
    local sample = renoise.song().selected_sample
    if not sample then return false end
    
    -- For simplicity, we just show the content in a dialog
    -- instead of creating a sample from it.
    renoise.app():show_message(
      "Imported TXT as Sample",
      "File content:\n" .. content
    )
    
    -- Return true on success, false on failure.
    return true
  end
}
```

Your hook must specify a `category` (e.g., "sample", "instrument"), a list of file `extensions`, and an `invoke` function that performs the import logic.


## Timers

Tools can register functions that are called periodically using [`renoise.tool():add_timer`](../API/renoise/renoise.ScriptingTool.md#add_timer). This is useful for background tasks or animations in custom GUIs.

```lua
local tick_count = 0
local function my_timer_func()
  tick_count = tick_count + 1
  renoise.app():show_status("Timer tick: " .. tick_count)
  if tick_count >= 10 then
    -- To create a one-shot timer, remove it when it's no longer needed.
    renoise.tool():remove_timer(my_timer_func)
    renoise.app():show_status("Timer removed.")
  end
end

-- Call my_timer_func every 1000ms (1 second).
renoise.tool():add_timer(my_timer_func, 1000)
```

Timers are paused when modal dialogs are open. The interval is not guaranteed to be exact, but it's usually accurate to within a few milliseconds.


## Application Notifiers

The tool object provides several `..._observable` properties that allow you to react to application-level events, such as loading a new song or the tool being shut down. This is the primary way to manage your tool's lifecycle.

```lua
local function on_new_song()
  local song_name = renoise.song() and renoise.song().name or "Untitled"
  renoise.app():show_status("New song loaded: " .. song_name)
end

-- Called every time a new song is created or loaded.
renoise.tool().app_new_document_observable:add_notifier(on_new_song)

local function on_tool_shutdown()
  -- This is a good place to clean up resources.
  print("My tool is unloading.")
end

-- Called right before the tool is unloaded.
renoise.tool().tool_will_unload_observable:add_notifier(on_tool_shutdown)
```

Some important notifiers include:
*   `tool_finished_loading_observable`: Fired when the tool has been successfully loaded.
*   `tool_will_unload_observable`: Fired just before the tool is disabled or reloaded.
*   `app_new_document_observable`: Fired after a new song has been loaded.
*   `app_release_document_observable`: Fired before the current song is closed.
*   `app_will_save_document_observable` Fired just before the song is saved.
*   `app_idle_observable`: Fired periodically, useful for low-priority background tasks.

## Preferences

Tools can have preferences that are saved and loaded by Renoise. To use them, we first need to create a [`renoise.Document`](../API/renoise/renoise.Document.md) object which holds the options that we want to store.

Fields in a Renoise Document are defined as [Observable types](./observables.md). This is especially handy for settings dialogs, as UI widgets can be directly bound to these observable properties. The UI will automatically update the document, and vice-versa.

Let's see an example of setting up an `options` object for a tool. Our goal is to have a few settings managed by a Document and a dialog to change them. The tool will be able to randomize the song's BPM and track count.

We will also define a menu entry to open our tool's settings dialog. See the sections on [Menu Entries](#menu-entries) and [Custom GUIs](#custom-guis) for more details.

```lua
-- Create a new renoise.Document by supplying a table of default values.
-- Each field will be wrapped in an Observable type (e.g., ObservableBoolean).
-- * a boolean for whether the tool should randomize the BPM
-- * a boolean for randomizing tracks
-- * an integer for the maximum number of tracks
local options = renoise.Document.create("RandomizerToolPreferences") {
  randomize_bpm = true,
  randomize_tracks = false,
  max_tracks = 16
}

-- Once we have our options, we assign the document to our tool's preferences.
renoise.tool().preferences = options

-- Define a randomizer function.
-- When called, it will set a random BPM and add or remove tracks.
local function randomize_song()
  local song = renoise.song()
  -- Use .value to access the underlying value of an Observable
  if options.randomize_bpm.value then
    -- Set BPM to a value between 60 and 180
    song.transport.bpm = 60 + math.random() * 120
  end
  
  if options.randomize_tracks.value then
    -- Figure out how many tracks we want based on the max_tracks option
    local target_count = 1 + math.floor(math.random() * options.max_tracks.value)
    local current_count = song.sequencer_track_count

    if current_count < target_count then
      -- Insert new tracks if there aren't enough
      for i = 1, target_count - current_count do
        song:insert_track_at(current_count)
      end
    else
      -- Remove tracks if there are too many
      for i = 1, current_count - target_count do
        song:delete_track_at(song.sequencer_track_count)
      end
    end
  end
end

-- Define a function to show a custom dialog for our options.
function show_options()
  local vb = renoise.ViewBuilder()

  local dialog_content = vb:column {
    margin = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN,
    views = {
      -- Add randomize BPM option
      vb:row {
        views = {
          -- Bind our observable value directly to this checkbox
          vb:checkbox {
            bind = options.randomize_bpm
          },
          vb:text {
            text = "Randomize BPM"
          }
        }
      },
      -- Add randomize tracks option
      vb:row {
        views = {
          -- Same for the randomize_tracks boolean
          vb:checkbox {
            bind = options.randomize_tracks
          },
          vb:text {
            text = "Randomize Tracks"
          },
        }
      },
      -- Add max tracks row
      vb:row {
        views = {
          -- For max_tracks, create a valuebox and bind it.
          -- Restrict it to a range of [1..16].
          vb:valuebox {
            min = 1,
            max = 16,
            bind = options.max_tracks
          },
          vb:text {
            text = "Tracks Max"
          }
        }
      },
      -- Add some space
      vb:space{ 
        height = renoise.ViewBuilder.DEFAULT_DIALOG_SPACING
      }, 
      -- Add a button that will execute the randomization
      vb:button {
        text = "Randomize Now",
        notifier = randomize_song
      }
    }
  }
  
  renoise.app():show_custom_dialog(
    "Randomizer Options", dialog_content
  )
end

-- Finally, add a menu entry to open our options dialog.
renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Randomizer Options...",
  invoke = show_options
}
```

As you can see, all we had to do was assign our observables to the `bind` property of the UI controls. Renoise handles the synchronization between the UI and the document automatically.

### preferences.xml

When you assign a document to `renoise.tool().preferences`, Renoise automatically saves its state to a `preferences.xml` file inside your tool's folder. As long as you use simple data types, you don't have to worry about serialization.

Try restarting Renoise to see that the values you've set in your dialog persist between sessions.

### Complex Documents

For more complex applications, or if you prefer an object-oriented approach, you can create a class that inherits from [`renoise.Document.DocumentNode`](../API/renoise/renoise.Document.DocumentNode.md) and register properties in its constructor.

You could rewrite the document creation from the example above like this:

```lua
---@class RandomizerToolPreferences : renoise.Document.DocumentNode
---@field randomize_bpm renoise.Document.ObservableBoolean
---@field randomize_tracks renoise.Document.ObservableBoolean
---@field max_tracks renoise.Document.ObservableNumber
class "RandomizerToolPreferences" (renoise.Document.DocumentNode)

function RandomizerToolPreferences:__init()
  renoise.Document.DocumentNode.__init(self)
  -- Register observable properties which will make up our Document
  self:add_property("randomize_bpm", true)
  self:add_property("randomize_tracks", false)
  self:add_property("max_tracks", 16)
end

---@type RandomizerToolPreferences
local options = RandomizerToolPreferences()

renoise.tool().preferences = options
```

This approach allows you to build more structured and complex preference documents. See the complete [Document API](../API/renoise/renoise.Document.md) for more details on what you can store and how to manage it.

> [!NOTE]
> This time we also included type annotations (like `---@class RandomizerToolPreferences`). These can help you with development when using a Lua language server like [LuaLS](https://luals.github.io/), but they are not required for the script to run.
