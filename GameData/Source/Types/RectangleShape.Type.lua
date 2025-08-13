---@meta


---@class RectangleShape
---@field width number
---@field height number
---@field x number
---@field y number
local RectangleShape = {}

---@param width number
---@param height number
---@return RectangleShape
function RectangleShape(width, height) end

function RectangleShape:SetFillColor(r, g, b) end

function RectangleShape:SetPosition(x, y) end

---@type RectangleShape
RectangleShape = nil
