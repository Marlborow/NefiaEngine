local Game = {}

local Camera = require "Camera"
local Player = require "Player"


local PlayerCamera = Camera()

function Game.Init()
    Player:Init();
    PlayerCamera:Attach(Player.__position, Vec2(50,50))
end

function Game.Update(dt)
    Player:Update(dt)
    PlayerCamera:Update(dt)
end


function Game.Draw()
    PlayerCamera:Apply();
    Player:Draw(window);
end

return Game
