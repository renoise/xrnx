--[[============================================================================
com.renoise.ExampleToolGui.xrnx/main.lua
============================================================================]]
                                                                               --

---@diagnostic disable: lowercase-global
---@diagnostic disable: assign-type-mismatch

-- tool registration

-- (see com.renoise.ExampleTool.xrns/main.lua for a description of this
--  header and tools in general)

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:1. Hello World...",
  invoke = function() hello_world() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:2. Pretty Hello World...",
  invoke = function() pretty_hello_world() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:3. Dynamic Content & Ids...",
  invoke = function() dynamic_content() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:4. Batch Building Views (Matrix)...",
  invoke = function() dynamic_building_matrix() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:5. Aligning & Auto Sizing...",
  invoke = function() aligners_and_auto_sizing() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:6. Available Backgrounds & Text...",
  invoke = function() available_backgrounds() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:7. Available Controls...",
  invoke = function() available_controls() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:8. Documents & Views...",
  invoke = function() documents_and_views() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:9. Overflow & ScrollBar...",
  invoke = function() overflow_and_scrollbars() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:10. Dynamic Content & ScrollBar...",
  invoke = function() dynamic_content_and_scrollbars() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:11. Mouse Events...",
  invoke = function() handle_mouse_events() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:12. Keyboard Events...",
  invoke = function() handle_key_events() end
}

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Example Tool GUI:13. MIDI mapping...",
  invoke = function() midi_mapping() end
}


--------------------------------------------------------------------------------
-- Helper Function
--------------------------------------------------------------------------------

local function show_status(message)
  renoise.app():show_status(message)
  print(message)
end


--------------------------------------------------------------------------------
-- GUI
--------------------------------------------------------------------------------

-- hello_world

function hello_world()

  -- to create views, we do need to create a "viewbuilder object", which
  -- can be instantiated from the class renoise.ViewBuilder:
  local vb = renoise.ViewBuilder()

  -- a viewbuilder constructs views for us, which can then later on be
  -- passed to renoise to be shown - somehow. Right now there are two
  -- ways to show your custom views:
  -- app():show_custom_prompt() -> shows a modal dialog with buttons
  -- app():show_custom_dialog() -> shows a non modal dialog with custom content

  -- lets start with the most simple view/dialog thats possible, by only
  -- creating a prompt with a custom text.

  -- To create & configure views, we do pass a table with properties as
  -- argument to the viewbuilder functions:

  -- vb:text { text = "My text" }

  -- means nothing more than:
  -- 1. create a text view
  -- 2. tell the text view that its text property is "My text"


  -- here is how this looks like in action:

  local dialog_title = "Hello World"

  local dialog_content = vb:text {
    text = "from the Renoise Scripting API"
  }

  local dialog_buttons = { "OK" }

  renoise.app():show_custom_prompt(
    dialog_title, dialog_content, dialog_buttons)

  -- eh voila. Not pretty, but at least something to start with ;) We're going
  -- to make that a bit more pretty and advanced in the next example...
end

--------------------------------------------------------------------------------

-- pretty_hello_world

function pretty_hello_world()

  -- Beside of texts, controls and backgrounds and so on, the viewbuilder also
  -- offers some helper views which will help you to 'align' and stack views.

  -- lets start by creating a view builder again:
  local vb = renoise.ViewBuilder()

  -- now we are going to use a "column" view. a column can do three things:
  -- 1. showing a background (if you don't want your views on the plain dialogs
  --    back)
  -- 2. "stack" other views (its child views) either vertically, or horizontally
  --    vertically = vb:column{}
  --    horizontally = vb:row{}
  -- 3. align child views via "margins" -> borders for nested views

  -- lets use all of this in a bit more complicated hello world view:

  local dialog_title = "Hello World"
  local dialog_buttons = { "OK" };

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
      -- now add a text *into* the column
      views = {
        vb:text {
          text = "from the Renoise Scripting API\n" ..
              "in a vb:column with a background"
        }
      }
    }
  }

  renoise.app():show_custom_prompt(
    dialog_title, dialog_content, dialog_buttons)

  -- lets go on and start to use some real controls (buttons & stuff) now...
end

--------------------------------------------------------------------------------

-- dynamic_content

function dynamic_content()
  local vb = renoise.ViewBuilder()

  -- we've used above an inlined style to create view. This is very elegant
  -- when creating only small & simple GUIs, but can also be confusing when the
  -- view hierarchy gets more complex.
  -- you actually can also build views step by step, instead of passing a table
  -- with properties, set the properties of the views manually:

  local DEFAULT_DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN

  -- this:
  local my_column_view = vb:column {}
  my_column_view.margin = DEFAULT_DIALOG_MARGIN
  my_column_view.style = "group"

  local my_text_view = vb:text {}
  my_text_view.text = "My text"

  my_column_view:add_child(my_text_view)

  -- is exactly the same like this:
  local my_column_view = vb:column {
    margin = DEFAULT_DIALOG_MARGIN,
    style = "group",
    views = {
      vb:text {
        text = "My text"
      }
    }
  }

  -- in practice you should use a combination of the above two notations, but
  -- its recommended to setup & prepare components in separate steps while
  -- still using the inlined / nested notation:

  local my_first_column_view = vb:column {
    views = {
      -- some more content
    }
  }

  local my_second_column_view = vb:column {
    views = {
      -- some more content
    }
  }

  -- then do the final layout:
  local my_final_layout = vb:row {
    views = {
      my_first_column_view,
      my_second_column_view
    }
  }

  -- the inlined notation has a problem though: you can not memorize your views
  -- in local variables, in case you want to access them later (for example to
  -- hide/how them, change the text or whatever else). This is what viewbuilder
  -- "id"s are for.

  -- lets build up a simple view that dynamically reacts on a button hit:

  local DEFAULT_DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local DEFAULT_CONTROL_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING

  local dialog_title = "vb IDs"
  local dialog_buttons = { "OK" };

  local dialog_content = vb:column {
    margin = DEFAULT_DIALOG_MARGIN,
    spacing = DEFAULT_CONTROL_SPACING,
    views = {
      vb:text {
        id = "my_text",
        text = "Do what you see"
      },
      vb:button {
        text = "Hit Me!",
        tooltip = "Hit this button to change the above text.",
        notifier = function()
          ---@type renoise.Views.Text
          local text_view = vb.views.my_text
          text_view.text = "Button was hit."
        end
      }
    }
  }

  -- we are doing two things here:
  -- first we do create a vb:text as usual, but this time we also give it an
  -- id "my_text_view". This id can then at any time be used to resolve this
  -- view. So we can use the inlined notation without having to create lots of
  -- local view refs

  -- There's now also a first control present: a button. Controls may have
  -- notifiers.
  -- The buttons notifier is simply a function without arguments, which is
  -- called as soon as you hit the button. Tf you use other views like a
  -- value box, the notifiers will pass a value along your function...

  -- please note that ids are unique !per viewbuilder object!, so you can
  -- create several viewbuilders (one for each component) to access multiple
  -- sets of ids

  renoise.app():show_custom_prompt(
    dialog_title, dialog_content, dialog_buttons)
end

--------------------------------------------------------------------------------

-- dynamic_building_matrix

function dynamic_building_matrix()

  -- as shown in dynamic_content(), you can build views either in the "nested"
  -- notation, or "by hand". You can of course also combine both ways, for
  -- example if you want to dynamically build equally behaving view "blocks"

  -- here is a simple example that creates a note-octave-matrix with buttons

  local vb = renoise.ViewBuilder()

  local CONTENT_MARGIN = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN
  local BUTTON_WIDTH = 2 * renoise.ViewBuilder.DEFAULT_CONTROL_HEIGHT

  local NUM_OCTAVES = 10
  local NUM_NOTES = 12

  local note_strings = {
    "C-", "C#", "D-", "D#", "E-", "F-",
    "F#", "G-", "G#", "A-", "A#", "B-"
  }

  -- create the main content column, but don't add any views yet:
  local dialog_content = vb:vertical_aligner {
    margin = CONTENT_MARGIN,
  }

  for octave = 1, NUM_OCTAVES do
    -- create a row for each octave
    local octave_row = vb:row {}
    for note = 1, NUM_NOTES do
      local note_button = vb:button {
        id = "button" .. octave .. note,
        width = BUTTON_WIDTH,
        text = note_strings[note] .. tostring(octave - 1),
        notifier = function()
          -- functions do memorize all values in the scope they are
          -- nested in (upvalues), so we can simply access the note and
          -- octave from the loop here:
          show_status(("note_button %s%d got pressed"):format(
            note_strings[note], octave - 1))
        end

      }
      -- add the button by "hand" into the octave_row
      octave_row:add_child(note_button)
    end

    dialog_content:add_child(octave_row)
  end

  renoise.app():show_custom_dialog(
    "Batch Building Views", dialog_content)
end

--------------------------------------------------------------------------------

-- aligners_and_auto_sizing

function aligners_and_auto_sizing()

  -- beside of "stacking" views in columns and rows, its sometimes also useful
  -- to align some parts of the views for example centered or right
  -- this is what the view builders "horizontal_aligner" and "vertical_aligner"
  -- building blocks are for.

  -- related to this topic, we'll also show how you can auto size views: (size
  -- a view relative to its parents size). This is done by simply specifying
  -- percentage values for the sizes, like: width = "100%"

  local vb = renoise.ViewBuilder()

  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTENT_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING

  -- lets create a simple dialog as usual, and align a few totally useless
  -- buttons & texts:
  local dialog_content = vb:column {
    id = "dialog_content",
    margin = DIALOG_MARGIN,
    spacing = CONTENT_SPACING,
    views = {
      -- first center a text. We don't necessarily need aligners for this,
      -- but simply resize the text to fill the entrire row in the column,
      -- then tell the text view how it should align its content:
      vb:text {
        text = "horizontal_aligner",
        width = "100%",
        align = "center",
        font = "bold"
      },
      -- add a large Textfield (this will be our largest view the other
      -- views will align to)
      vb:textfield {
        value = "Large Text field",
        width = 300
      },
      -- align a text to the right, using 'align_horizontal'
      -- aligners do have margins & spacings, just like columns, rows have, which
      -- we now use to place a text 20 pixels on the right, top, bottom:
      vb:horizontal_aligner {
        background = "group",
        mode = "right",
        margin = 5,
        views = {
          vb:text {
            text = "I'm right and margined",
          },
        }
      },
      -- align a set of buttons to the left, using 'align_horizontal'
      -- well, this is actually just what "row" does, but horizontal_aligner
      -- automatically uses a width of "100%", while you can not use a "row"
      -- with a relative width...
      vb:horizontal_aligner {
        mode = "left",
        views = {
          vb:button {
            text = "[",
            width = 40
          },
          vb:button {
            text = "Left",
            width = 80
          },
          vb:button {
            text = "]",
            width = 20
          }
        }
      },
      -- align a set of buttons to the right, using 'align_horizontal'
      vb:horizontal_aligner {
        mode = "right",
        views = {
          vb:button {
            text = "[",
            width = 40
          },
          vb:button {
            text = "Right",
            width = 80
          },
          vb:button {
            text = "]",
            width = 20
          }
        }
      },
      -- align a set of buttons centered, using 'align_horizontal'
      vb:horizontal_aligner {
        mode = "center",
        views = {
          vb:button {
            text = "Center",
            width = 80
          }
        }
      },
      -- again a set of buttons centered, but with some spacing
      vb:horizontal_aligner {
        mode = "center",
        spacing = 8,
        views = {
          vb:button {
            text = "[",
            width = 40
          },
          vb:button {
            text = "Spacing = 8",
            width = 80
          },
          vb:button {
            text = "]",
            width = 20
          }
        }
      },
      -- show the "justify" align style
      vb:horizontal_aligner {
        mode = "justify",
        spacing = 8,
        views = {
          vb:button {
            text = "[",
            width = 40
          },
          vb:button {
            text = "Justify",
            width = 80
          },
          vb:button {
            text = "]",
            width = 20
          }
        }
      },
      -- show the "distribute" align style
      vb:horizontal_aligner {
        mode = "distribute",
        spacing = 8,
        views = {
          vb:button {
            text = "[",
            width = 40
          },
          vb:button {
            text = "Distribute",
            width = 80
          },
          vb:button {
            text = "]",
            width = 20
          }
        }
      },
      -- add a space before we start with a "new category"
      vb:space {
        height = 20
      },
      -- lets use a stack with relative width, height properties:
      vb:text {
        text = "stack",
        font = "bold",
        width = "100%",
        align = "center"
      },
      vb:stack {
        background = "plain",
        width = "100%",
        views = {
          vb:row {
            width = 80,
            height = 60,
            origin = { 10, 10 },
            style = "group",
          },
          vb:button {
            origin = { x = 20, y = 20 },
            width = 100,
            height = 30,
            text = "Button in stack"
          },
          vb:horizontal_aligner {
            mode = "right",
            margin = 10,
            origin = { 0, 60 },
            width = "100%",
            views = {
              vb:text {
                style = "strong",
                text = "Text in stack"
              }
            }
          }
        }
      },
      -- add a space before we start with a "new category"
      vb:space {
        height = 20
      },
      -- lets use/show relative width, height properties:
      vb:text {
        text = "relative sizes",
        font = "bold",
        width = "100%",
        align = "center"
      },
      -- create a aligner again, but this time just to distribute
      -- some views:
      vb:horizontal_aligner {
        width = "100%",
        views = {
          vb:button {
            text = "20%",
            width = "20%"
          },
          vb:button {
            text = "80%",
            width = "80%"
          },
        }
      },
      -- again a space before we start with a "new category"
      vb:space {
        height = 20
      },
      -- not lets create a button that toggles another view. when toggling, we
      -- do update the main racks size which also updates the dialogs size:
      vb:text {
        text = "resize racks & dialogs",
        width = "100%",
        align = "center",
        font = "bold"
      },
      -- add a button that hides the other view:
      vb:button {
        text = "Click me",
        notifier = function()
          -- toggle visibility of the view on each click
          vb.views.hide_me_text.visible = not vb.views.hide_me_text.visible
        end,
      },
      -- the text view that we are going to show/hide
      vb:text {
        id = "hide_me_text",
        text = "Click the button above to hide this view",
      },
    }
  }

  renoise.app():show_custom_dialog("Aligning & Auto Sizing", dialog_content)
end

--------------------------------------------------------------------------------

-- available_backgrounds

function available_backgrounds()

  -- lets go on by simply demonstrating the available views, starting with all
  -- background styles:

  local vb = renoise.ViewBuilder()

  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local DIALOG_SPACING = renoise.ViewBuilder.DEFAULT_DIALOG_SPACING
  local CONTROL_MARGIN = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN


  -- columns
  local group_back = vb:column {
    margin = CONTROL_MARGIN,
    background = "group",
    views = {
      vb:text {
        text = "style = 'group'"
      }
    }
  }

  local plain_back = vb:column {
    margin = CONTROL_MARGIN,
    background = "plain",
    views = {
      vb:text {
        text = "style = 'plain'"
      }
    }
  }

  local body_back = vb:column {
    margin = CONTROL_MARGIN,
    background = "body",
    views = {
      vb:text {
        text = "style = 'body'"
      }
    }
  }

  local panel_back = vb:column {
    margin = CONTROL_MARGIN,
    background = "panel",
    views = {
      vb:text {
        text = "style = 'panel'"
      }
    }
  }

  local border_back = vb:column {
    margin = CONTROL_MARGIN,
    background = "border",
    views = {
      vb:text {
        text = "style = 'border'"
      }
    }
  }

  local multiline_text = vb:column {
    margin = CONTROL_MARGIN,
    views = {
      vb:multiline_text {
        width = 160,
        height = 50,
        text = [[
multiline_text:
Long texts can be scrolled and/or autoformated with a 'multiline_text'.
]]
      }
    }
  }

  -- and also use a non modal dialog this time:
  renoise.app():show_custom_dialog(
    "Backgrounds & Text",
    vb:column {
      margin = DIALOG_MARGIN,
      spacing = DIALOG_SPACING,
      uniform = true,
      views = {
        group_back,
        plain_back,
        body_back,
        panel_back,
        border_back,
        multiline_text
      }
    }
  )
end

--------------------------------------------------------------------------------

-- available_controls

function available_controls()

  -- now we create a dialog with all available controls (things that let the
  -- user change "values"), so you get an idea how all the views look like,
  -- which views to choose from when creating a new custom GUIs.
  --
  -- but one note about controls & "values" in general first: as you'll see
  -- below, we do attach notifiers to the values of the controls. Notifiers are
  -- callback functions that are called as soon as the user changed the views
  -- value through the GUI. To maintain something like an external state that
  -- you are going to use outside the view, make sure you do keep the views value
  -- and "your" value in sync.
  --
  -- here is a somple example on how to sync an external value with "your" value:
  --
  -- current_velocity = 0x7f -- used in other places like your processing functions
  --
  -- vb:slider {
  --   value = current_velocity, -- initialize the GUI with your value
  --   notifier = function(slider_value) -- update your value when the GUI changed
  --     current_velocity = slider_value
  --   end,
  --   min = 0,
  --   max = 0x7f
  -- }
  --
  -- there is another way of dealing with "values", which we will describe in the
  -- next example more in detail. Basically you can also pass over an observable
  -- object to the view (not the raw number, boolean), which then will be used by
  -- the view instead of its onw value. Any changes to this value can then tracked
  -- outside of this view. This often is very useful to seperate the GUI code from
  -- the controller and data. Here is a simple example:
  --
  -- -- (the controller part of your script)
  -- options.current_velocity = 0x7f
  -- options.current_velocity.add_notifier(current_value_changed_function)

  -- -- (and the GUI)
  -- vb:slider {
  --   bind = options.current_velocity, -- only gets a reference passed
  --   min = 0,
  --   max = 0x7f
  -- }

  -- we memorize a reference to the dialog this time, to close it
  ---@type renoise.Dialog|nil
  local control_example_dialog = nil

  local vb = renoise.ViewBuilder()

  local DIALOG_MARGIN =
      renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN

  local CONTENT_SPACING =
      renoise.ViewBuilder.DEFAULT_CONTROL_SPACING

  local CONTENT_MARGIN =
      renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN

  local DEFAULT_CONTROL_HEIGHT =
      renoise.ViewBuilder.DEFAULT_CONTROL_HEIGHT

  local DEFAULT_DIALOG_BUTTON_HEIGHT =
      renoise.ViewBuilder.DEFAULT_DIALOG_BUTTON_HEIGHT

  local DEFAULT_MINI_CONTROL_HEIGHT =
      renoise.ViewBuilder.DEFAULT_MINI_CONTROL_HEIGHT

  local TEXT_ROW_WIDTH = 80


  ---- CONTROL ROWS

  -- textfield
  local textfield_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:textfield"
      },
      vb:textfield {
        width = 120,
        text = "Edit me",
        notifier = function(text)
          show_status(("textfield value changed to '%s'"):
          format(text))
        end
      }
    }
  }

  --- multiline_textfield row
  local mltextfield_row = vb:row {
    views = {
      vb:text {
        width = 80,
        text = "vb:ml_textfield"
      },
      vb:multiline_textfield {
        width = 120,
        height = 60,
        value = "Paragraphs are separated with \\n's.\n\nEdit me",
        notifier = function(value)
          show_status(("multiline_textfield value changed to '%s'"):
          format(value))
        end
      },
    }
  }

  -- link
  local link_row = vb:row {
    spacing = CONTENT_SPACING,
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:link"
      },
      vb:column {
        uniform = true,
        views = {
          vb:link {
            text = "scripting.renoise.com",
            style = "strong",
            notifier = function()
              renoise.app():open_url("https://scripting.renoise.com")
            end,
          },
          vb:link {
            active = false,
            text = "disabled",
            style = "strong",
            notifier = function()
              show_status("this will never be shown")
            end,
          },
          vb:link {
            text = "Hit me too",
            width = "100%",
            align = "center",
            font = "italic",
            -- we also can handle presses, releases separately
            pressed = function()
              show_status("link was pressed")
            end,
            released = function()
              show_status("link was released")
            end,
          }
        }
      }
    }
  }

  -- bitmapview
  local bitmapview_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:bitmap"
      },
      vb:bitmap {
        -- recolor to match the GUI theme:
        mode = "body_color",
        -- bitmaps names should be specified with a relative path using
        -- your tool script bundle path as base:
        bitmap = "Bitmaps/RenoiseLua.bmp",
        notifier = function()
          show_status("bitmapview was pressed")
        end
      },
    }
  }

  -- button
  local button_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:button"
      },
      vb:button {
        text = "Hit me",
        width = 60,
        notifier = function()
          show_status("button was hit")
        end,
      },
      vb:button {
        -- buttons can also use bitmaps as icons:
        bitmap = "Bitmaps/MiniPiano.bmp",
        width = 20,
        notifier = function()
          show_status("button with bitmap was hit")
        end,
      },
      vb:button {
        -- buttons can also have custom text/back colors
        text = "Color",
        width = 50,
        color = { 0x22, 0xaa, 0xff },
        secondary_color = { 0xff, 0xff, 0 },
        align = "center",
        font = "italic",
        -- and we also can handle presses, releases separately
        pressed = function()
          show_status("button with custom colors was pressed")
        end,
        released = function()
          show_status("button with custom colors was released")
        end,
      }
    }
  }

  -- checkbox
  local checkbox_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:checkbox"
      },
      vb:checkbox {
        value = true,
        notifier = function(value)
          show_status(("checkbox value changed to '%s'"):
          format(tostring(value)))
        end,
      }
    }
  }

  -- switch
  local switch_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:switch"
      },
      vb:switch {
        id = "switch",
        width = 100,
        value = 2,
        items = { "A", "B", "C" },
        notifier = function(new_index)
          ---@type renoise.Views.Switch
          local switch = vb.views.switch
          show_status(("switch value changed to '%s'"):
          format(switch.items[new_index]))
        end
      }
    }
  }

  -- popup
  local popup_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:popup"
      },
      vb:popup {
        id = "popup",
        width = 100,
        value = 2,
        items = { "First", "Second", "Third" },
        notifier = function(new_index)
          ---@type renoise.Views.Popup
          local popup = vb.views.popup
          show_status(("popup value changed to '%s'"):
          format(popup.items[new_index]))
        end
      }
    }
  }

  -- chooser
  local chooser_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:chooser"
      },
      vb:chooser {
        id = "chooser",
        value = 4,
        items = { "First", "Second", "Third", "Fourth" },
        notifier = function(new_index)
          ---@type renoise.Views.Chooser
          local chooser = vb.views.chooser
          show_status(("chooser value changed to '%s'"):
          format(chooser.items[new_index]))
        end
      }
    }
  }

  -- valuebox
  local valuebox_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:valuebox"
      },
      vb:valuebox {
        min = 0,
        max = 55,
        value = 5,
        tostring = function(value)
          return ("0x%.2X"):format(value)
        end,
        tonumber = function(str)
          return tonumber(str, 0x10)
        end,
        notifier = function(value)
          show_status(("valuebox value changed to '%d'"):
          format(value))
        end
      }
    }
  }

  -- valuebox_deactivated
  local valuebox_deactivated_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "(active=false)"
      },
      vb:valuebox {
        active = false, -- any control can be (de)activated
        min = 0,
        max = 55,
        value = 5,
        tostring = function(value)
          return ("0x%.2X"):format(value)
        end,
        tonumber = function(str)
          return tonumber(str, 0x10)
        end,
        notifier = function(value)
          show_status(("valuebox value changed to '%d'"):
          format(value))
        end
      }
    }
  }


  -- valuefield
  local valuefield_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:valuefield"
      },
      vb:valuefield {
        min = 0.0,
        max = math.db2lin(6.0),
        value = 1.0,

        tostring = function(value)
          local db = math.lin2db(value)
          if db > math.infdb then
            return ("%.03f dB"):format(db)
          else
            return "-INF dB"
          end
        end,

        tonumber = function(str)
          if str:lower():find("-inf") then
            return 0.0
          else
            local db = tonumber(str)
            if (db ~= nil) then
              return math.db2lin(db)
            end
          end
        end,

        notifier = function(value)
          show_status(("valuefield value changed to '%f'"):
          format(value))
        end
      }
    }
  }

  -- scrollbar
  local scrollbar_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:scrollbar"
      },
      vb:scrollbar {
        min = 50,
        max = 100,
        value = 65,
        pagestep = 25,
        autohide = true,
        background = "plain",
        notifier = function(value)
          show_status(("scrollbar offset changed to '%.0f'"):
          format(value))
        end
      }
    }
  }

  -- slider
  local slider_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:slider"
      },
      vb:slider {
        min = 1.0,
        max = 100,
        value = 20.0,
        notifier = function(value)
          show_status(("slider value changed to '%.1f'"):format(value))
        end
      }
    }
  }

  -- minislider
  local minislider_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:minislider"
      },
      vb:minislider {
        min = 0,
        max = 1,
        value = 0.5,
        notifier = function(value)
          show_status(("mini slider value changed to '%.1f'"):format(value))
        end
      }
    }
  }

  -- rotary
  local rotary_row = vb:row {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:rotary"
      },
      vb:rotary {
        min = 2,
        max = 4,
        value = 3.5,
        width = 2 * DEFAULT_CONTROL_HEIGHT,
        height = 2 * DEFAULT_CONTROL_HEIGHT,
        notifier = function(value)
          show_status(("rotaty encoder value changed to '%.1f'"):format(value))
        end
      }
    }
  }

  -- v sliders
  local vslider_column = vb:column {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:v_sliders"
      },
      vb:row {
        spacing = 4,
        views = {
          vb:scrollbar {
            min = 0,
            max = 100,
            value = 15,
            pagestep = 25,
            background = "plain",
            width = DEFAULT_CONTROL_HEIGHT - 2,
            height = 120,
            notifier = function(value)
              show_status(("v scrollbar offset changed to '%.0f'"):format(value))
            end
          },
          vb:slider {
            min = 1.0,
            max = 100,
            value = 20.0,
            width = DEFAULT_CONTROL_HEIGHT,
            height = 120,
            notifier = function(value)
              show_status(("v slider value changed to '%.1f'"):format(value))
            end
          },
          vb:minislider {
            min = 1.0,
            max = 100,
            value = 20.0,
            width = DEFAULT_MINI_CONTROL_HEIGHT,
            height = 60,
            notifier = function(value)
              show_status(("v mini slider value changed to '%.1f'"):format(value))
            end
          }
        }
      }
    }
  }

  -- xy pad column
  local xypad_column = vb:column {
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "vb:xypad"
      },
      vb:column {
        style = "border", -- cosmetics
        margin = 4,

        vb:xypad {
          width = 80,
          height = 80,
          value = { x = 0.75, y = 0.25 },
          snapback = { x = 0.5, y = 0.5 },
          notifier = function(value)
            show_status(("xy pad value changed to '%.2f, %.2f'"):
              format(value.x, value.y))
          end
        }
      }
    }
  }

  -- close button
  local close_button_row = vb:horizontal_aligner {
    mode = "right",
    views = {
      vb:button {
        text = "Close",
        width = 60,
        height = DEFAULT_DIALOG_BUTTON_HEIGHT,
        notifier = function()
          if control_example_dialog then
            control_example_dialog:close()
          end
        end,
      }
    }
  }


  ---- MAIN CONTENT & LAYOUT

  local dialog_content = vb:column {
    margin = DIALOG_MARGIN,
    spacing = CONTENT_SPACING,
    views = {
      vb:row {
        spacing = 4 * CONTENT_SPACING,
        views = {
          vb:column {
            spacing = CONTENT_SPACING,
            views = {
              textfield_row,
              mltextfield_row,
              link_row,
              bitmapview_row,
            }
          },

          vb:column {
            spacing = CONTENT_SPACING,
            views = {
              button_row,
              checkbox_row,
              switch_row,
              vb:space { height = DEFAULT_CONTROL_HEIGHT },
              popup_row,
              chooser_row,
              vb:space { height = DEFAULT_CONTROL_HEIGHT },
              valuefield_row,
              valuebox_row,
              valuebox_deactivated_row,
            },
          },

          vb:column {
            spacing = CONTENT_SPACING,
            views = {
              scrollbar_row,
              slider_row,
              minislider_row,
              rotary_row,
              vb:row {
                views = {
                  vslider_column,
                  xypad_column
                }
              }
            }
          }
        }
      },
      close_button_row
    }
  }


  -- DIALOG

  control_example_dialog = renoise.app():show_custom_dialog(
    "Available Controls", dialog_content
  )
end

--------------------------------------------------------------------------------

-- documents_and_views

-- as already noted in 'available_controls'. views can also be attached to
-- external document values, in order to seperate the controller code from the
-- view code. We're going to do this tight now and do start by create a very
-- simple example document. Please have a look at Renoise.Document.API for more
-- detail about such documents


-- DOCUMENT

---@class ExampleDocument
---@field my_flag renoise.Document.ObservableBoolean
---@field some_velocity renoise.Document.ObservableNumber
---@field pad_x renoise.Document.ObservableBoolean
---@field pad_y renoise.Document.ObservableBoolean

-- create a simple document
---@type ExampleDocument
local example_document = renoise.Document.create("ExampleDocument") {
  my_flag = false,
  some_velocity = 127,
  pad_x = 0.5,
  pad_y = 0.5
}

-- notifier callbacks
local function my_flag_notifier()
  local my_flag_value = example_document.my_flag.value

  show_status(("'my_flag' changed to '%s' by either the GUI " ..
    "or something else..."):format(my_flag_value and "True" or "False"))
end

local function some_velocity_notifier()
  local some_velocity = example_document.some_velocity.value

  show_status(("'some_velocity' value changed to '%s' by either the GUI " ..
    "or something else..."):format(some_velocity))
end

local function pad_value_notifier()
  local x, y = example_document.pad_x.value, example_document.pad_y.value

  show_status(("'pad_xy' value changed to '%.2f,%.2f' by either the GUI " ..
    "or something else..."):format(x, y))
end

-- attach to the document
example_document.my_flag:add_notifier(my_flag_notifier)
example_document.some_velocity:add_notifier(some_velocity_notifier)

example_document.pad_x:add_notifier(pad_value_notifier)
example_document.pad_y:add_notifier(pad_value_notifier)


-- GUI

function documents_and_views()
  local vb = renoise.ViewBuilder()

  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTENT_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING

  -- now we pass over the document struct to the views
  local checkbox_row = vb:row {
    views = {
      vb:text {
        text = "my_flag",
        width = 80
      },
      vb:checkbox {
        bind = example_document.my_flag --> bind
      }
    }
  }

  local valuebox_row = vb:row {
    views = {
      vb:text {
        text = "some_velocity",
        width = 80
      },
      vb:valuebox {
        bind = example_document.some_velocity, --> bind
        min = 0,
        max = 0x7f
      }
    }
  }

  local xypad_row = vb:row {
    views = {
      vb:xypad {
        bind = { --> bind
          x = example_document.pad_x,
          y = example_document.pad_y
        },
        width = valuebox_row.width,
      }
    }
  }

  renoise.app():show_custom_dialog(
    "Documents & Views",
    vb:column {
      margin = DIALOG_MARGIN,
      spacing = CONTENT_SPACING,
      uniform = true,
      views = {
        vb:column {
          spacing = CONTENT_SPACING,
          views = {
            checkbox_row,
            valuebox_row
          }
        },
        xypad_row
      }
    }
  )
end

--------------------------------------------------------------------------------

-- overflow_and_scrollbars

function overflow_and_scrollbars() 

  local vb = renoise.ViewBuilder()

  -- views can be larger than you actually want to show. there's no generic 
  -- overflow handling in the Renoise view API, but there is a scrollbar 
  -- widget, which can be used, for example, to scroll a content view within 
  -- a smaller view.
  
  -- below is an example of how to clamp the visible area of a view with a
  -- stack view and and attached scrollbar. Actual scrolling is done by changing
  -- the content views origin within the parent overflow view.
  
  -- in addition, the stack also has a mouse handler for scrolling the content
  -- on mouse wheel events.
  
  -- please note that this is just one way to archive scrolling. You could 
  -- e.g. also rebuild the visible area of your view in e.g. grid depending
  -- on the offset values of the slider bar instead of moving and clipping the 
  -- content view's origin.
  
  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTROL_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING
  local CONTROL_HEIGHT = renoise.ViewBuilder.DEFAULT_CONTROL_HEIGHT
  
  -- we do limit the height of the content to this value  
  local MAX_CONTENT_HEIGHT = 200
  -- change this to e.g. `8` and the scroll bar will disapear
  local NUMBER_OF_ITEMS_TO_SHOW = 100
  
  -- create some content with a lot of entries (rows in a column)
  local content = vb:column {
    uniform = true,
    spacing = CONTROL_SPACING
  }
  for i = 1, NUMBER_OF_ITEMS_TO_SHOW, 1 do
   content:add_view(
     vb:row{vb:checkbox{}, vb:text{ text = ("This is dummy row #%s"):format(i) }})
  end

  -- now create a vertical scrollbar which has a max value of `content.height`
  -- and a visible area (page size) of MAX_CONTENT_HEIGHT.
  --
  -- changes to the scroll bar offset will be forwarded as changes to the origin
  -- of the content view, so it slides beneth the parent overflow.
  --
  -- scroll bar properties:
  -- - min & max: full area that can be scrolled (height of the content here)
  -- - pagestep: visible area (maximum content height here)
  -- - value: this is the offset of the slider (y origin of the content here)
  -- 
  -- please also note that offset values bust be in range `[(max - min) - pagestep]`
  -- and NOT within `[min - max]` as it is with other sliders.
  
  local scrollbar = vb:scrollbar {
    autohide = true,
    width = CONTROL_HEIGHT,
    height = math.min(content.height, MAX_CONTENT_HEIGHT),
    min = 0, max = content.height,
    pagestep = math.min(content.height, MAX_CONTENT_HEIGHT),
    notifier = function(offset)
      content.origin = { x = 0, y = -offset }
    end
  }
  
  -- now create a stack which will holds the content and set its height to a
  -- size that is smaller than the content. This will clip the display of the
  -- content to a smaller size.
  --
  -- NB: it's important to disable the "autosize" property of the stack here
  -- else it would resize itself to conver the entire content.
  local overflow = vb:stack {
    autosize = false,
    width = content.width,
    height = math.min(content.height, MAX_CONTENT_HEIGHT),
    mouse_events = { "wheel" },
    mouse_handler = function (event)
      -- the moue wheel changes the scroll bar offset
      if event.type == "wheel" then
        if event.direction == "down" then
          scrollbar.value = math.min(scrollbar.max - scrollbar.pagestep, 
            scrollbar.value + CONTROL_HEIGHT)
        elseif event.direction == "up" then
          scrollbar.value = math.max(0, 
            scrollbar.value - CONTROL_HEIGHT)
        end
      end
    end,
    views = { content }
  }
  
  -- the dialog content now simply shows content and scroll bar side by side
  local dialog_content = vb:row {
    margin = DIALOG_MARGIN,
    views = {
      overflow,
      scrollbar
    }
  }
  
  renoise.app():show_custom_dialog("Overflow & ScrollBar", dialog_content)
end

--------------------------------------------------------------------------------

-- dynamic_content_and_scrollbars

function dynamic_content_and_scrollbars() 

  local vb = renoise.ViewBuilder()

  -- another approach to apply content scrolling is to rebuild or update 
  -- existing content in reaction to a scroll bar's offset change.
  --
  -- in this example we're showing a list of text (could be any data in 
  -- real-life scenarios) where only a few items should be visible.
  --
  -- the currently visible part of the data is controlled via a scroll bar
  
  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTROL_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING
  local CONTROL_HEIGHT = renoise.ViewBuilder.DEFAULT_CONTROL_HEIGHT

  -- maximum visible and available items  
  local NUMBER_OF_TOTAL_ITEMS = 500
  local NUMBER_OF_VISIBLE_ITEMS = 10

  -- first visible item
  local INITIAL_OFFSET = 200
  
  -- create the dummy data that we want to show
  local data_to_show = { }
  for i = 1, NUMBER_OF_TOTAL_ITEMS, 1 do
    table.insert(data_to_show, ("This is dummy data entry #%d"):format(i))
  end
  
  -- create content view with only the visible entries as rows
  local content = vb:column {
    uniform = true,
    spacing = CONTROL_SPACING,
  }  

  local content_row_views = { }
  for i = 1, math.min(NUMBER_OF_TOTAL_ITEMS, NUMBER_OF_VISIBLE_ITEMS), 1 do
    local row = {
      checkbox = vb:checkbox { },
      text = vb:text { text = data_to_show[i + INITIAL_OFFSET] }
    }
    table.insert(content_row_views, row)
    content:add_view(vb:row { views = { row.checkbox, row.text } })
  end
  
  -- now create a vertical scrollbar which has a max value of `NUMBER_OF_TOTAL_ITEMS` 
  -- and a visible area (page size) of `NUMBER_OF_VISIBLE_ITEMS`.
  --
  -- changes to the scroll bar offset will update the content texts.
  local scrollbar = vb:scrollbar {
    -- autohide = true,
    width = CONTROL_HEIGHT,
    height = content.height,
    min = 0, max = NUMBER_OF_TOTAL_ITEMS,
    pagestep = math.min(NUMBER_OF_TOTAL_ITEMS, NUMBER_OF_VISIBLE_ITEMS),
    value = INITIAL_OFFSET,
    notifier = function(offset)
      for i, row in ipairs(content_row_views) do 
        row.text.text = data_to_show[i + offset]
      end
    end 
  }
  
  -- the dialog content now simply shows content and scroll bar side by side
  -- and also installs a mouse handler to scroll through the contents
  local dialog_content = vb:row {
    margin = DIALOG_MARGIN,
    mouse_events = { "wheel" },
    mouse_handler = function (event)
      -- the moue wheel changes the scroll bar offset
      if event.type == "wheel" then
        if event.direction == "down" then
          scrollbar.value = math.min(scrollbar.max - scrollbar.pagestep, scrollbar.value + 1)
        elseif event.direction == "up" then
          scrollbar.value = math.max(0, scrollbar.value - 1)
        end
      end
    end,
    views = {
      content,
      scrollbar
    }
  }
  
  renoise.app():show_custom_dialog("Dynamic Content & ScrollBar", dialog_content)
end

--------------------------------------------------------------------------------

-- handle_mouse_events

function handle_mouse_events()

  local vb = renoise.ViewBuilder()

  -- Lets create a dialog with custom mouse handler here.
  -- The dialog content uses a stack as its main content view.
  --
  -- This content view has 3 sub views:
  --   1. a stack which is used as a background view
  --   2. another stack with a button and a bitmap overlay
  --   3. a status bar alike text
  --
  -- The content stack also has a mouse handler set, which allows to track
  -- mouse events within its view boundaries. We use it here to drag around
  -- the button by capturing mouse "drag" events.
  --
  -- Only layout views can have mouse_handers (rack, column, aligner & stack)
  --
  -- Please note that "drag" and "move" events are by default disabled. We do
  -- need to enable them in the "mouse_events" property.

  local CONTENT_HEIGHT = 500
  local CONTENT_WIDTH = 500

  local BUTTON_HEIGHT = 100
  local BUTTON_WIDTH = 100

  -- mouse drag status
  local drag_status = {
    -- are we currently dragging the button?
    dragging = false,
    -- initial offset of the mouse cursor within the drag button
    offset = { x = 0, y = 0 },
  }

  local content = vb:stack {
    id = "content",
    -- enable all events, so we can show the event status
    -- without the status text only "up", "down" and "drag" would be needed here
    mouse_events = {
      "enter", "exit", "move", "drag", "down", "up", "double", "wheel"
    },
    -- install the actual handler function
    mouse_handler = function(event)
      -- update status text from the mouse event
      local status_text_view = vb.views["status_text"]
      status_text_view.text = string.format(
      [[Mouse Event: type: '%s', button: '%s', direction: '%s', position: '%d,%d'
hover_view (top-most): '%s']],
        event.type, tostring(event.button), tostring(event.direction),
        event.position.x, event.position.y,
        (#event.hover_views > 0) and event.hover_views[1].id or "none"
      )
      -- start dragging the button with a mouse down
      if event.type == "down" then
        -- is the drag button view under the cusor?
        for _,v in pairs(event.hover_views) do
          if v.id == "drag_button" then
            drag_status.dragging = true
            break
          end
        end
        if drag_status.dragging then
          local drag_button = vb.views["drag_button"]
          drag_status.dragging = true
          drag_status.offset = {
            x = event.position.x - drag_button.origin.x,
            y = event.position.y - drag_button.origin.y
          }
        end
        -- stop dragging the button with a mouse up event
      elseif event.type == "up" and drag_status.dragging then
        drag_status.dragging = false
        -- drag the button around with the mouse "drag" events
      elseif event.type == "drag" and drag_status.dragging then
        local drag_button = vb.views["drag_button"]
        local new_origin = {
          x = event.position.x - drag_status.offset.x,
          y = event.position.y - drag_status.offset.y
        }
        -- clamp origin so the button doesn't fall out of the parent view
        new_origin.x = math.max(0, math.min(CONTENT_WIDTH - BUTTON_WIDTH, new_origin.x))
        new_origin.y = math.max(0, math.min(CONTENT_HEIGHT - BUTTON_HEIGHT, new_origin.y))
        -- apply the new origin
        drag_button.origin = new_origin
      end
      return event -- pass event to subviews
    end,
    -- content views
    views = {
      -- background, covering the entire content
      vb:stack {
        id = "background",
        width = CONTENT_WIDTH,
        height = CONTENT_HEIGHT,
        background = "border"
      },
      -- button stack to drag around, centered by default
      vb:stack {
        id = "drag_button",
        origin = {
          CONTENT_WIDTH / 2 - BUTTON_WIDTH / 2,
          CONTENT_HEIGHT / 2 - BUTTON_HEIGHT / 2
        },
        vb:button {
          id = "drag_button_button",
          width = BUTTON_WIDTH,
          height = BUTTON_HEIGHT,
          text = "Drag me around",
          style = "rounded"
        },
        vb:bitmap {
          id = "drag_button_bitmap",
          origin = { -20, -20 },
          bitmap = "Bitmaps/RenoiseLua.png",
          mode = "transparent"
        },
        vb:button {
          id = "drag_button_click",
          origin = { BUTTON_WIDTH / 4, BUTTON_HEIGHT - 20 },
          width = BUTTON_WIDTH / 2,
          height = 16,
          text = "Click me",
          notifier = function ()
            show_status("Button in button got clicked and cancels drag")
          end
        },
      },
      -- status text on bottom
      vb:text {
        id = "status_text",
        text = "Move mouse cursor here to show some status...",
        style = "strong",
        font = "mono",
        width = CONTENT_WIDTH,
        height = 36,
        origin = { 4, CONTENT_HEIGHT - 36 },
      }
    }
  }

  -- wrap into a dialog content view
  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN

  local dialog_content = vb:column {
    id = "dialog_content",
    margin = DIALOG_MARGIN,
    views = { content }
  }

  renoise.app():show_custom_dialog("Custom Mouse Handling", dialog_content)
end

--------------------------------------------------------------------------------

-- handle_key_events

function handle_key_events()
  -- dialogs also allow you to handle keyboard events by your own. by default
  -- only the escape key is used to close the dialog when focused. If you want
  -- to do more fancy stuff, then simply pass a key_hander_func to the custom
  -- dialog. Here is a simply example how this can be done:

  local vb = renoise.ViewBuilder()

  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTENT_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING

  local TEXT_ROW_WIDTH = 240

  local content_view = vb:column {
    margin = DIALOG_MARGIN,
    spacing = CONTENT_SPACING,
    views = {
      vb:text {
        width = TEXT_ROW_WIDTH,
        text = "Press some keyboard keys:"
      },
      vb:row {
        style = "group",
        views = {
          vb:multiline_text {
            id = "key_text",
            width = TEXT_ROW_WIDTH,
            height = 78,
            paragraphs = {
              "key.name:",
              "key.modifiers:",
              "key.character:",
              "key.note:",
              "key.repeat:"
            },
            font = "mono",
          }
        }
      }
    }
  }

  local function key_handler(dialog, key)
    ---@type renoise.Views.MultiLineTextField
    local key_text = vb.views.key_text
    -- update key_text to show what we got
    local modifier_flags = table.create {}
    for _, m in pairs { "shift", "control", "alt", "meta" } do
      if key.modifier_flags[m] then
        modifier_flags:insert(m)
      end
    end
    key_text.paragraphs = {
      ("key.name: '%s'"):format(key.name),
      ("key.modifier_flags: '%s'"):format(modifier_flags:concat(",")),
      ("key.character: '%s'"):format(key.character or "nil"),
      ("key.note: '%s'"):format(tostring(key.note) or "nil"),
      ("key.repeated: '%s'"):format(key.repeated and "true" or "false")
    }

    -- close on escape...
    if (key.modifiers == "" and key.name == "esc") then
      dialog:close()
    end
  end

  -- show a dialog as usual, but this time also pass a keyboard handler ref
  renoise.app():show_custom_dialog(
    "Handling Keyboard Events",
    content_view,
    key_handler)
end

--------------------------------------------------------------------------------

function midi_mapping()
  -- Tools can create their own MIDI mappings, and GUIs created from tools can
  -- also make use of MIDI mapping frames: MIDI mapping frames are colored
  -- overlays that are only visible when the MIDI mapping dialog in Renoise is
  -- open. When visible, they show the currently assigned MIDI mappings and also
  -- to easily bind new messages.
  --
  -- In this example we do create two buttons: one which allows mapping an
  -- existing function ("Transport:Playback:Start Playing [Trigger]") and one
  -- which we created in this tool ("com.renoise.ExampleToolGui:Example Mapping")
  -- See "renoise.tool():add_midi_mapping" below for the handler.
  --
  -- The 'midi_mapping' property can be used ony everything that's a 'control'
  -- in the viewbuilder.
  --
  -- Please note that the buttons in this example will do nothing at all when
  -- pressed with the mouse buttons. The MIDI mappings only apply to mapped
  -- MIDI, nothing else...

  local vb = renoise.ViewBuilder()

  local DIALOG_MARGIN = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN
  local CONTENT_SPACING = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING

  renoise.app():show_custom_dialog(
    "Documents & Views",

    vb:column {
      margin = DIALOG_MARGIN,
      spacing = CONTENT_SPACING,
      views = {
        vb:text {
          text = "Open the MIDI mapping dialog in Renoise to map:"
        },
        vb:row {
          views = {
            vb:button {
              width = 120,
              text = "Start Playing",
              midi_mapping = "Transport:Playback:Start Playing [Trigger]"
            },
            vb:button {
              width = 120,
              text = "Custom Mapping",
              midi_mapping = "com.renoise.ExampleToolGui:Example MIDI Mapping"
            },
          }
        }
      }
    }
  )
end

-- add a custom MIDI mapping, as used in the midi_mapping() example above

renoise.tool():add_midi_mapping {
  name = "com.renoise.ExampleToolGui:Example MIDI Mapping",
  invoke = function(message)
    print("com.renoise.ExampleToolGui: >> got midi_mapping message :")
    print(("  message:is_trigger(): %s)"):format(
      message:is_trigger() and "yes" or "no"))
    print(("  message:is_switch(): %s)"):format(
      message:is_switch() and "yes" or "no"))
    print(("  message:is_rel_value(): %s)"):format(
      message:is_rel_value() and "yes" or "no"))
    print(("  message:is_abs_value(): %s)"):format(
      message:is_abs_value() and "yes" or "no"))

    print(("  message.int_value: %d)"):format(
      message.int_value))
    print(("  message.boolean_value: %s)"):format(
      message.boolean_value and "true" or "false"))
  end
}


--------------------------------------------------------------------------------

-- thats it - basically ;) Please have a look at the ViewBuilderAPI.txt for a
-- complete list of properties & functions for all views...
