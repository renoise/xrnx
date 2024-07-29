---@meta

--------------------------------------------------------------------------------
-- ## renoise

---Holds all renoise related API test functions and classes.
---@class renoise
renoise = {}

---### constants

---This is a const
---@type number
renoise.API_VERSION = 6.1

---### functions

---Global function docs
function renoise.global_function() end

---More global function docs
---@return TestClass1|TestClass2
function renoise.global_function2() end

--------------------------------------------------------------------------------

---@class TestClass1
---@field field1 number
---@field field2 string
local TestClass1 = {}


---@class TestClass2
---@field alias SomeAlias
---@field field TestClass1
local TestClass2 = {}

---This is an alias
---@alias SomeAlias string
