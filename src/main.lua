require("git")
print("Current Version: v"..git_count.." ["..git.."]")
chartlib = require('chartlib/chartlib')
chart_fps = chartlib.new(200)
horizion = require("horizon/horizon")
player = require("player/player")
debug = require("debug/debug")
bullets = require("bullets/bullets")


pause = false

function love.load(arg)
  horizon.load(arg)
end

function love.draw()
  horizon.draw()
  debug.draw()
  if pause then
    love.graphics.printf("PAUSED [F1]",0,16,800,"center")
  end
  bullets.draw()
  player.draw()
end

function love.update(dt)
  chart_fps:push(love.timer.getFPS())
  if not pause then
    horizon.update(dt)
    bullets.update()
    player.update(dt)
  end
end

function love.keypressed(key)
  debug.keypressed(key)
  if key == "f1" then
    pause = not pause
  end
  if not pause then
    bullets.keypressed(key)
  end
end
