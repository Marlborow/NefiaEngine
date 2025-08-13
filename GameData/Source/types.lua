---@meta

-- ====================
--  WINDOW & DRAWABLES
-- ====================

---@class RenderWindow
---@field width integer
---@field height integer
local RenderWindow = {}
---@param width integer
---@param height integer
---@param title string
---@return RenderWindow
function RenderWindow(width, height, title) end
---@param r number
---@param g number
---@param b number
function RenderWindow:Clear(r, g, b) end
---@param drawable table
function RenderWindow:Draw(drawable) end
function RenderWindow:Display() end
---@param option boolean
function RenderWindow:SetFullscreen(option) end
function RenderWindow:SetSize(w, h) end
function RenderWindow:SetTitle(title) end
function RenderWindow:Close() end
---@param outEvent table
---@return boolean
function RenderWindow:PollEvent(outEvent) end
function RenderWindow:IsOpen() end
function RenderWindow:ResetViewport() end


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

---@class Texture
---@field width integer
---@field height integer
local Texture = {}
---@param path string
---@return Texture
function Texture(path) end

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

function Sprite:SetPosition(x, y)
function Sprite:SetScale(sx, sy) end
function Sprite:SetRotation(degrees) end
function Sprite:SetOrigin(ox, oy) end
function Sprite:SetTextureRect(left, top, width, height) end

---@class Viewport
---@field position Vec2
---@field size Vec2
---@field zoom number
local Viewport = {}
function Viewport:SetCenter(x, y) end
function Viewport:SetZoom(z) end
function Viewport:Apply() end
function Viewport:Reset() end

---@class Camera
---@field __target   Vec2
---@field __position Vec2
---@field __viewport Viewport
---@field __speed    number
local Camera = {}
function Camera:new() end
function Camera:Attach(target) end
function Camera:SetSpeed(s) end
function Camera:GetPosition() end
function Camera:Update(dt) end
function Camera:Apply() end
function Camera:Reset() end

-- ==========
--   MATH
-- ==========

---@class Vec2
---@field x number
---@field y number
local _Vec2 = {}
function _Vec2:Length() end
function _Vec2:Normalize() end
---@param other Vec2
---@return number
function _Vec2:Dot(other) end
---@return Vec2
function _Vec2:Clone() end

---@alias Vec2Ctor fun(x?: number, y?: number): Vec2
---@type Vec2Ctor
Vec2 = nil  -- global callable constructor (engine injects at runtime)

---@class Vec3
---@field x number
---@field y number
---@field z number
local _Vec3 = {}
function _Vec3:Length() end
function _Vec3:Normalize() end
---@param other Vec3
---@return number
function _Vec3:Dot(other) end
---@param other Vec3
---@return Vec3
function _Vec3:Cross(other) end
---@return Vec3
function _Vec3:Clone() end

---@alias Vec3Ctor fun(x?: number, y?: number, z?: number): Vec3
---@type Vec3Ctor
Vec3 = nil  -- global callable constructor (engine injects at runtime)


-- ==========
--   INPUT
-- ==========

---@class Keyboard
local Keyboard = {}
---Boolean: true if key pressed
---@param keyName string
---@return boolean
function Keyboard:Key(keyName) end
---Numeric: 1 if key pressed, 0 if not
---@param keyName string
---@return integer
function Keyboard:Keyi(keyName) end
---@param keyName string
---@return boolean
function Keyboard:IsKeyPressed(keyName) end -- optional alias for Key()

---@class Mouse
local Mouse = {}
---@return number, number
function Mouse.GetPosition() end
---@param button string|integer
---@return boolean
function Mouse.IsButtonPressed(button) end

---@class Gamepad
local Gamepad = {}
---@param id integer
---@param button string
---@return boolean
function Gamepad.IsButtonPressed(id, button) end

-- ==========
--   GLOBALS
-- ==========
---@type RenderWindow
window = nil
---@type RenderWindow
RenderWindow = nil
---@type RectangleShape
RectangleShape = nil
---@type CircleShape
CircleShape = nil
---@type Texture
Texture = nil
---@type Sprite
Sprite = nil
---@type Keyboard
Keyboard = nil
---@type Mouse
Mouse = nil
---@type Gamepad
Gamepad = nil

