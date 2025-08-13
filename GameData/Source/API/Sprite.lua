-- source/API/Sprite.lua
---@class Sprite
---@field texture Texture
---@field x number
---@field y number
---@field sx number
---@field sy number
---@field radians number
---@field ox number
---@field oy number
---@field _quad love.Quad|nil
local Sprite = {}
Sprite.__index = Sprite

---@param texture Texture
---@return Sprite
local function New(texture)
  return setmetatable({
    texture = texture,
    x = 0, y = 0,
    sx = 1, sy = 1,
    radians = 0,
    ox = 0, oy = 0,
    _quad = nil
  }, Sprite)
end

---@param x number
---@param y number
function Sprite:SetPosition(x, y)
  self.x, self.y = x, y
end

---@param sx number
---@param sy number|nil
function Sprite:SetScale(sx, sy)
  self.sx, self.sy = sx or 1, sy or sx or 1
end

---@param degrees number
function Sprite:SetRotation(degrees)
  self.radians = math.rad(degrees or 0)
end

---@param ox number
---@param oy number
function Sprite:SetOrigin(ox, oy)
  self.ox, self.oy = ox or 0, oy or 0
end

---SFML-like texture rect
---@param left number
---@param top number
---@param width number
---@param height number
function Sprite:SetTextureRect(left, top, width, height)
  local iw, ih = self.texture.image:getWidth(), self.texture.image:getHeight()
  self._quad = love.graphics.newQuad(left, top, width, height, iw, ih)
end

function Sprite:__draw()
  love.graphics.setColor(1, 1, 1)
  if self._quad then
    love.graphics.draw(self.texture.image, self._quad, self.x, self.y, self.radians, self.sx, self.sy, self.ox, self.oy)
  else
    love.graphics.draw(self.texture.image, self.x, self.y, self.radians, self.sx, self.sy, self.ox, self.oy)
  end
end

-- Callable class: Sprite(texture)
setmetatable(Sprite, {
  __call = function(_, tex)
    return New(tex)
  end
})

return Sprite

