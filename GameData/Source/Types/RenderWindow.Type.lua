---@meta
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


---@type RenderWindow
window = nil
