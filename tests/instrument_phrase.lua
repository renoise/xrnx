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
    
  
  ----------------------------------------------------------------------------
  -- prepare

  local new_instr = song:insert_instrument_at(#song.instruments + 1)
  new_instr.name = "New Instrument"
  

  ----------------------------------------------------------------------------
  -- insert/delete phrases
  
  new_instr.phrase_editor_visible = true
  
  assert(#new_instr.phrases == 0)
  local new_phrase = new_instr:insert_phrase_at(#new_instr.phrases + 1)
  assert(#new_instr.phrases == 1)
  
  local new_phrase2 = new_instr:insert_phrase_at(#new_instr.phrases + 1)
  local new_phrase3 = new_instr:insert_phrase_at(1)
  
  assert_error(function()
    new_instr:insert_phrase_at(#new_instr.phrases + 2)
  end)
  
  assert(#new_instr.phrases == 3)
  
  new_phrase2.number_of_lines = 22
  assert(#new_phrase2.lines == 22)
  
  ----------------------------------------------------------------------------
  -- insert/delete phrase mappings

  local new_phrase_mapping = new_instr:insert_phrase_mapping_at(
    1, new_instr.phrases[1])
  assert(rawequal(new_instr.phrases[1], new_phrase_mapping.phrase))
  
  -- no room for new phrase
  assert(not new_instr:can_insert_phrase_mapping_at(#new_instr.phrase_mappings + 1))
  assert_error(function()
    new_instr:insert_phrase_mapping_at(#new_instr.phrase_mappings + 1, new_phrase)
  end)
  
  -- make room 
  new_phrase_mapping.note_range = {0, 48}

  assert(new_instr:can_insert_phrase_mapping_at(#new_instr.phrase_mappings + 1))
  local new_phrase_mapping2 = new_instr:insert_phrase_mapping_at(
    #new_instr.phrase_mappings + 1, new_instr.phrases[2])
  new_phrase_mapping2.note_range = {60, 119}
  
  local new_phrase_mapping3 = new_instr:insert_phrase_mapping_at(
    #new_instr.phrase_mappings, new_instr.phrases[3])
  assert(new_phrase_mapping3.note_range[1] == 49)
  assert(new_phrase_mapping3.note_range[2] == 59)

  assert_error(function()
    new_phrase_mapping3.note_range = {}
  end)
  assert_error(function()
    new_phrase_mapping3.note_range = {48, 59}
  end)
  assert_error(function()
    new_phrase_mapping3.note_range = {49, 60}
  end)
     
  new_phrase_mapping2.note_range = {61, 119}
  new_phrase_mapping3.note_range = {49, 60}
  
  new_instr:delete_phrase_mapping_at(#new_instr.phrase_mappings - 1)
  new_instr:delete_phrase_mapping_at(#new_instr.phrase_mappings - 1)
  
  assert_error(function() -- phrase2 already has a mapping
    new_instr:insert_phrase_mapping_at(
      #new_instr.phrase_mappings + 1, new_instr.phrases[2])
  end)
  
  
  ----------------------------------------------------------------------------
  -- phrase lines
  
  for i = 1,22 do
    local line = new_phrase2:line(i)
    line:note_column(1).note_value = 48 + math.random() * 48
    line:note_column(1).instrument_value = math.random() * 127
    line:note_column(1).volume_value = math.random() * 127
    line:note_column(1).panning_value = math.random() * 127
    line:note_column(1).effect_number_value = math.random() * 34 + 1
    line:note_column(1).effect_amount_value = math.random() * 126 + 1
  end
  
  for i = 1,22 do
    local line = new_phrase2:line(i)
    assert(line:note_column(1).instrument_value ~= renoise.PatternLine.EMPTY_INSTRUMENT)
    assert(line:note_column(1).volume_value ~= renoise.PatternLine.EMPTY_VOLUME)
    assert(line:note_column(1).panning_value ~= renoise.PatternLine.EMPTY_PANNING)
    assert(line:note_column(1).effect_number_value ~= renoise.PatternLine.EMPTY_EFFECT_NUMBER)
    assert(line:note_column(1).effect_amount_value ~= renoise.PatternLine.EMPTY_EFFECT_AMOUNT)
  end
  
  new_phrase2.delay_column_visible = true
  new_phrase2.panning_column_visible = true
  new_phrase2.sample_effects_column_visible = true
  
  new_phrase2.visible_note_columns = 1
  new_phrase2.visible_effect_columns = 0
  
  
  ----------------------------------------------------------------------------
  -- phrase line notifiers

  local notifier_calls = 0
    
  function phrase_line_changed(pos)
    notifier_calls = notifier_calls + 1
  end
  
  class "TestClass" 
  function TestClass:__init() end
  function TestClass:phrase_line_changed(pos)
    notifier_calls = notifier_calls + 1
  end

  new_phrase2:add_line_notifier(phrase_line_changed)
  new_phrase2:remove_line_notifier(phrase_line_changed)
  assert(not new_phrase2:has_line_notifier(phrase_line_changed))
  
  new_phrase2:add_line_notifier(phrase_line_changed)
  assert(new_phrase2:has_line_notifier(phrase_line_changed))
  
  local object = TestClass()
  new_phrase2:add_line_notifier(TestClass.phrase_line_changed, object)
  new_phrase2:remove_line_notifier(TestClass.phrase_line_changed, object)
  assert(not new_phrase2:has_line_notifier(object, TestClass.phrase_line_changed))
  
  new_phrase2:add_line_notifier(object, TestClass.phrase_line_changed)
  assert(new_phrase2:has_line_notifier(object, TestClass.phrase_line_changed))
  assert(new_phrase2:has_line_notifier(TestClass.phrase_line_changed, object))

  assert(notifier_calls == 0)
  
  local line = new_phrase2:line(1)
  line.note_columns[1].note_value = 52
  assert(notifier_calls == 2)
  
  line:clear()
  assert(notifier_calls == 4)
   
  
  ----------------------------------------------------------------------------
  -- phrase properties
  
  new_phrase2.looping = true
  new_phrase2.loop_start = new_phrase2.number_of_lines / 2
  new_phrase2.loop_end = new_phrase2.number_of_lines
  new_phrase2.loop_end = new_phrase2.number_of_lines / 2 + 1
  new_phrase2.loop_start = new_phrase2.loop_end + 2 -- shifts end to fit
  assert_error(function()
    new_phrase2.loop_end = new_phrase2.loop_start
  end)
    
   
  new_phrase2.shuffle = 0.0
  new_phrase2.shuffle = 1.0
  assert(new_phrase2.shuffle == 1.0)
  assert_error(function()
    new_phrase2.shuffle = 1.01
  end)
  new_phrase2.shuffle = 0.5
  assert(new_phrase2.shuffle == 0.5)
  
  new_phrase2.key_tracking = renoise.InstrumentPhrase.KEY_TRACKING_TRANSPOSE
  assert(new_phrase2.key_tracking == renoise.InstrumentPhrase.KEY_TRACKING_TRANSPOSE)
   
  new_phrase2.base_note = 12
  assert(new_phrase2.base_note == 12)
  assert_error(function()
    new_phrase2.base_note = -1
  end)
  assert_error(function()
    new_phrase2.base_note = 120
  end)
   
   
  ----------------------------------------------------------------------------
  -- phrase column properties
  
  new_phrase2:set_column_is_muted(1, true)
  assert_error(function()
    new_phrase2:set_column_is_muted(0, true)
  end)
  assert_error(function()
    new_phrase2:set_column_is_muted(13, true)
  end)
  
  new_phrase2:set_column_name(1, "Wurst1")
  new_phrase2:set_column_name(2, "Wurst2")
  assert_error(function()
    new_phrase2:set_column_name(0, true)
  end)
  assert_error(function()
    new_phrase2:set_column_name(13, true)
  end)
  
  new_phrase2:swap_note_columns_at(1,2)
  assert(new_phrase2:column_name(1) == "Wurst2")
  assert(new_phrase2:column_name(2) == "Wurst1")
  assert_error(function()
    new_phrase2:swap_note_columns_at(0,1)
  end)
  new_phrase2:swap_effect_columns_at(1,2)
  assert_error(function()
    new_phrase2:swap_effect_columns_at(1,13)
  end)
  
  new_phrase2.visible_note_columns = 2
  
  
  ----------------------------------------------------------------------------
  -- cleanup
  
  song:delete_instrument_at(#song.instruments)
end


------------------------------------------------------------------------------
-- test finalizers

collectgarbage()


--[[--------------------------------------------------------------------------
--------------------------------------------------------------------------]]--
