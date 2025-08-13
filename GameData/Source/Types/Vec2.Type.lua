---@meta

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
Vec2 = nil
