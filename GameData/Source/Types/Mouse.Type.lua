---@meta

---@class Mouse
local Mouse = {}

---@return number, number

function Mouse.GetPosition() end

---@param button string|integer
---@return boolean
function Mouse.IsButtonPressed(button) end

---@type Mouse
Mouse = nil
