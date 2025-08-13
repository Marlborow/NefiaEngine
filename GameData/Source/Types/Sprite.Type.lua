---@meta

---@class Sprite
---@field x number
---@field y number
---@field sx number
---@field sy number
---@field radians number
---@field ox number
---@field oy number
local Sprite = {}

---@param texture Texture
---@return Sprite
function Sprite(texture) end

function Sprite:SetPosition(x, y) end

function Sprite:SetScale(sx, sy) end

function Sprite:SetRotation(degrees) end

function Sprite:SetOrigin(ox, oy) end

function Sprite:SetTextureRect(left, top, width, height) end


---@type Sprite
Sprite = nil
