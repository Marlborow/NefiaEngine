---@class Vec2
---@field x number
---@field y number
local Vec2 = {}
Vec2.__index = Vec2

setmetatable(Vec2, {
    __call = function(_, x, y)
        return setmetatable({ x = x or 0.0, y = y or 0.0 }, Vec2)
    end
})

function Vec2:__tostring()
    return string.format("Vec2(%.3f, %.3f)", self.x, self.y)
end

-- Operators
function Vec2.__add(a, b) return Vec2(a.x + b.x, a.y + b.y) end
function Vec2.__sub(a, b) return Vec2(a.x - b.x, a.y - b.y) end
function Vec2.__mul(a, s) return Vec2(a.x * s, a.y * s) end
function Vec2.__div(a, s) return Vec2(a.x / s, a.y / s) end
function Vec2.__eq(a, b) return a.x == b.x and a.y == b.y end

-- Methods
function Vec2:Length()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vec2:Normalize()
    local len = self:Length()
    if len > 0 then
        self.x = self.x / len
        self.y = self.y / len
    end
    return self
end

function Vec2:Dot(b)
    return self.x * b.x + self.y * b.y
end

function Vec2:Clone()
    return Vec2(self.x, self.y)
end

return Vec2

