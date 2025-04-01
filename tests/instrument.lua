--[[--------------------------------------------------------------------------
TestInstruments.lua
--------------------------------------------------------------------------]]--

do
  
  ----------------------------------------------------------------------------
  -- tools
  
  local function assert_error(statement)
    assert(pcall(statement) == false, "expected function error")
  end
  
  
  -- shortcuts
  
  local song = renoise.song()
  
  local selected_instrument = song.instruments[
    song.selected_instrument_index]
  
  
  
  ----------------------------------------------------------------------------
  -- insert/delete/swap
  
  local new_instr = song:insert_instrument_at(#song.instruments + 1)
  new_instr.name = "New Instrument!"
  
  song.selected_instrument_index = #song.instruments
  assert(song.selected_instrument.name == "New Instrument!")
  
  song:insert_instrument_at(#song.instruments + 1)
  song:delete_instrument_at(#song.instruments)
  
  assert_error(function()
    song:insert_instrument_at(#song.instruments + 2)
  end)
  
  assert_error(function()
    song:insert_instrument_at(0)
  end)
  
  song:insert_instrument_at(1)
  song:delete_instrument_at(1)
  
  song.instruments[1].name = "1"
  song.instruments[2].name = "2"
  song:swap_instruments_at(1, 2)
  
  assert(song.instruments[1].name == "2")
  assert(song.instruments[2].name == "1")
  
  song:swap_instruments_at(1, 2)
  assert(song.instruments[1].name == "1")
  assert(song.instruments[2].name == "2")
  
  song:delete_instrument_at(#song.instruments)


  ----------------------------------------------------------------------------
  -- midi input properties
    
  local midi_input_devices = {
    "MIDI In Master A",
    "MIDI In Master B",
    "MIDI In Master C",
    "MIDI In Master D"
   }
    
  local instrument = song:insert_instrument_at(#song.instruments + 1)
  local input_properties = instrument.midi_input_properties
  
  
  -- Test note range
  
  local num_note_range_changes = 0
  function input_note_range_changed()
    num_note_range_changes = num_note_range_changes + 1
  end
  
  input_properties.note_range_observable:add_notifier(
    input_note_range_changed)
  
  input_properties.note_range = {63, 19}
  assert(input_properties.note_range[1] == 19)
  assert(input_properties.note_range[2] == 63)

  input_properties.note_range = {1, 1}
  assert(input_properties.note_range[1] == 1)
  assert(input_properties.note_range[2] == 1)

  input_properties.note_range = {0, 119}
  assert(input_properties.note_range[1] == 0)
  assert(input_properties.note_range[2] == 119)
  
  assert_error(function()
    input_properties.note_range = {-1, 10}
  end)
  
  assert_error(function()
    input_properties.note_range = {90, 120}
  end)
  
  assert(num_note_range_changes == 6)


  -- Test assigned track
  
  local num_input_assigned_track_changes = 0
  function input_assigned_track_changed()
    num_input_assigned_track_changes = 
      num_input_assigned_track_changes + 1
  end
  
  input_properties.assigned_track_observable:add_notifier(
    input_assigned_track_changed)
  
  for track = 2, renoise.song().sequencer_track_count do
    input_properties.assigned_track = track
    assert(input_properties.assigned_track == track)
  end
  
  assert_error(function()
    input_properties.assigned_track = -1
  end)
  
  assert_error(function()
    input_properties.assigned_track = 
      renoise.song().sequencer_track_count + 1
  end)
  
  assert(num_input_assigned_track_changes == 
    renoise.song().sequencer_track_count - 1)
  
  
  -- Remove all test observables
  
  input_properties.note_range_observable:remove_notifier(
    input_note_range_changed)
  input_properties.assigned_track_observable:remove_notifier(
    input_assigned_track_changed)
  
  song:delete_instrument_at(#song.instruments)


  ----------------------------------------------------------------------------
  -- midi output properties
  
  local midi_outputs = table.create(renoise.Midi.available_output_devices())
  

  ----------------------------------------------------------------------------
  -- plugin properties

  local instrument = song:insert_instrument_at(#song.instruments + 1)
  local plugin_properties = instrument.plugin_properties
  
  local available_plugins = plugin_properties.available_plugins

  assert(plugin_properties.plugin_loaded == false)
  
  assert(plugin_properties:load_plugin("Audio/Generators/VST/doesnotexist") == false)
  
  local new_plugin_path = available_plugins[math.random(#available_plugins)]

  -- plugin may fail to load. do not assert
  if (plugin_properties:load_plugin(new_plugin_path)) then
    assert(plugin_properties.plugin_loaded == true)
    assert(plugin_properties.plugin_device.device_path == new_plugin_path)
    
    local plugin_device = plugin_properties.plugin_device
     
    assert(plugin_device.external_editor_visible == false)
    plugin_device.external_editor_visible = true
    assert(plugin_device.external_editor_visible == true)
    plugin_device.external_editor_visible = false
    assert(plugin_device.external_editor_visible == false)
    
    -- can't assert parameters and presets, cause they may not be present
    -- simply access them to test...
    local parameters = plugin_device.parameters
    local presets = plugin_device.presets
  end

  song:delete_instrument_at(#song.instruments)
  
  ----------------------------------------------------------------------------
  -- macros
  
  instrument = song:insert_instrument_at(#song.instruments + 1)
  
  assert(#instrument.macros == 8)
  assert(renoise.Instrument.NUMBER_OF_MACROS == #instrument.macros)
  
  local macro = instrument.macros[1]
  
  macro.value = 0.1
  macro.value_string = "22"
  assert(math.abs(macro.value * 100 - 22) < 0.00001)
  
  assert_error(function()
    macro.value = 100.1
  end)
  
  macro.name = "Wurst"
  assert(#macro.mappings == 0)

  song:delete_instrument_at(#song.instruments)

 
  ----------------------------------------------------------------------------
  -- MIDI macros
  
  instrument = song:insert_instrument_at(#song.instruments + 1)
  
  assert(type(instrument.pitchbend_macro),"InstrumentMacro")  
  instrument.pitchbend_macro.value = 0.5
  assert(instrument.pitchbend_macro.value == 0.5)
  assert_error(function()
    instrument.pitchbend_macro.value = 9999
  end)
  
  assert(type(instrument.modulation_wheel_macro),"InstrumentMacro")  
  instrument.modulation_wheel_macro.value = 0.5
  assert(instrument.modulation_wheel_macro.value == 0.5)
  assert_error(function()
    instrument.modulation_wheel_macro.value = 9999
  end)
  
  assert(type(instrument.channel_pressure_macro),"InstrumentMacro")  
  instrument.channel_pressure_macro.value = 0.5
  assert(instrument.channel_pressure_macro.value == 0.5)
  assert_error(function()
    instrument.channel_pressure_macro.value = 9999
  end)
  
  song:delete_instrument_at(#song.instruments)
  
  
  ----------------------------------------------------------------------------
  -- instr. comments
  
  instrument = song:insert_instrument_at(#song.instruments + 1)
  
  assert(type(instrument.comments) == "table")
  instrument.comments = {}
  local comments_changes = 0
  local comments_changed = function()
    comments_changes = comments_changes + 1
  end
  instrument.comments_observable:add_notifier(comments_changed)
  instrument.comments = {"Foo","Bar","Baz"}
  assert(#instrument.comments == 3)
  assert(instrument.comments[1] == "Foo")
  assert_error(instrument.comments[4] == "N/A")
  instrument.comments = {"Foo","Bar"}
  assert(#instrument.comments == 2)

  assert(comments_changes == 8) -- add 3, remove 3, add 2

  song:delete_instrument_at(#song.instruments) 
end


------------------------------------------------------------------------------
-- test finalizers

collectgarbage()


--[[--------------------------------------------------------------------------
--------------------------------------------------------------------------]]--
