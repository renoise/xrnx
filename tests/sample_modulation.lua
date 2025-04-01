--[[--------------------------------------------------------------------------
TestSampleModulation.lua
--------------------------------------------------------------------------]]--

do
  
  ----------------------------------------------------------------------------
  -- tools
  
  local function assert_error(statement)
    assert(pcall(statement) == false, "expected function error")
  end
  
  
  -- shortcuts
  
  local song = renoise.song()
  
  local instrument = song:insert_instrument_at(1)
  instrument.name = "Test Tone"
  
  local instrument2 = song:insert_instrument_at(2)
  instrument2.name = "Other Instrument"
  
  
    
  ----------------------------------------------------------------------------
  -- generate a new sample that we can apply some modulation to
  
  local sample = instrument:insert_sample_at(1)
  local sample_buffer = sample.sample_buffer
  local sample_rate = 44100
  local num_channels = 1
  local bit_depth = 32
  local num_frames = 168
  
  sample_buffer:create_sample_data(sample_rate, 
    bit_depth, num_channels, num_frames)
    
  sample_buffer:prepare_sample_data_changes()

  for channel = 1, num_channels do
    local mid_point = (num_frames / 2)
    for frame = 1, mid_point do
      local s = frame / mid_point
      sample_buffer:set_sample_data(channel, frame, s)
      sample_buffer:set_sample_data(channel, frame + mid_point, s - 1)
    end
  end

  sample_buffer:finalize_sample_data_changes()
  
  sample.loop_mode = renoise.Sample.LOOP_MODE_FORWARD
  sample.loop_start = 1
  sample.loop_end = num_frames
  
  
  ----------------------------------------------------------------------------
  -- test modulation devices & targets
  
  local modulations = instrument.sample_modulation_sets[1]
  
  local volume = modulations:insert_device_at("Modulation/Envelope", 
    renoise.SampleModulationDevice.TARGET_VOLUME, #modulations.devices + 1)

  local pan = modulations:insert_device_at("Modulation/Envelope", 
    renoise.SampleModulationDevice.TARGET_PANNING, #modulations.devices + 1)

  local pitch = modulations:insert_device_at("Modulation/Envelope", 
    renoise.SampleModulationDevice.TARGET_PITCH, #modulations.devices + 1)
  
  local pitch_lfo1 = modulations:insert_device_at("Modulation/Lfo", 
    renoise.SampleModulationDevice.TARGET_PITCH, #modulations.devices + 1)

  local cutoff = modulations:insert_device_at("Modulation/Envelope", 
    renoise.SampleModulationDevice.TARGET_CUTOFF, #modulations.devices + 1)
    
  local cutoff_lfo = modulations:insert_device_at("Modulation/Lfo", 
    renoise.SampleModulationDevice.TARGET_CUTOFF, #modulations.devices + 1)
    
  local resonance = modulations:insert_device_at("Modulation/Envelope", 
    renoise.SampleModulationDevice.TARGET_RESONANCE, #modulations.devices + 1)
  
  local drive = modulations:insert_device_at("Modulation/Envelope", 
    renoise.SampleModulationDevice.TARGET_DRIVE, #modulations.devices + 1)
  
  
  -- volume envelope
  
  local points = {
    { time = 1, value = 0.25 },
    { time = 3, value = 1.0 },
    { time = 6, value = 0.8 },
    { time = 12, value = 0.25 },
    { time = 24, value = 0.0 },
  }
  
  volume.enabled = true
  volume.length = 240
  volume:clear_points()
  volume.points = points
  volume.sustain_enabled = true
  volume.sustain_position = 8
  volume.fade_amount = 256
  volume:clear_points_in_range(3, 12)
  
  
  -- pan envelope
  
  pan.enabled = true
  pan.length = 480
  pan:clear_points()
  pan.play_mode = renoise.SampleEnvelopeModulationDevice.PLAYMODE_LINES
  pan:add_point_at(1, 0.5)
  pan:add_point_at(130, 0.8)
  pan:add_point_at(250, 0.2)
  pan:add_point_at(370, 0.8)
  pan:add_point_at(480, 0.5)
  pan.loop_mode = renoise.SampleEnvelopeModulationDevice.LOOP_MODE_FORWARD
  pan.loop_start = 130
  pan.loop_end = 370
  
  
  -- pitch
  
  pitch.enabled = true
  pitch.tempo_synced = true
  pitch.bipolar = true
  pitch.length = 250
  pitch.play_mode = renoise.SampleEnvelopeModulationDevice.PLAYMODE_POINTS
  pitch:clear_points()
  pitch:add_point_at(1, 0.5)
  pitch:add_point_at(70, 0.5 + (0.5 / 12) * 3)
  pitch:add_point_at(130, 0.5 + (0.5 / 12) * 7)
  pitch:add_point_at(190, 1.0)
  pitch.loop_mode = renoise.SampleEnvelopeModulationDevice.LOOP_MODE_FORWARD
  pitch.loop_start = 1
  pitch.loop_end = 250
  
  pitch_lfo1.mode = renoise.SampleLfoModulationDevice.MODE_RANDOM
  pitch_lfo1.bipolar = true
  pitch_lfo1.tempo_synced = true
  pitch_lfo1.dephase.value = 45
  pitch_lfo1.frequency.value = 0.1
  pitch_lfo1.amplitude.value = 5 / 127
  
  
  -- cutoff
  
  cutoff.enabled = true
  cutoff.length = 12
  cutoff:clear_points()
  cutoff:copy_points_from(volume)
  cutoff:add_point_at(9, 0.5)
  cutoff.sustain_enabled = true
  cutoff.sustain_position = 9
  
  cutoff_lfo.mode = renoise.SampleLfoModulationDevice.MODE_SIN
  cutoff_lfo.frequency.value = 0.02
  cutoff_lfo.amplitude.value = 15 / 127
  
  
  -- resonance
  
  resonance:copy_from(cutoff)
  resonance:add_point_at(1, 0.0)


  -- drive
  
  drive:copy_from(cutoff)
  drive:add_point_at(1, 0.0)


  ----------------------------------------------------------------------------
  -- test errors
  
  assert_error(function()
    volume:add_point_at(0, 1.0)
  end)
  
  assert_error(function()
    volume:add_point_at(9999, 1.0)
  end)
  
  assert_error(function()
    local bogus = modulations.bogus
  end)
  
  assert_error(function()
    volume.length = 0
  end)
  
  assert_error(function()
    pitch.length = 24 * 256 + 1
  end)
  
  assert_error(function()
    modulations.filter_type = 666
  end)
  
  assert_error(function()
    volume.play_mode = 999
  end)
  
  assert_error(function()
    volume.fade_amount = 99999
  end)
  
  assert_error(function()
    volume.loop_mode = 999
  end)
  
  assert_error(function()
    volume.loop_start = 0
  end)
  
  assert_error(function()
    volume.loop_end = 9999
  end)
  
  assert_error(function()
    volume2:copy_from(cutoff)
  end)
  
  assert_error(function()
    resonance:copy_from(pitch2)
  end)


  ----------------------------------------------------------------------------
  -- filter types
  
  modulations:upgrade_filter_version()
  assert(modulations.filter_version == 3)

  assert_error(function()
    modulations.filter_version = 4
  end)

  modulations.filter_type = modulations.available_filter_types[math.random( 
    #modulations.available_filter_types)]
    
  modulations.filter_type = "lp mooG"


  ----------------------------------------------------------------------------
  -- input parameters
  
  assert(type(modulations.volume_input) == "DeviceParameter")
  modulations.volume_input.value = 0.5
  assert(modulations.volume_input.value == 0.5)
  assert_error(function()
    modulations.volume_input.value = 9999
  end)  

  assert(type(modulations.panning_input) == "DeviceParameter")
  modulations.panning_input.value = 0.5
  assert(modulations.panning_input.value == 0.5)
  assert_error(function()
    modulations.panning_input.value = 9999
  end)  

  assert(type(modulations.pitch_input) == "DeviceParameter")
  modulations.pitch_input.value = 0.5
  assert(modulations.pitch_input.value == 0.5)
  assert_error(function()
    modulations.pitch_input.value = 9999
  end)  

  assert(type(modulations.cutoff_input) == "DeviceParameter")
  modulations.cutoff_input.value = 0.5
  assert(modulations.cutoff_input.value == 0.5)
  assert_error(function()
    modulations.cutoff_input.value = 9999
  end)  

  assert(type(modulations.resonance_input) == "DeviceParameter")
  modulations.resonance_input.value = 0.5
  assert(modulations.resonance_input.value == 0.5)
  assert_error(function()
    modulations.resonance_input.value = 9999
  end)  

  assert(type(modulations.drive_input) == "DeviceParameter")
  modulations.drive_input.value = 0.5
  assert(modulations.drive_input.value == 0.5)
  assert_error(function()
    modulations.drive_input.value = 9999
  end)  

  
  ----------------------------------------------------------------------------
  -- pitch range
  
  assert(type(modulations.pitch_range) == "number")
  modulations.pitch_range = 1
  assert(modulations.pitch_range == 1)
  modulations.pitch_range = 96
  assert(modulations.pitch_range == 96)
  assert_error(function()
    modulations.pitch_range = 97
  end)  
  assert_error(function()
    modulations.pitch_range = 0
  end)  


  ----------------------------------------------------------------------------
  -- test envelope device types
  
  local function insert_device(path, class_name)
    local device = modulations:insert_device_at(path, 
      renoise.SampleModulationDevice.TARGET_VOLUME, #modulations.devices + 1)
    assert(type(device) == class_name)
    return device
  end
  
  assert(#modulations.available_devices == 8);
  
  local operand = insert_device(
    "Modulation/Operand", "SampleOperandModulationDevice")
  local fader = insert_device(
    "Modulation/Fader", "SampleFaderModulationDevice")
  local ahdsr = insert_device(
    "Modulation/Ahdsr", "SampleAhdsrModulationDevice")
  local keytracker = insert_device(
    "Modulation/Key Tracking", "SampleKeyTrackingModulationDevice")
  local velracker = insert_device(
    "Modulation/Velocity Tracking", "SampleVelocityTrackingModulationDevice")
  local envelope = insert_device(
    "Modulation/Envelope", "SampleEnvelopeModulationDevice")
  local stepper = insert_device(
    "Modulation/Stepper", "SampleStepperModulationDevice")
  local lfo = insert_device(
    "Modulation/Lfo", "SampleLfoModulationDevice")


  ----------------------------------------------------------------------------
  -- cleanup

  song:delete_instrument_at(1)
  song:delete_instrument_at(1)  
  
end


------------------------------------------------------------------------------
-- test finalizers

collectgarbage()


--[[--------------------------------------------------------------------------
--------------------------------------------------------------------------]]--
