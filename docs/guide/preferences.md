# Preferences

Tools can have preferences that are saved and loaded by Renoise. To use them, we first need to create a [`renoise.Document`](../API/renoise/renoise.Document.md) object which holds the options that we want to store.

Fields in a Renoise Document are defined as [Observable types](./observables.md). This is especially handy for settings dialogs, as UI widgets can be directly bound to these observable properties. The UI will automatically update the document, and vice-versa.

Let's see an example of setting up an `options` object for a tool. Our goal is to have a few settings managed by a Document and a dialog to change them. The tool will be able to randomize the song's BPM and track count.

We will also define a menu entry to open our tool's settings dialog. You can read more about menu entries in the [Menus guide](./menus.md) and about graphical dialogs in the [Views guide](./views.md).

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
function randomize_song()
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
    margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
    spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,

    vb:row {
      vb:text {
        text = "Randomize BPM"
      },
      -- Bind our observable value directly to this checkbox
      vb:checkbox {
        bind = options.randomize_bpm
      }
    },
    vb:row {
      vb:text {
        text = "Randomize Tracks"
      },
      -- Same for the randomize_tracks boolean
      vb:checkbox {
        bind = options.randomize_tracks
      }
    },
    vb:row {
      vb:text {
        text = "Max Tracks"
      },
      -- For max_tracks, create a valuebox and bind it.
      -- Restrict it to a range of [1..16].
      vb:valuebox {
        min = 1,
        max = 16,
        bind = options.max_tracks
      }
    },
    -- Add a button that will execute the randomization
    vb:button {
      text = "Randomize Now",
      notifier = randomize_song
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

## preferences.xml

When you assign a document to `renoise.tool().preferences`, Renoise automatically saves its state to a `preferences.xml` file inside your tool's folder. As long as you use simple data types, you don't have to worry about serialization.

Try restarting Renoise to see that the values you've set in your dialog persist between sessions.

## Complex Documents

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
