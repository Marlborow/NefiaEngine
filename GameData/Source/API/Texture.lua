---@class Texture
---@field image love.Image
---@field width integer
---@field height integer
local Texture = {}
Texture.__index = Texture

---@param path string
---@return Texture
local function New(path)
  local img = love.graphics.newImage(path)
  return setmetatable({ image = img, width = img:getWidth(), height = img:getHeight() }, Texture)
end

setmetatable(Texture, { __call = function(_, path) return New(path) end })
return Texture

