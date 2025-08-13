local NO_SPRITE = true;

local Player = {
    __texture = nil;
    __sprite = nil;
    __rect = RectangleShape(100,100);
    __position = Vec2(0,0);
    __speed    = 300
}

--Player Movement
local function DoMovement(dt)

    --Reference to player.
    local this = Player;

    local hspd = Keyboard:Keyi("D") - Keyboard:Keyi("A");
    local vspd = Keyboard:Keyi("S") - Keyboard:Keyi("W");

    if(hspd ~= 0 and vspd ~= 0) then
        hspd = hspd * 0.707
        vspd = vspd * 0.707
    end

    this.__position.x = this.__position.x + (hspd * this.__speed * dt)
    this.__position.y = this.__position.y + (vspd * this.__speed * dt)

    if(NO_SPRITE) then
        this.__rect:SetPosition(this.__position.x, this.__position.y)
        return;
    end

    this.__sprite:SetPosition(this.__position.x, this.__position.y)
end

function Player:Init() end

function Player:Update(dt)
    DoMovement(dt)
end

function Player:GetPosition()
    return self.__position
end

function Player:Draw(window)
    if NO_SPRITE then
        window:Draw(self.__rect)
        return
    end

    window:Draw(self.__sprite)
end

return Player
