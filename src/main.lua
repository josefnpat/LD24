require("fcblib/fcblib")
horizion = require("horizon/horizon")

function love.load(arg)
  horizon.load(arg)
end

function love.draw()
  horizon.draw()
  love.graphics.print("FPS:"..love.timer.getFPS(),32,32)
end

function love.update(dt)
  horizon.update(dt)
end
