# Renoise Lua API Overview

The XXX.API files in this documentation folder will list all available Lua
functions and classes that can be accessed from scripts in Renoise.
If you are familiar with Renoise, the names of the classes, functions and
properties should be self explanitory.

A note about the general API design:

- Whatever you do with the API, you should never be able to fatally crash Renoise. If you manage to do this, then please file a bug report in our forums so we can fix it. All errors, as stupid they might be, should always result in a clean error message from Lua.

- The Renoise Lua API also allows global File IO and external program execution (via os.execute()) which can obviously be hazardous. Please be careful with these, as you would with programming in general...

Some notes about the documentation, and a couple of tips:

- All classes, functions in the API, are nested in the namespace (Lua table) "renoise". E.g: to get the application object, you will have to type "renoise.app()"

- The API is object-oriented, and thus split into classes. The references will first note the class name (e.g. 'renoise.Application'), then list its Constants, Properties, Functions and Operators. All properties and functions are always listed with their full path to make it clear where they belong and how to access them.

- Nearly all functions are actually "methods", so you have to invoke them via the colon operator ":" E.g. 'renoise.app():show_status("Status Message")' If you're new to Lua, this takes a while to get used to. Don't worry, it'll make sense sooner or later. ;)

- Properties are syntactic sugar for get/set functions. "song().comments" will invoke a function which returns "comments". But not all properties have setters, and thus can only be used as read-only "getters". Those are marked as "**READ-ONLY**".

- All exposed "objects" are read-only (you can not add new fields, properties). In contrast, the "classes" are not. This means you can extend the API classes  with your own helper functions, if needed, but can not add new properties to objects. Objects, like for example the result of "song()", are read-only to make it easier to catch typos. `song().transport.bmp = 80` will fire an error, because there is no such property 'bmp.' You probably meant `song().transport.bpm = 80` here. If you need to store data somewhere, do it in your own tables, objects instead of using the Renoise API objects.

- "some_property, _observable" means, that there is also an observer object available for the property. An observable object allows you to attach notifiers (global functions or methods) that will be called as soon as a value has changed. Please see Renoise.Document.API for more info about observables and related classes. 
  
A small example using bpm:
```lua
renoise.song().transport.bpm_observable:add_notifier(function()
  print("bpm changed")
end)

-- will print "bpm changed", but only if the bpm was not 120 before
renoise.song().transport.bpm = 120
```

The above notifier is called when anything changes the bpm, including your script, other scripts, or anything else in Renoise (you've automated the BPM in the song, entered a new BPM value in Renoise's GUI, whatever...)

Lists like "renoise.song().tracks[]" can also have notifiers. But these will only fire when the list layout has changed: an element was added, removed or elements in the list changed their order. They will not fire when the list values changed. Attach notifiers to the list elements to get such notifications.

- Can't remember what the name of function XYZ was? In the scripting terminal you can list all methods/properties of API objects (or your own class objects) via the global function `oprint(some_object)` - e.g. `oprint(renoise.song())`. To dump the renoise module/class layout, use `rprint(renoise)`.