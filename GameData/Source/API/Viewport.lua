---@class Viewport
---@field position Vec2
---@field size Vec2
---@field zoom number
local Viewport = {}
Viewport.__index = Viewport

setmetatable(Viewport, {
    __call = function(_, x, y)
        return setmetatable({
            position = Vec2(x or 0, y or 0),
            zoom = 1.0
        }, Viewport)
    end
})

function Viewport:SetCenter(x, y)
    local sw, sh = love.graphics.getDimensions()  -- always current
    local halfW = (sw / self.zoom) * 0.5
    local halfH = (sh / self.zoom) * 0.5
    self.position.x = x - halfW
    self.position.y = y - halfH
end

function Viewport:SetCenterWithSize(x, y, w, h)
    self:SetCenter(x + (w * 0.5) , y + (h * 0.5))
end


---Move the viewport by an offset
---@param dx number
---@param dy number
function Viewport:Move(dx, dy)
    self.position.x = self.position.x + dx
    self.position.y = self.position.y + dy
end

---Set the zoom level
---@param zoom number
function Viewport:SetZoom(zoom)
    self.zoom = zoom
end

function Viewport:Apply()
    love.graphics.push()
    love.graphics.scale(self.zoom, self.zoom)
    love.graphics.translate(-self.position.x, -self.position.y)
end





function Viewport:Reset()
    love.graphics.pop()
end

return Viewport

