# Views

Currently there are two ways to to create custom views in Tools:

```lua
-- Shows a modal dialog with a title, custom content and custom button labels:
renoise.app():show_custom_prompt(
  title, content_view, {button_labels} [, key_handler_func, key_handler_options])
  -> [pressed button]
```

See API Docs for [show_custom_prompt](../API/renoise/renoise.Application.md#show_custom_prompt) for more info.


```lua
-- Shows a non modal dialog, a floating tool window, with custom content:
renoise.app():show_custom_dialog(
  title, content_view [, key_handler_func, key_handler_options])
  -> [dialog object]
```

See API Docs for [show_custom_dialog](../API/renoise/renoise.Application.md#show_custom_prompt) for more info.

The `key_handler_func` in the custom dialog is optional. When defined, it should point to a function
with the signature noted below. 

See API Docs for [KeyHandler](../API/renoise/renoise.Application.md#key_handler) for more info.


## Creating Custom Views

Widgets are created with the `renoise.ViewBuilder` in the renoise API. 

See API Docs for [ViewBuilder](../API/renoise/renoise.ViewBuilder.md) for more info.

### Hello World

```lua
-- we start by creating a view builder. we'll use it to create views.
local vb = renoise.ViewBuilder()

-- now we are going to use a "column" view. a column can do three things:
-- 1. showing a background (if you don't want your views on the plain dialogs
--    back)
-- 2. "stack" other views (its child views) either vertically, or horizontally
--    vertically = vb:column{}
--    horizontally = vb:row{}
-- 3. align child views via "margins" -> borders for nested views

local dialog_title = "Hello World"
local dialog_buttons = {"OK"}

-- get some consts to let the dialog look like Renoises default views...
local DEFAULT_MARGIN = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN

-- start with a 'column' to stack other views vertically:
local dialog_content = vb:column {
  -- set a border of DEFAULT_MARGIN around our main content
  margin = DEFAULT_MARGIN,

  -- and create another column to align our text in a different background
  vb:column {
    -- background that is usually used for "groups"
    style = "group",
    -- add again some "borders" to make it more pretty
    margin = DEFAULT_MARGIN,

    -- now add the first text into the inner column
    vb:text {
    text = "from the Renoise Scripting API\n"..
        "in a vb:column with a background"
    },
  }
}

-- show the custom content in a prompt
renoise.app():show_custom_prompt(
  dialog_title, dialog_content, dialog_buttons)
```

#### Dynamic Content

GUIs usually are dynamic. They interact with the user. Do do so, you'll need to memorize references to some of your widgets. Here's an example on how this works in the Renoise View API.

```lua
local vb = renoise.ViewBuilder()

-- we've used above an inlined style to create view. This is very elegant
-- when creating only small & simple GUIs, but can also be confusing when the
-- view hierarchy gets more complex.
-- you actually can also build views step by step, instead of passing a table
-- with properties, set the properties of the views manually:

local DEFAULT_DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN

-- this:
local my_column_view = vb:column{}
my_column_view.margin = DEFAULT_DIALOG_MARGIN
my_column_view.style = "group"

local my_text_view = vb:text{}
my_text_view.text = "My text"
my_column_view:add_child(my_text_view)

-- is exactly the same like this:
local my_column_view = vb:column{
  margin = DEFAULT_DIALOG_MARGIN,
  style = "group",
  vb:text{
    text = "My text"
  }
}

-- in practice you should use a combination of the above two notations, but
-- its recommended to setup & prepare components in separate steps while
-- still using the inlined / nested notation:

local my_first_column_view = vb:column {
  -- some content
}

local my_second_column_view = vb:column {
  -- some more content
}

-- then do the final layout:
local my_final_layout = vb:row {
  my_first_column_view,
  my_second_column_view
}

-- the inlined notation has a problem though: you can not memorize your views
-- in local variables, in case you want to access them later (for example to
-- hide/how them, change the text or whatever else). This is what viewbuilder
-- "id"s are for.

-- lets build up a simple view that dynamically reacts on a button hit:

local DEFAULT_DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
local DEFAULT_CONTROL_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING

local dialog_title = "vb IDs"
local dialog_buttons = {"OK"};

local dialog_content = vb:column {
  margin = DEFAULT_DIALOG_MARGIN,
  spacing = DEFAULT_CONTROL_SPACING,

  vb:text {
    id = "my_text", -- we're giving the view a unique id here
    text = "Do what you see"
  },

  vb:button {
    text = "Hit Me!",
    tooltip = "Hit this button to change the above text.",
    notifier = function()
      -- here we resolve the id and access the above constructed view
      local my_text_view = vb.views.my_text
      my_text_view.text = "Button was hit."
    end
  }
}

-- We are doing two things here:
-- First we do create a vb:text as usual, but this time we also give it an
-- id "my_text_view". This id can then at any time be used to resolve this
-- view. So we can use the inlined notation without having to create lots of
-- local view refs

-- There's now also a first control present: a button. Controls may have
-- notifiers.
-- The buttons notifier is simply a function without arguments, which is
-- called as soon as you hit the button. Tf you use other views like a
-- value box, the notifiers will pass a value along your function...

-- Please note that ids are unique !per viewbuilder object!, so you can
-- create several viewbuilders (one for each component) to access multiple
-- sets of ids.

renoise.app():show_custom_prompt(
  dialog_title, dialog_content, dialog_buttons)
```

### More Examples

See [com.renoise.ExampleToolGUI.xrnx](https://github.com/renoise/xrnx/tree/master/tools) for more examples. This tool be read as it's own little guide and provides a lot more in-depth examples. 

The example tools can also be downloaded as part of a XRNX Starter pack Bundle from the [releases page](https://github.com/renoise/xrnx/releases).
