# The Renoise Application

The `renoise.app()` function is the entry point for interacting with the Renoise application itself. It returns a [`renoise.Application`](../API/renoise/renoise.Application.md) object, which provides access to global application states, functions for user interaction like dialogs, and control over the main window.

## Controlling the Application Window

The [`renoise.ApplicationWindow`](../API/renoise/renoise.ApplicationWindow.md) object, accessed via `renoise.app().window`, allows you to query and control the state of the main Renoise UI.

```lua
local window = renoise.app().window

-- Toggle fullscreen mode
window.fullscreen = not window.fullscreen

-- Check if the disk browser is visible
if window.disk_browser_is_visible then
  print("Disk browser is currently open.")
end

-- Switch the middle frame to the Mixer view
window.active_middle_frame = 
  renoise.ApplicationWindow.MIDDLE_FRAME_MIXER
```

You can also attach notifiers to many window properties to react to UI changes made by the user.

```lua
local window = renoise.app().window

-- Be notified when the disk browser visibility changes
function disk_browser_visibility_changed()
  if window.disk_browser_is_visible then
    renoise.app():show_status("Disk browser was opened.")
  else
    renoise.app():show_status("Disk browser was closed.")
  end
end

window.disk_browser_is_visible_observable:add_notifier(
  disk_browser_visibility_changed
)
```

## Song and File Handling

The application object provides functions to load, and save songs, instrument and other kinds of components. Note that these operations are not always instantaneous, as Renoise may need to prompt the user to save changes. 

To reliably execute code after a new song is created or loaded, you should use notifiers.

```lua
local app = renoise.app()

-- This will show a file dialog to the user. The song is not loaded immediately.
app:load_song("/path/to/some/song_file") 

-- To run code after a new song is ready, use a notifier.
-- This is typically done in your tool's initialization code.
function handle_new_document()
  print("A new song was created or loaded. The new song name is: " ..
    renoise.song().name)
end

-- The 'new_document_observable' is fired after a new song is
--- successfully created or loaded.
renoise.tool().app_new_document_observable:add_notifier(handle_new_document)

-- To save a song to a specific file:
app:save_song_as("/path/to/MyNewSong.xrns")
```

## Showing Dialogs and Messages

A common task for tools is to communicate with the user. The application object provides several functions to show different kinds of dialogs and messages.

### Simple Messages

For simple notifications, you can use `show_message`, `show_error`, `show_warning`, or `show_status`.

```lua
local app = renoise.app()

-- Show a message in the status bar
app:show_status("This is a status message.")

-- Show a modal info dialog
app:show_message("This is an informational message.")

-- Show a modal warning dialog
app:show_warning("This is a warning message.")

-- Show a modal error dialog
app:show_error("This is an error message.")
```

### User Prompts

To ask the user for a choice, you can use `show_prompt`. It displays a dialog with custom buttons and returns the label of the button that was pressed.

```lua
local app = renoise.app()

local pressed_button = app:show_prompt(
  "Confirm Action", 
  "Do you want to proceed?", 
  { "Yes", "No", "Cancel" }
)

if pressed_button == "Yes" then
  app:show_message("You chose to proceed.")
elseif pressed_button == "No" then
  app:show_message("You chose not to proceed.")
else
  app:show_message("You canceled the operation.")
end
```

### Custom Dialogs

For more complex user interfaces, you can create custom non-modal dialogs (tool windows) with `show_custom_dialog`. This requires using the `renoise.ViewBuilder` API to construct the UI.

```lua
-- A simple custom dialog example
local vb = renoise.ViewBuilder()

local my_dialog = nil
local my_dialog_content = vb:column {
  margin = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN,
  spacing = renoise.ViewBuilder.DEFAULT_DIALOG_SPACING,
  views = {
    vb:text {
      text = "This is a custom dialog."
    },
    vb:button {
      text = "Close Me",
      notifier = function()
        -- my_dialog is defined when calling show_custom_dialog
        my_dialog:close()
      end
    }
  }
}

my_dialog = renoise.app():show_custom_dialog(
  "My Tool Window", my_dialog_content
)
```

## File and Path Prompts

Your tool might need to read from or write to files. The API provides functions to open native file browser dialogs.

```lua
local app = renoise.app()

-- Prompt the user to select a directory
local dir_path = app:prompt_for_path("Select a Project Folder")
if dir_path and #dir_path > 0 then
  app:show_message("You selected the directory: " .. dir_path)
end

-- Prompt the user to select a file to open
local file_to_read = app:prompt_for_filename_to_read(
  { "txt", "lua" }, 
  "Open a Text File"
)
if file_to_read and #file_to_read > 0 then
  app:show_message("You selected the file: " .. file_to_read)
end

-- Prompt the user for a filename to save
local file_to_write = app:prompt_for_filename_to_write(
  "xml", 
  "Save Configuration"
)
if file_to_write and #file_to_write > 0 then
  app:show_message("File will be saved to: " .. file_to_write)
end
```
