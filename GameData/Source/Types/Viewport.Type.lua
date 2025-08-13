---@meta

---@class Viewport
---@field position Vec2
---@field size Vec2
---@field zoom number
local Viewport = {}

function Viewport:SetCenter(x, y) end

function Viewport:SetZoom(z) end

function Viewport:Apply() end

function Viewport:Reset() end


