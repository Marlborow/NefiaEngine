-- source/SirrusEngine.lua
-- Boots the engine, exposes Application, runs the game module.

local API = require("GameAPI")
API.InjectGlobals()
API.BindLoveEvents()

Application = {}
Application.__index = Application

function Application:New(width, height, title)
  local app = setmetatable({}, self)
  app.window = RenderWindow(width, height, title)
  _G.window = app.window
  return app
end

function Application:Run(gameModule)
  local moduleName = gameModule or "Game.Main"
  local game = require(moduleName)

  -- Lifecycle hooks (PascalCase)
  if type(game.Init) == "function" then game.Init() end

  function love.resize(w, h)
    if type(game.OnResize) == "function" then game.OnResize(w, h) end
  end

  function love.update(dt)
    if type(game.Update) == "function" then game.Update(dt) end
  end

function love.draw()
    if type(game.Draw) == "function" then game.Draw() end
    if window and window.Display then window:Display() end
    Viewport:Reset()
  end
end

return { Application = Application }

