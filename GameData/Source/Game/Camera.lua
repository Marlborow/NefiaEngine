-- API/Camera.lua
local Viewport = require("API.Viewport")


local Camera = {}
Camera.__index = Camera

setmetatable(Camera, { __call = function(_, ...) return Camera:new(...) end })

function Camera:new()
  local obj = setmetatable({}, Camera)
  obj.__target       = Vec2(0, 0)
  obj.__target_size  = Vec2(1, 1)
  obj.__position     = Vec2(0, 0)
  obj.__speed        = 4.0
  obj.__viewport     = Viewport(obj.__position.x, obj.__position.y, window.width, window.height)
  return obj
end

---@param target Vec2
---@param target_size Vec2
function Camera:Attach(target, target_size)
    self.__target = target
    self.__target_size = target_size
    print("Camera: ", self.__target_size.x, " ", self.__target_size.y)
end


function Camera:SetSpeed(s) if s ~= nil then self.__speed = s end end
function Camera:GetPosition() return self.__position end

function Camera:OnResize(w, h)
  if self.__viewport and self.__viewport.SetSize then
    self.__viewport:SetSize(w or window.width, h or window.height)
  end
end

---Snap camera center (useful for teleports)
function Camera:CenterOn(x, y)
  if type(x) == "table" then
    self.__position.x, self.__position.y = x.x, x.y
  else
    self.__position.x, self.__position.y = x, y
  end
  self.__viewport:SetCr(self.__position.x, self.__position.y)
end

function Camera:Update(dt)
  local halfW = (self.__target_size and self.__target_size.x or 0) * 0.5
  local halfH = (self.__target_size and self.__target_size.y or 0) * 0.5
  local tx = (self.__target and self.__target.x or 0) + halfW
  local ty = (self.__target and self.__target.y or 0) + halfH

  local lerp = (self.__speed or 4.0) * dt
  self.__position.x = self.__position.x + (tx - self.__position.x) * lerp
  self.__position.y = self.__position.y + (ty - self.__position.y) * lerp

  self.__viewport:SetCenterWithSize(self.__position.x, self.__position.y, self.__target_size.x, self.__target_size.y)
end

function Camera:Apply()  self.__viewport:Apply()  end
function Camera:Reset()  self.__viewport:Reset()  end

return Camera

