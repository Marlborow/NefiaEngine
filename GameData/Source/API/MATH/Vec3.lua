---@class Vec3
---@field x number
---@field y number
---@field z number
local Vec3 = {}
Vec3.__index = Vec3

setmetatable(Vec3, {
    __call = function(_, x, y, z)
        return setmetatable({ x = x or 0.0, y = y or 0.0, z = z or 0.0 }, Vec3)
    end
})

function Vec3:__tostring()
    return string.format("Vec3(%.3f, %.3f, %.3f)", self.x, self.y, self.z)
end

-- Operators
function Vec3.__add(a, b) return Vec3(a.x + b.x, a.y + b.y, a.z + b.z) end
function Vec3.__sub(a, b) return Vec3(a.x - b.x, a.y - b.y, a.z - b.z) end
function Vec3.__mul(a, s) return Vec3(a.x * s, a.y * s, a.z * s) end
function Vec3.__div(a, s) return Vec3(a.x / s, a.y / s, a.z / s) end
function Vec3.__eq(a, b) return a.x == b.x and a.y == b.y and a.z == b.z end

-- Methods
function Vec3:Length()
    return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end

function Vec3:Normalize()
    local len = self:Length()
    if len > 0 then
        self.x = self.x / len
        self.y = self.y / len
        self.z = self.z / len
    end
    return self
end

function Vec3:Dot(b)
    return self.x * b.x + self.y * b.y + self.z * b.z
end

function Vec3:Cross(b)
    return Vec3(
        self.y * b.z - self.z * b.y,
        self.z * b.x - self.x * b.z,
        self.x * b.y - self.y * b.x
    )
end

function Vec3:Clone()
    return Vec3(self.x, self.y, self.z)
end

return Vec3

