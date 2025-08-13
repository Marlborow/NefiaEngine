local EventBus       = require("API.EventBus")
local RenderWindow   = require("API.RenderWindow")
local Texture        = require("API.Texture")
local Sprite         = require("API.Sprite")
local CircleShape    = require("API.CircleShape")
local RectangleShape = require("API.RectangleShape")
local Keyboard       = require("API.Keyboard")
local Mouse          = require("API.Mouse")
local Viewport       = require("API.Viewport")

--MATH API
local Vec2           = require("API.MATH.Vec2")
local Vec3           = require("API.MATH.Vec3")


local okGamepad, Gamepad = pcall(require, "API.Gamepad")
if not okGamepad then Gamepad = nil end

local API = {
  EventBus       = EventBus,
  RenderWindow   = RenderWindow,
  Texture        = Texture,
  Sprite         = Sprite,
  CircleShape    = CircleShape,
  RectangleShape = RectangleShape,
  Keyboard       = Keyboard,
  Mouse          = Mouse,
  Vec2           = Vec2,
  Vec3           = Vec3,
  Gamepad        = Gamepad,
  Viewport       = Viewport,
}

function API.InjectGlobals()
  for k, v in pairs(API) do
    if k ~= "InjectGlobals" and k ~= "BindLoveEvents" then
      _G[k] = v
    end
  end
end

function API.BindLoveEvents()
  if EventBus and EventBus.BindLove then
    EventBus.BindLove()
  end
end

return API

