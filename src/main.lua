require("fcblib/fcblib")
chartlib = require('chartlib/chartlib')
chart_fps = chartlib.new(200)
horizion = require("horizon/horizon")

debug = true

function love.load(arg)
  horizon.load(arg)
end

function love.draw()
  horizon.draw()
  if debug then
    chart_fps:draw("fps",32,32,nil,64)
  end
end

function love.update(dt)
  horizon.update(dt)
  chart_fps:push(love.timer.getFPS())  
end

function love.keypressed(key)
  if key == "`" then
    debug = not debug
  end
end
