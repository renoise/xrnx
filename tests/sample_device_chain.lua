--[[--------------------------------------------------------------------------
TestSampleDeviceChain.lua
--------------------------------------------------------------------------]]--

do

  ----------------------------------------------------------------------------
  -- tools
  
  local function assert_error(statement)
    assert(pcall(statement) == false, "expected function error")
  end
  
  
  -- shortcuts
  
  local song = renoise.song()
  local selected_instrument = song.selected_instrument
  
  
  ----------------------------------------------------------------------------
  -- device chain insert/delete/swap
  ----------------------------------------------------------------------------
  
  selected_instrument:insert_sample_device_chain_at(1)
  
  while (#selected_instrument.sample_device_chains > 0) do
    selected_instrument:delete_sample_device_chain_at(1)
  end
  
  assert(#selected_instrument.sample_device_chains == 0)
  
  new_chain1 = selected_instrument:insert_sample_device_chain_at(1)
  assert(type(new_chain1) == "SampleDeviceChain")
  new_chain1.name = "Wurst"
  
  new_chain2 = selected_instrument:insert_sample_device_chain_at(2)
  assert(type(new_chain2) == "SampleDeviceChain")
  new_chain2.name = "Hose"
  
  selected_instrument:swap_sample_device_chains_at(1, 2)
  assert(selected_instrument.sample_device_chains[1].name == "Hose")
  assert(selected_instrument.sample_device_chains[2].name == "Wurst")
  
  
  ----------------------------------------------------------------------------
  -- device insert/delete/swap
  ----------------------------------------------------------------------------
  
  local avail_devices = 
    selected_instrument.sample_device_chains[1].available_devices
  
  local new_device_path
  repeat
    new_device_path = avail_devices[math.random(1, #avail_devices)]
  until
    -- avoid plugins, cause they may fail to load and pop up dialogs
    not string.find(new_device_path, "VST") and
    not string.find(new_device_path, "AU")
    
  
  assert_error(function()
    new_chain1:insert_device_at("InvalidDeviceName#234", 
      #new_chain1.devices + 1)
  end)
  
  -- mixer device tests
  assert_error(function()
    new_chain1:insert_device_at(new_device_path, 1)
  end)
  
  assert_error(function()
    new_chain1:delete_device_at(1)
  end)
  
  local device_count = #new_chain1.devices
  
  local new_device = new_chain1:insert_device_at(
    new_device_path, device_count + 1)
  device_count = device_count + 1
  assert(device_count == #new_chain1.devices)
  
  local found_device = false
  local found_device_path = false
  
  for _,device in ipairs(new_chain1.devices) do
    if device.name == new_device.name then
      found_device = true
    end
    if device.device_path == new_device_path then
      found_device_path = true
    end
  end
  
  assert(found_device)
  assert(found_device_path)
  
  new_chain1:delete_device_at(#new_chain1.devices)
  device_count = device_count - 1
  assert(device_count == #new_chain1.devices)
  
  new_chain1:insert_device_at(new_device_path, 
    #new_chain1.devices + 1)
  new_chain1:insert_device_at(new_device_path, 
    #new_chain1.devices + 1)
  
  device_count = device_count + 2
  assert(device_count == #new_chain1.devices)
  
  new_chain1:swap_devices_at(
    #new_chain1.devices, 
    #new_chain1.devices - 1)
  
  assert(device_count == #new_chain1.devices)
  
  new_chain1:delete_device_at(#new_chain1.devices)
  new_chain1:delete_device_at(#new_chain1.devices)
  
  device_count = device_count - 2
  assert(device_count == #new_chain1.devices)
  
  
  -- preset handing
  
  local mixer_device = new_chain1.devices[1]
  assert(#mixer_device.presets == 1) -- init
  
  new_chain1:insert_device_at(new_device_path, 
    #new_chain1.devices + 1)
    
  local new_device = new_chain1.devices[
    #new_chain1.devices]
  
  assert(#new_device.presets >= 1)
  assert(new_device.active_preset >= 1)

  local new_preset = math.random(#new_device.presets)
  new_device.active_preset = new_preset
  assert(new_device.active_preset == new_preset)
  
  assert_error(function()
    new_device.active_preset = 0
  end)
  assert_error(function()
    new_device.active_preset = #new_device.presets + 1
  end) 
end


------------------------------------------------------------------------------
-- test finalizers

collectgarbage()


--[[--------------------------------------------------------------------------
--------------------------------------------------------------------------]]--
