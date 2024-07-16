# Observables

The Renoise API makes extensive use of [the Observer pattern](https://en.wikipedia.org//wiki/Observer_pattern). In short, different values can be wrapped in Observable objects on which you can register notifier functions that will get called whenever the underlying value changes. This is a great way to react to changes without having to deal with constantly comparing the value to a cached state for example.

When reading the [API](https://github.com/renoise/definitions/), you will find a lot of fields with `_observable` at the end. Let's see how we can utilize this feature by attaching a notifier so that our tool can do something whenever the user loads a new song.

```lua
local loaded_new_song = function()
  renoise.app():show_message("Loaded a new song!")
end

renoise.tool().app_new_document_observable:add_notifier(loaded_new_song)
```

Try loading a tool with this code inside and open new songs. Whenever you want to attach notifiers to fields on the song, you should do it inside this function to make sure a song is already loaded and that you reattach things when the song changes. To listen to changes on specific values, you usually have to add `_observable` the name of the field and add a notifier to that. 

Let's extend the previous snippet so that it also fires whenever you change the name of an already loaded song.

```lua
local new_name_was_set = function()
  renoise.app():show_message("New name was set!\nName: " .. renoise.song().name)
end

local loaded_new_song = function()
  renoise.app():show_message("Loaded a new song!")
  renoise.song().name_observable:add_notifier(new_name_was_set)
end

renoise.tool().app_new_document_observable:add_notifier(loaded_new_song)
```

Now try changing the name of the current song inside the first field of the *Song / Song Comments* dialog to see your message pop up.

With this technique you can listen to all sorts of things which is very useful when you want your tool to change its behaviour or initialize itself each time the user selects a new instrument, track, sample and so on.

There are different Observables for each primitive type like `ObservableBoolean`, `ObservableNumber` or `ObservableString` and ones that are for storing list of such values (`ObservableBooleanList` etc.). You can check out the entire [Observables API](https://github.com/renoise/definitions/blob/main/library/renoise/document/observable.lua) to see them all.

# Preferences

Tools can have preferences just like Renoise. To use them we first need to create a renoise.Document object which holds the options that we want to store and restore. 

Documents in Renoise have all of their fields defined as an Observable type. This comes extra handy when you want to create some settings dialog that needs to be able change the behaviour of your tool and remember its state, while you also want to access these settings across your tool. By using the built-in Document API you get a lot of this functionality for free.

Let's see an example of setting up an `options` object that can be used for the above things. 

Our goal here is to have three kinds of settings managed by the Document class and a dialog that can be used to change them. The tool will be able to randomize the song by changing BPM and creating a random number of tracks. 

We will also define a menu entry for opening our tool settings dialog, you can read more about menu entries in the [Menus](TODO.md#menus) guide, graphical dialogs are further discussed in [Views](TODO.md#views).

```lua
-- We are creating a new renoise Document by supplying a table of values.
-- It has three fields, which will all get wrapped in an Observable
-- * a boolean for whether or not the tools should randomize the BPM
-- * another boolean for randomizing tracks
-- * an integer representing how many tracks we want to have at maximum
local options = renoise.Document.create("RandomizerToolPreferences") {
  randomize_bpm = true,
  randomize_tracks = false,
  max_tracks = 16
}

-- once we have our options, we have to assign it to our tool
renoise.tool().preferences = options

-- we define a randomizer function
-- when called, it will set a random BPM
-- and add or remove tracks randomly
function randomize_song()
  local song = renoise.song()
  -- make sure you use .value when accessing the underlying value inside Observables
  if options.randomize_bpm.value then
    -- we are setting the BPM to a value between 60 and 180
    song.transport.bpm = 60 + math.random() * 120
  end
  
  if options.randomize_tracks.value then
    -- let's figure out how many tracks we want based on the max_tracks option
    local target_count = 1 + math.floor(math.random() * options.max_tracks.value)

    -- and cache the amount of regular tracks the song has
    local current_count = song.sequencer_track_count

    -- we will either insert new tracks if there aren't enough
    if current_count < target_count then
      for i = 1, target_count - current_count do
        song:insert_track_at(current_count)
      end
    else
    -- or remove them if there is too much
      for i = 1, current_count - target_count do
        song:delete_track_at(song.sequencer_track_count)
      end
    end
  end
end

-- let's define a function for a custom dialog 
-- it will contain checkboxes and a slider for our options
function show_options()
  local vb = renoise.ViewBuilder()

  local dialog_content = vb:vertical_aligner {
    margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
    views = {
      vb:row {
        views = {
          vb:text {
            text = "Randomize BPM"
          },
          -- here we are binding our observable value to this checkbox
          vb:checkbox {
            bind = options.randomize_bpm
          }
        }
      },
      vb:row {
        views = {
          vb:text {
            text = "Randomize Tracks"
          },
          -- the same thing for the boolean for tracks
          vb:checkbox {
            bind = options.randomize_tracks
          }
        }
      },
      vb:row {
        views = {
          vb:text {
            text = "Max Tracks"
          },
          -- for the maximum tracks we create a value box 
          -- and restrict it to a range of [1..16]
          vb:valuebox {
            min = 1,
            max = 16,
            bind = options.max_tracks
          }
        }
      },
      -- add a button that will execute the randomization based on our options
      vb:row {
        vb:button {
          text = "Randomize",
          pressed = randomize_song
        }
      }
    }
  }
  renoise.app():show_custom_dialog(
    "Randomizer Options", dialog_content
  )
end

-- finally we add a menu entry to open our options dialog
renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Randomizer Options",
  invoke = show_options
}

```

As you can see all we had to do was to assign our observables to the `bind` field on the checkboxes and valuebox, Renoise will take care of updating our settings when the view changes and vice versa.

Of course you could also use observables this way without them being included in your settings, but this is the most common usage pattern for them.

## preferences.xml

When you assign the preferences, Renoise will take care of saving and loading your settings. Your tool will have a `preferences.xml` file created in its folder with the values from your options table. As long as you are using simple types, you don't have to worry about (de)serializing values. 

Try restarting Renoise to see that the values you've set in your dialog will persist over different sessions.

## Complex Documents

For more complex applications (or if you just prefer doing things the Object-Oriented way) you can also inherit from `renoise.Document.DocumentNode` and register properties in the constructor.

You could change the above Document creation to something like this:

```lua
---@class RandomizerToolPreferences : renoise.Document.DocumentNode
---@field randomize_bpm renoise.Document.ObservableBoolean
---@field randomize_tracks renoise.Document.ObservableBoolean
---@field max_tracks renoise.Document.ObservableNumber
class "RandomizerToolPreferences" (renoise.Document.DocumentNode)

function RandomizerToolPreferences:__init()
  renoise.Document.DocumentNode.__init(self)
  -- register an observable properties which will make up our Document
  self:add_property("randomize_bpm", true)
  self:add_property("randomize_tracks", false)
  self:add_property("max_tracks", 16)
end

---@type RandomizerToolPreferences
local options = RandomizerToolPreferences()

renoise.tool().preferences = options
```

This allows you to create more complex documents. Have a look at the complete [Document API](https://github.com/renoise/definitions/blob/main/library/renoise/document.lua) for more info and details about what else you can load/store this way.

> Note: This time we also included type annotations (like `---@class RandomizerToolPreferences`). These can help you with development but they aren't strictly necessary. You can read more about how to use them at the [LuaLS website](https://luals.github.io/).