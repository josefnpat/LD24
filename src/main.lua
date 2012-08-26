require("git")
print("Current Version: v"..git_count.." ["..git.."]")
prelevel = require('prelevel/prelevel')
chartlib = require('chartlib/chartlib')
chart_fps = chartlib.new(200)
horizion = require("horizon/horizon")
player = require("player/player")
debug = require("debug/debug")
bullets = require("bullets/bullets")

font_ld24_small = love.graphics.newFont("assets/ld24.ttf",16)
font_ld24_small:setLineHeight(1.2)
font_ld24_large = love.graphics.newFont("assets/ld24.ttf",32)
love.graphics.setFont(font_ld24_small)

pause = false

state = "prelevel"

function love.load(arg)
  horizon.load(arg)
  player.load(arg)
  player.say("Kurtz!",1,player.charlie)
  player.say("I'm going down! Tell kurtz that I ...",4,player.tuxxer)
  player.say("Kurtz!",1,player.charlie)
  player.say("...",2,player.charlie)
  player.say("Kurtz!",1,player.charlie)
end

function love.draw()
  if state == "game" then
    horizon.draw()
    bullets.draw()
    player.draw()
    if pause then
      love.graphics.printf("PAUSED ["..keybinding.pause.."]",0,16,800,"center")
    end
  elseif state =="prelevel" then
    prelevel.draw()
  end
  debug.draw()
end

function love.update(dt)
  chart_fps:push(love.timer.getFPS())
  if state == "game" then
    if not pause then
      horizon.update(dt)
      bullets.update(dt)
      player.update(dt)
    end 
  elseif state =="prelevel" then
    prelevel.update(dt)  
  end
end

function love.keypressed(key)
  debug.keypressed(key)
  if state == "game" then
    if key == keybinding.pause then
      pause = not pause
    end
    if not pause then
      bullets.keypressed(key)
    end
  elseif state =="prelevel" then
    prelevel.keypressed(key)
  end  
end
