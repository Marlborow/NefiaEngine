---@class RectangleShape
---@field width number
---@field height number
---@field x number
---@field y number
---@field r number
---@field g number
---@field b number
local RectangleShape = {}
RectangleShape.__index = RectangleShape

---@param width number
---@param height number
---@return RectangleShape
setmetatable(RectangleShape, { __call = function(_, width, height)
  return setmetatable({ width=width or 10, height=height or 10, x=0,y=0, r=1,g=1,b=1 }, RectangleShape)
end })

function RectangleShape:SetFillColor(r,g,b) self.r,self.g,self.b=r,g,b end
function RectangleShape:SetPosition(x,y) self.x,self.y=x,y end
function RectangleShape:__draw() love.graphics.setColor(self.r,self.g,self.b); love.graphics.rectangle("fill", self.x, self.y, self.width, self.height) end

return RectangleShape

