---@meta

---@class CircleShape
---@field radius number
---@field x number
---@field y number
local CircleShape = {}

---@param radius number
---@return CircleShape
function CircleShape(radius) end

function CircleShape:SetFillColor(r, g, b) end

function CircleShape:SetPosition(x, y) end

---@type CircleShape
CircleShape = nil
