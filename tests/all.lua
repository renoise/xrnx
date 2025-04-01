local failed_tests = 0

-- run all tests except midi_actions which already executes a lot of sub tests
local ignored_files = table.create{ "all.lua", "midi_actions.lua" }

-- run all in current directory
for _, file in pairs(os.filenames(os.currentdir(), { "*.lua" })) do
  if ignored_files:find(file) == nil then
    local file_chunk = assert(loadfile(os.currentdir() .. file, "t"))
    print("Running '" .. file .. "' tests...")
    local result, error = pcall(file_chunk)
    if result == false then
      print("\tTest FAILED:\n" .. error)
      failed_tests = failed_tests + 1
    end
  end
end

assert(failed_tests == 0,
  "One or more test failed. See output for details...")
 
