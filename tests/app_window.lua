--[[--------------------------------------------------------------------------
TestAppWindow.lua
--------------------------------------------------------------------------]]--

do

  ----------------------------------------------------------------------------
  -- tools
  
  local function assert_error(statement)
    assert(pcall(statement) == false, "expected function error")
  end
  
  
  -- shortcuts
  
  local window = renoise.app().window
  
  
  ----------------------------------------------------------------------------
  -- upper frame
  
  local notification_count = 0
  function disk_browser_is_visible_changed()
    notification_count = notification_count + 1  
  end
  
  window.disk_browser_is_visible = false
  
  window.disk_browser_is_visible_observable:add_notifier(
    disk_browser_is_visible_changed)
  
  window.disk_browser_is_visible = true
  assert(window.disk_browser_is_visible == true)
  assert(notification_count == 1)
  
  window.disk_browser_is_visible = false
  assert(window.disk_browser_is_visible == false)
  assert(notification_count == 2)
  
  window.disk_browser_is_visible_observable:remove_notifier(
    disk_browser_is_visible_changed)

end


------------------------------------------------------------------------------
-- test finalizers

collectgarbage()


--[[--------------------------------------------------------------------------
--------------------------------------------------------------------------]]--

