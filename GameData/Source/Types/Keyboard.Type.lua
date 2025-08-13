---@meta

---@class Keyboard
local Keyboard = {}

---Boolean: true if key pressed
---@param keyName string
---@return boolean

function Keyboard:Key(keyName) end

---Numeric: 1 if key pressed, 0 if not
---@param keyName string
---@return integer

function Keyboard:Keyi(keyName) end

---@param keyName string
---@return boolean
function Keyboard:IsKeyPressed(keyName) end -- optional alias for Key()


---@type Keyboard
Keyboard = nil
