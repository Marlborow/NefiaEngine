---@class RenderWindow
---@field width integer
---@field height integer
---@field _isOpen boolean
---@field _drawList table
local RenderWindow = {}
RenderWindow.__index = RenderWindow

---Constructor: callable like `RenderWindow(w,h,title)`
---@param width integer
---@param height integer
---@param title string
---@return RenderWindow
local function New(width, height, title)
  love.window.setMode(width, height, { resizable = true })
  love.window.setTitle(title or "Sirrus")
  return setmetatable({
    width = width,
    height = height,
    _isOpen = true,
    _drawList = {}
  }, RenderWindow)
end

---Clear the backbuffer
---@param r number @0..1
---@param g number @0..1
---@param b number @0..1
function RenderWindow:Clear(r, g, b)
  love.graphics.clear(r or 0, g or 0, b or 0, 1)
end

---Queue a drawable (must have `__draw()`)
---@param drawable table
function RenderWindow:Draw(drawable)
  self._drawList[#self._drawList+1] = drawable
end


function RenderWindow:SetFullscreen(option)
    local w, h, flags = love.window.getMode()
    flags.fullscreen = enable and true or false
    love.window.setMode(w, h, flags)
    self.width, self.height = love.graphics.getDimensions()
end


---Flush queued drawables to the screen
function RenderWindow:Display()
  for i = 1, #self._drawList do
    local d = self._drawList[i]
    if d and d.__draw then d:__draw() end
  end
  self._drawList = {}
end

---Poll one SFML-like event into `outEvent`
---@param outEvent table
---@return boolean
function RenderWindow:PollEvent(outEvent)
  local q = require("source.API.EventBus").queue
  local ev = table.remove(q, 1)
  if not ev then return false end
  if ev.type == "Resized" then self.width, self.height = ev.width, ev.height end
  if ev.type == "Closed" then self._isOpen = false end
  for k in pairs(outEvent) do outEvent[k] = nil end
  for k,v in pairs(ev) do outEvent[k] = v end
  return true
end

---Set window size
---@param w integer
---@param h integer
function RenderWindow:SetSize(w, h)
  self.width, self.height = w, h
  love.window.setMode(w, h, { resizable = true })
end

---Set title
---@param title string
function RenderWindow:SetTitle(title)
  love.window.setTitle(title or "")
end

function RenderWindow:IsOpen() return self._isOpen end
function RenderWindow:Close()  self._isOpen = false; love.event.quit() end

function RenderWindow:ResetViewport()
    love.graphics.pop()
end

setmetatable(RenderWindow, { __call = function(_, w,h,t) return New(w,h,t) end })
return RenderWindow

