---@class CircleShape
---@field radius number
---@field x number
---@field y number
---@field r number
---@field g number
---@field b number
local CircleShape = {}
CircleShape.__index = CircleShape

---@param radius number
---@return CircleShape
setmetatable(CircleShape, { __call = function(_, radius)
  return setmetatable({ radius=radius or 10, x=0,y=0, r=1,g=1,b=1 }, CircleShape)
end })

function CircleShape:SetFillColor(r,g,b) self.r,self.g,self.b=r,g,b end
function CircleShape:SetPosition(x,y) self.x,self.y=x,y end
function CircleShape:__draw() love.graphics.setColor(self.r,self.g,self.b); love.graphics.circle("fill", self.x, self.y, self.radius) end

return CircleShape

