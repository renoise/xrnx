---@meta

--------------------------------------------------------------------------------
---## renoise.SomeClass

---@class renoise.SomeClass
renoise.SomeClass = {}

---### constants

---SOME_CONSTANT docs
renoise.SomeClass.SOME_CONSTANT = 4

--------------------------------------------------------------------------------

---SomeClass docs
---@class SomeClassInstance
---@field some_property table<string, integer>
local SomeClassInstance = {}

---SomeClassInstance Docs
---@return SomeClassInstance
function renoise.SomeClass() end

---SomeFunction docs
function SomeClassInstance:some_function() end
