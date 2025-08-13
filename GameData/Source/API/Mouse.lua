---@class Mouse
local Mouse = {}

---@return number, number
function Mouse.GetPosition()
  return love.mouse.getPosition()
end

---@param button string|integer
---@return boolean
function Mouse.IsButtonPressed(button)
  local map = { Left=1, Right=2, Middle=3, X1=4, X2=5 }
  local b = type(button)=="string" and (map[button] or 1) or button
  return love.mouse.isDown(b or 1)
end

return Mouse

