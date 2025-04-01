--[[--------------------------------------------------------------------------
TestSamples.lua
--------------------------------------------------------------------------]]--

do

  ----------------------------------------------------------------------------
  -- tools
  
  local function assert_error(statement)
    assert(pcall(statement) == false, "expected function error")
  end
  
  function float_cmp(f1, f2)
    return math.abs(f1 - f2) < 0.0001
  end
  
  
  ----------------------------------------------------------------------------
  -- insert/delete/swap
  
  local song = renoise.song()
  local selected_instrument = song.selected_instrument
  
  selected_instrument:clear() -- test with a empty samples
  
  local new_sample = selected_instrument:insert_sample_at(
    #selected_instrument.samples + 1)
  new_mapping = new_sample.sample_mapping
  
  assert(type(new_sample) == "Sample")
  assert(type(new_mapping) == "SampleMapping")
  
  new_sample.name = "New Sample!"
  new_mapping.base_note = 12
  
  song.selected_sample_index = #selected_instrument.samples
  assert(song.selected_sample.name == "New Sample!")
  
  selected_instrument:insert_sample_at(#selected_instrument.samples + 1)
  selected_instrument:delete_sample_at(#selected_instrument.samples)
  
  assert_error(function()
    selected_instrument:insert_sample_at(#selected_instrument.samples + 2)
  end)
  
  assert_error(function()
    selected_instrument:insert_sample_at(0)
  end)
  
  selected_instrument:insert_sample_at(1)
  selected_instrument:insert_sample_at(1)
  selected_instrument:delete_sample_at(1)
  
  selected_instrument.samples[1].name = "1"
  selected_instrument.samples[2].name = "2"
  selected_instrument:swap_samples_at(1, 2)
  
  assert(selected_instrument.samples[1].name == "2")
  assert(selected_instrument.samples[2].name == "1")
  
  selected_instrument:swap_samples_at(1, 2)
  assert(selected_instrument.samples[1].name == "1")
  assert(selected_instrument.samples[2].name == "2")
  
  selected_instrument:delete_sample_at(#selected_instrument.samples)
  
  
  ----------------------------------------------------------------------------
  -- basic properties
  
  local selected_sample = song.selected_sample
  
  selected_sample.panning = 0.75
  assert(selected_sample.panning == 0.75)
  assert_error(function()
    selected_sample.panning = 1.2 
  end)
  
  selected_sample.volume = 2.25
  selected_sample.fine_tune = -127
  
  selected_sample.beat_sync_enabled = false
  selected_sample.beat_sync_lines = 1
  selected_sample.beat_sync_lines = 128
  assert_error(function()
    selected_sample.beat_sync_lines = 0
  end)

  selected_sample.beat_sync_mode = 
    renoise.Sample.BEAT_SYNC_REPITCH
  selected_sample.beat_sync_mode = 
    renoise.Sample.BEAT_SYNC_PERCUSSION
  selected_sample.beat_sync_mode = 
    renoise.Sample.BEAT_SYNC_TEXTURE
  assert_error(function()
    selected_sample.beat_sync_mode = -1
  end)

  selected_sample.mute_group = 0
  selected_sample.mute_group = 15
  assert_error(function()
    selected_sample.mute_group = 16
  end)
  assert_error(function()
    selected_sample.mute_group = -1
  end)
  
  selected_sample.interpolation_mode = 
    renoise.Sample.INTERPOLATE_NONE
  selected_sample.interpolation_mode = 
    renoise.Sample.INTERPOLATE_LINEAR
  selected_sample.interpolation_mode = 
    renoise.Sample.INTERPOLATE_CUBIC
  selected_sample.interpolation_mode = 
    renoise.Sample.INTERPOLATE_SINC
  assert_error(function()
    selected_sample.interpolation_mode = 0
  end)
  assert_error(function()
    selected_sample.interpolation_mode = 
      renoise.Sample.INTERPOLATE_SINC + 1
  end)
  
  selected_sample.oversample_enabled = true
    
  selected_sample.new_note_action = 
    renoise.Sample.NEW_NOTE_ACTION_NOTE_CUT
  selected_sample.new_note_action =
    renoise.Sample.NEW_NOTE_ACTION_NOTE_OFF
  selected_sample.new_note_action = 
    renoise.Sample.NEW_NOTE_ACTION_SUSTAIN
  assert_error(function()
    selected_sample.new_note_action = 0
  end)
  assert_error(function()
    selected_sample.new_note_action = 
      renoise.Sample.NEW_NOTE_ACTION_SUSTAIN + 1
  end)
  
  selected_sample.loop_mode = 
    renoise.Sample.LOOP_MODE_OFF
  selected_sample.loop_mode = 
    renoise.Sample.LOOP_MODE_FORWARD
  selected_sample.loop_mode = 
    renoise.Sample.LOOP_MODE_REVERSE
  selected_sample.loop_mode = 
    renoise.Sample.LOOP_MODE_PING_PONG
  assert_error(function()
    selected_sample.loop_mode = 0
  end)
  assert_error(function()
    selected_sample.loop_mode = 
      renoise.Sample.LOOP_MODE_PING_PONG + 1
  end)
  
  
  ----------------------------------------------------------------------------
  -- sample buffer & loops
  
  local sample_buffer = selected_sample.sample_buffer
  
  if sample_buffer.has_sample_data then
    sample_buffer:delete_sample_data()
  end
  
  assert_error(function()
    print(sample_buffer.sample_rate)
  end)
  assert_error(function()
    print(sample_buffer.bit_depth)
  end)
  assert_error(function()
    print(sample_buffer.number_of_channels)
  end)
  assert_error(function()
    print(sample_buffer.number_of_frames)
  end)
  
  local new_rate = 96000
  local new_bit_depth = 24
  local new_num_channels = 2
  local new_num_frames = math.floor(new_rate / 2)
  
  local succeeded = sample_buffer:create_sample_data(
    new_rate, new_bit_depth, new_num_channels, new_num_frames)
    
  assert(succeeded)
  
  assert(new_rate == sample_buffer.sample_rate)
  assert(new_bit_depth == sample_buffer.bit_depth)
  assert(new_num_channels == sample_buffer.number_of_channels)
  assert(new_num_frames == sample_buffer.number_of_frames)
  
  sample_buffer:set_sample_data(1, 1, 0.1)
  sample_buffer:set_sample_data(2, 1, 0.2)
  
  assert(float_cmp(sample_buffer:sample_data(1, 1), 0.1))
  assert(float_cmp(sample_buffer:sample_data(2, 1), 0.2))
  
  sample_buffer:set_sample_data(1, new_num_frames, -0.3)
  sample_buffer:set_sample_data(2, new_num_frames, 0.4)
  sample_buffer:set_sample_data(2, new_num_frames - 1, 2.1)
  
  assert(float_cmp(sample_buffer:sample_data(1, new_num_frames), -0.3))
  assert(float_cmp(sample_buffer:sample_data(2, new_num_frames), 0.4))
  assert(float_cmp(sample_buffer:sample_data(2, new_num_frames - 1), 1.0))
  
  assert_error(function()
    print(sample_buffer:sample_data(1, new_num_frames + 1))
  end)
  assert_error(function()
    print(sample_buffer:sample_data(1, 0))
  end)
  assert_error(function()
    print(sample_buffer:sample_data(0, 1))
  end)
  assert_error(function()
    print(sample_buffer:sample_data(3, 1))
  end)
  
  selected_sample.loop_start = 1
  selected_sample.loop_end = new_num_frames
  
  assert_error(function()
    selected_sample.loop_start = 0
  end)
  assert_error(function()
    selected_sample.loop_end = 0
  end)
  assert_error(function()
    selected_sample.loop_start = new_num_frames + 1
  end)
  assert_error(function()
    selected_sample.loop_end = new_num_frames + 1
  end)
  
  sample_buffer:prepare_sample_data_changes()
  
  for frame = 1,new_num_frames do
    sample_buffer:set_sample_data(1, frame, math.sin(new_num_frames / 
      frame * math.pi))
    sample_buffer:set_sample_data(2, frame, math.cos(new_num_frames / 
      frame * math.pi))
  end
  
  sample_buffer:finalize_sample_data_changes()


  ----------------------------------------------------------------------------
  -- sample display
  
  sample_buffer.display_length = 6
  assert(sample_buffer.display_length == 6)

  assert_error(function() -- length out of bounds
    sample_buffer.display_length = new_num_frames + 1
  end)

  sample_buffer.display_start = 5
  assert(sample_buffer.display_start == 5)

  assert_error(function() -- start out of bounds
    sample_buffer.display_start = new_num_frames + 1
  end)

  sample_buffer.vertical_zoom_factor = 0.5
  assert(sample_buffer.vertical_zoom_factor == 0.5)

  assert_error(function() -- vzoom out of bounds
    sample_buffer.vertical_zoom_factor = 2.0
  end)

  sample_buffer.display_range = {2, 3}
  assert(sample_buffer.display_range[1] == 2)
  assert(sample_buffer.display_range[2] == 3)
  assert(sample_buffer.display_start == 2)
  assert(sample_buffer.display_length == 1)
  
  assert_error(function() -- reversed display range
    sample_buffer.display_range = {3, 2}
  end)

  assert_error(function() -- 0-length display range
    sample_buffer.display_range = {3, 3}
  end)

  assert_error(function() -- left out of range
    sample_buffer.display_range = {0, 1}
  end)

  assert_error(function() -- right out of range
    sample_buffer.display_range = {1, sample_buffer.number_of_frames + 2}
  end)


  ----------------------------------------------------------------------------
  -- sample selection
  
  sample_buffer.selection_range = {1, new_num_frames}
  
  -- range and start/end must match
  assert(sample_buffer.selection_range[1] == 1)
  assert(sample_buffer.selection_range[2] == new_num_frames)
  assert(sample_buffer.selection_start == 1)
  assert(sample_buffer.selection_end == new_num_frames)

  sample_buffer.selection_start = math.random(new_num_frames / 2)
  assert(sample_buffer.selection_start == sample_buffer.selection_range[1])

  sample_buffer.selection_range = {new_num_frames/2, new_num_frames}
  
  assert_error(function() -- start out of bounds
    selected_sample.selection_start = new_num_frames + 1
  end)
  assert_error(function()
    selected_sample.selection_start = 0
  end)
  
  assert_error(function() -- end out of bounds
    selected_sample.selection_end = new_num_frames + 1
  end)
  assert_error(function()
    selected_sample.selection_end = 0
  end)
  
  sample_buffer.selected_channel = renoise.SampleBuffer.CHANNEL_LEFT
  assert(sample_buffer.selected_channel == renoise.SampleBuffer.CHANNEL_LEFT)

  new_num_channels = 1
  sample_buffer:delete_sample_data()
  sample_buffer:create_sample_data(
    new_rate, new_bit_depth, new_num_channels, new_num_frames)
  sample_buffer:set_sample_data(1, 1, 0.1)

  assert_error(function()
    sample_buffer.selected_channel = renoise.SampleBuffer.CHANNEL_RIGHT
  end)


  ----------------------------------------------------------------------------
  -- sample slices
  
  assert(#selected_sample.slice_markers == 0)
  assert(not selected_sample.is_slice_alias)
  
  selected_sample.slice_markers = {1,2,3,4,5,6,7,8,9}
  selected_sample.slice_markers = {}
  
  selected_sample:insert_slice_marker(math.floor(new_num_frames / 4))
  selected_sample:insert_slice_marker(math.floor(new_num_frames / 3))
  selected_sample:insert_slice_marker(math.floor(new_num_frames / 2))
  selected_sample:insert_slice_marker(new_num_frames + 1) -- allowed!
  
  assert(#selected_sample.slice_markers == 4)
  
  assert_error(function() -- out of bounds
    selected_sample:insert_slice_marker(0)
  end)
  assert_error(function() -- out of bounds
    selected_sample:insert_slice_marker(new_num_frames + 2)
  end)
  
  selected_sample:delete_slice_marker(math.floor(new_num_frames / 2))
  
  assert_error(function() -- out of bounds
    selected_sample:delete_slice_marker(math.floor(new_num_frames / 5))
  end)
  
  assert(#selected_sample.slice_markers == 3)
  
  selected_sample:insert_slice_marker(math.floor(new_num_frames / 2))
  
  assert(#selected_sample.slice_markers == 4)
  assert(selected_sample.slice_markers[1] == new_num_frames / 4)
  assert(selected_sample.slice_markers[2] == new_num_frames / 3)
  assert(selected_sample.slice_markers[3] == new_num_frames / 2)
  assert(selected_sample.slice_markers[4] == new_num_frames + 1)

  selected_sample:move_slice_marker(
    math.floor(new_num_frames / 2), math.floor(new_num_frames / 8))
  
  assert(selected_sample.slice_markers[1] == new_num_frames / 8)
  assert(selected_sample.slice_markers[2] == new_num_frames / 4)
  assert(selected_sample.slice_markers[3] == new_num_frames / 3)
  assert(selected_sample.slice_markers[4] == new_num_frames + 1)

  -- sliced sample lists can't be modified
  assert_error(function() -- 
    selected_instrument:insert_sample_at(
      #selected_instrument.samples + 1)
  end)
  
  assert_error(function() -- 
    selected_instrument:delete_sample_at(
      #selected_instrument.samples)
  end)
  
  -- sliced samples can't be edited
  assert(#selected_instrument.samples == #selected_sample.slice_markers + 1)
  
  assert(not selected_instrument.samples[1].is_slice_alias)
  assert(not selected_instrument.samples[1].sample_buffer.read_only)
  
  assert(selected_instrument.samples[2].is_slice_alias)
  assert(selected_instrument.samples[2].sample_buffer.read_only)
  
  
  ----------------------------------------------------------------------------
  -- sample mappings
  
  local LAYER_NOTE_ON = renoise.Instrument.LAYER_NOTE_ON
  local LAYER_NOTE_OFF = renoise.Instrument.LAYER_NOTE_OFF
  local LAYER_NOTE_DISABLED = renoise.Instrument.LAYER_NOTE_DISABLED
  
  -- create 4 samples to test
  selected_instrument:clear() -- test with empty samples
  local sample2 = selected_instrument:insert_sample_at(#selected_instrument.samples + 1)
  local sample3 = selected_instrument:insert_sample_at(#selected_instrument.samples + 1)
  local sample4 = selected_instrument:insert_sample_at(#selected_instrument.samples + 1)
  
  local mapping2 = sample2.sample_mapping
  local mapping3 = sample3.sample_mapping
  local mapping4 = sample4.sample_mapping
  
  assert(#selected_instrument.sample_mappings[LAYER_NOTE_ON] == 3)
  assert(#selected_instrument.sample_mappings[LAYER_NOTE_OFF] == 0)
  
  mapping2.layer = LAYER_NOTE_ON
  mapping3.layer = LAYER_NOTE_OFF

  assert(#selected_instrument.sample_mappings[LAYER_NOTE_ON] == 2)
  assert(#selected_instrument.sample_mappings[LAYER_NOTE_OFF] == 1)
  
  assert_error(function() -- invalid layer
    mapping4.layer = LAYER_NOTE_DISABLED
  end)
  assert_error(function() -- invalid base note
    mapping4.base_note = 120
  end)
  assert_error(function() -- invalid note range
    mapping4.note_range = {0,-1}
  end)
  assert_error(function()
    mapping4.note_range = {0}
  end)
  assert_error(function() -- invalid note range
    mapping4.velocity_range = {128,128}
  end)
  assert_error(function()
    mapping4.velocity_range = {20}
  end)
end


------------------------------------------------------------------------------
-- test finalizers

collectgarbage()


--[[--------------------------------------------------------------------------
--------------------------------------------------------------------------]]--
