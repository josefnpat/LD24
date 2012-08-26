require("git")
print("Current Version: v"..git_count.." ["..git.."]")

math.randomseed( os.time() )

prelevel = require('prelevel/prelevel')
chartlib = require('chartlib/chartlib')
chart_fps = chartlib.new(200)
horizion = require("horizon/horizon")
gui = require("gui/gui")
player = require("player/player")
script = require("script/script")
debug = require("debug/debug")
bullets = require("bullets/bullets")
enemy = require("enemy/enemy")
endgame = require("endgame/endgame")
lovemenu = require("lovemenu")

font_ld24_small = love.graphics.newFont("assets/ld24.ttf",16)
font_ld24_small:setLineHeight(1.2)
font_ld24_large = love.graphics.newFont("assets/ld24.ttf",32)
font_ld24_xlarge = love.graphics.newFont("assets/ld24.ttf",64)
love.graphics.setFont(font_ld24_small)

pause = false

state = "menu"

function love.load(arg)
  horizon.load(arg)
  player.load(arg)
  prelevel.load(arg)
  bullets.load(arg)
  gui.load(arg)
  enemy.load(arg)
  lovemenu.load(arg)
end

function love.draw()
  if state == "menu" then
    lovemenu.draw()
  elseif state == "game" then
    horizon.draw()
    bullets.draw()
    enemy.draw()
    player.draw()
    gui.draw()
    if pause then
      love.graphics.printf("PAUSED ["..keybinding.pause.."]",0,300,800,"center")
    end
  elseif state =="prelevel" then
    prelevel.draw()
  elseif state =="endgame" then
    endgame.draw()
  end
  debug.draw()
end

function love.update(dt)
  chart_fps:push(love.timer.getFPS())
  if state == "menu" then
    lovemenu.update(dt)
  elseif state == "game" then
    if not pause then
      horizon.update(dt)
      bullets.update(dt)
      player.update(dt)
      gui.update(dt)
      enemy.update(dt)
    end 
  elseif state =="prelevel" then
    prelevel.update(dt)  
  end
end

function love.keypressed(key,unicode)
  debug.keypressed(key)
  if state == "menu" then
    lovemenu.keypressed(key,unicode)
  elseif state == "game" then
    if key == keybinding.pause then
      pause = not pause
    end
    if not pause then
      bullets.keypressed(key)
    end
  elseif state =="prelevel" then
    prelevel.keypressed(key)
  elseif state =="endgame" then
    endgame.keypressed(key,unicode)
  end  
end

function love.mousepressed(x,y,button)
  lovemenu.mousepressed(x,y,button)
end
