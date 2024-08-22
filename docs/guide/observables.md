# Observables

The Renoise API makes extensive use of [the Observer pattern](https://en.wikipedia.org//wiki/Observer_pattern). In short, different values can be wrapped in Observable objects on which you can register notifier functions that will get called whenever the underlying value changes. This is a great way to react to changes without having to deal with constantly comparing the value to a cached state for example.

When reading the [API](../API/README.md), you will find a lot of fields with `_observable` at the end. Let's see how we can utilize this feature by attaching a notifier so that our tool can do something whenever the user loads a new song.

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

There are different Observables for each primitive type like `ObservableBoolean`, `ObservableNumber` or `ObservableString` and ones that are for storing list of such values (`ObservableBooleanList` etc.). You can check out the entire [Observables API](../API/renoise/renoise.Document.Observable.md) to see them all.
