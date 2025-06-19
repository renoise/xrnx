# Observables

The Renoise API makes extensive use of the [Observer pattern](https://en.wikipedia.org/wiki/Observer_pattern). In short, many values are wrapped in "Observable" objects. You can register "notifier" functions on these objects, which will be called whenever the underlying value changes. This is a powerful way to react to changes in the application state without constantly polling and comparing values.

When browsing the [API documentation](../API/README.md), you will find many properties with an `_observable` suffix. Let's see how to use this feature by attaching a notifier that runs when the user loads a new song.

```lua
local function on_new_document()
  renoise.app():show_message("Loaded a new song!")
end

-- Get the tool's new_document observable and add our function as a notifier.
renoise.tool().app_new_document_observable:add_notifier(on_new_document)
```

A common pattern is to attach notifiers to song-specific properties inside the `app_new_document_observable` notifier. This ensures that your notifiers are re-attached whenever a new song is loaded. To listen for changes on a specific value, you typically add `_observable` to the property name and add a notifier to it.

Let's extend the previous snippet to also fire a message whenever the name of the song changes.

```lua
local function on_song_name_changed()
  local song_name = renoise.song().name
  renoise.app():show_message("New name was set!\nName: " .. song_name)
end

local function on_new_document()
  renoise.app():show_message("Loaded a new song!")
  -- When a new song is loaded, attach a notifier to its name_observable
  renoise.song().name_observable:add_notifier(on_song_name_changed)
end

renoise.tool().app_new_document_observable:add_notifier(on_new_document)
```

Now, try changing the song title in the "Song Settings" tab to see your message pop up.

With this technique, you can listen to all sorts of events, which is very useful when you want your tool to react to user actions like selecting a new instrument, track, or sample.

There are different Observables for each primitive type, such as `ObservableBoolean`, `ObservableNumber`, or `ObservableString`, as well as list types like `ObservableBooleanList`. You can explore the entire [Observables API](../API/renoise/renoise.Document.Observable.md) to see them all.
