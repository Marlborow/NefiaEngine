---@class Keyboard
local Keyboard = {}

---Return true if key is pressed (names like "left","right","escape","a","z","1")
---@param keyName string
---@return boolean
function Keyboard:Key(keyName)
    if type(keyName) ~= "string" then
        return false
    end
    return love.keyboard.isDown(keyName:lower()) and true or false
end

---Return true if key is pressed (names like "left","right","escape","a","z","1")
---@param keyName string
---@return boolean
function Keyboard:IsKeyPressed(keyName)
    if type(keyName) ~= "string" then
        return false
    end
    return love.keyboard.isDown(keyName:lower()) and true or false
end



---Return 1 if key is pressed, 0 if not
---@param keyName string
---@return integer
function Keyboard:Keyi(keyName)
    return self:Key(keyName) and 1 or 0
end


return Keyboard

