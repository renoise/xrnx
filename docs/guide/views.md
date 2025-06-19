# Views

Currently, there are two ways to create custom views (dialogs) in Tools:

```lua
-- Shows a modal dialog with a title, custom content, and custom button labels.
-- It blocks interaction with the main window until closed.
renoise.app():show_custom_prompt(
  title, content_view, {button_labels} [, key_handler_func, key_handler_options])
  -> [pressed_button_index]
```

See the API docs for [`show_custom_prompt`](../API/renoise/renoise.Application.md#show_custom_prompt) for more info.

```lua
-- Shows a non-modal dialog (a floating tool window) with custom content.
renoise.app():show_custom_dialog(
  title, content_view [, key_handler_func, key_handler_options])
  -> [dialog_object]
```

See the API docs for [`show_custom_dialog`](../API/renoise/renoise.Application.md#show_custom_dialog) for more info.

The optional `key_handler_func` allows you to capture keyboard events in the dialog. See the API docs for [`KeyHandler`](../API/renoise/renoise.Application.md#key_handler) for details.

## Creating Custom Views

Widgets are created with the [`renoise.ViewBuilder`](../API/renoise/renoise.ViewBuilder.md) class.

### Hello World

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

### Dynamic Content

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

### More Examples

See the `com.renoise.ExampleToolGui.xrnx` tool for more examples. This tool can be read as its own little guide and provides many more in-depth examples.

The example tools can be downloaded as part of the XRNX Starter Pack from the [official repository's releases page](https://github.com/renoise/xrnx/releases).
