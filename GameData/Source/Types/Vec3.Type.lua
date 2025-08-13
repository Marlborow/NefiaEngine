---@meta

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
Vec3 = nil
