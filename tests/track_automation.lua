--[[--------------------------------------------------------------------------
TestTrackAutomation.lua
--------------------------------------------------------------------------]]--

do

  ----------------------------------------------------------------------------
  -- tools
  
  local function assert_error(statement)
    assert(pcall(statement) == false, "expected function error")
  end


  -- shortcuts
  
  local song = renoise.song()
  
  song.selected_track_index = 1 -- make sure its a player track
  
  local selected_track = song.tracks[song.selected_track_index]
  
  local selected_pattern_track = song.patterns[
    song.selected_pattern_index].tracks[song.selected_track_index]
  
  local last_device = selected_track.devices[
    #selected_track.devices]

  local parameter = last_device.parameters[2]
  
  
  -- create/delete automation
  
  assert(parameter.time_quantum == 1/256) -- no time quantum

  if (selected_pattern_track:find_automation(parameter)) then
    selected_pattern_track:delete_automation(parameter)
  end
  
  assert_error(function() -- does not exist 
    selected_pattern_track:delete_automation(parameter)
  end)
  
  local new_automation = 
    selected_pattern_track:create_automation(parameter)

  assert(new_automation.dest_device.name == last_device.name and
    new_automation.dest_parameter.name == parameter.name)

  local resolved_automation = 
    selected_pattern_track:find_automation(parameter)

  assert(resolved_automation.dest_device.name == last_device.name and
    resolved_automation.dest_parameter.name == parameter.name)

  assert_error(function() -- already exists
    selected_pattern_track:create_automation(parameter)
  end)

  assert_error(function() -- postfx: parameter not automatable
    selected_pattern_track:create_automation(selected_track.postfx_volume)
  end)

  
  -- change automation
  
  local function make_point(time, value)
    return { ["time"] = time, ["value"] = value }
  end
  
  new_automation.points = {
    make_point(1, 1.0), 
    make_point(2, 0.0), 
    make_point(8 + 2/256, 0.5)
  }

  assert_error(function() -- bogus values
    new_automation.points = {
      make_point(1, 1.0), 
      make_point(2, 1.5), 
    }
  end)
  
  assert_error(function() -- bogus times
    new_automation.points = {
      make_point(-2, 1.0), 
    }
  end)
  
  assert(#new_automation.points == 3)
  
  assert(new_automation.points[1].time == 1)
  assert(new_automation.points[1].value == 1.0)

  assert(new_automation.points[2].time == 2)
  assert(new_automation.points[2].value == 0.0)

  assert(new_automation.points[3].time == 8 + 2/256)
  assert(new_automation.points[3].value == 0.5)

  new_automation:clear_range(2, 8)
  assert(#new_automation.points == 2)
  new_automation:clear()
  assert(#new_automation.points == 0)
  
  assert_error(function() -- bogus values
    new_automation:add_point_at(2, -0.345)
  end)
  
  assert_error(function() -- bogus times
    new_automation:add_point_at(-2, 0.345)
  end)
  
  new_automation:add_point_at(2 + 3/256, 0.345)
  new_automation:add_point_at(2 + 3/256, 1.0) -- will change point
  
  assert(#new_automation.points == 1)
  assert(new_automation.points[1].time == 2 + 3/256)
  assert(new_automation.points[1].value == 1.0)

  assert(new_automation:has_point_at(2 + 3/256))
  new_automation:remove_point_at(2 + 3/256)
  assert_error(not new_automation:has_point_at(2 + 3/256))

  -- something to look at (also test unsorted points)
  new_automation.points = {
    make_point(2, 0.0), 
    make_point(1 + 128/256, 1.0), 
    make_point(8, 0.5)
  }
  

  -- test automation with time quantum

  local master_index = #song.tracks - song.send_track_count
  local master_track = song.tracks[master_index]

  assert(master_track.type == renoise.Track.TRACK_TYPE_MASTER)

  local master_device = master_track.devices[1]
  local bpm_parameter = master_device.parameters[6]
  
  assert(bpm_parameter.name == "BPM")
  assert(bpm_parameter.time_quantum == 1)

  local master_pattern_track = song.patterns[
    song.selected_pattern_index].tracks[master_index]

  if (master_pattern_track:find_automation(bpm_parameter)) then
    master_pattern_track:delete_automation(bpm_parameter)
  end

  new_automation = master_pattern_track:create_automation(bpm_parameter)

  new_automation.points = {
    make_point(1, 1.0), 
    make_point(1 + 1/256, 0.0), 
    make_point(1 + 2/256, 1/2),
    make_point(1 + 200/256, 1/4)
  }

  -- should only have resulted in two quantized points
  assert(#new_automation.points == 2)

  assert(new_automation.points[1].time == 1)
  assert(new_automation.points[1].value == 1/2)

  assert(new_automation.points[2].time == 2)
  assert(new_automation.points[2].value == 1/4)

end

  
  
------------------------------------------------------------------------------
-- test finalizers

collectgarbage()


--[[--------------------------------------------------------------------------
--------------------------------------------------------------------------]]--

