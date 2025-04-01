--[[--------------------------------------------------------------------------
TestTrackSwapping.lua

Tests all the myriad combinations of swapping tracks with groups present.
--------------------------------------------------------------------------]]--

do

  local song = renoise.song()
  
  song:insert_track_at(1)
  
  for i = song.sequencer_track_count, 2, -1 do
    song:delete_track_at(i)
  end
  
  song:insert_track_at(1)
  song:insert_track_at(1)
  song:insert_track_at(1)
  song:insert_track_at(1)
  song.tracks[1].name = "ta"
  song.tracks[2].name = "tb"
  song.tracks[3].name = "tc"
  song.tracks[4].name = "td"
  song.tracks[5].name = "te"
  
  group_a = song:insert_group_at(1)
  song.tracks[1].name = "ga"
  song:add_track_to_group(2, 1)
  song:add_track_to_group(3, 2)
  song:add_track_to_group(4, 3)
  song:add_track_to_group(5, 4)
  song:add_track_to_group(6, 5)
  
  -- Player tracks --
  
  -- within group, both edges
  song:swap_tracks_at(1,5)
  assert(song.tracks[1].name == "te")
  assert(song.tracks[5].name == "ta")
  assert(rawequal(song.tracks[1].group_parent, group_a))
  assert(rawequal(song.tracks[5].group_parent, group_a))
  
  -- within group, edge to centre
  song:swap_tracks_at(1,3)
  assert(song.tracks[1].name == "tc")
  assert(song.tracks[3].name == "te")
  assert(rawequal(song.tracks[1].group_parent, group_a))
  assert(rawequal(song.tracks[3].group_parent, group_a))
  
  song:swap_tracks_at(3,5)
  assert(song.tracks[3].name == "ta")
  assert(song.tracks[5].name == "te")
  assert(rawequal(song.tracks[3].group_parent, group_a))
  assert(rawequal(song.tracks[5].group_parent, group_a))
  
  -- within group, fully internal
  song:swap_tracks_at(2,4)
  assert(song.tracks[2].name == "td")
  assert(song.tracks[4].name == "tb")
  assert(rawequal(song.tracks[2].group_parent, group_a))
  assert(rawequal(song.tracks[4].group_parent, group_a))
  
  song:insert_track_at(1)
  song.tracks[1].name = "tf"
  song:insert_track_at(1)
  song.tracks[1].name = "tg"
  song:insert_track_at(9)
  song.tracks[9].name = "th"
  song:insert_track_at(9)
  song.tracks[9].name = "ti"
  
  -- across group, both edges
  song:swap_tracks_at(2, 9)
  assert(song.tracks[2].name == "ti")
  assert(song.tracks[9].name == "tf")
  assert(rawequal(song.tracks[2].group_parent, nil))
  assert(rawequal(song.tracks[9].group_parent, nil))
  
  -- across group, one edge
  song:swap_tracks_at(1, 9)
  assert(song.tracks[1].name == "tf")
  assert(song.tracks[9].name == "tg")
  assert(rawequal(song.tracks[1].group_parent, nil))
  assert(rawequal(song.tracks[9].group_parent, nil))
  
  song:swap_tracks_at(2, 10)
  assert(song.tracks[2].name == "th")
  assert(song.tracks[10].name == "ti")
  assert(rawequal(song.tracks[2].group_parent, nil))
  assert(rawequal(song.tracks[10].group_parent, nil))
  
  -- across group, no edge
  song:swap_tracks_at(1, 10)
  assert(song.tracks[1].name == "ti")
  assert(song.tracks[10].name == "tf")
  assert(rawequal(song.tracks[1].group_parent, nil))
  assert(rawequal(song.tracks[10].group_parent, nil))
  
  -- outside group, left edge
  song:swap_tracks_at(1, 2)
  assert(song.tracks[1].name == "th")
  assert(song.tracks[2].name == "ti")
  assert(rawequal(song.tracks[1].group_parent, nil))
  assert(rawequal(song.tracks[2].group_parent, nil))
  
  -- outside group, right edge
  song:swap_tracks_at(9, 10)
  assert(song.tracks[9].name == "tf")
  assert(song.tracks[10].name == "tg")
  assert(rawequal(song.tracks[9].group_parent, nil))
  assert(rawequal(song.tracks[10].group_parent, nil))
  
  -- group member to non-group member, from left
  song:swap_tracks_at(2, 5)
  assert(song.tracks[2].name == "ta")
  assert(song.tracks[5].name == "ti")
  assert(rawequal(song.tracks[2].group_parent, nil))
  assert(rawequal(song.tracks[5].group_parent, group_a))
  
  -- group member to non-group member, from right
  song:swap_tracks_at(6, 9)
  assert(song.tracks[6].name == "tf")
  assert(song.tracks[9].name == "tb")
  assert(rawequal(song.tracks[6].group_parent, group_a))
  assert(rawequal(song.tracks[9].group_parent, nil))
  
  -- group member to non-group member, left edge swap
  song:swap_tracks_at(2, 3)
  assert(song.tracks[2].name == "tc")
  assert(song.tracks[3].name == "ta")
  assert(rawequal(song.tracks[2].group_parent, nil))
  assert(rawequal(song.tracks[3].group_parent, group_a))
  
  -- group member to non-group member, right edge swap
  song:swap_tracks_at(7, 9)
  assert(song.tracks[7].name == "tb")
  assert(song.tracks[9].name == "te")
  assert(rawequal(song.tracks[7].group_parent, group_a))
  assert(rawequal(song.tracks[9].group_parent, nil))
  
  song:add_track_to_group(4, 5)
  group_b = song.tracks[6]
  group_b.name = "gb"
  song:add_track_to_group(4, 5)
  group_c = song.tracks[6]
  group_c.name = "gc"
  
  -- group member to member of other group (nested in same parent group), right
  song:swap_tracks_at(4, 8)
  assert(song.tracks[4].name == "tf")
  assert(song.tracks[8].name == "td")
  assert(rawequal(song.tracks[4].group_parent, group_c))
  assert(rawequal(song.tracks[8].group_parent, group_a))
  
  -- group member to member of other group (nested in same parent group), left
  song:swap_tracks_at(4, 3)
  assert(song.tracks[4].name == "ta")
  assert(song.tracks[3].name == "tf")
  assert(rawequal(song.tracks[4].group_parent, group_c))
  assert(rawequal(song.tracks[3].group_parent, group_a))
  
  group_d = song:insert_group_at(1)
  group_d.name = "gd"
  song:add_track_to_group(2, 1)
  
  -- group member to member of other group (non-nested)
  song:swap_tracks_at(1, 5)
  assert(song.tracks[1].name == "ta")
  assert(song.tracks[5].name == "th")
  assert(rawequal(song.tracks[1].group_parent, group_d))
  assert(rawequal(song.tracks[5].group_parent, group_c))
  
  
  -- One group track with one player track -- 
  
  -- group with ungrouped track
  song:swap_tracks_at(2, 3)
  assert(song.tracks[1].name == "tc")
  assert(song.tracks[2].name == "ta")
  assert(song.tracks[3].name == "gd")
  assert(rawequal(song.tracks[2].group_parent, group_d))
  assert(rawequal(song.tracks[1].group_parent, nil))
  
  song:swap_tracks_at(8, 13)
  assert(song.tracks[5].name == "tg")
  assert(song.tracks[10].name == "th")
  assert(song.tracks[11].name == "ti")
  assert(song.tracks[12].name == "gc")
  assert(song.tracks[13].name == "gb")
  assert(rawequal(song.tracks[5].group_parent, group_a))
  assert(rawequal(song.tracks[10].group_parent, group_c))
  assert(rawequal(song.tracks[11].group_parent, group_c))
  assert(rawequal(song.tracks[12].group_parent, group_b))
  assert(rawequal(song.tracks[13].group_parent, nil))
  
  -- group with grouped track
  song:swap_tracks_at(3, 7)
  assert(song.tracks[2].name == "tb")
  assert(song.tracks[6].name == "ta")
  assert(song.tracks[7].name == "gd")
  assert(rawequal(song.tracks[2].group_parent, nil))
  assert(rawequal(song.tracks[6].group_parent, group_d))
  assert(rawequal(song.tracks[7].group_parent, group_a))
  
  song:swap_tracks_at(7, 10)
  assert(song.tracks[6].name == "th")
  assert(song.tracks[9].name == "ta")
  assert(song.tracks[10].name == "gd")
  assert(rawequal(song.tracks[6].group_parent, group_a))
  assert(rawequal(song.tracks[9].group_parent, group_d))
  assert(rawequal(song.tracks[10].group_parent, group_c))
  
  
  -- Two group tracks --
  
  -- top-level group with top-level group, non-adjacent
  song:swap_tracks_at(7, 13)
  assert(song.tracks[7].name == "gb")
  assert(song.tracks[13].name == "ga")
  assert(rawequal(song.tracks[3].group_parent, group_d))
  assert(rawequal(song.tracks[4].group_parent, group_c))
  assert(rawequal(song.tracks[5].group_parent, group_c))
  assert(rawequal(song.tracks[6].group_parent, group_b))
  assert(rawequal(song.tracks[7].group_parent, nil))
  assert(rawequal(song.tracks[9].group_parent, group_a))
  assert(rawequal(song.tracks[10].group_parent, group_a))
  assert(rawequal(song.tracks[11].group_parent, group_a))
  assert(rawequal(song.tracks[12].group_parent, group_a))
  assert(rawequal(song.tracks[13].group_parent, nil))
  
  song:swap_tracks_at(8, 13)
  
  -- top-level group with top-level group, adjacent
  song:swap_tracks_at(7, 12)
  assert(song.tracks[7].name == "ga")
  assert(song.tracks[12].name == "gb")
  assert(rawequal(song.tracks[3].group_parent, group_a))
  assert(rawequal(song.tracks[4].group_parent, group_a))
  assert(rawequal(song.tracks[5].group_parent, group_a))
  assert(rawequal(song.tracks[6].group_parent, group_a))
  assert(rawequal(song.tracks[7].group_parent, nil))
  assert(rawequal(song.tracks[8].group_parent, group_d))
  assert(rawequal(song.tracks[9].group_parent, group_c))
  assert(rawequal(song.tracks[10].group_parent, group_c))
  assert(rawequal(song.tracks[11].group_parent, group_b))
  assert(rawequal(song.tracks[12].group_parent, nil))
  
  -- top-level group with nested group
  song:swap_tracks_at(7, 11)
  assert(song.tracks[6].name == "gc")
  assert(song.tracks[11].name == "ga")
  assert(rawequal(song.tracks[3].group_parent, group_d))
  assert(rawequal(song.tracks[4].group_parent, group_c))
  assert(rawequal(song.tracks[5].group_parent, group_c))
  assert(rawequal(song.tracks[6].group_parent, nil))
  assert(rawequal(song.tracks[7].group_parent, group_a))
  assert(rawequal(song.tracks[8].group_parent, group_a))
  assert(rawequal(song.tracks[9].group_parent, group_a))
  assert(rawequal(song.tracks[10].group_parent, group_a))
  assert(rawequal(song.tracks[11].group_parent, group_b))
  
  -- nested group with nested group
  song:swap_tracks_at(4, 11)
  assert(song.tracks[7].name == "ga")
  assert(song.tracks[11].name == "gd")
  assert(rawequal(song.tracks[3].group_parent, group_a))
  assert(rawequal(song.tracks[4].group_parent, group_a))
  assert(rawequal(song.tracks[5].group_parent, group_a))
  assert(rawequal(song.tracks[6].group_parent, group_a))
  assert(rawequal(song.tracks[7].group_parent, group_c))
  assert(rawequal(song.tracks[10].group_parent, group_d))
  assert(rawequal(song.tracks[11].group_parent, group_b))
  
  
  -- Group with a member (disallowed, nothing should change) --
  
  -- parent with track member, left edge
  song:swap_tracks_at(7, 3)
  assert(song.tracks[3].name == "tf")
  assert(song.tracks[7].name == "ga")
  assert(rawequal(song.tracks[3].group_parent, group_a))
  assert(rawequal(song.tracks[7].group_parent, group_c))
  
  -- parent with track member, right edge
  song:swap_tracks_at(8, 9)
  assert(song.tracks[8].name == "ti")
  assert(song.tracks[9].name == "gc")
  assert(rawequal(song.tracks[8].group_parent, group_c))
  assert(rawequal(song.tracks[9].group_parent, nil))
  
  -- parent with group member
  song:swap_tracks_at(9, 7)
  assert(song.tracks[9].name == "gc")
  assert(song.tracks[7].name == "ga")
  assert(rawequal(song.tracks[9].group_parent, nil))
  assert(rawequal(song.tracks[7].group_parent, group_c))
  
  -- parent with nested member
  song:swap_tracks_at(10, 12)
  assert(song.tracks[10].name == "ta")
  assert(song.tracks[12].name == "gb")
  assert(rawequal(song.tracks[10].group_parent, group_d))
  assert(rawequal(song.tracks[12].group_parent, nil))
  

  -- 4-layer group move bug --
  song:swap_tracks_at(12, 5) -- create the 4-layer
  song:swap_tracks_at(4, 7)
  assert(song.tracks[6].name == "gb")
  assert(song.tracks[7].name == "tg")
  assert(rawequal(song.tracks[3].group_parent, group_a)) -- used to fail
  assert(rawequal(song.tracks[4].group_parent, group_d))
  assert(rawequal(song.tracks[5].group_parent, group_b))
  assert(rawequal(song.tracks[6].group_parent, group_a))
  
end

collectgarbage()
