# TODO

# The Song

explain how the song is structured and provide some snippets to change things

# Patterns and Phrases

describe how to access the columns in patterns and phrases, mention iterators for performance

# Keybindings

show how keybindings work, explain scopes

```
keybindings: Register key bindings somewhere in Renoise's existing
set of bindings.

The Lua table passed to add_keybinding is defined as:

* Required fields:
  + ["name"] = The scope, name and category of the key binding.
  + ["invoke"] = A function that is called as soon as the mapped key is
      pressed. The callback has one argument: "repeated", indicating
      if its a virtual key repeat.
The key binding's 'name' must have 3 parts, separated by ":" e.g.
[scope:topic_name:binding_name]

* 'scope' is where the shortcut will be applied, just like those
  in the categories list for the keyboard assignment preference pane.
* 'topic_name' is useful when grouping entries in the key assignment pane.
  Use "tool" if you can't come up with something meaningful.
* 'binding_name' is the name of the binding.

Currently available scopes are:
> "Global", "Automation", "Disk Browser", "Instrument Box", "Mixer",
> "Pattern Editor", "Pattern Matrix", "Pattern Sequencer", "Sample Editor"
> "Track DSPs Chain"

Using an unavailable scope will not fire an error, instead it will render the
binding useless. It will be listed and mappable, but never be invoked.

There's no way to define default keyboard shortcuts for your entries. Users
manually have to bind them in the keyboard prefs pane. As soon as they do,
they'll get saved just like any other key binding in Renoise.

```

# Menus

explain how to create menu items and folders and their scopes

```

menu_entries: Insert a new menu entry somewhere in Renoise's existing
context menus or the global app menu. Insertion can be done during
script initialization, but can also be done dynamically later on.

The Lua table passed to 'add_menu_entry' is defined as:

* Required fields:
  + ["name"] = Name and 'path' of the entry as shown in the global menus or
      context menus to the user
  + ["invoke"] = A function that is called as soon as the entry is clicked

* Optional fields:
  + ["active"] = A function that should return true or false. When returning
      false, the action will not be invoked and will be "greyed out" in
      menus. This function is always called before "invoke", and every time
      prior to a menu becoming visible.
  + ["selected"] = A function that should return true or false. When
      returning true, the entry will be marked as "this is a selected option"

Positioning entries:

You can place your entries in any context menu or any window menu in Renoise.
To do so, use one of the specified categories in its name:

+ "Window Menu" -- Renoise icon menu in the window caption on Windows/Linux
+ "Main Menu" (:File", ":Edit", ":View", ":Tools" or ":Help") -- Main menu
+ "Scripting Menu" (:File",  or ":Tools") -- Scripting Editor & Terminal
+ "Disk Browser Directories"
+ "Disk Browser Files"
+ "Instrument Box"
+ "Pattern Sequencer"
+ "Pattern Editor"
+ "Pattern Matrix"
+ "Pattern Matrix Header"
+ "Phrase Editor"
+ "Phrase Mappings"
+ "Phrase Grid"
+ "Sample Navigator"
+ "Sample Editor"
+ "Sample Editor Ruler"
+ "Sample Editor Slice Markers"
+ "Sample List"
+ "Sample Mappings"
+ "Sample FX Mixer"
+ "Sample Modulation Matrix"
+ "Mixer"
+ "Track Automation"
+ "Track Automation List"
+ "DSP Chain"
+ "DSP Chain List"
+ "DSP Device"
+ "DSP Device Header"
+ "DSP Device Automation"
+ "Modulation Set"
+ "Modulation Set List"

Separating entries:

To divide entries into groups (separate entries with a line), prepend one or
more dashes to the name, like "--- Main Menu:Tools:My Tool Group Starts Here"
```


# Views

overview of the view API

```
-- Currently there are two ways to to create custom views:
--
-- Shows a modal dialog with a title, custom content and custom button labels:
renoise.app():show_custom_prompt(
  title, content_view, {button_labels} [, key_handler_func, key_handler_options])
  -> [pressed button]

-- _(and)_ Shows a non modal dialog, a floating tool window, with custom
-- content:
renoise.app():show_custom_dialog(
  title, content_view [, key_handler_func, key_handler_options])
  -> [dialog object]

-- key_handler_func is optional. When defined, it should point to a function
-- with the signature noted below. "key" is a table with the fields:
-- > key = {  
-- >   name,      -- name of the key, like 'esc' or 'a' - always valid  
-- >   modifiers, -- modifier states. 'shift + control' - always valid  
-- >   character, -- character representation of the key or nil  
-- >   note,      -- virtual keyboard piano key value (starting from 0) or nil  
-- >   state,     -- optional (see below) - is the key getting pressed or released?
-- >   repeated,  -- optional (see below) - true when the key is soft repeated (held down)
-- > }
-- 
-- The "repeated" field will not be present when 'send_key_repeat' in the key 
-- handler options is set to false. The "state" field only is present when the
-- 'send_key_release' in the key handler options is set to true. So by default only 
-- key presses are send to the key handler.
--
-- key_handler_options is an optional table with the fields:
-- > options = { 
-- >   send_key_repeat=true OR false   -- by default true
-- >   send_key_release=true OR false  -- by default false
-- > }
-- >
-- Returned "dialog" is a reference to the dialog the keyhandler is running on.
--
--     function my_keyhandler_func(dialog, key) end
--
-- When no key handler is specified, the Escape key is used to close the dialog.
-- For prompts, the first character of the button labels is used to invoke
-- the corresponding button.
-- 
-- When returning the passed key from the key-handler function, the
-- key will be passed back to Renoise's key event chain, in order to allow
-- processing global Renoise key-bindings from your dialog. This will not work
-- for modal dialogs. This also only applies to global shortcuts in Renoise,
-- because your dialog will steal the focus from all other Renoise views such as
-- the Pattern Editor, etc.
```