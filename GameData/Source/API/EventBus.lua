---@class EventBus
---@field queue table
local EventBus = { queue = {} }

---Push an event table
---@param ev table
function EventBus.Push(ev)
  EventBus.queue[#EventBus.queue+1] = ev
end

---Bind Love callbacks to push SFML-like events
function EventBus.BindLove()
  function love.quit() EventBus.Push({ type="Closed" }) end
  function love.resize(w,h) EventBus.Push({ type="Resized", width=w, height=h }) end
  function love.keypressed(key, sc, rep) EventBus.Push({ type="KeyPressed", key=key, scancode=sc, isRepeat=rep }) end
  function love.keyreleased(key, sc) EventBus.Push({ type="KeyReleased", key=key, scancode=sc }) end
  function love.mousepressed(x,y,button,istouch,presses) EventBus.Push({ type="MouseButtonPressed", x=x, y=y, button=button, presses=presses or 1 }) end
  function love.mousereleased(x,y,button,istouch,presses) EventBus.Push({ type="MouseButtonReleased", x=x, y=y, button=button, presses=presses or 1 }) end
  function love.mousemoved(x,y,dx,dy) EventBus.Push({ type="MouseMoved", x=x, y=y, dx=dx, dy=dy }) end
  function love.wheelmoved(dx,dy) EventBus.Push({ type="MouseWheelScrolled", dx=dx, dy=dy }) end
end

return EventBus

